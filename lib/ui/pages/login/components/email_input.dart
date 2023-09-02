import 'package:amigo_fiel/ui/helpers/errors/ui_errors.dart';
import 'package:amigo_fiel/ui/pages/login/login_page.dart';
import 'package:amigo_fiel/ui/pages/login/login_presenter.dart';
import 'package:amigo_fiel/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return StreamBuilder<UIError?>(
        stream: presenter.emailErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: presenter.validateEmail,
            decoration: InputDecoration(
              errorText: snapshot.data?.description,
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: customSecondaryColor)),
              prefixIcon: const Icon(Icons.person_outline_outlined),
              labelText: "Digite seu email",
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          );
        });
  }
}
