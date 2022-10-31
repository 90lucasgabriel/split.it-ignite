import 'package:flutter/material.dart';

import 'package:splitit/shared/models/friend_model.dart';
import 'package:splitit/theme/app_theme.dart';

class PersonTile extends StatelessWidget {
  final FriendModel data;
  final VoidCallback onPressed;

  const PersonTile({
    Key? key,
    required this.data,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(data.photoURL),
              fit: BoxFit.cover,
            ),
          )),
      title: Text(
        data.name,
        style: !data.isPaid
            ? AppTheme.textStyles.eventTileTitle
            : AppTheme.textStyles.text,
      ),
      trailing: !data.isPaid
          ? IconButton(
              icon: Icon(
                Icons.remove,
                color: AppTheme.colors.error,
              ),
              onPressed: onPressed,
            )
          : IconButton(
              icon: Icon(
                Icons.add,
                color: AppTheme.colors.primary,
              ),
              onPressed: onPressed,
            ),
    );
  }
}
