import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test/Helpful.dart';
import 'package:test/classes.dart';
import 'package:test/news.dart';
import 'home.dart';
import 'package:test/todolist.dart';

class projects extends StatefulWidget{
  int id;
  projects(this.id);
  @override
  State<projects> createState() => _projectsState();
}

class _projectsState extends State<projects> {
  static const buttonColor = Color(0xffbb0000);
  static const textColor = Color(0xFF024335);
  static const backgroundColor = Color(0xFFE6F6EF);
  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحه تمرینا'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: widthOfScreen,
          height: heightOfScreen,
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
                  top: 20,
                  right: 25,
                  child: Text(
                    'تمرینا',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  )
              ),
              Positioned(
                top: 80,
                  right: 16,
                  child: ProjectBox(b: true, title: 'AP project', deadline: '1403/04/17', grade: '10' , time: '72',explainClient: 'helppppppp',explainServer: 'dart and flutter',)
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: textColor,
        child: Row(
          children: [
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
                    Icons.note_alt,
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
            IconButton(
              icon: Icon(
                Icons.school,
                color: backgroundColor,
                size: 30,
              ),
              onPressed: () => setState(
                    () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => classes(widget.id),
                  ));
                },
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
                    builder: (context) => home(),
                  ));
                },
              ),
            ),

          ],
        ),
      ),

    );
  }
}

class ProjectBox extends StatefulWidget{
  bool b;
  String title;
  String deadline;
  String time;
  String explainServer;
  String explainClient;
  String grade;
  ProjectBox(
      {required this.b,
        required this.title,
        required this.deadline,
        required this.time,
        required this.explainServer,
        required this.explainClient,
        required this.grade});

  @override
  State<ProjectBox> createState() => _ProjectBoxState();
}

class _ProjectBoxState extends State<ProjectBox> {
  final serverController = TextEditingController();
  final clientController = TextEditingController();
  final timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.green.shade100,
                title: Row(
                  children: [
                    Spacer(),
                    PharseText(pharse: "جزییات تمرین", color: _projectsState.textColor, size: 25,),
                    SizedBox(width: 5,),
                    IconButton(
                        onPressed: () => setState(
                              () {
                                Navigator.of(context).pop();
                          },
                        ),
                        icon: Icon(
                          Icons.cancel,
                          color: _projectsState.textColor,
                          size: 35,
                         ),
                    ),
                  ],
                ),
                content: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    width: 320,
                    height: 350,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                            right: 10,
                            child: PharseText(pharse: 'عنوان : ${widget.title}', color: _projectsState.textColor, size: 18)
                        ),
                        Positioned(
                          right: 10,
                            top: 40,
                            child: PharseText(pharse: 'دِدلاین : ${widget.deadline}', color: _projectsState.textColor, size: 18)
                        ),
                        Positioned(
                            right: 10,
                            top: 60,
                            child: Row(
                              children: [
                                PharseText(pharse: 'زمان تخمینی باقی مانده : ', color: _projectsState.textColor, size: 18),
                                LittleFieldBox(labelText: widget.time, controller: timeController, hintText: widget.time, width: 50),
                              ],
                            )
                        ),
                        Positioned(
                            right: 10,
                            top: 120,
                            child: PharseText(pharse: 'توضیحات : ', color: _projectsState.textColor, size: 18)
                        ),
                        Positioned(
                            right: 5,
                            top: 160,
                            child: SizedBox(
                              width: 240,
                              child: TextFormField(
                                controller: serverController,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white70,
                                  labelText: widget.explainServer,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  labelStyle: const TextStyle(
                                    color: Color(0xff003b11),
                                    fontWeight: FontWeight.w300,
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green, width: 5),
                                  ),
                                  hintText: widget.explainServer,
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
                                  contentPadding: EdgeInsets.symmetric(vertical: 30.0 , horizontal: 10),
                                ),
                              ),
                            )

                        ),
                        Positioned(
                            right: 10,
                            top: 260,
                            child: PharseText(pharse: 'نمره : ${widget.grade}', color: _projectsState.textColor, size: 18)
                        ),
                        Positioned(
                            right: 10,
                            top: 295,
                            child: PharseText(pharse: 'بارگذاری تمرین : ', color: _projectsState.textColor, size: 18)
                        ),
                        Positioned(
                            right: 140,
                            top: 275,
                            child: LittleFieldBox(labelText: 'خلاصه بگو', controller: clientController, hintText: 'خلاصه بگو', width: 100)
                        ),
                      ],
                    )
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
                            height: 40,
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
                                SizedBox(width: 112,),
                                Text(
                                  'ثبت',
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
        child: Container(
          alignment: Alignment.center,
          width: 350,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: widget.b ? Colors.green : Colors.green.shade200,
          ),
          child: Stack(
            children: [
              Positioned(left: 10, top: 17 ,child: PharseText(pharse: widget.deadline, color: _projectsState.backgroundColor, size: 15)),
              Positioned(right: 45 , top: 12,child: PharseText(pharse: widget.title, color: _projectsState.backgroundColor, size: 20)),
              Positioned(right: 10 , top: 13 ,child: Icon(widget.b ? Icons.circle_outlined : Icons.task_alt_outlined, size: 32, color: _projectsState.backgroundColor,)),
            ],
          ),
        )
    );
  }
}