import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/Helpful.dart';
import 'package:project/classes.dart';
import 'package:project/news.dart';
import 'home.dart';
import 'package:project/todolist.dart';

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
  String response = '';
  final dateContoroller = TextEditingController();
  List<ProjectHandler> projects = [];
  List<ProjectHandler> past = [];
  List<ProjectHandler> future = [];
  List<String> listStrings = [];

  @override
  void initState()  {
    super.initState();
    showAssignment().then((response) {
      setState(() {
        print('------3-090-103-03--0----here ====== reponse = $response ');
         listStrings = response.split("=");
        setListsDefault(listStrings, DateTime.now());
      });
    }).catchError((error) {

    });
  }

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
                top: 25,
                  left: 20,
                  child: Row(
                    children: [
                      LittleFieldBox(labelText: 'تاریخ', controller: dateContoroller, hintText:  'مثال : 1403/02/03' , width: 130,),
                      IconButton(
                              onPressed: () => setState(
                                () {
                              String s = dateContoroller.text;
                              List<String> times = s.split('/');
                              print('herrrrrreeeeeeeeeee ${times.length}');
                              if(times.length != 3)
                                return;
                              setListsDefault(listStrings, DateTime(int.parse(times[0]) ,int.parse(times[1]) , int.parse(times[2])));
                              print(past);
                              print("kokokoko");
                              print(future);
                            },
                          ),
                          icon: Icon(Icons.data_saver_on , color: Color(0xff003b11), size: 40,))
                    ],
                  )),   //بخش انتخاب تاریخ و دکمه اش
              Positioned(
                top: 30,
                  right: 135,
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () => setState(
                                () {
                              setListsEarliest(listStrings, DateTime(DateTime.now().year-621 , DateTime.now().month-3 , DateTime.now().day+10 , DateTime.now().hour , DateTime.now().minute));
                              print(past);
                              print("kokokoko");
                              print(future);
                            },
                          ),
                          icon: Icon(Icons.lock_clock_outlined , color: Color(0xff003b11), size: 40,)),
                      Text(
                          "تاریخ تحویل",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 7,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  )
              ),  //دکمه مرتب سازی بر اساس تاریخ تحویل
              Positioned(
                  top: 30,
                  right: 90,
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () => setState(
                                () {
                              setListsTimeSet(listStrings,DateTime(DateTime.now().year-621 , DateTime.now().month-3 , DateTime.now().day+10 , DateTime.now().hour , DateTime.now().minute));
                              print(past);
                              print("kokokoko");
                              print(future);
                            },
                          ),
                          icon: Icon(Icons.sort , color: Color(0xff003b11), size: 40,)),
                      Text(
                        "زمان تعریف",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 7,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  )
              ),  //دکمه مرتب سازی بر اساس زمان تعریف
              Positioned(
                  top: 30,
                  right: 50,
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () => setState(
                                () {
                              setListsEstimatedTime(listStrings, DateTime(DateTime.now().year-621 , DateTime.now().month-3 , DateTime.now().day+10 , DateTime.now().hour , DateTime.now().minute));
                              print(past);
                              print("kokokoko");
                              print(future);
                            },
                          ),
                          icon: Icon(Icons.punch_clock_outlined , color: Color(0xff003b11), size: 40,)),
                      Text(
                        "زمان تخمینی",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 7,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  )
              ),  //دکمه مرتب سازی بر اساس زمان تخمینی
              Positioned(
                  top: 30,
                  right: 5,
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () => setState(
                                () {
                              setListsAlphabet(listStrings, DateTime(DateTime.now().year-621 , DateTime.now().month-3 , DateTime.now().day+10 , DateTime.now().hour , DateTime.now().minute));
                              print(past);
                              print("kokokoko");
                              print(future);
                            },
                          ),
                          icon: Icon(Icons.sort_by_alpha , color: Color(0xff003b11), size: 40,)),
                      Text(
                        "حروف الفبا",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 7,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  )
              ),  //دکمه مرتب سازی بر اساس حروف الفبا
              Positioned(
                  top: 120,
                  right: 25,
                  child: Text(
                    'تمرینا',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  )
              ),  //نوشته
              for(int i=0 ; i<future.length ; i++)
                Positioned(
                    top: i*80+170,
                    right: 18 ,
                    child: ProjectBox(widget.id,b: true, title: future[i].title, deadline: future[i].deadline, time: future[i].hour, explainServer: future[i].description.split(',')[0], explainClient: !future[i].description.contains(',')? "توضیحات تحویل" : future[i].description.split(',')[1], grade: future[i].grade , esatimatedTime: future[i].estimatedTime,)
                ),  //تمرینای اینده
              for(int i=0 ; i<past.length ; i++)
                Positioned(
                    top: i*80+170+future.length*80,
                    right: 18 ,
                    child: ProjectBox(widget.id,b: false, title: past[i].title, deadline: past[i].deadline, time: past[i].hour, explainServer: past[i].description.split(',')[0], explainClient: !past[i].description.contains(',')? "توضیحات تحویل" : past[i].description.split(',')[1], grade: past[i].grade , esatimatedTime:  past[i].estimatedTime,)
                ),  //تمرینای گذشته
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

  Future<String> showAssignment() async {
    final socket = await Socket.connect("192.168.141.145", 8000);
    socket.write('${widget.id}-showAssignment\u0000');
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

  void setListsDefault(List<String> list , DateTime dateTime){
    projects.clear();
    past.clear();
    future.clear();
    for(String s in list){
      List<String> parts = s.split("-");
      List<String> timeList = parts[1].split(",");
      projects.add(ProjectHandler(
          firstString: s,
          title: parts[0],
          dataTime: DateTime(int.parse(timeList[0].split("/")[0]) , int.parse(timeList[0].split("/")[1]) , int.parse(timeList[0].split("/")[2]) ,
              int.parse(timeList[1].split(":")[0]) , int.parse(timeList[1].split(":")[1])),
          hour: timeList[1],
          deadline: timeList[0],
          grade: parts[2],
          description: parts[3],
          estimatedTime: timeList[2]));
      if(!(projects.last.dataTime.year == dateTime.year && projects.last.dataTime.month == dateTime.month && projects.last.dataTime.day == dateTime.day))
        projects.remove(projects.last);
    }
    projects.sort((ProjectHandler a, ProjectHandler b) {
// اگر هر دو تاریخ در گذشته یا آینده هستند، بر اساس زمان مرتب میشوند
      if ((a.dateTime().isBefore(dateTime) && b.dateTime().isBefore(dateTime)) ||
          (a.dateTime().isAfter(dateTime) && b.dateTime().isAfter(dateTime))) {
        return a.dateTime().compareTo(b.dateTime());
      } else if (a.dateTime().isBefore(dateTime)) {
// 'a' گذشته است و 'b' آینده است، 'a' اول قرار میگیرد
        return -1;
      } else {
// 'a' آینده است و 'b' گذشته است، 'b' اول قرار میگیرد
        return 1;
      }
    });
    for(ProjectHandler p in projects) {
      print(p.title);
      if(p.dateTime().isBefore(dateTime))
        past.add(p);
      else if(p.dateTime().isAfter(dateTime) || p.dataTime == dateTime)
        future.add(p);
    }
    for(ProjectHandler p in future)
      print("future = ${p.title}");
    for(ProjectHandler p in past)
      print("past = ${p.title}");
  }

  void setListsEarliest(List<String> list , DateTime dateTime){
    projects.clear();
    past.clear();
    future.clear();
    for(String s in list){
      List<String> parts = s.split("-");
      List<String> timeList = parts[1].split(",");
      projects.add(ProjectHandler(
          firstString: s,
          title: parts[0],
          dataTime: DateTime(int.parse(timeList[0].split("/")[0]) , int.parse(timeList[0].split("/")[1]) , int.parse(timeList[0].split("/")[2]) ,
              int.parse(timeList[1].split(":")[0]) , int.parse(timeList[1].split(":")[1])),
          hour: timeList[1],
          deadline: timeList[0],
          grade: parts[2],
          description: parts[3],
          estimatedTime: timeList[2]));
      if(projects.last.description.contains(","))
        projects.remove(projects.last);
    }
    projects.sort((ProjectHandler a, ProjectHandler b) {
// اگر هر دو تاریخ در گذشته یا آینده هستند، بر اساس زمان مرتب میشوند
      if ((a.dateTime().isBefore(dateTime) && b.dateTime().isBefore(dateTime)) ||
          (a.dateTime().isAfter(dateTime) && b.dateTime().isAfter(dateTime))) {
        return a.dateTime().compareTo(b.dateTime());
      } else if (a.dateTime().isBefore(dateTime)) {
// 'a' گذشته است و 'b' آینده است، 'a' اول قرار میگیرد
        return -1;
      } else {
// 'a' آینده است و 'b' گذشته است، 'b' اول قرار میگیرد
        return 1;
      }
    });
    for(ProjectHandler p in projects) {
      print(p.title);
      if(p.dateTime().isBefore(dateTime))
        past.add(p);
      else if(p.dateTime().isAfter(dateTime) || p.dataTime == dateTime)
        future.add(p);
    }
    for(ProjectHandler p in future)
      print("future = ${p.title}");
    for(ProjectHandler p in past)
      print("past = ${p.title}");
  }

  void setListsTimeSet(List<String> list , DateTime dateTime){
    projects.clear();
    past.clear();
    future.clear();
    for(String s in list){
      List<String> parts = s.split("-");
      List<String> timeList = parts[1].split(",");
      projects.add(ProjectHandler(
          firstString: s,
          title: parts[0],
          dataTime: DateTime(int.parse(timeList[0].split("/")[0]) , int.parse(timeList[0].split("/")[1]) , int.parse(timeList[0].split("/")[2]) ,
              int.parse(timeList[1].split(":")[0]) , int.parse(timeList[1].split(":")[1])),
          hour: timeList[1],
          deadline: timeList[0],
          grade: parts[2],
          description: parts[3],
          estimatedTime: timeList[2]));
      if(projects.last.description.contains(","))
        projects.remove(projects.last);
    }
    for(ProjectHandler p in projects) {
      print(p.title);
      if(p.dateTime().isBefore(dateTime))
        past.add(p);
      else if(p.dateTime().isAfter(dateTime) || p.dataTime == dateTime)
        future.add(p);
    }
    for(ProjectHandler p in future)
      print("future = ${p.title}");
    for(ProjectHandler p in past)
      print("past = ${p.title}");
  }

  void setListsEstimatedTime(List<String> list , DateTime dateTime){
    projects.clear();
    past.clear();
    future.clear();
    for(String s in list){
      List<String> parts = s.split("-");
      List<String> timeList = parts[1].split(",");
      projects.add(ProjectHandler(
          firstString: s,
          title: parts[0],
          dataTime: DateTime(int.parse(timeList[0].split("/")[0]) , int.parse(timeList[0].split("/")[1]) , int.parse(timeList[0].split("/")[2]) ,
              int.parse(timeList[1].split(":")[0]) , int.parse(timeList[1].split(":")[1])),
          hour: timeList[1],
          deadline: timeList[0],
          grade: parts[2],
          description: parts[3],
          estimatedTime: timeList[2]));
      if(projects.last.description.contains(","))
        projects.remove(projects.last);
    }
    projects.sort((ProjectHandler a, ProjectHandler b) => int.parse(a.estimatedTime)-int.parse(b.estimatedTime));

    for(ProjectHandler p in projects) {
      print(p.title);
      if(p.dateTime().isBefore(dateTime))
        past.add(p);
      else if(p.dateTime().isAfter(dateTime) || p.dataTime == dateTime)
        future.add(p);
    }
    for(ProjectHandler p in future)
      print("future = ${p.title}");
    for(ProjectHandler p in past)
      print("past = ${p.title}");
  }

  void setListsAlphabet(List<String> list , DateTime dateTime){
    projects.clear();
    past.clear();
    future.clear();
    for(String s in list){
      List<String> parts = s.split("-");
      List<String> timeList = parts[1].split(",");
      projects.add(ProjectHandler(
          firstString: s,
          title: parts[0],
          dataTime: DateTime(int.parse(timeList[0].split("/")[0]) , int.parse(timeList[0].split("/")[1]) , int.parse(timeList[0].split("/")[2]) ,
              int.parse(timeList[1].split(":")[0]) , int.parse(timeList[1].split(":")[1])),
          hour: timeList[1],
          deadline: timeList[0],
          grade: parts[2],
          description: parts[3],
          estimatedTime: timeList[2]));
      if(projects.last.description.contains(","))
        projects.remove(projects.last);
    }
    projects.sort((ProjectHandler a, ProjectHandler b) => a.title.compareTo(b.title));

    for(ProjectHandler p in projects) {
      print(p.title);
      if(p.dateTime().isBefore(dateTime))
        past.add(p);
      else if(p.dateTime().isAfter(dateTime) || p.dataTime == dateTime)
        future.add(p);
    }
    for(ProjectHandler p in future)
      print("future = ${p.title}");
    for(ProjectHandler p in past)
      print("past = ${p.title}");
  }
}

