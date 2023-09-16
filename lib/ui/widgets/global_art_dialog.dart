import 'package:flutter/material.dart';

class GlobalAlretDialog extends StatefulWidget {
  const GlobalAlretDialog(
      {super.key,
        required this.TextTitle,
        required this.model,
        required this.hight,
        required this.ImageLogo,
        required this.onTap,
        required this.buttonText});

  final String TextTitle;
  final String model;
  final double hight;
  final String ImageLogo;
  final String buttonText;

  final ValueChanged onTap;

  @override
  State<GlobalAlretDialog> createState() => _GlobalAlretDialogState();
}

class _GlobalAlretDialogState extends State<GlobalAlretDialog> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          actionsOverflowButtonSpacing: 20,
          title: Image.asset(widget.ImageLogo),
          content: SizedBox(
            height: widget.hight,
            child: Column(
              children: [
                Text(
                  widget.TextTitle,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
                Text(widget.model),
              ],
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  widget.onTap;
                },
                child: Text(widget.buttonText),
              ),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}