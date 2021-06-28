import 'package:flutter/material.dart';
import '../presentation/addNote.dart';

class MyTabBar extends StatefulWidget {
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 8.0,
      shape: CircularNotchedRectangle(),
      color: Color(0xFF2D2E2E),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(index: 0, lable: 'Sample1'),
          buildTabItem(index: 1, lable: 'Sample2')
        ],
      ),
    );
  }

  Widget buildTabItem({@required int index, @required String lable}) {
    return TextButton(
        onPressed: () {
          print('gotpressed$lable');
        },
        child: Text(
          lable,
          style: TextStyle(color: Colors.white),
        ));
  }
}
