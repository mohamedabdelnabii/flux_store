import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../generated/l10n.dart';
import '../theme/app_text_styles.dart';

class ImagePickerService {
  static Future<File?> pickImage({required BuildContext context}) async {
    final ImagePicker picker = ImagePicker();

    File? pickedImage;

    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(
                  S.of(context).camera,
                  style: AppTextStyles.font16BlackMedium,
                ),
                onTap: () async {
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (image != null) {
                    pickedImage = File(image.path);
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(
                  S.of(context).gallery,
                  style: AppTextStyles.font16BlackMedium,
                ),
                onTap: () async {
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (image != null) {
                    pickedImage = File(image.path);
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );

    return pickedImage;
  }
}
