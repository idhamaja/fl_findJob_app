import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:practice_job_app_fl/constants/app_constants.dart';
import 'dart:io';

class ImageUploader extends ChangeNotifier {
  final uuid = const Uuid();
  final ImagePicker _picker = ImagePicker();

  String? imageUrl;
  String? imagePath;

  List<String> imageFiles = [];

  Future<void> pickImage(BuildContext context) async {
    try {
      XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        XFile? croppedFile = await cropImage(pickedFile, context);

        if (croppedFile != null) {
          String? uploadedImageUrl = await imageUpload(croppedFile, context);

          if (uploadedImageUrl != null) {
            imageFiles.add(croppedFile.path);
            imagePath = croppedFile.path;
            imageUrl = uploadedImageUrl;
            notifyListeners();
          }
        }
      }
    } catch (e) {
      print("Error picking or uploading image: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  Future<XFile?> cropImage(XFile imageFile, BuildContext context) async {
    try {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
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
        return XFile(croppedFile.path);
      }
    } catch (e) {
      print("Error cropping image: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error cropping image: $e")),
      );
    }
    return null;
  }

  Future<String?> imageUpload(XFile upload, BuildContext context) async {
    try {
      File image = File(upload.path);

      final ref = FirebaseStorage.instance
          .ref()
          .child("FindJob")
          .child("${uuid.v1()}.jpg");

      final uploadTask = ref.putFile(image);
      final taskSnapshot = await uploadTask
          .timeout(const Duration(seconds: 30))
          .catchError((error) {
        print("Upload timeout or canceled: $error");
        throw error;
      });

      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      print("Uploaded image URL: $downloadUrl");

      return downloadUrl;
    } catch (e) {
      print("Error uploading image: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error uploading image")),
      );
      return null;
    }
  }
}
