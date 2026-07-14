import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GameDialog extends StatelessWidget {
  const GameDialog({
    super.key,
    required this.title,
    required this.animation,
    required this.buttonText,
    required this.onPressed,
  });

  final String title;
  final String animation;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dialogSize = MediaQuery.of(context).size.shortestSide * 0.24;

    return PopScope(
      canPop: false,
      child: Column(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          Lottie.asset(
            'assets/animations/$animation',
            height: dialogSize,
            width: dialogSize,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: ElevatedButton(
              onPressed: onPressed,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  buttonText,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ),
          const SizedBox(height: 2),
        ],
      ),
    );
  }
}
