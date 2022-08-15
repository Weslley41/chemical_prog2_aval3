import 'package:chemical_prog2_aval3/elements.dart';

class Atom {
  late String _symbol;

  Atom({required String symbol}) {
    if (Elements().hasElement(symbol)) {
      _symbol = symbol;
    } else {
      Exception('Elemento inexistente "$symbol"');
    }
  }

  @override
  String toString() => _symbol;
}
