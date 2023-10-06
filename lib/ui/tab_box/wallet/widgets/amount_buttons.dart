import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class AmountButtons extends StatefulWidget {
  const AmountButtons({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<AmountButtons> createState() => _AmountButtonsState();
}

class _AmountButtonsState extends State<AmountButtons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.5,
          mainAxisSpacing: 24.h,
          crossAxisSpacing: 16.h,
        ),
        children: List.generate(
          9,
          (index) => InkWell(
            onTap: () {
              setState(() {
                widget.controller.text = "\$${amounts[index]}";
              });
            },
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100.r),
                  border: Border.all(color: AppColors.primary, width: 2.w)),
              child: Center(
                child: Text("\$${amounts[index]}",
                    style:
                        Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.primary)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> amounts = ["10", "20", "50", "100", "200", "250", "500", "750", "1,000"];
