
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/body/onbording_body.dart';
import 'package:flutter_application_2/body/onbordingbuttonswid.dart';
import 'package:flutter_application_2/controler/cubits/onbordingcubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controler/cubits/onbordingcontrolstate.dart';

class onbordingpage extends StatelessWidget {
  onbordingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => onbordingcontrol_cubit(),
      child: BlocBuilder<onbordingcontrol_cubit, onbordingstate>(
        builder: (context, state) {
          onbordingcontrol_cubit controler =
              context.read<onbordingcontrol_cubit>();

          return Scaffold(
            body: onbordingbody(controler: controler),
            bottomNavigationBar: onbordingbuttonswidget(controler: controler,),
          );
        },
      ),
    );
  }
}


