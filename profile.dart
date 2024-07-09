import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project/home.dart';
import 'package:project/log_in.dart';
import 'package:project/user_information.dart';
import 'Helpful.dart';

class profile extends StatefulWidget{
  profile(this.id);
  int id;
  @override
  State<profile> createState() => _profile();
}

class _profile extends State<profile> {
  static const buttonColor = Color(0xffbb0000);
  static const textColor = Color(0xFF024335);
  static const backgroundColor = Color(0xFFE6F6EF);
  String response = '';
  List<String> listStrings = [];
  bool b = false;
  @override
  void initState()  {
    super.initState();
    showInformation().then((response) {
      setState(() {
        print('------3-090-103-03--0----here ====== reponse = $response ');
        if(response == 'not complete') {
          b = false;
        } else {
          b = true;
          listStrings = response.split("-");
        }
        print("list === $listStrings");
      });
    }).catchError((error) {

    });
  }

  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height  ;
    double widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: textColor,
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
      body: Container(
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
                top: 10,
                right: 127,
                child:Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: textColor),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 6,
                            spreadRadius: 2,
                            color: Colors.white
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://irs01.wisgoon.com/irs01/8b/8a/e0/5f/irs01_s3old_736x736_bF2GD9mm_2411253_1626592307032145264.jpeg',
                          )
                      )
                  ),
                )),  // عکس نمایه
            Positioned(
              top: 170,
              right: widthOfScreen/2-40,
              child: Text(
                listStrings[0],
                style: TextStyle(
                  color: textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),  //بخش اسم
            Positioned(
                top: 250,
                right: 10,
                child: Container(
                  width: 365,
                  height: 270,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    border: Border.all(
                      color: textColor,
                      width: 8,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                )),
            Positioned(
              top: 280,
                left: 40,
                child: Text(
                  listStrings[1],
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ),
            Positioned(
              top: 275,
              right: 40,
              child: Text(
                'شماره دانشجویی',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),  //شماره دانشجویی
            Positioned(
              top: 340,
              left: 40,
              child: Text(
                '${getSeason(DateTime.now())}-${DateTime.now().year-621}',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              top: 335,
              right: 40,
              child: Text(
                'ترم جاری',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),  //اسم ترم
            Positioned(
              top: 400,
              left: 40,
              child: Text(
                listStrings[2],
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              top: 395,
              right: 40,
              child: Text(
                'تعداد واحد',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),  //تعداد واحد
            Positioned(
              top: 455,
              left: 40,
              child: Text(
                listStrings[3],
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              top: 460,
              right: 40,
              child: Text(
                'معدل کل',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),  //معدل کل
            Positioned(
                top: 550,
                right: 20,
                child: InkWell(
                    onTap: () async {
                      print('************here     :    $response');
                    },
                    child: Container(
                      width: 180,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: textColor,
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 30,),
                          PharseText(
                            color: Colors.white,
                            size: 16,
                            pharse: 'حذف حساب کاربری',
                          ),
                        ],
                      ),
                    )
                )),  //دکمه حدف
            Positioned(
                top: 550,
                left: 20,
                child: InkWell(
                    onTap: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => login_page(),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: textColor,
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 56,),
                          PharseText(
                            color: Colors.white,
                            size: 18,
                            pharse: 'خروج',
                          ),
                        ],
                      ),
                    )
                )),  //دکمه خروج
            Positioned(
                top: 610,
                left: widthOfScreen/2-100,
                child: InkWell(
                    onTap: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => user_profile(widget.id),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: textColor,
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 50,),
                          PharseText(
                            color: Colors.white,
                            size: 19,
                            pharse: 'تغییر اطلاعات',
                          ),
                        ],
                      ),
                    )
                )),  //دکمه تغییر اطلاعات
          ],
        ),
      ),
    );
  }

  String getSeason(DateTime date) {
    int month = date.month;
    if (month >= 3 && month <= 5) {
      return 'بهار';
    } else if (month >= 6 && month <= 8) {
      return 'تابستان';
    } else if (month >= 9 && month <= 11) {
      return 'پاییز';
    } else {
      return 'زمستان';
    }
  }

  Future<String> showInformation() async {
    final socket = await Socket.connect("192.168.141.145", 8000);
    socket.write('${widget.id}-showInformation\u0000');
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

  Future<void> exit() async {
    final socket = await Socket.connect("192.168.141.145", 8000);
    socket.write('${widget.id}-exit\u0000');
    socket.flush();
  }
}