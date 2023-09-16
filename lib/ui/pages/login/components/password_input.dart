import 'package:amigo_fiel/presentation/presenters/getx_login_presenter.dart';
import 'package:amigo_fiel/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<GetxLoginPresenter>();
    return Obx(
      () => TextFormField(
        onChanged: presenter.validatePassword,
        decoration: InputDecoration(
          errorText: presenter.passwordError.string,
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
      ),
    );
  }
}
