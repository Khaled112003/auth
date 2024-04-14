
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controler/cubits/onbordingcontrolstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controler/cubits/onbordingcubit.dart';

class onbordingbody extends StatelessWidget {
   onbordingbody({required this.controler,
    super.key,
  });
  onbordingcontrol_cubit controler;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
        ),
        Expanded(
          child: BlocProvider<onbordingcontrol_cubit>.value(
            value: controler,
            child: BlocBuilder<onbordingcontrol_cubit, onbordingstate>(
              builder: (context, state) {
                onbordingcontrol_cubit controler =
                    context.read<onbordingcontrol_cubit>();
    
                return PageView(controller:controler.PageControler ,
                  
                  children: List.generate(controler.data.length, ((index) {
                    return Column(
                      children: [
                        Image.network(
                          controler.data[index].image,
                          width: 250,
                          height: 200,
                        ),
                        Text(
                          controler.data[index].text,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controler.data[index].club,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    );
                  })),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
