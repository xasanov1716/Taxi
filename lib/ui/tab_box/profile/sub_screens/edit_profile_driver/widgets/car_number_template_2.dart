import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/driver_bloc/driver_bloc.dart';
import 'package:taxi_app/data/models/driver/driver_fields.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_driver/widgets/car_number_textfield.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class CarNumberContainer2 extends StatefulWidget {

  @override

  State<CarNumberContainer2> createState() => _CarNumberContainer2State();
  const CarNumberContainer2({super.key, required this.isFromAuth, });
  final bool isFromAuth;
}

class _CarNumberContainer2State extends State<CarNumberContainer2> {
  final FocusNode _firstFocusNode = FocusNode();
  final TextEditingController _firstController = TextEditingController();
  final FocusNode _secondFocusNode = FocusNode();
  final TextEditingController _secondController = TextEditingController();
  final FocusNode _thirdFocusNode = FocusNode();
  final TextEditingController _thirdController = TextEditingController();

_init(){
  String carNumberInitial = context.read<DriverBloc>().state.driverModel.carNumber;

  _firstController.text=carNumberInitial.substring(0,2);
  _secondController.text=carNumberInitial.substring(3,6);
  _thirdController.text=carNumberInitial.substring(7,10);
}
@override
  void initState() {
  if (!widget.isFromAuth)_init();
  }
  @override
  void dispose() {
    // Dispose of the controllers and focus nodes when the widget is disposed.
    _firstController.dispose();
    _firstFocusNode.dispose();
    _secondController.dispose();
    _secondFocusNode.dispose();
    _thirdController.dispose();
    _thirdFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: getTheme(context)? AppColors.dark1:AppColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 4, color:getTheme(context)? AppColors.c_500:AppColors.dark3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: getTheme(context)? AppColors.c_500:AppColors.dark3,
            ),
          ),
          CarNumberTextField(
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
            hintText: "123",
            maxLength: 3,
            inputFormatter: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            width: 90.w,
            focusNode: _secondFocusNode,
            controller: _secondController,
            nextFocusNode: _thirdFocusNode,
            previousFocusNode: _firstFocusNode,
          ),
          CarNumberTextField(
            valueChanged: (value) {
              context.read<DriverBloc>().updateDriverField(
                  fieldKey: DriverFieldKeys.carNumber,
                  value:
                      "${_firstController.text} ${_secondController.text} $value");
            },
            hintText: "ABC",
            maxLength: 3,
            inputFormatter: [
              FilteringTextInputFormatter.allow(
                RegExp(r'[a-zA-Z]'),
              ),
              UppercaseTextInputFormatter(),
            ],
            width: 100.w,
            focusNode: _thirdFocusNode,
            controller: _thirdController,
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
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: getTheme(context)? AppColors.c_500:AppColors.dark3,
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
