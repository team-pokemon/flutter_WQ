import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LearnFlutter extends StatefulWidget {
  const LearnFlutter({Key? key}) : super(key: key);

  @override
  State<LearnFlutter> createState() => _LearnFlutterState();
}

class _LearnFlutterState extends State<LearnFlutter> {
  bool? isCheckBox = false;
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Growth',
          style: TextStyle(fontFamily: 'FontMain'),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('yes');
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/Lake.jpg'),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(15.0),
              color: Colors.green,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Upload',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint('Elevated button');
              },
              child: const Text('Upload when verified'),
            ),
            
            
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                debugPrint('hey');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blueAccent,
                  ),
                  Text('Results found after as follows: '),
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
            Switch(
              value: isSwitch,
              onChanged: (bool newbool) {
                setState(() {
                  isSwitch = newbool;
                });
              },
            ),
            Checkbox(
              value: isCheckBox,
              onChanged: (bool? newbool) {
                setState(() {
                  isCheckBox = newbool;
                });
              },
            ),
            Image.network('https://wallpaperaccess.com/full/1909531.jpg'),
            const SizedBox(height: 10),
            Container(
              height: 300,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  ColumnSeries<OrdinalSales, String>(
                    dataSource: _createData(),
                    xValueMapper: (OrdinalSales sales, _) => sales.category,
                    yValueMapper: (OrdinalSales sales, _) => sales.sales,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<OrdinalSales> _createData() {
    final data = <OrdinalSales>[
      OrdinalSales('pH lvl', 5),
      OrdinalSales('Hardness', 25),
      OrdinalSales('Solids', 100),
      OrdinalSales('Organic Carb', 75),
    ];

    return data;
  }
}

class OrdinalSales {
  final String category;
  final int sales;

  OrdinalSales(this.category, this.sales);
}
