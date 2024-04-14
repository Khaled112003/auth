import 'package:flutter/material.dart';
import 'package:flutter_application_2/screans/newpass.dart';


class verifiaction extends StatelessWidget {
  const verifiaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'verifiaction',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          children: [
            SizedBox(height: 80,),
            Center(
                child: Text('Please Enter Vericiation Code',
                    style: TextStyle(fontWeight: FontWeight.bold ,fontSize:17 ))),
                    SizedBox(height: 20,),
    //                 OtpTextField(
    //     numberOfFields: 5,
    //     borderColor: Color(0xFF512DA8),
    //     //set to true to show as box or false to show as dash
    //     showFieldAsBox: true, 
    //     //runs when a code is typed in
    //     onCodeChanged: (String code) {
    //         //handle validation or checks here           
    //     },
    //     //runs when every textfield is filled
    //     onSubmit: (String verificationCode){
            
    //         Navigator.push(context, MaterialPageRoute(builder: (context) {
    //           return newpassword();
    //         },));
    //     }, // end onSubmit
    // ),
                   
          ],
        ),
      ),
    );
  }
}
