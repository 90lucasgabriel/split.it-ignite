import 'package:flutter/material.dart';

import 'package:splitit/widgets/skeleton.dart';

class EventTileLoading extends StatelessWidget {
  const EventTileLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Skeleton(size: Size(48, 48)),
          title: const Skeleton(size: Size(60, 19)),
          subtitle: const Skeleton(size: Size(45, 13)),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Skeleton(size: Size(35, 19)),
              SizedBox(height: 4),
              Skeleton(size: Size(35, 13)),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
