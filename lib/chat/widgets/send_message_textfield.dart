import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/blocs/messages/message_bloc.dart';
import 'package:taxi_app/blocs/messages/message_event.dart';
import 'package:taxi_app/chat/widgets/for_audio/audio.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class SendMessageTextField extends StatefulWidget {
  const SendMessageTextField({
    super.key,
    required this.onSuffixIconTap,
    required this.onChanged,
    required this.onSendTap,
    required this.controller,
    required this.value,
  });
  final VoidCallback onSuffixIconTap;
  final ValueChanged onChanged;
  final VoidCallback onSendTap;
  final TextEditingController controller;
  final String value;

  @override
  State<SendMessageTextField> createState() => _SendMessageTextFieldState();
}

class _SendMessageTextFieldState extends State<SendMessageTextField> {
  Color color = const Color(0xFFFAFAFA);

  FocusNode? focusNode = FocusNode();

  double _height = 56.0;

  @override
  void initState() {
    super.initState();
    focusNode?.addListener(_onFocusChange);
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    focusNode?.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  void _onTextChanged() {
    setState(() {
      _height = 56.0 + (widget.controller.text.length / 100) * 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 312.w,
            height: _height,
            child: TextField(
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              maxLines: null,
              minLines: null,
              expands: true,
              focusNode: focusNode,
              onChanged: widget.onChanged,
              controller: widget.controller,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontFamily: "Urbanist",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff9e9e9e),
                  height: 20 / 14,
                ),
                contentPadding: EdgeInsets.all(15.r),
                hintText: 'Message...',
                suffixIcon: IconButton(
                  onPressed: widget.onSuffixIconTap,
                  icon: SvgPicture.asset(
                    AppIcons.image2,
                    width: 20.w,
                    colorFilter: const ColorFilter.mode(
                        AppColors.c_500, BlendMode.srcIn),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: getTheme(context)
                          ? AppColors.dark3
                          : const Color(0xFFFAFAFA),
                      width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.primary, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: getTheme(context)
                          ? const Color(0xFFFAFAFA)
                          : AppColors.dark2,
                      width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: getTheme(context)
                    ? (focusNode!.hasFocus)
                        ? AppColors.yellowTransparent
                        : AppColors.dark2
                    : (focusNode!.hasFocus)
                        ? const Color(0xFFFFFAED)
                        : const Color(0xFFFAFAFA),
                filled: true,
              ),
            ),
          ),
          12.pw,
          value.isEmpty
              ? AudioController()
              : InkWell(
                  borderRadius: BorderRadius.circular(100.r),
                  onTap: widget.onSendTap,
                  child: Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      gradient: AppColors.gradientOrangeYellow,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.getSvg(
                          name: AppIcons.send, iconType: IconType.bold),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
