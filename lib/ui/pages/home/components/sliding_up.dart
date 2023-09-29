import 'package:amigo_fiel/presentation/presenters/presenters.dart';

import 'package:amigo_fiel/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FeedspotSlidingUp extends StatelessWidget {
  final Widget mapsPage;
  final Widget panel;
  final GetxFeedspotPresenter feedspotPresenter;
  final GetxPanelPresenter panelPresenter;

  const FeedspotSlidingUp({
    Key? key,
    required this.mapsPage,
    required this.panel,
    required this.feedspotPresenter,
    required this.panelPresenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final defaultBackgroundColor = isDarkMode ? customDefaultDarkColor : customWhiteColor;
    final maxHeight = MediaQuery.of(context).size.height * 0.6;
    return GetBuilder<GetxPanelPresenter>(
      builder: (panelPresenter) {
        return SlidingUpPanel(
          maxHeight: maxHeight,
          minHeight: 0,
          isDraggable: true,
          controller: panelPresenter.controller,
          backdropEnabled: true,
          parallaxEnabled: true,
          parallaxOffset: .5,
          color: defaultBackgroundColor,
          boxShadow: const [BoxShadow(blurRadius: 8, color: Color.fromRGBO(0, 0, 0, 0.75))],
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          panelBuilder: (controller) {
            return panel;
          },
          body: mapsPage,
        );
      },
    );
  }
}
