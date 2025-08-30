class ProfileOptionModel {
  final String title;
  final String icon;
  final bool? isDeleteAccountOption;
  final bool? isNotificationOption;

  const ProfileOptionModel({
    required this.title,
    required this.icon,
    this.isDeleteAccountOption = false,
    this.isNotificationOption = false,
  });
}
