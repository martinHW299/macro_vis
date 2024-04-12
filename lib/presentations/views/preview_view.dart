import 'dart:io';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:macro_vision_1/utils/text_cleaner.dart';
import 'package:macro_vision_1/utils/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:macro_vision_1/models/vision_model.dart';

class PreviewView extends StatefulWidget {
  const PreviewView({super.key});

  @override
  State<PreviewView> createState() => _PreviewViewState();
}

class _PreviewViewState extends State<PreviewView> {
  final VisionModel visionModel = VisionModel();

  final gemini = Gemini.instance;

  File? _selectedImage;

  String _resultText = '';

  void _loadImageFromGallery() async {
    File? image = await pickImageFromGallery(context);
    setState(() {
      _selectedImage = image;
    });
  }

  void _loadImageFromCamera() async {
    File? image = await pickImageFromCamera(context);
    setState(() {
      _selectedImage = image;
    });
  }

  void _deleteSelectedImage() {
    setState(() {
      _selectedImage = null;
    });
  }

  void _analyzeImage() async {
    if (_selectedImage != null) {
      final String? result =
          await visionModel.processImageAndText(_selectedImage!);

      setState(() {
        _resultText = result!;
      });
    } else {
      setState(() {
        _resultText = 'Imagen no seleccionada';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double imageSize = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              _selectedImage != null
                  ? Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Image.file(_selectedImage!,
                            width: imageSize,
                            height: imageSize,
                            fit: BoxFit.cover),
                        IconButton(
                            onPressed: _deleteSelectedImage,
                            icon: const Icon(Icons.close, color: Colors.white))
                      ],
                    )
                  : Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade100),
                      child: const Center(
                        child: Text('Seleccionar una imagen'),
                      ),
                    ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      onPressed: _loadImageFromCamera,
                      icon: const Icon(Icons.camera_alt_outlined),
                      label: const Text('Cámara')),
                  ElevatedButton.icon(
                    onPressed: _loadImageFromGallery,
                    icon: const Icon(Icons.photo_library_outlined),
                    label: const Text('Galería'),
                  ),
                  if (_selectedImage != null)
                    ElevatedButton(
                      onPressed: () {
                        _analyzeImage();
                      },
                      child: const Text('Analizar'),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: imageSize,
                child: TextField(
                  readOnly: true,
                  controller:
                      TextEditingController(text: resultCleaner(_resultText)),
                  maxLines: null,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Resultado',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
