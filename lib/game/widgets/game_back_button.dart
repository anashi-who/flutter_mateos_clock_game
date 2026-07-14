import 'package:flutter/material.dart';

class GameBackButton extends StatelessWidget {
  const GameBackButton({
    super.key,
    this.iconColor,
    this.onTap,
    this.icon,
  });

  final Color? iconColor;
  final Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final iconSize = MediaQuery.of(context).size.shortestSide * 0.05;

    return InkWell(
      onTap: onTap,
      child: Icon(
        icon ?? Icons.settings,
        size: iconSize,
        color: iconColor ?? Colors.black,
      ),
    );
  }
}
