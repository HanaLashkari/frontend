import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/Helpful.dart';
import 'package:project/classes.dart';
import 'package:project/news.dart';
import 'package:project/projects.dart';
import 'package:project/todolist.dart';
import 'package:project/user_information.dart';

class home extends StatefulWidget{
  int id = 402243094;
  home(this.id);
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  static const buttonColor = Color(0xffbb0000);
  static const textColor = Color(0xFF024335);
  static const backgroundColor = Color(0xFFE6F6EF);
  String response = '';
  String exam = '';
  String best = '';
  String worst = '';
  String assignment = '';
  List<ProjectHandler> doneList = [];
  List<ToDoListHandlaer> notDoneList = [];
  List<String> listStrings = [];

  @override
  void initState()  {
    super.initState();
    showHomePage().then((response) {
      setState(() {
        print('------3-090-103-03--0----here ====== reponse = $response ');
        listStrings = response.split("#");
        setlists(listStrings, DateTime.now());
      });
    }).catchError((error) {
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height  ;
    double widthOfScreen = MediaQuery.of(context).size.width;
    print('width :   $widthOfScreen');
    print('height :   $heightOfScreen');

    return Scaffold(
      appBar: AppBar(
        title: Text('صفحه سرا'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: widthOfScreen,
          height: heightOfScreen+(doneList.length>4 ? (doneList.length-4)/2 : 0)*50+ (notDoneList.length>5 ? (notDoneList.length-5)*80 : 0 ),
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
                  child: InkWell(
                    child: IconButton(
                      icon: Icon(
                        size: 40,
                        Icons.account_circle,
                        color: textColor,
                      ),
                      onPressed: () => setState(
                            () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => user_profile(id: 402243094, info: 'here'),
                          ));
                        },
                      ),
                    ),
                  )
              ), //icon of profile
              Positioned(
                top: 45,
                  right: 10,
                  child: Text(
                    'خلاصه فعالیت ها ',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  )
              ), //summary text
              Positioned(
                top: 100,
                  right: 25,
                  child: Row(
                    children: [
                      Summary(Icons.border_color_outlined , 'تعداد تکالیف -> $assignment'),
                      SizedBox(width: 30,),
                      Summary(Icons.library_books_outlined , 'تعداد امتحان -> $exam'),
        
                    ],
                  )
              ), //row for summary
              Positioned(
                  top: 200,
                  right: 25,
                  child: Row(
                    children: [
                      Summary(Icons.heart_broken_outlined , 'بدترین نمره -> $worst'),
                      SizedBox(width: 30,),
                      Summary(Icons.emoji_events_outlined , 'بهترین نمره -> $best'),
                    ],
                  )
              ), //row two for summary
              Positioned(
                  top: 310,
                  right: 15,
                  child: Text(
                    'فعالیت های جاری',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  )
              ), //to do list text
              for(int i=0 ; i<notDoneList.length ; i++)
                Positioned(
                    top: i*80+370,
                    right: 18 ,
                    child: ToDoList(title: notDoneList[i].title, b: true , firstStr: notDoneList[i].firstString, id: widget.id , clazz: true,)
                ),//column for to do list
              Positioned(
                  top: 380+notDoneList.length*80,
                  right: 15,
                  child: Text(
                    'تمرین های انجام شده',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  )
              ), //done work text
              for(int i=0 ; i<doneList.length ; i++)
                if(i%2 == 0)
                Positioned(
                    top: i*100+440+notDoneList.length*80,
                    right: 30 ,
                    child: DoneWork(doneList[i].title), //column even for done work
                ),
              for(int i=0 ; i<doneList.length ; i++)
                if(i%2 == 1)
                  Positioned(
                      top: (i-1)*50+440+notDoneList.length*80,
                      left: 30 ,
                      child: DoneWork(doneList[i].title),
                  ), //column odd for done work
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
              ),
            ),

          ],
        ),
      ),
    );
  }
  Future<String> showHomePage() async {
    final socket = await Socket.connect("192.168.141.145", 8000);
    socket.write('${widget.id}-showHomePage\u0000');
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
    print('lizhdbhujsreedkabhereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee ============== $response');
    return response;
  }

  void setlists(List<String> list , DateTime dateTime){
    doneList.clear();
    notDoneList.clear();
    List<String> part = list[0].split(',');
    assignment = part[0];
    exam = part[1];
    worst = part[2];
    best = part[3];
    print('object  ========= $assignment --- $exam --- $worst --- $best');
    List<ToDoListHandlaer> listOfworks = [];
    for(String s in list[1].split("=")){
      List<String> parts = s.split("-");
      listOfworks.add(ToDoListHandlaer(
          firstString: s,
          title: parts[0],
          dataTime: DateTime(int.parse(parts[3]) , int.parse(parts[4]) , int.parse(parts[5]) , int.parse(parts[1]) , int.parse(parts[2])),
          hour: parts[1],
          minute: parts[2],
          isDone: parts[6]
      )
      );
      if(!(listOfworks.last.dataTime.year == dateTime.year && listOfworks.last.dataTime.month == dateTime.month && listOfworks.last.dataTime.day == dateTime.day))
        listOfworks.remove(listOfworks.last);
    }
    listOfworks.sort((ToDoListHandlaer a, ToDoListHandlaer b) {
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
    for(ToDoListHandlaer p in listOfworks) {
      print(p.title);
      if(p.isDone == 'false')
        notDoneList.add(p);
    }
    for(ToDoListHandlaer p in notDoneList)
      print("not done = ${p.title}");

    for(String s in list[2].split("=")){
      List<String> parts = s.split("-");
      List<String> timeList = parts[1].split(",");
      doneList.add(ProjectHandler(
          firstString: s,
          title: parts[0],
          dataTime: DateTime(int.parse(timeList[0].split("/")[0]) , int.parse(timeList[0].split("/")[1]) , int.parse(timeList[0].split("/")[2]) ,
              int.parse(timeList[1].split(":")[0]) , int.parse(timeList[1].split(":")[1])),
          hour: timeList[1],
          deadline: timeList[0],
          grade: parts[2],
          description: parts[3],
          estimatedTime: timeList[2]));
      if(!doneList.last.dateTime().isBefore(dateTime))
        doneList.remove(doneList.last);
    }
    for(ProjectHandler p in doneList)
      print("project is done = ${p.title}");

  }
}

class Summary extends StatelessWidget{
  Summary(this.icon, this.text);
  final IconData icon;
  final String text;
  static const textColor = Color(0xFF024335);
  static const backgroundColor = Color(0xFFE6F6EF);
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 150,
      height: 85,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(13)),
        border: Border.all(
          color: textColor,
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
      child: Column(
        children: [
          SizedBox(height: 9,),
          Row(
            children: [
              SizedBox(width: 60),
              Icon(
                icon,
                color: textColor,
                size: 30,
              ),
            ],
          ),
          SizedBox(height: 6,),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }

}

class DoneWork extends StatelessWidget{
  DoneWork(this.text);
  final String text;
  static const textColor = Color(0xFF024335);
  static const backgroundColor = Color(0xFFE6F6EF);
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 150,
      height: 85,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(13)),
        border: Border.all(
          color: textColor,
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
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 13,
        ),
      ),
    );
  }

}