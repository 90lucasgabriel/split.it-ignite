import 'package:flutter/material.dart';

import 'package:splitit/theme/app_theme.dart';
import 'package:splitit/shared/models/event.dart';
import 'package:splitit/widgets/icon_card_widget.dart';

class EventTileWidget extends StatelessWidget {
  final EventModel model;

  const EventTileWidget({Key? key, required this.model}) : super(key: key);

  IconCardType get iconCardType =>
      model.value >= 0 ? IconCardType.positive : IconCardType.negative;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: IconCardWidget(
            type: iconCardType,
          ),
          title: Text(
            model.title,
            style: AppTheme.textStyles.eventTileTitle,
          ),
          subtitle: Text(
            model.createdAt.toString(),
            style: AppTheme.textStyles.eventTileSubtitle,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'R\$ ${model.value.toStringAsFixed(2)}',
                style: AppTheme.textStyles.eventTileValue,
              ),
              const SizedBox(height: 4),
              Text(
                '${model.people} amigos',
                style: AppTheme.textStyles.eventTilePeople,
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
