import 'package:chemical_prog2_aval3/elements.dart';

class Atom {
  late String _symbol;
  late Element? _element;

  Atom({required String symbol}) {
    _element = Elements().hasElement(symbol);
    if (_element != null) {
      _symbol = symbol;
    } else {
      throw Exception('invalid element: "$symbol"');
    }
  }

  @override
  String toString() => _symbol;
  int get weight => _element!.weight;
}
