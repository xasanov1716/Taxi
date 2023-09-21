import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_app/blocs/messages/message_bloc.dart';
import 'package:taxi_app/blocs/messages/message_event.dart';
import 'package:taxi_app/blocs/messages/message_state.dart';
import 'package:taxi_app/data/models/message/message_model.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/chat_with_driver/widgets/image_container.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/chat_with_driver/widgets/message_container.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/chat_with_driver/widgets/send_message_textfield.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class ChatWithDriverScreen extends StatefulWidget {
  const ChatWithDriverScreen({super.key});

  @override
  State<ChatWithDriverScreen> createState() => _ChatWithDriverScreenState();
}

class _ChatWithDriverScreenState extends State<ChatWithDriverScreen> {
  ImagePicker picker = ImagePicker();

  List<String> images = [];

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
              Expanded(
                child: state.messages.isNotEmpty
                    ? ListView(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        children: [
                          ...List.generate(
                            state.messages.length,
                            (index) {
                              MessageModel message = state.messages[index];
                              return Row(
                                mainAxisAlignment: index.isEven
                                    ? MainAxisAlignment.start
                                    : MainAxisAlignment.end,
                                children: [
                                  message.image == null
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
      context.read<MessageBloc>().add(SendMessage(
              messageModel: MessageModel(
            receiverName: '',
            senderName: '',
            dateTime: DateTime.now().toString(),
            image: images,
          )));
      print(images);

    }
  }

  Future<void> _getFromGallery() async {
    List<XFile>? xFiles = await picker.pickMultiImage();
    if (context.mounted) {
      images = xFiles.map((file) => file.path).toList();
      context.read<MessageBloc>().add(SendMessage(
              messageModel: MessageModel(
            receiverName: '',
            senderName: '',
            dateTime: DateTime.now().toString(),
            image: images,
          )));

    }
  }
}