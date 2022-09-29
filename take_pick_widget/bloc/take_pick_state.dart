part of 'take_pick_bloc.dart';

@immutable
abstract class TakePickState {}

class TakePickInitial extends TakePickState {
  String? imagePath;

  TakePickInitial({required this.imagePath});
}
