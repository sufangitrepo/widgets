import 'dart:io';

import 'package:cas_elms/widgets/take_pick_widget/bloc/take_pick_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../flow/admin/add_student/widget/add_student_body.dart';

class ProfilePic extends StatelessWidget {
  AddStudentBodyState addStudentBodyState;
  ProfilePic({required this.addStudentBodyState, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      double height = constraints.maxHeight;

      return Column(
        children: [
          BlocBuilder<TakePickBloc, TakePickState>(builder: (context, state) {
            if (state is TakePickInitial) {
              if (state.imagePath != null) {
                addStudentBodyState.imageFile = File(state.imagePath!);
                return Container(
                  height: height * .7,
                  width: 100,
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    foregroundImage: FileImage(File(state.imagePath!)),
                    maxRadius: 30,
                  ),
                );
              } else {
                return Container(
                  height: height * .7,
                  width: 100,
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    maxRadius: 30,
                    child: Icon(Icons.person),
                  ),
                );
              }
            } else {
              return Container(
                height: height * .7,
                width: 100,
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  maxRadius: 30,
                  child: Icon(Icons.person),
                ),
              );
            }
          }),
          Container(
              width: width,
              height: height * .3,
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  Provider.of<TakePickBloc>(context, listen: false)
                      .add(TakePickGalleryEvent());
                },
                child: Text(
                  'take photo',
                  style: TextStyle(
                      height: 1.2,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 2),
                ),
              ))
        ],
      );
    });
  }
}
