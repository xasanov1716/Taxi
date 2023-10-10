import 'package:flutter/material.dart';

class GlobalAlertDialog extends StatefulWidget {
  const GlobalAlertDialog(
      {super.key,
      required this.textTitle,
      required this.model,
      required this.hight,
      required this.imageLogo,
      required this.onTap,
      required this.buttonText});

  final String textTitle;
  final String model;
  final double hight;
  final String imageLogo;
  final String buttonText;

  final ValueChanged onTap;

  @override
  State<GlobalAlertDialog> createState() => _GlobalAlertDialogState();
}

class _GlobalAlertDialogState extends State<GlobalAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          actionsOverflowButtonSpacing: 20,
          title: Image.asset(widget.imageLogo),
          content: SizedBox(
            height: widget.hight,
            child: Column(
              children: [
                Text(
                  widget.textTitle,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
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
