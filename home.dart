import 'package:flutter/material.dart';
import 'package:test/Helpful.dart';
import 'package:test/user_information.dart';

class home extends StatefulWidget{
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  static const buttonColor = Color(0xffbb0000);
  static const textColor = Color(0xFF024335);
  static const backgroundColor = Color(0xFFE6F6EF);
  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    print('width :   $widthOfScreen');
    print('height :   $heightOfScreen');
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
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
                          builder: (context) => user_profile(info: 'here'),
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
                  'خلاصه کارها ',
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
                    Summary(Icons.border_color_outlined , 'تعداد تکالیف -> 2'),
                    SizedBox(width: 30,),
                    Summary(Icons.library_books_outlined , 'تعداد امتحان -> 5'),

                  ],
                )
            ), //row for summary
            Positioned(
                top: 200,
                right: 25,
                child: Row(
                  children: [
                    Summary(Icons.heart_broken_outlined , 'بدترین نمره -> 15'),
                    SizedBox(width: 30,),
                    Summary(Icons.emoji_events_outlined , 'بهترین نمره -> 100'),
                  ],
                )
            ), //row two for summary
            Positioned(
              top: heightOfScreen/10*8,
                child: Container(
                  width: widthOfScreen,
                  height: heightOfScreen/10,
                  color: textColor,
                  child: Row(
                    children: [
                      SizedBox(width: 17,),
                      IconButton(
                        icon: Icon(
                          Icons.note_alt,
                          color: backgroundColor,
                          size: 30,
                        ),
                        onPressed: () => setState(
                              () {
                            //Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(width: 28,),
                      IconButton(
                        icon: Icon(
                          Icons.campaign,
                          color: backgroundColor,
                          size: 30,
                        ),
                        onPressed: () => setState(
                              () {
                            //Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(width: 28,),
                      IconButton(
                        icon: Icon(
                          Icons.school,
                          color: backgroundColor,
                          size: 30,
                        ),
                        onPressed: () => setState(
                              () {
                            //Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(width: 28,),
                      IconButton(
                        icon: Icon(
                          Icons.list_alt,
                          color: backgroundColor,
                          size: 30,
                        ),
                        onPressed: () => setState(
                              () {
                            //Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(width: 28,),
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
                                //Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                )
            ),    //bottom bar
          ],
        ),
      ),
    );
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