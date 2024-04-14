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

/*

  texto = texto.replaceAll('Comida:', '').replaceAll('*', '').trim();

  // Separar líneas y limpiar cada una
  List<String> lines = texto.split('\n').map((line) => line.trim()).toList();

  // Obtener el nombre de la comida
  String foodName = lines.first;

  // Obtener las cantidades de proteínas, carbohidratos y grasas
  String proteins = lines[1].split(':')[1].trim();
  String carbohydrates = lines[2].split(':')[1].trim();
  String fats = lines[3].split(':')[1].trim();

  // Formatear el texto en el formato deseado

  String formattedText = '''
Comida: $foodName
Proteínas: $proteins
Carbohidratos: $carbohydrates
Grasas: $fats
''';

  return formattedText;


String resultCleaner(String texto) {
  texto = texto.replaceAll(RegExp(r'[{}]'), '');

  texto = texto.replaceAll(',', '\n');

  texto = texto.replaceAll('Comida:', 'Comida:');

  // Reemplazar '1:' por 'Proteínas:'
  texto = texto.replaceAllMapped(RegExp(r'1:([\d.]+) gramos'), (match) {
    return 'Proteínas: ${match.group(1)} gramos';
  });

  // Reemplazar '2:' por 'Carbohidratos:'
  texto = texto.replaceAllMapped(RegExp(r'2:([\d.]+) gramos'), (match) {
    return 'Carbohidratos: ${match.group(1)} gramos';
  });

  // Reemplazar '3:' por 'Grasas:'
  texto = texto.replaceAllMapped(RegExp(r'3:([\d.]+) gramos'), (match) {
    return 'Grasas: ${match.group(1)} gramos';
  });

  return texto;
}
*/