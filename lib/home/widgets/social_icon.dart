import 'package:flutter/material.dart';
import 'package:web/utils/utils.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    super.key,
    required this.icon,
    required this.url,
  });

  final Widget icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: () => openUrl(url),
    );
  }
}
