import 'package:flutter/material.dart';
import 'package:flutter_iterator_pattern_demo/common/iterator/i_iterator_collection.dart';
import 'package:flutter_iterator_pattern_demo/home/home_iterator_collection.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final IIteratorCollection _collection;
  int maxCount = 30;
  int? _currentIndex = 0;
  bool _isTraversing = false;

  @override
  void initState() {
    super.initState();
    _collection = HomeIteratorCollection(maxCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: Color(0xFF73C0F4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildGridView(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Color(0xFF8F4F06)),
            onPressed: _isTraversing ? null : _traverse,
            child: Text(
              '按鈕',
              style: TextStyle(color: Color(0xFFE6EFF3)),
            ),
          )
        ],
      ),
    )));
  }

  Future _traverse() async {
    _toggleIsTraversing();
    final iterator = _collection.createIterator();
    while (iterator.hasNext()) {
      setState(() {
        _currentIndex = iterator.getNext();
      });
      await Future.delayed(const Duration(seconds: 1));
    }
    _toggleIsTraversing();
  }

  void _toggleIsTraversing() {
    setState(() {
      _isTraversing = !_isTraversing;
    });
  }

  Widget buildGridView() {
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1),
      children: buildGridViewChildren(),
    );
  }

  List<Widget> buildGridViewChildren() {
    List<Widget> list = [];
    for (int i = 1; i < maxCount + 1; i++)
      list.add(buildGridViewChildrenItem(i));
    return list;
  }

  Widget buildGridViewChildrenItem(int index) {
    return new Container(
      alignment: Alignment.center,
      color: _getBackgroundColor(index),
      child: new Text(
        '$index',
        style: TextStyle(color: Color(0xFF8F4F06)),
      ),
    );
  }

  Color _getBackgroundColor(int index) =>
      _currentIndex == index ? Color(0xFFF3E4C6) : Color(0xFFE6EFF3);
}
