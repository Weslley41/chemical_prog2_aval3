import 'dart:io';

class Element {
  final String _symbol;
  final String _name;
  final String _latinName;
  final int _weight;

  Element({
    required String simbol,
    required String name,
    required String latinName,
    required int weight,
  }) :
    _symbol = simbol,
    _name = name,
    _latinName = latinName,
    _weight = weight;

  @override
  String toString() => _symbol;
  String get symbol => _symbol;
  String get name => _name;
  String get latinName => _latinName;
  int get weight => _weight;
}

class Elements extends Iterable {
  final List<Element> _elements = [];

  Elements() {
    File file = File('elements.csv');
    List<String> fileLines = file.readAsLinesSync();

    for (var i = 1; i < fileLines.length; i++) {
      List<String> data = fileLines[i].split(',');

      _elements.add(
        Element(simbol: data[1], name: data[2], latinName: data[3], weight: int.parse(data[0]))
      );
    }
  }

  @override
  Iterator<Element> get iterator => _elements.iterator;

  bool hasElement(symbol) {
    for (var element in _elements) {
      if (element.symbol == symbol) return true;
    }
    return false;
  }
}
