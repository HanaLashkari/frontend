import 'dart:core';
import 'dart:ffi';
import 'Course.dart';
import 'Student.dart';

class Assignment{
  late final Course course;
  DateTime deadLine = DateTime(2024 , 5 , 7);
  final TypeOfAssignment? typeOfAssignment;
  bool isAvailable = true;
  static List<Assignment> assignments = [];
  Map<Student, Double> grades = {};

  Assignment(this.course, this.deadLine, this.typeOfAssignment,
      this.isAvailable);
  void setDeadLine(DateTime d){
    deadLine = d;
  }
  DateTime getDeadLine(){
    return deadLine;
  }
  TypeOfAssignment getType(){
    return typeOfAssignment!;
  }
  void setAvailable(bool b){
    isAvailable = b;
  }
  bool getAvailable(){
    return isAvailable;
  }
  Map<Student , Double> getGrades(){
    return grades;
  }
  void setGrades(Map<Student , Double> g){
    grades.addAll(g);
  }
  static getAllAssignments(){
    return assignments;
  }
}

enum TypeOfAssignment{
  homework , project
}