import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_app/blocs/messages/message_bloc.dart';
import 'package:taxi_app/blocs/messages/message_event.dart';
import 'package:taxi_app/data/models/message/message_model.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

void chatDialog(BuildContext context,{required ImagePicker picker}) {
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
                    _getFromCamera(picker: picker,context: context);
                  },
                  leading: const Icon(
                    Icons.camera_alt,
                    color: AppColors.white,
                  ),
                  title:  Text(
                    tr('select_from_camera'),
                    style:const TextStyle(color: AppColors.white, fontSize: 20),
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
                    _getFromGallery(picker: picker,context: context);
                  },
                  leading: const Icon(
                    Icons.photo,
                    color: AppColors.white,
                  ),
                  title:  Text(
                    tr('select_from_gallery'),
                    style:const TextStyle(color: AppColors.white, fontSize: 20),
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

Future<void> _getFromGallery({required ImagePicker picker, required BuildContext context}) async {
  List<String> images = [];
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

Future<void> _getFromCamera({required ImagePicker picker, required BuildContext context}) async {
  List<String> images = [];
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
