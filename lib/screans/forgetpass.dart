import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/helper/message.dart';
import 'package:flutter_application_2/screans/verifcation.dart';
import 'package:flutter_application_2/widgets/cusstomtextfield.dart';
import 'package:flutter_application_2/widgets/custombuttonfield.dart';

class forgetpass extends StatefulWidget {
  forgetpass({super.key});

  @override
  State<forgetpass> createState() => _forgetpassState();
}

class _forgetpassState extends State<forgetpass> {
  String? email;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'forget my password',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Center(
                  child: Text('Please Enter Email Address',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17))),
              SizedBox(
                height: 20,
              ),
              customtextfiald(
                validator: (data) {
                  if (data!.isEmpty) {
                    return "Field is required";
                  }
                  if (!data.contains('@gmail.com')) {
                    return 'Email must contain @gmail.com';
                  }
                },
                onChanged: (data) {
                  email = data;
                },
                hintText: 'enter your email',
                icon: Icon(Icons.email),
              ),
              SizedBox(
                height: 40,
              ),
              custombuttonfield(
                text: 'Send',
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    try {
                       await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email!);

                      
                    } on  FirebaseAuthException catch (e) {
                      massage(context, 'email not exist');
                    }
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return verifiaction();
                        },
                      ));
                    
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
