import 'package:flutter/material.dart';
import 'package:test/Helpful.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Profile(),
    );
  }
}

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
          title: Text('Sign Up Page'),
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
              SizedBox( height: 80),
              Row(
                children: [
                  const SizedBox(width: 90),
                  Text(
                    'Fill out the items.',
                    style: TextStyle(
                      color: Colors.purple.shade900, //B71579FF
                      fontSize: 24,
                    ),
                  ),
                ],
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