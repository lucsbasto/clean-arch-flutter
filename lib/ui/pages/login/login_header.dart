import 'package:amigo_fiel/utils/images.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Image(image: const AssetImage(customLogoImage), height: screenHeight * 0.17),
        const SizedBox(
          height: 0.12,
        ),
        Text("Bem vindo de volta.", style: Theme.of(context).textTheme.displayMedium),
        Text("Ajude-nos a cuidar dos cães de rua registrando as suas atividades no aplicativo Amigo Fiel.",
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
