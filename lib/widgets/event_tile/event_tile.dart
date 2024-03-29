import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splitit/modules/event_details/event_details_page.dart';

import 'package:splitit/shared/models/event.dart';
import 'package:splitit/shared/utils/formatters.dart';
import 'package:splitit/theme/app_theme.dart';
import 'package:splitit/widgets/event_tile/event_tile_loading.dart';
import 'package:splitit/widgets/icon_card_widget.dart';

class EventTileWidget extends StatelessWidget {
  final EventModel model;
  final bool isLoading;
  final VoidCallback? onTap;

  const EventTileWidget({
    Key? key,
    required this.model,
    required this.isLoading,
    this.onTap,
  }) : super(key: key);

  IconCardType get iconCardType =>
      model.value >= 0 ? IconCardType.positive : IconCardType.negative;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const EventTileLoading();
    }

    return InkWell(
      onTap: onTap,
      child: Column(
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
              model.createdAt.dayMonth(),
              style: AppTheme.textStyles.eventTileSubtitle,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  model.value.toBrl(),
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
      ),
    );
  }
}
