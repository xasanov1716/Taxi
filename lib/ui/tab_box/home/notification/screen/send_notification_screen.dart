import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubits/notification_send_cubit/notification_send_cubit.dart';
import 'package:taxi_app/data/models/notification_model/notification_model.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/constants/constants.dart';
import 'package:taxi_app/utils/mixins/validator.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/error_message_dialog.dart';

class SendNotificationScreen extends StatefulWidget {
  SendNotificationScreen({Key? key}) : super(key: key);

  @override
  State<SendNotificationScreen> createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> with FormValidationMixin {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController bodyController = TextEditingController();

  String? currentIconCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test notification'),
        centerTitle: true,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<NotificationSendCubit>().sendNotification(
                        NotificationModel(
                          timestamp: 0,
                          title: titleController.text,
                          body: bodyController.text,
                          iconCode: currentIconCode!,
                        ),
                      );
                }
              },
              child: Text(
                'Send',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.primary),
              ))
        ],
      ),
      body: BlocListener<NotificationSendCubit, NotificationSendState>(
        listener: (context, state) {
          if (state is NotificationSendLoading) {
            showLoader(context);
          } else if (state is NotificationSendError) {
            Navigator.pop(context);
            showErrorMessage(message: state.errorMessage, context: context);
          } else if (state is NotificationSendSuccess) {
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: validateString,
                  controller: titleController,
                  decoration: InputDecoration(
                      label: const Text('Title...'),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                ),
                20.ph,
                TextFormField(
                  validator: validateString,
                  controller: bodyController,
                  decoration: InputDecoration(
                      label: const Text('Body...'),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                ),
                20.ph,
                DropdownButtonFormField(
                  validator: validateDropDown,
                  borderRadius: BorderRadius.circular(16),
                  hint: const Text('Select icon mode'),
                  items: iconMapping.keys
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    currentIconCode = value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showLoader(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Dialog(
          child: SizedBox(
            height: 300,
            width: 300,
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
