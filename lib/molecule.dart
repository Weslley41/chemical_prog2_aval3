import 'package:chemical_prog2_aval3/atom.dart';

class Molecule implements Comparable<Molecule> {
  late String _formula, _name;
  final List<Map<String, dynamic>> _atoms = [];
  late int _weight;

  Molecule({required String formula, required String name}) {
    this.formula = formula;
    _name = name;
  }

  set formula(String formula) {
    if (formula.isEmpty) {
      throw Exception('Invalid formula: $formula');
    }

    _weight = 0;
    _formula = formula;
    final regex = RegExp('(?<symbol>[A-Z][a-z]?d*)(?<count>[0-9]*)');
    final atoms = regex.allMatches(formula);

    for (var atom in atoms) {
      String? atomSymbol = atom.namedGroup('symbol');
      int atomCount;

      switch (atom.namedGroup('count')) {
        case '':
          atomCount = 1;
          break;
        case '1':
          throw Exception('Invalid formula: $formula');
        default:
          atomCount = int.parse(atom.namedGroup('count')!);
          break;
      }

      try {
        Atom atom = Atom(symbol: atomSymbol!);
        _atoms.add({
          "atom": atom,
          "count": atomCount
        });
        _weight += atom.weight * atomCount;
      } catch (e) {
        throw Exception('Invalid formula: $formula');
      }
    }
  }

  @override
  String toString() => "$_name: $_formula";
  String get formula => _formula;
  int get weight => _weight;

  @override
  int compareTo(other) => (_weight - other.weight).truncate();
}
