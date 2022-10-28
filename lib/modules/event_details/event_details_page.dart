import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:splitit/theme/app_theme.dart';
import 'package:splitit/widgets/person_check_tile/person_check_tile.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({Key? key}) : super(key: key);

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
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
          'Título Tela',
          style: AppTheme.textStyles.appBarTitle
              .copyWith(color: AppTheme.colors.gray),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              color: AppTheme.colors.gray,
            ),
          )
        ],
      ),
      body: PersonCheckTile(),
    );
  }
}
