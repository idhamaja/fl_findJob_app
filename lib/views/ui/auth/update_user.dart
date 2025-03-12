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
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController skill0 = TextEditingController();
  TextEditingController skill1 = TextEditingController();
  TextEditingController skill2 = TextEditingController();
  TextEditingController skill3 = TextEditingController();
  TextEditingController skill4 = TextEditingController();

  @override
  void dispose() {
    phone.dispose();
    location.dispose();
    skill0.dispose();
    skill1.dispose();
    skill2.dispose();
    skill3.dispose();
    skill4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginNotifier>(
        builder: (context, LoginNotifier, child) {
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
                      return imageUploader.imageFile.isEmpty
                          ? GestureDetector(
                              onTap: () {
                                imageUploader.pickImage();
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
                                imageUploader.imageFile.clear();
                                setState(() {
                                  
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: kLightBlue,
                                backgroundImage: FileImage(
                                  File(
                                    imageUploader.imageFile[0],
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: location,
                      hintText: "Location",
                      keyboardType: TextInputType.text,
                      borderRadius: BorderRadius.circular(10.0), // Sudut tumpul
                      validator: (location) {
                        if (location!.isEmpty) {
                          return "Please enter a valid location";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: phone,
                      hintText: "Phone Number",
                      keyboardType: TextInputType.phone,
                      borderRadius: BorderRadius.circular(10.0), // Sudut tumpul
                      validator: (phone) {
                        if (phone!.isEmpty) {
                          return "Please enter a valid phone";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 10),
                    ReusableText(
                      text: "Professional Skills",
                      style: appstyle(30, kDark, FontWeight.bold),
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill0,
                      hintText: "Skill 1",
                      keyboardType: TextInputType.text,
                      borderRadius: BorderRadius.circular(10.0), // Sudut tumpul
                      validator: (skill) {
                        if (skill!.isEmpty) {
                          return "Please enter a valid skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill1,
                      hintText: "Skill 2",
                      keyboardType: TextInputType.text,
                      borderRadius: BorderRadius.circular(10.0), // Sudut tumpul
                      validator: (skill) {
                        if (skill!.isEmpty) {
                          return "Please enter a valid skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill2,
                      hintText: "Skill 3",
                      keyboardType: TextInputType.text,
                      borderRadius: BorderRadius.circular(10.0), // Sudut tumpul
                      validator: (skill) {
                        if (skill!.isEmpty) {
                          return "Please enter a valid skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill3,
                      hintText: "Skill 4",
                      keyboardType: TextInputType.text,
                      borderRadius: BorderRadius.circular(10.0), // Sudut tumpul
                      validator: (skill) {
                        if (skill!.isEmpty) {
                          return "Please enter a valid skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill4,
                      hintText: "Skill 5",
                      keyboardType: TextInputType.text,
                      borderRadius: BorderRadius.circular(10.0), // Sudut tumpul
                      validator: (skill) {
                        if (skill!.isEmpty) {
                          return "Please enter a valid skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    HeightSpacer(size: 20),
                    CustomButton(onTap: () {}, text: "Update Profile"),
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
