String resultCleaner(String texto) {
  texto = texto
      .replaceAll('[log]', '')
      .replaceAll('Comida:', '')
      .replaceAll('*', '')
      .trim();

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
}
