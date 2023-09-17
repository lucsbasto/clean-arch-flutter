import 'package:amigo_fiel/presentation/presenters/presenters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animation_design_model.dart';

class CustomFadeInAnimation extends StatelessWidget {
  final GetxSplashPresenter controller;
  final int durationInMs;
  final CustomAnimationModel? model;
  final Widget child;

  const CustomFadeInAnimation({
    super.key,
    required this.durationInMs,
    this.model,
    required this.child,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: durationInMs),
        top: controller.animate.value ? model!.topAfter : model!.topBefore,
        left: controller.animate.value ? model!.leftAfter : model!.leftBefore,
        bottom: controller.animate.value ? model!.bottomAfter : model!.bottomBefore,
        right: controller.animate.value ? model!.rightAfter : model!.rightBefore,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: durationInMs),
          opacity: controller.animate.value ? 1 : 0,
          child: child,
        ),
      ),
    );
  }
}
