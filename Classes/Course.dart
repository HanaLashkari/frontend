import 'dart:core';
import 'dart:ffi';
import 'Assignment.dart';
import 'Student.dart';
import 'Teacher.dart';

class Course{
  late final String name;
  late final Int unit; //vahed in dars
  late Teacher professor;
  late bool available = true;
  late final Int code;
  List<Student> students = [];
  Map<Student , Double> grades = {};
  List<Assignment> homeworks = [];
  List<Assignment> projects = [];
  DateTime date = DateTime(2024 , 5  , 22);


  Course(this.name, this.unit, this.professor, this.code);


  String getName(){
    return name;
  }
  Int getUnit(){
    return unit;
  }
  Teacher getProfessor(){
    return professor;
  }
  void setProfessor(Teacher t){
    professor = t;
  }
  void setAvailable(bool b){
    available = b;
  }
  bool getAvailable(){
    return available;
  }
  Int getCode(){
    return code;
  }
  List<Student> getStudents(){
    return students;
  }
  void addStudent(Student s){
    students.add(s);
  }
  void addStudents(List<Student> s){
    students.addAll(s);
  }
  Map<Student , Double> getGrades(){
    return grades;
  }
  void setGrades(Map<Student , Double> g){
    grades.addAll(g);
  }
  void addProject(Assignment project){
    projects.add(project);
  }
  List<Assignment> getProjects(){
    return projects;
  }
  void addHomework(Assignment homework){
    homeworks.add(homework);
  }
  List<Assignment> getHomeworks(){
    return homeworks;
  }
  void setDateExam(DateTime d){
    date = d;
  }
  DateTime getDateExam(){
    return date;
  }
}