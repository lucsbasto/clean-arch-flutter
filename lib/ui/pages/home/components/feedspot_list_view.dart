import 'package:amigo_fiel/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class FeedspotListView extends StatelessWidget {
  final FeedspotEntity feedspot;
  const FeedspotListView({super.key, required this.feedspot});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: feedspot.images?.length,
      itemBuilder: (context, index) {
        String imageUrl = feedspot.images![index].imageUrl;
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
    ;
  }
}
