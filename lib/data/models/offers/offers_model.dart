class OffersModel {
  final String title;
  final String subtitle;
  final String description="1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n2. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n3. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n4. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.";
  final String icon;
  final String promoCode;

  OffersModel({
    required this.title,
    required this.icon,
    required this.promoCode,
    required this.subtitle,
  });
}
