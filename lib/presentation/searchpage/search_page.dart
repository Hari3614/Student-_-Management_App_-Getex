import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getex/core/constants.dart';
import 'package:getex/presentation/student_add_screen/student_add_screen.dart';
import 'package:getex/presentation/widgets/appbar_widget.dart';
import 'package:getex/presentation/widgets/floating_action_button.dart';
import 'package:getex/presentation/widgets/show_dialogue.dart';
import 'package:getex/presentation/widgets/textfield.dart';
import 'package:getex/student_model/student_controller.dart';

final StudentController studentsController = Get.put(StudentController());

class StudentsSearchScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  StudentsSearchScreen({Key? key});

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    studentsController.loadStudents();
    return Scaffold(
      backgroundColor: appBarClrWhite,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBarWidget(
          lefticon: Icons.menu,
          righticon: Icons.search,
          onTapright: () {},
          title: 'STUDENTS LIST',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormFieldWidget(
              controller: searchController,
              labelText: 'Search',
              hintText: 'Search Students',
              inputType: TextInputType.name,
              prefixicon: Icons.search,
              onChanged: (value) {
                studentsController.searchStudents(value);
              },
            ),
            Expanded(
              child: Obx(
                () {
                  if (studentsController.students.isEmpty) {
                    return const Center(child: Text('No Student Found'));
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => setHeight,
                        scrollDirection: Axis.vertical,
                        itemCount: studentsController.filteredStudents.length,
                        itemBuilder: (context, index) {
                          var student =
                              studentsController.filteredStudents[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 500,
                              decoration: containerDecoration1.copyWith(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: InkWell(
                                        onTap: () {
                                          showsDialogBoxs(
                                              circleAvatar: CircleAvatar(
                                                radius: 100,
                                                backgroundColor: appBarClrWhite,
                                                backgroundImage: FileImage(
                                                    File(student.imageUrl)),
                                              ),
                                              studentname: Text(
                                                student.name,
                                                style: innerName,
                                              ),
                                              age: Text(
                                                'Age : ${student.age}',
                                                style: ageandDepTxt,
                                              ),
                                              parentname: Text(
                                                'Guardian Name : ${student.guardianName}',
                                                style: ageandDepTxt,
                                              ),
                                              department: Text(
                                                'Department : ${student.department}',
                                                style: ageandDepTxt,
                                              ),
                                              place: Text(
                                                'Place : ${student.place}',
                                                style: ageandDepTxt,
                                              ),
                                              phonenumber: Text(
                                                'Phone : ${student.phoneNumber}',
                                                style: ageandDepTxt,
                                              ),
                                              student: student);
                                        },
                                        child: Container(
                                          width: 320,
                                          height: 350,
                                          decoration: BoxDecoration(
                                            borderRadius: boxborderRadius,
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(
                                                  File(student.imageUrl)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    setHeight15,
                                    Text(
                                      student.name,
                                      style: innerName,
                                    ),
                                    setHeight,
                                    Text(
                                      'Age : ${student.age}',
                                      style: ageandDepTxt,
                                    ),
                                    Text(
                                      'Department : ${student.department}',
                                      style: ageandDepTxt,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          const FloatingActionButtonWidget(page: AddStudentScreen()),
    );
  }
}
