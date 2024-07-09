import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/Helpful.dart';
import 'package:project/classes.dart';
import 'package:project/news.dart';
import 'package:project/projects.dart';
import 'home.dart';

class todolist extends StatefulWidget{
  int id;
  todolist(this.id, {super.key});
  @override
  State<todolist> createState() => _todolistState();
}

class _todolistState extends State<todolist> {
  static const buttonColor = Color(0xffbb0000);
  static const textColor = Color(0xFF024335);
  static const backgroundColor = Color(0xFFE6F6EF);
  final titleController = TextEditingController();
  final hourController = TextEditingController();
  final minuteController = TextEditingController();
  String response = '';
  List<ToDoListHandlaer> doneList = [];
  List<ToDoListHandlaer> notDoneList = [];
  List<ToDoListHandlaer> todolist = [];
  List<String> listStrings = [];

  @override
  void initState()  {
    super.initState();
    showToDoList().then((response) {
      setState(() {
        print('------3-090-103-03--0----here ====== reponse = $response ');
        listStrings = response.split("=");
        setlists(listStrings, DateTime.now());
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
        title: Text('صفحه کارا'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: widthOfScreen,
          height: notDoneList.length+doneList.length>7 ? heightOfScreen+(notDoneList.length+doneList.length-8)*80 : heightOfScreen,
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
                  right: 20,
                  child: Text(
                    'کارها',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  )
              ), //to do list text
              for(int i=0 ; i<notDoneList.length ; i++)
                Positioned(
                    top: i*80+75,
                    right: 18 ,
                    child: ToDoList(title: notDoneList[i].title, b: true , firstStr: notDoneList[i].firstString, id: widget.id , clazz: true,)
                ),
              Positioned(
                  top: notDoneList.length*80+80,
                  right: 20,
                  child: Text(
                    'کارهای انجام شده',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  )
              ), //done works text
              for(int i=0 ; i<doneList.length ; i++)
                Positioned(
                    top: i*80+140+notDoneList.length*80,
                    right: 18 ,
                    child: ToDoList(title: doneList[i].title, b: false , firstStr: doneList[i].firstString, id: widget.id , clazz: true,)
                ), //to do list boxes
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
                    Icons.list_alt,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color(0xff97d2b3),
                title: Row(
                  children: [
                    Spacer(),
                    PharseText(pharse: "افزودن کار جدید", color: backgroundColor, size: 20,),
                    Icon(
                        Icons.note_add_outlined,
                        color: backgroundColor,),
                  ],
                ),
                content: Container(
                  width: 300,
                  height: 210,
                  child: Column(
                    children: [
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Spacer(),
                          PharseText(pharse: "عنوان کار", color: backgroundColor, size: 18),
                          SizedBox(width: 10,)
                        ],
                      ),
                      SizedBox(height: 8,),
                      LittleFieldBox(labelText: "خلاصه بنویس", controller: titleController, hintText: "برنامه ریزی فراموش نشه" , width: 320.0),
                      SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LittleFieldBox(labelText: 'ساعت', controller: hourController, hintText: 'ساعت', width: 80.0),
                          SizedBox(width: 5),
                          PharseText(pharse: ' : ', color: backgroundColor, size: 40),
                          SizedBox(width: 5),
                          LittleFieldBox(labelText: 'دقیقه', controller: minuteController, hintText: 'دقیقه', width: 80.0),
                        ],
                      )
                    ],
                  ),
                ),
                actions: [
                  InkWell(
                      onTap: () async {
                        setState(() {
                          addToDoList();
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => PageForToDoList(widget.id , true),
                          ));
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            width: 220,
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
                                SizedBox(width: 75,),
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('کار شما اضافه شد')),
          );
        },
        child: Icon(
          Icons.add,
          color: backgroundColor,
          size: 40,
        ),
        backgroundColor: textColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }

  Future<String> showToDoList() async {
    final socket = await Socket.connect("192.168.141.145", 8000);
    socket.write('showToDoList\u0000');
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

  Future<String> addToDoList() async {
    final socket = await Socket.connect("192.168.141.145", 8000);
    socket.write('addToDoList\u0000');
    if(titleController.text.trim().isNotEmpty && minuteController.text.trim().isNotEmpty && hourController.text.trim().isNotEmpty)
      socket.write('${titleController.text}-${hourController.text}-${minuteController.text}-${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}-false\u0000');
    titleController.clear();
    hourController.clear();
    minuteController.clear();
    socket.flush();
    return response;
  }

  void setlists(List<String> list , DateTime dateTime){
    todolist.clear();
    doneList.clear();
    notDoneList.clear();
    for(String s in list){
      List<String> parts = s.split("-");
      todolist.add(ToDoListHandlaer(
          firstString: s,
          title: parts[0],
          dataTime: DateTime(int.parse(parts[3]) , int.parse(parts[4]) , int.parse(parts[5]) , int.parse(parts[1]) , int.parse(parts[2])),
          hour: parts[1],
          minute: parts[2],
          isDone: parts[6]
      )
      );
      if(!(todolist.last.dataTime.year == dateTime.year && todolist.last.dataTime.month == dateTime.month && todolist.last.dataTime.day == dateTime.day))
        todolist.remove(todolist.last);
    }
    todolist.sort((ToDoListHandlaer a, ToDoListHandlaer b) {
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
    for(ToDoListHandlaer p in todolist) {
      print(p.title);
      if(p.isDone == 'false')
        notDoneList.add(p);
      else if(p.isDone == 'true')
        doneList.add(p);
    }
    for(ToDoListHandlaer p in doneList)
      print("done = ${p.title}");
    for(ToDoListHandlaer p in notDoneList)
      print("not done = ${p.title}");
  }
}
