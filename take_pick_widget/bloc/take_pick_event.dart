part of 'take_pick_bloc.dart';

@immutable
abstract class TakePickEvent {}

class TakePickGalleryEvent extends TakePickEvent {}

class TakePickCameraEvent extends TakePickEvent {}

class TakePickInitialEvent extends TakePickEvent {}
