import 'package:flutter_iterator_pattern_demo/common/iterator/i_iterator.dart';

abstract class IIteratorCollection {
  IIterator createIterator();
}
