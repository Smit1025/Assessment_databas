import 'package:flutter/material.dart';
import 'package:flutter1/Offline_Assess.dart/student_module.dart';
import 'package:flutter1/offline_Asiment/addstudent.dart';
import 'package:flutter1/offline_Asiment/editstudent.dart';
import 'package:flutter1/offline_Asiment/sevices.dart';
import 'package:flutter1/offline_Asiment/studentmodel.dart';

class DashBoardSqlFlite extends StatefulWidget {
  const DashBoardSqlFlite({super.key});

  @override
  State<DashBoardSqlFlite> createState() => _DashBoardSqlFliteState();
}

class _DashBoardSqlFliteState extends State<DashBoardSqlFlite> {
  List<StudentModel> studentList = []; //create blank list of StudentModel
  var studentServices = StudentServices();
  var studentModel = StudentModel();

  @override
  void initState() {
    super.initState();
    getAllRecordFromStudent();
  }

  getAllRecordFromStudent() async //creating method which fetch from record from table
  {
    studentServices = StudentServices(); //initlization
    var allStudent = await studentServices.readService("Student");

    allStudent.forEach((singleStudent) {
      setState(() {
        studentModel = StudentModel();

        studentModel.id = singleStudent["id"];
        studentModel.name = singleStudent["name"];
        studentModel.subject = singleStudent["subject"];
        studentModel.marks = singleStudent["marks"];

        studentList.add(studentModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("${studentList[index].name}"),
                subtitle: Text("${studentList[index].subject}"),
                trailing: Wrap(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditStudentPage(
                                        studentModel: studentList[index],
                                      )));
                        },
                        icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: () async {
                          print(studentList[index]);
                          var studentModel = StudentModel();
                          var studentServices = StudentServices();

                          studentModel.id = studentList[index].id;
                          var result = await studentServices.deleteService(
                              "Student", studentModel);

                          print(result);
                          studentList = [];
                          getAllRecordFromStudent();
                        },
                        icon: Icon(Icons.delete)),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddStudentPage()));
        },
        child: Icon(Icons.list),
      ),
    );
  }
}
