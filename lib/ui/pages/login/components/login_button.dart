import 'package:amigo_fiel/presentation/presenters/getx_login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<GetxLoginPresenter>();
    return SizedBox(
      width: double.infinity,
      child: Obx(
        () => ElevatedButton(
          onPressed: presenter.isFormValid.value == true ? presenter.auth : null,
          child: const Text("LOGIN"),
        ),
      ),
    );
  }
}
