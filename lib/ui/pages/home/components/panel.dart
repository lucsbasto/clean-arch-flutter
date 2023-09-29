import 'package:amigo_fiel/main/factories/presenters/feedspot_presenter.dart';
import 'package:amigo_fiel/main/factories/presenters/panel_presenter_factory.dart';
import 'package:amigo_fiel/ui/pages/home/components/drag_handle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../presentation/presenters/presenters.dart';
import '../../../../utils/colors.dart';

class FeedSpotPanel extends StatelessWidget {
  final GetxPanelPresenter panelPresenter;
  final GetxFeedspotPresenter feedspotPresenter;
  const FeedSpotPanel({
    Key? key,
    required this.panelPresenter,
    required this.feedspotPresenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final defaultIconColor = isDarkMode ? customWhiteColor : customDefaultDarkColor;
    final PanelController controller = panelPresenter.controller;

    return Visibility(
      visible: panelPresenter.isVisible,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DragHandle(
                    onTap: () {
                      if (controller.isPanelOpen) {
                        panelPresenter.hidePanel();
                      } else {
                        panelPresenter.openPanel();
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 200,
                    child: Obx(() {
                      final feedspot = feedspotPresenter.feedspot;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: feedspot?.images?.length ?? 0,
                        itemBuilder: (context, index) {
                          String imageUrl = feedspot?.images?[index].imageUrl ?? '';
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                              imageUrl,
                              width: 500,
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Obx(() {
                            final feedspot = feedspotPresenter.feedspot;
                            return Text(
                              "${feedspot?.landmark}",
                              style: Theme.of(context).textTheme.headlineLarge,
                            );
                          }),
                          const Spacer(),
                          Row(
                            children: const [
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                            ],
                          ),
                        ],
                      ),
                      Obx(() {
                        final feedspot = feedspotPresenter.feedspot;
                        return Text(
                          "${feedspot?.fullAddress}",
                          style: Theme.of(context).textTheme.headlineSmall,
                        );
                      }),
                    ],
                  ),
                  Divider(
                    height: 40,
                    thickness: 2,
                    color: defaultIconColor,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Encher'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('Reportar'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
