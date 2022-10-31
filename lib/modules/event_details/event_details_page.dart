import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:splitit/modules/event_details/event_details_controller.dart';
import 'package:splitit/modules/event_details/state/event_details.dart';
import 'package:splitit/shared/models/event.dart';
import 'package:splitit/shared/repositories/firebase_repository.dart';
import 'package:splitit/shared/utils/formatters.dart';
import 'package:splitit/theme/app_theme.dart';
import 'package:splitit/widgets/item_tile/item_tile.dart';
import 'package:splitit/widgets/person_check_tile/person_check_tile.dart';

class EventDetailsPage extends StatefulWidget {
  final EventModel event;
  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  final controller =
      EventDetailsController(firebaseRepository: FirebaseRepository());

  late ReactionDisposer _disposer;

  @override
  void initState() {
    _disposer = autorun((_) {
      if (controller.state.runtimeType == EventDetailsStateSuccess) {
        BotToast.closeAllLoading();
        Navigator.pop(context);
        return;
      }

      if (controller.state.runtimeType == EventDetailsStateError) {
        BotToast.closeAllLoading();
        BotToast.showText(text: 'Não foi possível apagar o evento.');
        return;
      }

      if (controller.state.runtimeType == EventDetailsStateLoading) {
        BotToast.showLoading();
        return;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.white,
        elevation: 0,
        leading: BackButton(
          color: AppTheme.colors.gray,
        ),
        title: Text(
          widget.event.title,
          style: AppTheme.textStyles.appBarTitle
              .copyWith(color: AppTheme.colors.gray),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await controller.firebaseRepository
                  .delete(id: widget.event.id, collection: '/events');
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.delete,
              color: AppTheme.colors.gray,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.all(16),
              color: AppTheme.colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PARTICIPANTES',
                    style: AppTheme.textStyles.eventTileTitle,
                  ),
                  ...widget.event.friends
                      .map(
                        (person) => PersonCheckTile(
                            person: person,
                            valueSplitted: widget.event.valueSplitted,
                            isPaid: false,
                            onCheckPressed: () {}),
                      )
                      .toList(),
                ],
              ),
            ),
            Container(
              color: AppTheme.colors.grayLight.withOpacity(0.1),
              child: ListTile(
                dense: true,
                title: Text('Faltam: ',
                    style: AppTheme.textStyles.eventTileValue
                        .copyWith(color: AppTheme.colors.error)),
                trailing: Text(
                  widget.event.valueRemaining.toBrl(),
                  style: AppTheme.textStyles.eventTileValue
                      .copyWith(color: AppTheme.colors.error),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              color: AppTheme.colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ITENS',
                    style: AppTheme.textStyles.eventTileTitle,
                  ),
                  ...ListTile.divideTiles(
                    color: AppTheme.colors.grayLight,
                    tiles: widget.event.items
                        .map(
                          (item) => ItemTile(item: item),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            Container(
              color: AppTheme.colors.grayLight.withOpacity(0.1),
              child: ListTile(
                dense: true,
                title: const Text('Total: '),
                trailing: Text(widget.event.value.toBrl()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
