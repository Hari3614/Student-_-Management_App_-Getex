import 'package:get/get.dart';
import 'package:getex/model/student_model.dart';
import 'package:getex/services/database_helper.dart';
import 'package:image_picker/image_picker.dart';

class StudentController extends GetxController {
  var students = <StudentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadStudents();
    print('the length of list is ${students.length}');
  }

  Future pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile == null) {
        return;
      }
      return pickedFile.path;
    } catch (e) {
      print('error fetching error');
    }
  }

  void loadStudents() async {
    List<Map<String, dynamic>> studentData =
        await DbHelper().getAllStudentsData();
    students.assignAll(
        studentData.map((data) => StudentModel.fromMap(data)).toList());
  }

  void addStudent(StudentModel student) async {
    await DbHelper().insertData(student);
    loadStudents();
  }

  void updateStudent(StudentModel student) async {
    await DbHelper().updateDatabase(student);
    loadStudents();
  }

  void deleteStudent(int id) async {
    await DbHelper().deleteStudent(id);
    loadStudents();
  }

  RxList<StudentModel> filteredStudents = <StudentModel>[].obs;

  void searchStudents(String query) {
    filteredStudents.value = students
        .where((student) =>
            student.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    filteredStudents.sort((a, b) {
      int indexOfA = a.name.toLowerCase().indexOf(query.toLowerCase());
      int indexOfB = b.name.toLowerCase().indexOf(query.toLowerCase());

      if (indexOfA == 0 && indexOfB != 0) {
        return -1;
      } else if (indexOfA != 0 && indexOfB == 0) {
        return 1;
      }

      return a.name.compareTo(b.name);
    });
  }
}
