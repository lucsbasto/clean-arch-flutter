import 'package:amigo_fiel/ui/helpers/errors/ui_errors.dart';
import 'package:amigo_fiel/ui/pages/login/login_presenter.dart';
import 'package:amigo_fiel/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return StreamBuilder<UIError?>(
        stream: presenter.passwordErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: presenter.validatePassword,
            decoration: InputDecoration(
              errorText: snapshot.data?.description,
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: customSecondaryColor)),
              prefixIcon: const Icon(Icons.fingerprint),
              labelText: "Digite sua senha",
              border: const OutlineInputBorder(),
              suffixIcon: const IconButton(
                onPressed: null,
                icon: Icon(Icons.remove_red_eye_sharp),
              ),
            ),
            obscureText: true,
          );
        });
  }
}
