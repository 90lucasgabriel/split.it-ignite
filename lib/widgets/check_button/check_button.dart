import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:splitit/shared/models/event.dart';
import 'package:splitit/shared/models/friend_model.dart';
import 'package:splitit/shared/repositories/firebase_repository.dart';
import 'package:splitit/theme/app_theme.dart';
import 'package:splitit/widgets/check_button/controller.dart';
import 'package:splitit/widgets/check_button/enum/state.dart';

class CheckButton extends StatefulWidget {
  final FriendModel friend;
  final EventModel event;
  final Function(FriendModel newFriend) onCheckPressed;

  const CheckButton({
    Key? key,
    required this.friend,
    required this.event,
    required this.onCheckPressed,
  }) : super(key: key);

  @override
  State<CheckButton> createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  late CheckButtonController controller;

  Color get primaryColor => controller.state == CheckButtonState.success
      ? AppTheme.colors.primaryBackground
      : AppTheme.colors.grayLight.withOpacity(0.1);
  Color get secondaryColor => controller.state == CheckButtonState.success
      ? AppTheme.colors.primary
      : AppTheme.colors.grayLight;
  IconData get icon => controller.state == CheckButtonState.success
      ? Icons.check_box
      : Icons.check_box_outline_blank;

  @override
  void initState() {
    controller = CheckButtonController(
      firebaseRepository: FirebaseRepository(),
      event: widget.event,
    );

    if (widget.friend.isPaid) {
      controller.state = CheckButtonState.success;
    }

    autorun((_) {
      if (controller.state == CheckButtonState.success) {
        widget.onCheckPressed(widget.friend.copyWith(isPaid: true));
      } else if (controller.state == CheckButtonState.empty) {
        widget.onCheckPressed(widget.friend.copyWith(isPaid: false));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return InkWell(
        onTap: () {
          controller.update(widget.friend);
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(4)),
          child: Icon(
            icon,
            color: secondaryColor,
          ),
        ),
      );
    });
  }
}
