import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getex/core/constants.dart';
import 'package:getex/model/student_model.dart';
import 'package:getex/presentation/update_student/update_student.dart';
import 'package:getex/presentation/widgets/dialogue_delete.dart';

void showsDialogBoxs({
  required CircleAvatar circleAvatar,
  required Text studentname,
  required Text parentname,
  required Text department,
  required Text phonenumber,
  required Text age,
  required Text place,
  required StudentModel student,
}) {
  Get.dialog(Dialog(
    shadowColor: Colors.black,
    child: Container(
      height: 500,
      decoration: containerDecoration2.copyWith(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Container(child: circleAvatar),
                ),
                setHeight15,
                studentname,
                setHeight,
                age,
                setHeight,
                parentname,
                setHeight,
                place,
                setHeight,
                department,
                setHeight,
                phonenumber,
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10, // Adjust the values based on your requirements
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: boxborderRadius,
                color: appBarClrWhite,
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        showDialogueforDelete(student);
                      },
                      icon: const Icon(Icons.delete, color: appBarClrBlk)),
                  IconButton(
                      onPressed: () {
                        Get.to(UpdateStudentsScreen(studentModel: student));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: appBarClrBlk,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}
