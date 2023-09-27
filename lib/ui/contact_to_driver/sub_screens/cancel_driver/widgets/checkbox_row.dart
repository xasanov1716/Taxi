import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/widgets/checkbox.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class CancelDriverCheckBoxRow extends StatefulWidget {
  const CancelDriverCheckBoxRow({super.key, required this.text});
  final String text;

  @override
  State<CancelDriverCheckBoxRow> createState() => _CancelDriverCheckBoxRowState();
}

class _CancelDriverCheckBoxRowState extends State<CancelDriverCheckBoxRow> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Ink(
          child: InkWell(
            onTap: (){
              setState(() {
                isChecked=!isChecked;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
              child: Row(
                children: [
                  CustomCheckbox(
                    isChecked: isChecked,
                    onChanged: (value) {
                      setState(
                            () {
                          isChecked = value;
                        },
                      );
                    },
                  ),
                  24.pw,
                  Text(widget.text,style: AppTextStyle.bodyXlargeSemibold,overflow: TextOverflow.ellipsis,)
                ],
              ),
            ),
          ),
        ),
        8.ph
      ],
    );
  }
}
