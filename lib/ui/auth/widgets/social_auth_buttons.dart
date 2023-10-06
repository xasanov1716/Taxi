import 'package:flutter/widgets.dart';
import 'package:taxi_app/ui/auth/widgets/custom_auth_social_network_button.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomAuthButton(imageUrl: AppIcons.facebook, onTap: () {}),
        20.pw,
        CustomAuthButton(imageUrl: AppIcons.google, onTap: () {}),
        20.pw,
        CustomAuthButton(imageUrl: AppIcons.apple, onTap: () {}),
      ],
    );
  }
}
