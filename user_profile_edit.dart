import 'package:flutter/material.dart';
import 'package:test/Helpful.dart';


class Profile extends StatefulWidget{
  @override
  Editing createState() => Editing();
}

class Editing extends State<Profile>{
  final usernameController = TextEditingController();
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  final cityContorollor = TextEditingController();
  final fieldContorollor = TextEditingController();
  bool _isVisible = true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.purple.shade50,
        appBar: AppBar(
          title: Text('User Profile Page'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.purple.shade800,
            ), onPressed: () {  },
          ),
        ),
        body: SafeArea(
           child:ListView(
            children: [
              SizedBox(width: 100, height: 50),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.purple.shade800),
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
              )
                    ],
                ),
              ),
              SizedBox(height: 25),
              const NameBox(title: 'User Name:' , value: 25),
              SizedBox(height: 5),
              FieldBox(abscureText: false, controller: usernameController, hintText: 'Hana Lashkari'),
              SizedBox(height: 15),
              const NameBox(title: 'Id:' , value: 25),
              SizedBox(height: 5),
              FieldBox(abscureText: false, controller: idController, hintText: '123456789'),
              SizedBox(height: 15),
              const NameBox(title: 'City:' , value: 25.0),
              SizedBox(height: 5),
              FieldBox(abscureText: false, controller: cityContorollor , hintText: 'Tehran'),
              SizedBox(height: 15),
              const NameBox(title: 'Field Of Study:' , value: 25.0),
              SizedBox(height: 5),
              FieldBox(abscureText: false, controller: fieldContorollor , hintText: 'Computer Engineer'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                    children: [
                    SizedBox(height: 15 ),
                    NameBox(title: 'Password:' , value: 0),
                    SizedBox(height: 5),
                    TextField(
                      controller: passwordController,
                      obscureText: _isVisible,
                      decoration: InputDecoration(
                       enabledBorder: const OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple.shade100),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: '************',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: _isVisible
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      color: Colors.purple,
                          ),
    ),
                      ),
                ],
                    ),
              ),
              SizedBox(height: 15),
              ElevatedButton(onPressed: (){},
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 3,
                      color: Colors.white,
                    ),
                  ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade900,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ],
          ),
        )
    );
  }
}