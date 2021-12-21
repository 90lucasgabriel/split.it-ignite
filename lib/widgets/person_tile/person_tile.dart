import 'package:flutter/material.dart';

class PersonTile extends StatelessWidget {
  const PersonTile({
    Key? key,
    required this.name,
    required this.isSelected,
  }) : super(key: key);

  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        color: Colors.grey,
      ),
      title: Text(name),
      trailing: isSelected
          ? IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {},
            )
          : IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
    );
  }
}
