import 'package:flutter/material.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/constants/privacy_policy.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        centerTitle: false,
        onTap: () {
          Navigator.pop(context);
        },
        title: 'Privacy Policy',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                PrivacyPolicyConstants.first,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              24.ph,
              const Text(PrivacyPolicyConstants.firstData),
              24.ph,
              Text(PrivacyPolicyConstants.second,
                  style: Theme.of(context).textTheme.titleLarge),
              24.ph,
              const Text(PrivacyPolicyConstants.secondData),
              24.ph,
              Text(PrivacyPolicyConstants.third,
                  style: Theme.of(context).textTheme.titleLarge),
              24.ph,
              const Text(PrivacyPolicyConstants.thirdData),
            ],
          ),
        ),
      ),
    );
  }
}