class ProjectBox extends StatefulWidget{
  int id;
  bool b;
  String title;
  String deadline;
  String time;
  String explainServer;
  String explainClient;
  String grade;
  String esatimatedTime;
  ProjectBox(
      this.id,
      {required this.b,
        required this.title,
        required this.deadline,
        required this.time,
        required this.explainServer,
        required this.explainClient,
        required this.esatimatedTime,
        required this.grade});

  @override
  State<ProjectBox> createState() => _ProjectBoxState();
}

class _ProjectBoxState extends State<ProjectBox> {
  final serverController = TextEditingController();
  final clientController = TextEditingController();
  final timeController = TextEditingController();
  String response = '';

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
                            top: widget.b? 70 : 80,
                            child: Row(
                              children: [
                                PharseText(pharse: 'زمان تخمینی : ', color: _projectsState.textColor, size: 18),
                                widget.b ? LittleFieldBox(labelText: widget.esatimatedTime, controller: timeController, hintText: widget.esatimatedTime, width: 70) : PharseText(pharse: widget.esatimatedTime, color: _projectsState.textColor, size: 18),
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
                              child: widget.b?TextFormField(
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
                              ):PharseText(pharse: widget.explainServer, color: _projectsState.textColor, size: 18),
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
                            right: widget.b? 140 : 135,
                            top: widget.b? 275 : 295,
                            child: widget.b?LittleFieldBox(labelText: widget.explainClient, controller: clientController, hintText: widget.explainClient, width: 100):PharseText(pharse: widget.explainClient, color: _projectsState.textColor, size: 18),
                        ),
                      ],
                    )
                  ),
                ),
                actions: [
                  InkWell(
                      onTap: () async {
                        if(timeController.text != widget.esatimatedTime || serverController.text != widget.explainServer || clientController.text != widget.explainClient)
                          changeDescription(widget.title, timeController, serverController, clientController);
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
              Positioned(left: 20, top: 17 ,child: PharseText(pharse: widget.time, color: _projectsState.backgroundColor, size: 15)),
              Positioned(right: 45 , top: 12,child: widget.b? PharseText(pharse: widget.title, color: _projectsState.backgroundColor, size: 20) : Text(widget.title , style: TextStyle(color: _projectsState.backgroundColor , fontSize: 20 , fontWeight: FontWeight.w300, decoration: TextDecoration.lineThrough , decorationColor: _projectsState.backgroundColor ))),
              Positioned(right: 10 , top: 13 ,child: Icon(widget.b ? Icons.circle_outlined : Icons.task_alt_outlined, size: 32, color: _projectsState.backgroundColor,)),
            ],
          ),
        )
    );
  }

  Future<String> changeDescription(String title , TextEditingController estimated , TextEditingController server , TextEditingController client) async {
    final socket = await Socket.connect("192.168.141.145", 8000);
    socket.write('${widget.id}-changeDescription\u0000');
    socket.write('$title\u0000');
    socket.write('${estimated.text.trim().isNotEmpty ? estimated.text : widget.esatimatedTime}-${server.text.trim().isNotEmpty ? server.text : widget.explainServer}-${client.text.trim().isNotEmpty ? client.text : widget.explainClient}\u0000');
    socket.flush();
    timeController.clear();
    serverController.clear();
    clientController.clear();
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
}