import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_field_event.dart';
part 'password_field_state.dart';

class PasswordFieldBloc extends Bloc<PasswordFieldEvent, PasswordFieldState> {
  PasswordFieldBloc() : super(PasswordFieldInitial()) {
    on<ChangeVisibilityEvent>((event, emit) {
      emit.call(PasswordVisibilitState(event.obscure));
    });
  }
}
