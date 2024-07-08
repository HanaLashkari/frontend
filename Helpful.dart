import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project/todolist.dart';

class FieldBox extends StatelessWidget{
  const FieldBox({super.key , required this.labelText,required this.controller , required this.hintText});
  final controller;
  final String labelText;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white70,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xff003b11),
            fontWeight: FontWeight.w300,
          ),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green , width: 5)),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFB4B4B4)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xff003b11) , width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
                color: Color(0xff09ce36),
                style: BorderStyle.solid),
          ),
        ),
      ),
    );
  }
}

class LittleFieldBox extends StatelessWidget {
  const LittleFieldBox({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.hintText,
    required this.width,
  }) : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white70,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.never, // اضافه کردن خاصیت floatingLabelBehavior
          labelStyle: const TextStyle(
            color: Color(0xff003b11),
            fontWeight: FontWeight.w300,
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 5),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF706D6D)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xff003b11), width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xff09ce36),
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}

class PharseText extends StatelessWidget {
  const PharseText(
      {super.key, required this.pharse, required this.color, required this.size});

  final String? pharse;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      pharse!,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

class Eror_login extends StatelessWidget{
  Eror_login({required this.response , required this.widthOfScreen , required this.buttonColor});
  String response;
  double widthOfScreen;
  Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return response == '10'? Positioned(
        top: 560,
        right: widthOfScreen * 0.138,
        child: PharseText(
          pharse: 'رمز عبور اشتباه است دوباره امتحان کنید',
          size: 17,
          color: buttonColor,
        )
    ) : response == '01' || response == '00' ?
    Positioned(
        top: 560,
        right: widthOfScreen * 0.21,
        child: PharseText(
          pharse: 'اطلاعات یافت نشد، ثبت نام کنید',
          size: 17,
          color: buttonColor,
        )
    ) : Positioned(child: Container());
  }

  }

class Eror_password extends StatelessWidget{
  Eror_password({required this.response , required this.widthOfScreen , required this.buttonColor});
  String response;
  double widthOfScreen;
  Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return response == '0'? Positioned(
        top: 540,
        right: widthOfScreen * 0.12,
        child: PharseText(
          pharse: 'رمز عبور اشتباه باید بیشتر از 8 حرف باشد',
          size: 17,
          color: buttonColor,
        )
    ) : response == '1' ?
    Positioned(
        top: 540,
        right: widthOfScreen * 0.055,
        child: PharseText(
          pharse: 'رمز عبور باید شامل یکی از کارکترهای @ ، ! ، # و \$ باشد',
          size: 15,
          color: buttonColor,
        )
    ) : response == '2' ? Positioned(
        top: 540,
        right: widthOfScreen * 0.085,
        child: PharseText(
          pharse: 'رمز عبور باید شامل یک حرف بزرگ انگلیسی باشد',
          size: 16,
          color: buttonColor,
        )
    )
        : response == '3' ? Positioned(
        top: 540,
        right: widthOfScreen * 0.085,
        child: PharseText(
          pharse: 'رمز عبور باید شامل یک حرف کوچک انگلیسی باشد',
          size: 16,
          color: buttonColor,
        )
    ): response == '4' ? Positioned(
        top: 540,
        right: widthOfScreen * 0.14,
        child: PharseText(
          pharse: 'رمز عبور باید شامل یکی از اعداد 0-9 باشد',
          size: 16,
          color: buttonColor,
        )
    ) :
    response == '6' ? Positioned(
        top: 540,
        right: widthOfScreen * 0.055,
        child: PharseText(
          pharse: 'رمز عبور نباید شامل نام کاربری و شماره دانشجویی باشد',
          size: 15,
          color: buttonColor,
        )
    ) :
    response == '7' ? Positioned(
        top: 540,
        right: widthOfScreen * 0.25,
        child: PharseText(
          pharse: 'این حساب کاربری وجود دارد',
          size: 17,
          color: buttonColor,
        )
    ) :
    Positioned(child: Container());
  }

}

class ToDoList extends StatefulWidget{
  ToDoList({required this.title , required this.b , required this.firstStr , required this.id});
  String title;
  bool b;
  String firstStr;
  int id;
  @override
  static const buttonColor = Color(0xffbb0000);
  static const textColor = Color(0xFF024335);
  static const backgroundColor = Color(0xFFE6F6EF);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {

    return Container(
        width: 350,
        height: 60,
        decoration: BoxDecoration(
          color: widget.b ? ToDoList.backgroundColor : Color(0xFFF8FFF8),
          borderRadius: BorderRadius.all(Radius.circular(13)),
          border: Border.all(
            color: ToDoList.textColor,
            width: 3.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 13,
              right: 10,
              child: Text(
              widget.title,
              style: TextStyle(
                color: widget.b ? ToDoList.textColor : ToDoList.buttonColor,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                decoration: widget.b?TextDecoration.none : TextDecoration.lineThrough,
                decorationColor: ToDoList.buttonColor
              ),
            ),),
            Positioned(
              top: 3,
                child: Row(
                  children: [
                    InkWell(
                      child: IconButton(
                        icon: Icon(
                          size: 28,
                          Icons.cancel_outlined,
                          color: ToDoList.buttonColor,
                        ),
                        onPressed: () => setState(
                              () {
                          },
                        ),
                      ),
                    ),
                    widget.b ? InkWell(
                      child: IconButton(
                        icon: Icon(
                          size: 28,
                          Icons.task_alt,
                          color: Colors.green,
                        ),
                        onPressed: () => setState(
                              () {
                                doTask(widget.firstStr);
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) => page(widget.id),
                                ));
                          },
                        ),
                      ),
                    ) : SizedBox(width: 0,),
                  ],
                ))
        ]
        )
    );
  }
  Future<void> doTask(String s) async {
    final socket = await Socket.connect("192.168.141.145", 8000);
    socket.write('doTask\u0000');
    socket.write('${s}\u0000');
    socket.flush();
  }
}

class ProjectHandler{
  String firstString;
  String title;
  DateTime dataTime;
  String estimatedTime;
  String description;
  String grade;
  String hour;
  String deadline;
  ProjectHandler({required this.firstString , required this.title ,required this.dataTime , required this.grade , required this.description , required this.estimatedTime , required this.hour , required this.deadline});
  DateTime dateTime(){return this.dataTime;}
}

class ToDoListHandlaer{
  String firstString;
  String title;
  DateTime dataTime;
  String minute;
  String hour;
  String isDone;
  ToDoListHandlaer({required this.firstString , required this.title ,required this.dataTime , required this.hour , required this.minute , required this.isDone});
  DateTime dateTime(){return this.dataTime;}
}

class page extends StatefulWidget{
  int id;
  page(this.id);
  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  @override
  void initState()  {
    super.initState();
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => todolist(widget.id),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

