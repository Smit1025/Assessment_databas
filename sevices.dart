import 'package:flutter1/Offline_Assess.dart/Repositroy.dart';
import 'package:flutter1/Offline_Assess.dart/student_module.dart';
import 'package:flutter1/offline_Asiment/repository.dart';
import 'package:flutter1/offline_Asiment/studentmodel.dart';

class StudentServices {
  late Repository _repository;

  StudentServices() {
    _repository = Repository();
  }

  insertService(table, StudentModel studentModel) async {
    return await _repository.insertRecord(table, studentModel.studentMap());
  }

  readService(table) async {
    return await _repository.fetchRecord(table);
  }

  updateService(table, StudentModel studentModel) async {
    return await _repository.updateRecord(table, studentModel.studentMap());
  }

  deleteService(table, StudentModel studentModel) async {
    return await _repository.deleteRecord(table, studentModel.studentMap());
  }
}
