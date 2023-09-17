import 'package:amigo_fiel/ui/mixins/mixins.dart';
import 'package:amigo_fiel/ui/pages/splash/components/components.dart';
import 'package:amigo_fiel/presentation/presenters/presenters.dart';
import 'package:amigo_fiel/utils/utils.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget with NavigationManager {
  final GetxSplashPresenter presenter;

  const SplashPage({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    presenter.startSplashAnimation();
    presenter.loadAccount();

    return Scaffold(
      body: Builder(
        builder: (context) {
          presenter.navigateToStream.listen((page) {
            if (page.isNotEmpty == true) {
              handleNavigation(presenter.navigateToStream, clear: true);
            }
          });
          return Stack(
            children: [
              CustomFadeInAnimation(
                durationInMs: 1600,
                controller: presenter,
                model: CustomAnimationModel(
                  topBefore: -20,
                  topAfter: 0,
                  leftBefore: -20,
                  leftAfter: 0,
                ),
                child: Container(
                  width: 80,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.elliptical(60, 100),
                      bottomRight: Radius.elliptical(100, 100),
                      topRight: Radius.elliptical(30, 30),
                    ),
                    color: Colors.amber[500],
                  ),
                ),
              ),
              CustomFadeInAnimation(
                durationInMs: 1600,
                controller: presenter,
                model: CustomAnimationModel(topAfter: 150, topBefore: 150, leftAfter: 30, leftBefore: -100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amigo Fiel', style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Encontre pontos \nde alimentação  \npara animais de rua.",
                        style: Theme.of(context).textTheme.displayLarge),
                  ],
                ),
              ),
              CustomFadeInAnimation(
                durationInMs: 1600,
                controller: presenter,
                model: CustomAnimationModel(bottomAfter: 70, bottomBefore: 0, leftAfter: 25, leftBefore: 0),
                child: Column(children: const [
                  Image(
                    image: AssetImage(customSplashImage),
                    height: 350,
                    width: 350,
                  ),
                ]),
              ),
              CustomFadeInAnimation(
                durationInMs: 1600,
                controller: presenter,
                model: CustomAnimationModel(
                  bottomBefore: 0,
                  bottomAfter: 70,
                  rightAfter: 30,
                  rightBefore: 30,
                ),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.amber[600],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
