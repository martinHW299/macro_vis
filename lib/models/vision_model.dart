import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_gemini/src/models/candidates/candidates.dart';

class VisionModel {
  final Gemini gemini = Gemini.instance;

  Future<String?> processImageAndText(File imageFile) async {
    try {
      final Uint8List imageBytes = await imageFile.readAsBytes();

      final Candidates? candidates = (await gemini.textAndImage(
        text:
            "Detecta cada alimento que contiene la imagen, la cantidad de macronutrientes de cada alimento y solo retorna la suma total de macronutrientes de la comida. Los macronutrientes los vamos a representar con ID's, proteínas = 1, carbohidratos = 2, grasas = 3. Retorna la respuesta en formato JSON, respetando su notacion entre comillas dobles de variables y su valor: {Comida:Descripción, 1:X gramos, 2:Y gramos, 3:Z gramos}",
        images: [imageBytes],
      ));

      if (candidates != null) {
        final String? result = candidates.content!.parts?.first.text;
        log(result!);
        return result; // Retorna la cadena resultante
      } else {
        return null; // Retorna null si no hay respuesta válida
      }
    } catch (e) {
      log('Error processing image: $e');
      return null; // Retorna null en caso de error
    }
  }
}
