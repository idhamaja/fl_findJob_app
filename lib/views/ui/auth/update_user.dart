import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice_job_app_fl/controllers/exports.dart';
import 'package:practice_job_app_fl/views/common/custom_btn.dart';
import 'package:practice_job_app_fl/views/common/custom_textfield.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';
import 'package:practice_job_app_fl/views/common/height_spacer.dart';
import 'package:provider/provider.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final List<TextEditingController> _skillControllers =
      List.generate(5, (index) => TextEditingController());

  @override
  void dispose() {
    _phoneController.dispose();
    _locationController.dispose();
    for (var controller in _skillControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      // Lakukan sesuatu dengan data yang diinput
      final location = _locationController.text;
      final phone = _phoneController.text;
      final skills =
          _skillControllers.map((controller) => controller.text).toList();

      print('Location: $location');
      print('Phone: $phone');
      print('Skills: $skills');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginNotifier>(
        builder: (context, loginNotifier, child) {
          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 60.h,
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                    text: "Personal Details",
                    style: appstyle(35, kDark, FontWeight.bold),
                  ),
                  Consumer<ImageUploader>(
                    builder: (context, imageUploader, child) {
                      return imageUploader.imageFiles.isEmpty
                          ? GestureDetector(
                              onTap: () {
                                imageUploader.pickImage(context);
                              },
                              child: CircleAvatar(
                                backgroundColor: kLightBlue,
                                child: const Center(
                                  child: Icon(Icons.photo_filter_rounded),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                imageUploader.imageFiles.clear();
                                setState(() {});
                              },
                              child: CircleAvatar(
                                backgroundColor: kLightBlue,
                                backgroundImage: FileImage(
                                  File(
                                    imageUploader.imageFiles[0],
                                  ),
                                ),
                              ),
                            );
                    },
                  )
                ],
              ),
              const HeightSpacer(size: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: _locationController,
                      hintText: "Location",
                      keyboardType: TextInputType.text,
                      borderRadius: BorderRadius.circular(10.0),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a valid location";
                        }
                        return null;
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: _phoneController,
                      hintText: "Phone Number",
                      keyboardType: TextInputType.phone,
                      borderRadius: BorderRadius.circular(10.0),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a valid phone number";
                        }
                        return null;
                      },
                    ),
                    const HeightSpacer(size: 10),
                    ReusableText(
                      text: "Professional Skills",
                      style: appstyle(30, kDark, FontWeight.bold),
                    ),
                    const HeightSpacer(size: 10),
                    ..._skillControllers.map((controller) {
                      return Column(
                        children: [
                          CustomTextField(
                            controller: controller,
                            hintText:
                                "Skill ${_skillControllers.indexOf(controller) + 1}",
                            keyboardType: TextInputType.text,
                            borderRadius: BorderRadius.circular(10.0),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a valid skill";
                              }
                              return null;
                            },
                          ),
                          const HeightSpacer(size: 10),
                        ],
                      );
                    }).toList(),
                    HeightSpacer(size: 20),
                    CustomButton(
                      onTap: _updateProfile,
                      text: "Update Profile",
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
