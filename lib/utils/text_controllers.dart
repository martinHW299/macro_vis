String resultCleaner(String texto) {
  texto =
      texto.replaceAll('{', '').replaceAll('}', '').replaceAll('"', '').trim();

  List<String> partes = texto.split('\n');

  String comida = '';
  double proteina = 0.0;
  double carbohidratos = 0.0;
  double grasas = 0.0;

  for (String parte in partes) {
    List<String> keyValue = parte.split(':');
    if (keyValue.length == 2) {
      String key = keyValue[0].trim();
      String value = keyValue[1].trim();

      if (key == 'Comida') {
        comida = value;
      } else if (key == '1') {
        proteina = double.tryParse(value.split(' ')[0]) ?? 0.0;
      } else if (key == '2') {
        carbohidratos = double.tryParse(value.split(' ')[0]) ?? 0.0;
      } else if (key == '3') {
        grasas = double.tryParse(value.split(' ')[0]) ?? 0.0;
      }
    }
  }
  String formattedText = '''
Comida: $comida
Proteínas: $proteina gramos
Carbohidratos: $carbohidratos gramos
Grasas: $grasas gramos
''';
  return formattedText;
}

bool isValidEmail(String email) {
  const emailRegex = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
  return RegExp(emailRegex).hasMatch(email);
}

bool isValidPassword(String password) {
  const passwordRegex = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$';
  return RegExp(passwordRegex).hasMatch(password);
}
