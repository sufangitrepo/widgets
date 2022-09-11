import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/colors.dart';
import '../../flow/super_admin/super_login/login_widgets/text_field.dart';
import 'bloc/password_field_bloc.dart';

class PasswordTextField extends StatelessWidget {
  Icon? prefixIcon;
  String? hint;
  String? text;
  Widget? suffixIcon;
  TextInputType? textInputType;
  ValidationClosure? closure;
  TextEditingController controller;
  GlobalKey<FormFieldState>? validationKey;
  PasswordTextField(
      {required this.controller,
      this.prefixIcon,
      this.closure,
      this.validationKey,
      this.textInputType,
      this.text,
      this.suffixIcon,
      this.hint,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<PasswordFieldBloc>(context, listen: false);
    return BlocBuilder<PasswordFieldBloc, PasswordFieldState>(
      builder: (context, state) {
        if (state is PasswordVisibilitState) {
          return TextFormField(
            validator: closure,
            controller: controller,
            keyboardType: textInputType,
            key: validationKey,
            cursorColor: brownColor,
            obscureText: state.obscure,
            onChanged: (value) {
              if (validationKey != null) {
                validationKey!.currentState?.validate();
              }
            },
            decoration: InputDecoration(
                hintText: hint,
                prefixIcon: prefixIcon,
                suffixIcon: IconButton(
                    onPressed: () {
                      if (state.obscure) {
                        bloc.add(ChangeVisibilityEvent(false));
                      } else {
                        bloc.add(ChangeVisibilityEvent(true));
                      }
                    },
                    icon: state.obscure
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility)),
                helperText: '',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: brownColor, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: brownColor, width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.only(left: 10)),
          );
        } else {
          return TextFormField(
            validator: closure,
            controller: controller,
            keyboardType: textInputType,
            key: validationKey,
            obscureText: true,
            cursorColor: brownColor,
            onChanged: (value) {
              if (validationKey != null) {
                validationKey!.currentState?.validate();
              }
            },
            decoration: InputDecoration(
                hintText: hint,
                prefixIcon: prefixIcon,
                suffixIcon: IconButton(
                    onPressed: () {
                      bloc.add(ChangeVisibilityEvent(false));
                    },
                    icon: Icon(Icons.visibility_off)),
                helperText: '',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: brownColor, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: brownColor, width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.only(left: 10)),
          );
        }
      },
    );
  }
}
