import 'package:flutter_iterator_pattern_demo/common/iterator/i_iterator.dart';
import 'package:flutter_iterator_pattern_demo/common/iterator/i_iterator_collection.dart';
import 'package:flutter_iterator_pattern_demo/home/home_iterator.dart';

class HomeIteratorCollection implements IIteratorCollection {
  final int maxCount;

  const HomeIteratorCollection(this.maxCount);

  @override
  IIterator createIterator() => HomeIterator(this);
}
