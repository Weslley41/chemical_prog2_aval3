import 'dart:io';

class Element {
  final String _symbol, _name, _latinName;
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

  static final Elements _instance = Elements._internal();
  factory Elements() => _instance;
  Elements._internal() {
    List<String> file = File('examples/elements.csv').readAsLinesSync();

    for (var i = 1; i < file.length; i++) {
      List<String> data = file[i].split(',');

      _elements.add(
        Element(simbol: data[1], name: data[2], latinName: data[3], weight: int.parse(data[0]))
      );
    }
  }

  @override
  Iterator<Element> get iterator => _elements.iterator;

  Element? hasElement(symbol) {
    for (var element in _elements) {
      if (element.symbol == symbol) return element;
    }
    return null;
  }
}
