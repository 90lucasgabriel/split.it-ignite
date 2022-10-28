import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:splitit/theme/app_theme.dart';

class PersonCheckTile extends StatelessWidget {
  const PersonCheckTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(height: 40, width: 40, color: Colors.red),
      title: Text('Nome Sobrenome'),
      subtitle: Text('R\$ 150,23'),
      trailing: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: AppTheme.colors.primaryBackground,
            borderRadius: BorderRadius.circular(4)),
        child: Icon(
          Icons.check_box,
          color: AppTheme.colors.primary,
        ),
      ),
    );
  }
}
