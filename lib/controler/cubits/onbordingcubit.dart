 




import 'package:flutter/material.dart';
import 'package:flutter_application_2/controler/cubits/onbordingcontrolstate.dart';
import 'package:flutter_application_2/models/bordingmodel.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class onbordingcontrol_cubit extends Cubit<onbordingstate> {
  onbordingcontrol_cubit() : super(onbordinginitialstate());
PageController PageControler =PageController();
 void next(){
  PageControler.nextPage(duration: Duration(seconds: 1), curve: Curves.bounceIn);

}
void skip()async{
  final shared=await SharedPreferences.getInstance() ;
   await shared.setBool('onbording', true);
  
}


  List data =[
    
    onbordinmodel(club: 'Elnasser', text: " ronaldo", image: "https://media.cnn.com/api/v1/images/stellar/prod/230621042149-01-cristiano-ronaldo-euro-200-apps-062023-restricted.jpg?c=16x9&q=h_833,w_1480,c_fill"),
    onbordinmodel(club: 'Inter Memie', text: " messi", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Lionel_Messi_20180626.jpg/640px-Lionel_Messi_20180626.jpg"),
    onbordinmodel(club: 'liverbool', text: " salah", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReGRR8wNu6Mfr5mA3b_NitNkc3w0QvoVBqNeVCm0nLXQ&s")
  ];
}
