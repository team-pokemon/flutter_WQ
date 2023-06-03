import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_one/learn_flutter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SearchBar(),
          const SizedBox(height: 10),
          CardView(),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const LearnFlutter();
                  },
                ),
              );
            },
            child: Text("DevSoc"),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController =
        TextEditingController();

    return CupertinoSearchTextField(
      controller: _textEditingController,
    );
  }
}

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 350,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(0.02),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.cyan[200],
          child: ListTile(
            leading: Container(
              width: 60,
              height: 60,
              child: Image.asset('images/Lake.jpg'),
            ),
            title: Text(
              'Condition',
              style: TextStyle(fontSize: 17),
            ),
            subtitle: Text(
              'Water Quality Index',
              style: TextStyle(fontSize: 13),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '40%',
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.share,
                  color: Colors.yellow,
                  size: 17,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
