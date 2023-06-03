import 'package:flutter/material.dart';
import 'package:flutter_one/home_page.dart';
import 'package:flutter_one/profile_page.dart';
import 'package:flutter_one/splash.dart';
import 'package:camera/camera.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Splash(),
    );
  }
}

class Root extends StatefulWidget {
  const Root({Key? key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentPage = 0;
  List<Widget> pages = const [HomePage(), ProfilePage()];
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    await _controller.initialize();
  }

  void _openCamera() async {
    if (_controller.value.isInitialized) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: Stack(
              children: [
                CameraPreview(_controller),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: _capturePhoto,
                      child: const Text('Capture'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  void _capturePhoto() async {
  try {
    final XFile? capturedImage = await _controller.takePicture();
    // Use the capturedImage variable
    if (capturedImage != null) {
      // Handle the captured photo as needed
      print('Captured image path: ${capturedImage.path}');
    }
  } catch (e) {
    // Handle the error
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WaterQ',
          style: TextStyle(fontFamily: 'FontMain'),
        ),
        centerTitle: true,
      ),
      body: pages[currentPage],
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _openCamera,
        child: const Icon(Icons.camera_alt),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.map), label: 'Map'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
