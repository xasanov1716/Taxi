import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/blocs/messages/message_bloc.dart';
import 'package:taxi_app/blocs/messages/message_event.dart';
import 'package:taxi_app/chat/widgets/for_audio/audio.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/message/message_model.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class SendMessageTextField extends StatefulWidget {
  const SendMessageTextField({super.key, required this.onSuffixIconTap});
  final VoidCallback onSuffixIconTap;
  @override
  State<SendMessageTextField> createState() => _SendMessageTextFieldState();
}

class _SendMessageTextFieldState extends State<SendMessageTextField> {
  String value = '';

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 312.w,
            height: 56.h,
            child: GlobalTextField(
              hintText: 'Message...',
              suffixIcon: IconButton(
                onPressed: widget.onSuffixIconTap,
                icon: SvgPicture.asset(
                  AppIcons.image2,
                  width: 20.w,
                  colorFilter:
                      const ColorFilter.mode(AppColors.c_500, BlendMode.srcIn),
                ),
              ),
              onChanged: (v) {
                setState(() {
                  value = v;
                });
              },
              contentPadding: EdgeInsets.all(20.r),
              controller: controller,
            ),
          ),
          12.pw,
          value.isEmpty
              ? AudioController()
              : InkWell(
                  borderRadius: BorderRadius.circular(100.r),
                  onTap: () {
                    context.read<MessageBloc>().add(
                          (SendMessage(
                              messageModel: MessageModel(
                            receiverName: '',
                            senderName: '',
                            dateTime:
                                DateTime.now().toString().substring(10, 16),
                            message: value,
                          ))),
                        );
                    value = '';
                    controller.clear();
                  },
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
