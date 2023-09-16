import 'package:amigo_fiel/presentation/presenters/getx_login_presenter.dart';
import 'package:amigo_fiel/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<GetxLoginPresenter>();
    return Obx(
      () => TextFormField(
        onChanged: presenter.validateEmail,
        decoration: InputDecoration(
          errorText: presenter.emailError.value,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: customSecondaryColor),
          ),
          prefixIcon: const Icon(Icons.person_outline_outlined),
          labelText: "Digite seu email",
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
