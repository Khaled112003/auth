import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/helper/message.dart';
import 'package:flutter_application_2/screans/forgetpass.dart';
import 'package:flutter_application_2/widgets/cusstomtextfield.dart';
import 'package:flutter_application_2/widgets/custombuttonfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class Signin extends StatefulWidget {
  Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String? pass;
  String? email;
  bool isloading = false;
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'sign in ',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    customtextfiald(
                      icon: Icon(Icons.email),
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
                      hintText: 'email',
                    ),
                    SizedBox(height: 20),
                    customtextfiald(
                      icon: Icon(Icons.lock),
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field is required";
                        }
                      },
                      obscureText: true,
                      onChanged: (data) {
                        pass = data;
                      },
                      hintText: 'password',
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return forgetpass();
                              },
                            ));
                          },
                          child: Text(
                            "forget my password?",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    custombuttonfield(
                      text: ' sign in',
                      onTap: () async {
                        isloading = true;
                        setState(() {});

                        if (formkey.currentState!.validate()) {
                          try {
                            await User();
                            massage(context, 'success');
                            
                          } on FirebaseAuthException catch (e) {
                            massage(context,
                                "there's an error, please cheack your email and password");
                            if (e.code == 'user-not-found') {
                              massage(context, 'No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              ;
                              massage(context,
                                  'Wrong password provided for that user.');
                            }
                          } catch (e) {
                            massage(context,
                                'sorry there is an error, please try again');
                            print(e);
                          } finally {}
                        } else {
                          massage(context,
                              'sorry there is an error, please try again');
                        }
                        isloading = false;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Don't have any account? Sign up",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> User() async {
    UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: pass!,
    );
  }
}
