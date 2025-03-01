import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getex/presentation/student_list_screen/student_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: StudentListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
