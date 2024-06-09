import 'dart:collection';
import 'dart:ffi';
import 'Course.dart';

class Teacher{
  String? name;
  Long? id;
  Map<Int , Course>? courses = {};
  List<Teacher> allTeachers = [];

  Teacher(this.name, this.id);

  void setName(String name){
    this.name = name;
  }
  String getName(){
    return name!;
  }
  void setId(Long id){
    this.id = id;
  }
  Long getId(){
    return id!;
  }
  void addCourses(Map<Int , Course> c){
    courses?.addAll(c);
  }
  Map<Int , Course> getCourses(){
    return courses!;
  }
  void addTeacher(Teacher t){
    allTeachers.add(t);
  }
  List<Teacher> getTeachers(){
    return allTeachers;
  }
}

