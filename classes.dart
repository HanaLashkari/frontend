import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Helpful.dart';
import 'home.dart';
import 'package:project/news.dart';
import 'package:project/projects.dart';
import 'package:project/todolist.dart';

class classes extends StatefulWidget{
  int id;
  classes(this.id);
  @override
  State<classes> createState() => _classesState();
}

class _classesState extends State<classes> {
  static const buttonColor = Color(0xffbb0000);
  static const textColor = Color(0xFF024335);
  static const backgroundColor = Color(0xFFE6F6EF);
  final codeController = TextEditingController();
  String response = '';
  List<String> list = [];

  @override
  void initState()  {
    super.initState();
    showClasses().then((response) {
      setState(() {
        print('------3-090-103-03--0----here ====== reponse = $response ');
        list = response.split("=");

      });
    }).catchError((error) {

    });
    }

  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    int x = list.length;
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحه کلاسا'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: widthOfScreen,
          height: heightOfScreen + (x>3 ? (x-3)*210 : 0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: const [
                  0.5,
                  0.8,
                  0.9,
                ],
                colors: [
                  Colors.white,
                  Colors.green.shade50,
                  Colors.green.shade100,
                ]),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 35,
                  right: 20,
                  child: Text(
                    'کلاسا',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  )
              ),
              Positioned(
                top: 25,
                left: 13,
                child: InkWell(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Color(0xff97d2b3),
                            title: Row(
                              children: [
                                Spacer(),
                                PharseText(pharse: "افزودن درس جدید", color: backgroundColor, size: 20,),
                                Icon(
                                  Icons.school_sharp,
                                  color: backgroundColor,),
                              ],
                            ),
                            content: Container(
                              width: 300,
                              height: 80,
                              child: Column(
                                children: [
                                  SizedBox(height: 8,),
                                  FieldBox(labelText: "کد درس", controller: codeController, hintText: "کد درس گلستان را وارد کنید" ),
                                ],
                              ),
                            ),
                            actions: [
                              InkWell(
                                  onTap: () async {
                                    addClass();
                                    Navigator.of(context).pop();
                                    print('----- reponse = $response');
                                    if(response == 'not found'){
                                      erorNotFound();
                                    }else if(response == 'found'){
                                      Navigator.pushReplacement(context, MaterialPageRoute(
                                          builder: (context) => projects(widget.id)));
                                    }
                                    response = '';
                                    //codeController.clear();
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        width: 256,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Color(0xff003b11),
                                          border: Border.all(
                                            color: Color(0xff003b11),
                                            width: 3.5,
                                          ),
                                        ),
                                        child: const Row(
                                          children: [
                                            SizedBox(width: 103,),
                                            Text(
                                              'افزودن',

                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: buttonColor,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'افزودن کلاس',
                                style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: backgroundColor,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ),
              for(int i=0 ; i<x ; i++)
                Positioned(
                    top: i*220+100,
                    right: 5 ,
                    child: CardForClases(title: list[i].split("-")[0], teacher: list[i].split("-")[1], unit: list[i].split("-")[2], numberOfHomework: list[i].split("-")[3], bestStudent: list[i].split("-")[4])),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: textColor,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.note_alt,
                color: backgroundColor,
                size: 30,
              ),
              onPressed: () => setState(
                    () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => projects(widget.id),
                  ));
                },
              ),
            ),
            SizedBox(width: 26,),
            IconButton(
              icon: Icon(
                Icons.campaign,
                color: backgroundColor,
                size: 30,
              ),
              onPressed: () => setState(
                    () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => news(widget.id),
                  ));
                },
              ),
            ),
            SizedBox(width: 26,),
            Container(
              width: 50,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.school,
                    color: backgroundColor,
                    size: 30,
                  ),
                  onPressed: () => setState(
                        () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => home(widget.id),
                      ));
                    },
                  ),
                ),
              ),
            ),
            SizedBox(width: 26,),
            IconButton(
              icon: Icon(
                Icons.list_alt,
                color: backgroundColor,
                size: 30,
              ),
              onPressed: () => setState(
                    () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => todolist(widget.id),
                  ));
                },
              ),
            ),
            SizedBox(width: 26,),
            IconButton(
              icon: Icon(
                Icons.home,
                color: backgroundColor,
                size: 30,
              ),
              onPressed: () => setState(
                    () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => home(widget.id),
                  ));
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  Future<String> addClass() async {
    final socket = await Socket.connect("192.168.141.145", 8000);
    socket.write('addClass\u0000');
    socket.write('${codeController.text}\u0000');
    socket.flush();

    final responseBuffer = StringBuffer();
    socket.listen((socketResponse) {
      responseBuffer.write(String.fromCharCodes(socketResponse));
    }, onDone: () {
      socket.close();
    });

    await socket.done;  // Wait for the socket to be closed
    setState(() {
      response = responseBuffer.toString();
    });
    return response;
  }

  Future<String> showClasses() async {
    final socket = await Socket.connect("192.168.141.145", 8000);
    socket.write('showClasses\u0000');
    socket.flush();

    final responseBuffer = StringBuffer();
    socket.listen((socketResponse) {
      responseBuffer.write(String.fromCharCodes(socketResponse));
    }, onDone: () {
      socket.close();
    });

    await socket.done;
    setState(() {
      response = responseBuffer.toString();
    });
    return response;
  }

  void erorNotFound(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Spacer(),
              PharseText(pharse: "کلاس مورد نظر در گلستان وجود ندارد", color: buttonColor, size: 15.5,),
              Icon(
                Icons.error_outline,
                color: buttonColor,
                size: 25,
              ),
            ],
          ),
          content: Container(
            width: 300,
            height: 35,
            child: Column(
              children: [
                PharseText(pharse: 'دوباره امتحان کنید', color: buttonColor, size: 20)
              ],
            ),
          ),
          actions: [
            InkWell(
                onTap: () async {
                    Navigator.of(context).pop();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      width: 256,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: buttonColor,
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 103,),
                          Text(
                            'فهمیدم',

                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
            )
          ],
        );
      },
    );
  }
}

class CardForClases extends StatelessWidget{
  String title;
  String teacher;
  String unit;
  String numberOfHomework;
  String bestStudent;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 380,
        height: 210,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10,
            margin: EdgeInsets.all(10),
            color: _classesState.textColor,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Row(
                    children: [
                      Icon(Icons.school_outlined, size: 34, color: _classesState.backgroundColor,),
                      SizedBox(width: 5,),
                      Text(
                        title,
                        style: TextStyle(
                          color: _classesState.backgroundColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                              'استاد : $teacher\nتعداد واحد : $unit\nتکالیف باقی مانده : $numberOfHomework\nشاگرد ممتاز : $bestStudent ',
                              style: TextStyle(
                                  fontSize: 16,
                                color: _classesState.backgroundColor,
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CardForClases(
      {required this.title,
        required this.teacher,
        required this.unit,
        required this.numberOfHomework,
        required this.bestStudent});
}

