import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_app/blocs/messages/message_bloc.dart';
import 'package:taxi_app/blocs/messages/message_event.dart';
import 'package:taxi_app/blocs/messages/message_state.dart';
import 'package:taxi_app/chat/widgets/audio_container.dart';
import 'package:taxi_app/chat/widgets/image_container.dart';
import 'package:taxi_app/chat/widgets/message_container.dart';
import 'package:taxi_app/chat/widgets/send_message_textfield.dart';
import 'package:taxi_app/data/models/message/message_model.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ImagePicker picker = ImagePicker();

  List<String> images = [];

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
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.call,
              width: 28.w,
              colorFilter: ColorFilter.mode(
                  getTheme(context) ? AppColors.white : AppColors.c_900,
                  BlendMode.srcIn),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.moreCircle,
              width: 28.w,
              colorFilter: ColorFilter.mode(
                  getTheme(context) ? AppColors.white : AppColors.c_900,
                  BlendMode.srcIn),
            ),
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
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        children: [
                          ...List.generate(
                            state.messages.length,
                            (index) {
                              MessageModel message = state.messages[index];
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
                  showBottomSheetDialog(context);
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

  void showBottomSheetDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: getTheme(context) ? AppColors.c_900 : AppColors.c_700,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    onTap: () {
                      _getFromCamera();
                    },
                    leading: const Icon(
                      Icons.camera_alt,
                      color: AppColors.white,
                    ),
                    title: const Text(
                      "Select from Camera",
                      style: TextStyle(color: AppColors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white, width: 2)),
                  child: ListTile(
                    onTap: () {
                      _getFromGallery();
                    },
                    leading: const Icon(
                      Icons.photo,
                      color: AppColors.white,
                    ),
                    title: const Text(
                      "Select from Gallery",
                      style: TextStyle(color: AppColors.white, fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (xFile != null && context.mounted) {
      images.add(xFile.path);
      context.read<MessageBloc>().add(
            SendMessage(
              messageModel: MessageModel(
                receiverName: '',
                senderName: '',
                dateTime: DateTime.now().toString(),
                image: images,
              ),
            ),
          );
      images = [];
    }
  }

  Future<void> _getFromGallery() async {
    List<XFile>? xFiles = await picker.pickMultiImage();
    if (context.mounted) {
      images = xFiles.map((file) => file.path).toList();
      context.read<MessageBloc>().add(
            SendMessage(
              messageModel: MessageModel(
                receiverName: '',
                senderName: '',
                dateTime: DateTime.now().toString(),
                image: images,
              ),
            ),
          );
      images = [];
    }
  }
}
