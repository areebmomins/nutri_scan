import 'package:flutter/material.dart';

void showUploadImageBottomSheet(
  BuildContext context,
  Function() onUploadFromGalleryClicked,
  Function() onTakePictureClicked,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    builder: (context) {
      return Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Upload from Gallery',
                    style: TextStyle(
                      color: Color(0xFF56428F),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onTap:() {
                  onUploadFromGalleryClicked();
                  Navigator.pop(context);
                },
              ),
              GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Take Picture',
                    style: TextStyle(
                      color: Color(0xFF56428F),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onTap: () {
                  onTakePictureClicked();
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 32),
            ],
          ),
        ],
      );
    },
  );
}
