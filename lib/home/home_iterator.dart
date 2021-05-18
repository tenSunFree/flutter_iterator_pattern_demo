import 'dart:math';
import 'package:flutter_iterator_pattern_demo/home/home_iterator_collection.dart';
import '../common/iterator/i_iterator.dart';

class HomeIterator implements IIterator {
  final HomeIteratorCollection collection;

  int get maxCount => collection.maxCount;
  late int currentCount = 0;

  HomeIterator(this.collection);

  @override
  bool hasNext() => currentCount < maxCount;

  @override
  int? getNext() {
    if (!hasNext()) return null;
    currentCount++;
    return Random().nextInt(maxCount - 1) + 1;
  }
}
