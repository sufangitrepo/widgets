import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'take_pick_event.dart';
part 'take_pick_state.dart';

class TakePickBloc extends Bloc<TakePickEvent, TakePickState> {
  TakePickBloc() : super(TakePickInitial(imagePath: null)) {
    on<TakePickCameraEvent>((event, emit) async {
      ImagePicker imagePicker = ImagePicker();
      XFile? xFile = await imagePicker.pickImage(source: ImageSource.gallery);
      if (xFile != null) {
        emit(TakePickInitial(imagePath: xFile.path));
      } else {
        emit(TakePickInitial(imagePath: null));
      }
    });

    on<TakePickGalleryEvent>((event, emit) async {
      try {
        ImagePicker imagePicker = ImagePicker();
        XFile? xFile = await imagePicker.pickImage(source: ImageSource.gallery);
        if (xFile != null) {
          emit(TakePickInitial(imagePath: xFile.path));
        } else {
          emit(TakePickInitial(imagePath: null));
        }
      } catch (e) {
        print("GALLERY EVENT ###############33333" + e.toString());
      }
    });

    on<TakePickInitialEvent>((event, emit) {
      emit.call(TakePickInitial(imagePath: null));
    });
  }
}
