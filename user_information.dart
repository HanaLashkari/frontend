import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/home.dart';

import 'Helpful.dart';

class user_profile extends StatefulWidget{
  user_profile(this.id);
  int id;
  @override
  State<user_profile> createState() => _user_profileState();
}

class _user_profileState extends State<user_profile> {
  static const buttonColor = Color(0xffbb0000);
  static const textColor = Color(0xFF024335);
  static const backgroundColor = Color(0xFFE6F6EF);
  final usernameController = TextEditingController();
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  final currentTermController = TextEditingController();
  final gradeController = TextEditingController();
  final unitsController = TextEditingController();
  bool _isVisible = true;
  var response = '';
  @override
  Widget build(BuildContext context) {
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
            )),
            Positioned(
              top: 148,
              right: 105,
              child: const PharseText(
                pharse: 'اطلاعات خود را کامل کنید',
                color: textColor,
                size: 18,
              ),
            ),
            Positioned(
              top: 190,
                right: 10,
                child: Container(
                  width: 365,
                  height: 450,
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
                top: 220,
                right: 32,
                child: FieldBox(
                  labelText: 'نام و نام خانوادگی',
                  hintText: 'بین نام و نام خانوادگی تنها یک فاصله باشد',
                  controller: usernameController,
                )
            ),
            Positioned(
                top: 300,
                right: 32,
                child: FieldBox(
                  labelText: 'شماره دانشجویی',
                  hintText: 'اعداد باید انگلیسی باشند',
                  controller: idController,
                )
            ),
            Positioned(
                top: 380,
                right: 32,
                child: FieldBox(
                  labelText: 'ترم جاری',
                  hintText: 'مثال : بهار 1402-1403',
                  controller: currentTermController,
                )
            ),
            Positioned(
                top: 460,
                right: 32,
                child: FieldBox(
                  labelText: 'تعداد واحد',
                  hintText: 'مثال : 18',
                  controller: unitsController,
                )
            ),
            Positioned(
                top: 540,
                right: 32,
                child: FieldBox(
                  labelText: 'معدل کل',
                  hintText: ' مثال : 19.33',
                  controller: gradeController,
                )
            ),
            Positioned(
                top: 660,
                right: 118,
                child: InkWell(
                    onTap: () async {
                      print('************here     :    $response');
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
                          SizedBox(width: 46,),
                          PharseText(
                            color: Colors.white,
                            size: 15,
                            pharse: 'ذخیره کن',
                          ),
                        ],
                      ),
                    )
                )),
          ],
        ),
      ),
    );
  }
  /*Future<String> changeInformation() async {
    await Socket.connect("192.168.1.35", 8000).then((serverSocket) {
      serverSocket.write('signup\u0000');
      serverSocket.write('${usernameController.text}-${idController.text}-${passwordController.text}\u0000');
      serverSocket.flush();
      serverSocket.listen((socketResponse) {
        if (mounted) {
          setState(() {
            response = String.fromCharCodes(socketResponse);
          });
        }
      });
    });
    print("---------- server response is:  { $response }");
    return response;
  }*/
}