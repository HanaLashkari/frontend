import 'package:flutter/material.dart';
import 'package:project/Helpful.dart';
import 'package:project/classes.dart';
import 'package:project/projects.dart';
import 'package:project/todolist.dart';
import 'home.dart';

class news extends StatefulWidget{
  int id;
  news(this.id);
  @override
  State<news> createState() => _news();
}

class _news extends State<news> {
  static const buttonColor = Color(0xffbb0000);
  static const textColor = Color(0xFF024335);
  static const backgroundColor = Color(0xFFE6F6EF);
  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحه خبرا'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: widthOfScreen,
          height: heightOfScreen+100,
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
                    'خبرا',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  )
              ),
              Positioned(
                  top: 70,
                  right: 13.5,
                  child: NEWS(title: 'news' , text: 'nothing'),
              ),
              Positioned(
                top: 280,
                right: 13.5,
                child: NEWS(title: 'news' , text: 'nothing'),
              ),
              Positioned(
                top: 490,
                right: 13.5,
                child: NEWS(title: 'news' , text: 'nothing'),
              ),
              Positioned(
                top: 700,
                right: 13.5,
                child: NEWS(title: 'news' , text: 'nothing'),
              ),
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
                    Icons.campaign,
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
}

class NEWS extends StatelessWidget{
  String title;
  String text;
  NEWS({required this.title,required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          height: 180,
          decoration: BoxDecoration(
              border: Border.all(width: 4, color: _news.textColor),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)
              ),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://static.cdn.asset.aparat.com/avt/35796944-5958-b__267564876.jpg',
                  )
              )
          ),
        ),
        Container(
          width: 160,
          height: 180,
          decoration:  BoxDecoration(
            color: Colors.green.shade300,
            border: Border.all(width: 4, color: _news.textColor),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)
            ),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            children: [
              PharseText(pharse: title, color: _news.backgroundColor, size: 20),
              SizedBox(height: 10,),
              PharseText(pharse: text, color: _news.backgroundColor, size: 15),
              SizedBox(height: 10,),
              PharseText(pharse: 'بیشتر...', color: _news.textColor, size: 20),
            ],
          ),
        )
      ],
    );
  }

}