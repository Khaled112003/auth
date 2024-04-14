
import 'package:flutter/material.dart';

import 'package:flutter_application_2/controler/cubits/onbordingcubit.dart';

import 'package:flutter_application_2/screans/signin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controler/cubits/onbordingcontrolstate.dart';

class onbordingbuttonswidget extends StatelessWidget {
   onbordingbuttonswidget({required this.controler,
    super.key,
  });
  onbordingcontrol_cubit controler;


  @override
  Widget build(BuildContext context) {
    return BlocProvider<onbordingcontrol_cubit>.value(
            value: controler,
            child: BlocBuilder<onbordingcontrol_cubit, onbordingstate>(
              builder: (context, state) {
                onbordingcontrol_cubit controler =
                    context.read<onbordingcontrol_cubit>();
    
                return SizedBox(
                height: 120,
                child: Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(onTap: () {
                        Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Signin();
                            }));
                      },
                        child: ElevatedButton(onPressed: () {}, child: Text("skip"))),
                      ElevatedButton(onPressed: controler.next, child: Text("continue"))
                    ],
                  ),
                ));
          }),
        );
      }
  
  }
