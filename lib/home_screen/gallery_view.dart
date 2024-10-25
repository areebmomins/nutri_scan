import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/utils.dart';

class GalleryView extends StatefulWidget {
  GalleryView(
      {Key? key,
      required this.title,
      this.text,
      required this.onImage,
      required this.onDetectorViewModeChanged})
      : super(key: key);

  final String title;
  final String? text;
  final Function(InputImage inputImage) onImage;
  final Function()? onDetectorViewModeChanged;

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  File? _image;
  String? _path;
  ImagePicker? _imagePicker;

  @override
  void initState() {
    super.initState();

    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _galleryBody());
  }

  Widget _galleryBody() {
    return Column(children: [
      const Spacer(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SizedBox(
          height: 320,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _image != null
                  ? Image.file(_image!)
                  : const Icon(
                      Icons.image,
                      size: 240,
                      color: Color(0xFFA095C1),
                    ),
            ],
          ),
        ),
      ),
      const Spacer(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF56428F),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.attach_file, size: 32),
                  color: Colors.white,
                  onPressed: _getImageAsset,
                  padding: const EdgeInsets.all(16),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Asset',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF82799D),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF56428F),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.image, size: 32),
                  color: Colors.white,
                  onPressed: () => _getImage(ImageSource.gallery),
                  padding: const EdgeInsets.all(16),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF82799D),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF56428F),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.camera_alt_outlined, size: 32),
                  color: Colors.white,
                  onPressed: () => _getImage(ImageSource.camera),
                  padding: const EdgeInsets.all(16),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Camera',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF82799D),
                ),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 40),
      // if (_image != null)
      //   Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Text(
      //         '${_path == null ? '' : 'Image path: $_path'}\n\n${widget.text ?? ''}'),
      //   ),
    ]);
  }

  Future _getImage(ImageSource source) async {
    setState(() {
      _image = null;
      _path = null;
    });
    final pickedFile = await _imagePicker?.pickImage(source: source);
    if (pickedFile != null) {
      _processFile(pickedFile.path);
    }
  }

  Future _getImageAsset() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final assets = manifestMap.keys
        .where((String key) => key.contains('images/'))
        .where((String key) =>
            key.contains('.jpg') ||
            key.contains('.jpeg') ||
            key.contains('.png') ||
            key.contains('.webp'))
        .toList();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select image',
                    style: TextStyle(fontSize: 20),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.7),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (final path in assets)
                            GestureDetector(
                              onTap: () async {
                                Navigator.of(context).pop();
                                _processFile(await getAssetPath(path));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(path),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Cancel')),
                ],
              ),
            ),
          );
        });
  }

  Future _processFile(String path) async {
    setState(() {
      _image = File(path);
    });
    _path = path;
    final inputImage = InputImage.fromFilePath(path);
    widget.onImage(inputImage);
  }
}
