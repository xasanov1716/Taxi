import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/driver_bloc/driver_bloc.dart';
import 'package:taxi_app/data/models/driver/driver_fields.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_driver/widgets/car_number_textfield.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class CarNumberContainer extends StatefulWidget {
  @override
  State<CarNumberContainer> createState() => _CarNumberContainerState();

  CarNumberContainer({super.key, required this.isFromAuth});

  final bool isFromAuth;
}

class _CarNumberContainerState extends State<CarNumberContainer> {
  final FocusNode _firstFocusNode = FocusNode();
  final TextEditingController _firstController = TextEditingController();
  final FocusNode _secondFocusNode = FocusNode();
  final TextEditingController _secondController = TextEditingController();
  final FocusNode _thirdFocusNode = FocusNode();
  final TextEditingController _thirdController = TextEditingController();
  final FocusNode _fourthFocusNode = FocusNode();
  final TextEditingController _fourthController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers and focus nodes when the widget is disposed.
    _firstController.dispose();
    _firstFocusNode.dispose();
    _secondController.dispose();
    _secondFocusNode.dispose();
    _thirdController.dispose();
    _thirdFocusNode.dispose();
    _fourthController.dispose();
    _fourthFocusNode.dispose();
    super.dispose();
  }

  _init() {
    String carNumberInitial = context.read<DriverBloc>().state.driverModel.carNumber;
    if (carNumberInitial.length > 10) {
      _firstController.text = carNumberInitial.substring(0, 2);
      _secondController.text = carNumberInitial.substring(2, 4);
      _thirdController.text = carNumberInitial.substring(4, 8);
      _fourthController.text = carNumberInitial.substring(8, 11);
    }
  }

  @override
  void initState() {
    if (!widget.isFromAuth) _init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 4, color: AppColors.dark3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.dark3,
            ),
          ),
          CarNumberTextField(
            textInputType: TextInputType.number,
            hintText: "00",
            maxLength: 2,
            inputFormatter: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            width: 65.w,
            focusNode: _firstFocusNode,
            controller: _firstController,
            nextFocusNode: _secondFocusNode,
          ),
          CarNumberTextField(
            textInputType: TextInputType.text,
            hintText: "A",
            maxLength: 1,
            inputFormatter: [
              FilteringTextInputFormatter.allow(
                RegExp(r'[a-zA-Z]'),
              ),
              UppercaseTextInputFormatter(),
            ],
            width: 50.w,
            focusNode: _secondFocusNode,
            controller: _secondController,
            nextFocusNode: _thirdFocusNode,
            previousFocusNode: _firstFocusNode,
          ),
          CarNumberTextField(
            textInputType: TextInputType.number,
            hintText: "123",
            maxLength: 3,
            inputFormatter: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            width: 100.w,
            focusNode: _thirdFocusNode,
            controller: _thirdController,
            nextFocusNode: _fourthFocusNode,
            previousFocusNode: _secondFocusNode,
          ),
          CarNumberTextField(
            textInputType: TextInputType.text,
            valueChanged: (value) {
              context.read<DriverBloc>().updateDriverField(
                  fieldKey: DriverFieldKeys.carNumber,
                  value:
                      "${_firstController.text} ${_secondController.text} ${_thirdController.text} $value");
            },
            hintText: "NN",
            maxLength: 2,
            inputFormatter: [
              FilteringTextInputFormatter.allow(
                RegExp(r'[a-zA-Z]'),
              ),
              UppercaseTextInputFormatter(),
            ],
            width: 80.w,
            focusNode: _fourthFocusNode,
            controller: _fourthController,
            previousFocusNode: _thirdFocusNode,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30.w,
                height: 30.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppIcons.uzbFlagCarNumber),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: 6.w,
                height: 6.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.dark3,
                ),
              ),
              const Text(
                'UZ',
                style: TextStyle(
                  color: Color(0xFF3368CF),
                  fontSize: 22,
                  fontFamily: 'Chakra',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
