import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_app/blocs/messages/message_bloc.dart';
import 'package:taxi_app/blocs/messages/message_event.dart';
import 'package:taxi_app/blocs/messages/message_state.dart';
import 'package:taxi_app/data/models/message/message_model.dart';
import 'package:taxi_app/ui/chat/widgets/audio_container.dart';
import 'package:taxi_app/ui/chat/widgets/chat_dialog.dart';
import 'package:taxi_app/ui/chat/widgets/image_container.dart';
import 'package:taxi_app/ui/chat/widgets/message_container.dart';
import 'package:taxi_app/ui/chat/widgets/send_message_textfield.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ImagePicker picker = ImagePicker();

  String value = '';

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: 'Daniel Austin',
        action: [
          getIcon(
            AppIcons.call,
            context: context,
            onTap: () {},
          ),
          getIcon(
            AppIcons.moreCircle,
            context: context,
            onTap: () {},
          ),
        ],
      ),
      body: BlocBuilder<MessageBloc, MessageState>(
        builder: (context, state) {
          return Column(
            children: [
              14.ph,
              Expanded(
                child: state.messages.isNotEmpty
                    ? ListView(
                        reverse: true,
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        children: [
                          ...List.generate(
                            state.messages.length,
                            (index) {
                              MessageModel message =
                                  state.messages.reversed.toList()[index];
                              return Column(
                                children: [
                                  14.ph,
                                  Row(
                                    mainAxisAlignment: index.isEven
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.end,
                                    children: [
                                      message.image == null &&
                                              message.message == null
                                          ? AudioContainer(
                                              audioPath: message.voice ?? '')
                                          : message.image == null
                                              ? Flexible(
                                                  fit: FlexFit.loose,
                                                  child: MessageContainer(
                                                    index: index,
                                                    message: message.message!,
                                                    dateTime: message.dateTime,
                                                  ),
                                                )
                                              : ImageContainer(
                                                  images: message.image ?? []),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          'There are no posts here yet',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: getTheme(context)
                                      ? AppColors.white
                                      : AppColors.black),
                        ),
                      ),
              ),
              SendMessageTextField(
                onSuffixIconTap: () {
                  chatDialog(context,picker: picker);
                },
                onChanged: (v) {
                  setState(() {
                    value = v;
                  });
                },
                onSendTap: () {
                  context.read<MessageBloc>().add(
                        (SendMessage(
                            messageModel: MessageModel(
                          receiverName: '',
                          senderName: '',
                          dateTime: DateTime.now().toString().substring(10, 16),
                          message: value,
                        ))),
                      );
                  value = '';
                  controller.clear();
                },
                controller: controller,
                value: value,
              ),
            ],
          );
        },
      ),
    );
  }
}