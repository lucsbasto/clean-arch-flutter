import 'package:flutter/material.dart';

import 'package:amigo_fiel/presentation/presenters/getx_home_presenter.dart';
import 'package:amigo_fiel/utils/utils.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final GetxHomePresenter presenter;
  final Widget slidingUp;
  const HomePage({
    Key? key,
    required this.presenter,
    required this.slidingUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final defaultBackgroundColor = isDarkMode ? customDefaultDarkColor : customWhiteColor;
    final defaultIconColor = isDarkMode ? customWhiteColor : customDefaultDarkColor;
    presenter.load();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? defaultBackgroundColor : customWhiteColor,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              final user = presenter.user;
              return Text(
                '${user?.firstName} ${user?.lastName}',
                style: Theme.of(context).textTheme.titleLarge,
              );
            }),
            Obx(() {
              final user = presenter.user;
              if (user?.isVerified == true) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4, left: 5),
                  child: Icon(
                    Icons.verified_outlined,
                    color: defaultIconColor,
                    size: 18,
                  ),
                );
              }
              return const Text('');
            }),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
        leading: IconButton(
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Obx(
              () {
                final user = presenter.user;
                if (user?.avatarUrl != null) {
                  return Image.network(
                    '${user?.avatarUrl}', // Coloque a URL da imagem aqui
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  );
                }
                return Image.network(
                  'https://cdn1.iconfinder.com/data/icons/big-rocket/80/BigRocket-1-01-512.png', // Coloque a URL da imagem aqui
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          color: isDarkMode ? customWhiteColor : customDarkColor,
          onPressed: () {},
        ),
      ),
      body: slidingUp,
    );
  }
}
