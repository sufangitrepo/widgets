part of 'password_field_bloc.dart';

@immutable
abstract class PasswordFieldEvent {
  const PasswordFieldEvent();
}

class ChangeVisibilityEvent extends PasswordFieldEvent {
  final bool obscure;
  ChangeVisibilityEvent(this.obscure);
}
