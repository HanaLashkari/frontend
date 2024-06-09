import 'dart:ffi';
import 'Course.dart';

class Student{
  late final String name;
  late final Long id;
  late String password;
  final List<Int> _allCourseNumber = [];
  final List<Int> _allCourseUnits = [];
  List<Course> _currentCourses = [];
  final List<List<Course>> _allCourses = [];

  List<Int> get allCourseNumber => _allCourseNumber;

  double _currentAverage = 0.0;
  double _totalAverage = 0.0;

  Student(this.name, this.id, this.password);

  List<Int> get allCourseUnits => _allCourseUnits;

  List<Course> get currentCourses => _currentCourses;

  set currentCourses(List<Course> value) {
    _currentCourses = value;
  }

  List<List<Course>> get allCourses => _allCourses;


  double get currentAverage => _currentAverage;

  set currentAverage(double value) {
    _currentAverage = value;
  }

  double get totalAverage => _totalAverage;

  set totalAverage(double value) {
    _totalAverage = value;
  }

  String getPassword(){
    return password;
  }
  void changePassword(String p){
    password = p;
  }
}