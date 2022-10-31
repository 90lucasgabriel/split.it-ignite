import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitit/shared/models/event.dart';
import 'package:splitit/shared/models/friend_model.dart';
import 'package:splitit/shared/utils/formatters.dart';
import 'package:splitit/theme/app_theme.dart';
import 'package:splitit/widgets/check_button/check_button.dart';

class PersonCheckTile extends StatelessWidget {
  final FriendModel person;
  final double valueSplitted;
  final bool isPaid;
  final EventModel event;
  final Function(FriendModel newFriend) onCheckPressed;

  const PersonCheckTile(
      {Key? key,
      this.isPaid = false,
      required this.onCheckPressed,
      required this.person,
      required this.event,
      required this.valueSplitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppTheme.colors.grayLight.withOpacity(0.2),
              image: person.photoURL.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(person.photoURL), fit: BoxFit.cover)
                  : null),
        ),
        title: Text(person.name),
        subtitle: Text(
          valueSplitted.toBrl(),
          style: GoogleFonts.roboto(
            color:
                person.isPaid ? AppTheme.colors.primary : AppTheme.colors.error,
          ),
        ),
        trailing: CheckButton(
          event: event,
          friend: person,
          onCheckPressed: onCheckPressed,
        ),
      );
    });
  }
}

class CheckboxButton {}
