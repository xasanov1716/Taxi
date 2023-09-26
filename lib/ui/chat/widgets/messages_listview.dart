import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/models/message/message_model.dart';
import 'package:taxi_app/ui/chat/widgets/audio_container.dart';
import 'package:taxi_app/ui/chat/widgets/image_container.dart';
import 'package:taxi_app/ui/chat/widgets/message_container.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({super.key, required this.messages});
  final List<MessageModel> messages;
  @override
  Widget build(BuildContext context) {
    return ListView(
      reverse: true,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      children: [
        ...List.generate(
          messages.length,
          (index) {
            MessageModel message = messages.reversed.toList()[index];
            return Column(
              children: [
                14.ph,
                Row(
                  mainAxisAlignment: index.isEven
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                  children: [
                    message.image == null && message.message == null
                        ? AudioContainer(audioPath: message.voice ?? '')
                        : message.image == null
                            ? Flexible(
                                fit: FlexFit.loose,
                                child: MessageContainer(
                                  index: index,
                                  message: message.message!,
                                  dateTime: message.dateTime,
                                ),
                              )
                            : ImageContainer(images: message.image ?? []),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
