import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getex/core/constants.dart';
import 'package:getex/model/student_model.dart';
import 'package:getex/presentation/searchpage/search_page.dart' as searchPage;
import 'package:getex/presentation/student_list_screen/student_list.dart'
    as studentList;
import 'package:getex/presentation/widgets/appbar_widget.dart';
import 'package:getex/presentation/widgets/snack_bar.dart';
import 'package:getex/presentation/widgets/textfield.dart';
import 'package:image_picker/image_picker.dart';

class UpdateStudentsScreen extends StatelessWidget {
  const UpdateStudentsScreen({super.key, required this.studentModel});
  final StudentModel studentModel;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: studentModel.name);
    TextEditingController ageController =
        TextEditingController(text: studentModel.age.toString());
    TextEditingController departmentController =
        TextEditingController(text: studentModel.department);
    TextEditingController placeController =
        TextEditingController(text: studentModel.place);
    TextEditingController phoneNoController =
        TextEditingController(text: studentModel.phoneNumber.toString());
    TextEditingController guardianNameController =
        TextEditingController(text: studentModel.guardianName);
    final formKey = GlobalKey<FormState>();
    RxString pickedimage = RxString(studentModel.imageUrl);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBarWidget(
          onTapLeft: () {
            Get.back();
          },
          title: 'Edit Student Details',
          lefticon: Icons.arrow_back,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 120, top: 25),
              child: Obx(
                () => InkWell(
                  onTap: () async {
                    final imagepath = await studentList.studentsController
                        .pickImage(ImageSource.gallery);
                    pickedimage.value = imagepath ?? '';
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 189, 186, 186),
                          borderRadius: boxborderRadius,
                          image: pickedimage.value.isNotEmpty
                              ? DecorationImage(
                                  image: FileImage(File(pickedimage.value)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        width: 150,
                        height: 170,
                        child: pickedimage.value.isEmpty
                            ? const Center(
                                child: Icon(
                                  Icons.add_a_photo,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Constants().kheight20,
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      prefixicon: Icons.person,
                      controller: nameController,
                      hintText: 'Enter the name',
                      labelText: 'Name',
                      inputType: TextInputType.name,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return 'please enter a valid name';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      prefixicon: Icons.calendar_month,
                      controller: ageController,
                      hintText: 'Enter the age',
                      labelText: 'Age',
                      inputType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.parse(value) >= 120 ||
                            int.parse(value) <= 0) {
                          return 'please enter a valid age';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      prefixicon: Icons.diversity_3,
                      controller: guardianNameController,
                      hintText: 'Enter the name of the Guardian',
                      labelText: 'Guardian Name',
                      inputType: TextInputType.name,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return 'please enter a valid name';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      prefixicon: Icons.library_books,
                      controller: departmentController,
                      hintText: 'Enter the department',
                      labelText: 'Department',
                      inputType: TextInputType.text,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return 'please enter a valid department';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      prefixicon: Icons.location_city,
                      controller: placeController,
                      hintText: 'Enter the place',
                      labelText: 'Place',
                      inputType: TextInputType.text,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return 'please enter a valid place';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      prefixicon: Icons.phone,
                      controller: phoneNoController,
                      hintText: 'Enter the phone number',
                      labelText: 'Contact Number',
                      inputType: TextInputType.phone,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length != 10) {
                          return 'please enter a valid phone no';
                        }
                        return null;
                      },
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          color: appBarClrBlk, borderRadius: boxborderRadius),
                      child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate() &&
                                pickedimage.isNotEmpty) {
                              studentList.studentsController.updateStudent(
                                  StudentModel(
                                      id: studentModel.id,
                                      name: nameController.text,
                                      age: int.parse(ageController.text),
                                      department: departmentController.text,
                                      place: placeController.text,
                                      phoneNumber:
                                          int.parse(phoneNoController.text),
                                      guardianName: guardianNameController.text,
                                      imageUrl: pickedimage.string));

                              Get.back();
                              Get.to(const studentList.StudentListScreen());
                            } else if (pickedimage.isEmpty) {
                              snackBarFunction(
                                  title: 'Error',
                                  subtitle: 'Please select an image',
                                  backgroundColor: Colors.red,
                                  dismissDirection: DismissDirection.horizontal,
                                  snackPosition: SnackPosition.BOTTOM,
                                  borderRadius: 10,
                                  animationDuration: const Duration(seconds: 2),
                                  reverseAnimationCurve: Curves.bounceOut,
                                  duration: const Duration(seconds: 2),
                                  snackStyle: SnackStyle.FLOATING);
                            } else {}
                          },
                          child: Text(
                            'Upload Details',
                            style: buttonTxt,
                          )),
                    ),
                    setHeight
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
