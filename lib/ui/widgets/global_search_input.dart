import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class GlobalSearchTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  final String caption;
  final TextEditingController controller;

  const GlobalSearchTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.caption,
    required this.controller,
  }) : super(key: key);

  @override
  _GlobalSearchTextField createState() => _GlobalSearchTextField();
}

class _GlobalSearchTextField extends State<GlobalSearchTextField> {
  final bool _isPasswordVisible = false;

  bool isFocus = false;
  final FocusNode _textFieldFocus = FocusNode();
  Color _color = Colors.white;
  Color _iconColor = Colors.grey;

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _color = Colors.yellow;
          _iconColor = Colors.amber;
        });
      } else {
        setState(() {
          _color = Colors.white;
          _iconColor = Colors.grey;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.caption.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              widget.caption,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: widget.controller,
          focusNode: _textFieldFocus,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: IconButton(
              splashRadius: 1,
              icon: SvgPicture.asset(AppIcons.search, color: _iconColor),
              onPressed: () {},
            ),
            suffixIcon: IconButton(
              splashRadius: 1,
              icon: SvgPicture.asset(AppIcons.filter, color: _iconColor),
              onPressed: () {},
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.amber, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: _color,
            filled: true,
          ),
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.keyboardType == TextInputType.visiblePassword
              ? !_isPasswordVisible
              : false,
        ),
      ],
    );
  }
}
