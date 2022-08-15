class Molecule {
  final String _formule;
  final String _name;

  Molecule({
    required String formula,
    required String name
  }) :
    _formule = formula,
    _name = name;

  String get formula => _formule;
  int get weight => 0;
}
