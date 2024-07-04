import 'package:flutter/material.dart';
import 'package:test/Helpful.dart';
import 'package:test/classes.dart';
import 'package:test/news.dart';
import 'package:test/projects.dart';
import 'home.dart';

class todolist extends StatefulWidget{
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
  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    int countOfToDoListBox = -10+2;
    int countOfDoneWorkBox = -4 + 2;
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحه کارا'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: widthOfScreen,
          height: countOfToDoListBox+countOfDoneWorkBox>12 ? heightOfScreen+(countOfToDoListBox+countOfDoneWorkBox)*85 : heightOfScreen,
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
              Positioned(
                  top: 75,
                  right: 16,
                  child: Column(
                    children: [
                      ToDoList(pharse: 'Ap project' , b: true,),
                      SizedBox(height: 20,),
                      ToDoList(pharse: 'Sleep enough' , b: true,)
                    ],
                  )), //to do list boxes
              Positioned(
                  top: (countOfToDoListBox+11)*80,
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
              Positioned(
                  top: (countOfToDoListBox+11)*80+60,
                  right: 16,
                  child: Column(
                    children: [
                      ToDoList(pharse: 'Ap project' , b: false,),
                      SizedBox(height: 20,),
                      ToDoList(pharse: 'Sleep enough' , b: false,)
                    ],
                  )), //done works boxes
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
                    builder: (context) => projects(),
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
                    builder: (context) => news(),
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
                    builder: (context) => classes(),
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
                        builder: (context) => todolist(),
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
                    builder: (context) => home(),
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
                        Navigator.of(context).pop();
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
}
