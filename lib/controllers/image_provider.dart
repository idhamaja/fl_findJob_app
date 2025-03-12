import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_job_app_fl/constants/app_constants.dart';

class ImageUploader extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();

  String? imageUrl;
  String? imagePath;

  List<String> imageFile = [];

  void pickImage() async {
    // ignore: no_leading_underscores_for_local_identifiers

    XFile? _imageFile = await _picker.pickImage(source: ImageSource.gallery);

    if (_imageFile != null) {
      // Crop the image
      _imageFile = await cropImage(_imageFile);
      if (_imageFile != null) {
        imageFile.add(_imageFile.path);
      } else {
        return;
      }
    }
  }

  Future<XFile?> cropImage(XFile imageFile) async {
    // Crop the image using image_cropper package
    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: imageFile.path,
      maxWidth: 800,
      maxHeight: 600,
      compressQuality: 70,
      aspectRatio: const CropAspectRatio(ratioX: 4, ratioY: 3),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'FindJob Cropper Image',
          toolbarColor: kLightBlue,
          toolbarWidgetColor: kLight,
          initAspectRatio: CropAspectRatioPreset.ratio5x4,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'FindJob Cropper Image',
        ),
      ],
    );

    if (croppedFile != null) {
      notifyListeners();
      return XFile(croppedFile.path);
    } else {
      return null;
    }
  }

  Future<String?> imageUpload(XFile upload) async {}
}
