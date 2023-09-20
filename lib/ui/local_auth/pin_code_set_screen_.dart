import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/local_auth/widgets/pin_put_first_set_page.dart';
import 'package:taxi_app/ui/local_auth/widgets/pin_put_second_page.dart';

class PinCodeSetScreen extends StatefulWidget {
  const PinCodeSetScreen({super.key});

  @override
  State<PinCodeSetScreen> createState() => _PinCodeSetScreenState();
}

class _PinCodeSetScreenState extends State<PinCodeSetScreen> {
  final TextEditingController codeController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Создать новый PIN-код",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 48.h),
          child: PageView(
            controller: _pageController,
            children: const [
              PageOne(),
              PageTwo(),
            ],
          ),
        ));
  }
}
//       onTap: () {
//         if (codeController.text.isNotEmpty) {
//           StorageRepository.putString('code', codeController.text);
//         }
//         Navigator.pushNamed(context, RouteNames.fingerprintScreen);
//       },