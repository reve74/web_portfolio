import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../app/style/app_text_style.dart';
import '../../../../core/constants.dart';
import '../body_section.dart';

class CareerCard extends StatelessWidget {
  final String company;
  final String title;
  final String subtitle;
  final String details;
  final String? appStoreUrl;
  final String? playStoreUrl;

  const CareerCard({
    required this.company,
    required this.title,
    required this.subtitle,
    required this.details,
    this.appStoreUrl,
    this.playStoreUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          company,
          style: AppTextStyle.headline1Bold.copyWith(
            color: Colors.grey.shade900,
          ),
        ),
        const Gap(20),
        Text(
          title,
          style: AppTextStyle.headline2.copyWith(color: Colors.black),
        ),
        Text(
          subtitle,
          style: AppTextStyle.headline2.copyWith(color: Colors.black),
        ),
        Row(
          children: [
            if (appStoreUrl != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: storeLinkButton(
                  store: StoreName.appStore,
                  storeUrl: Constants.mypeachAppStoreUrl,
                ),
              ),
            if (playStoreUrl != null)
              storeLinkButton(
                store: StoreName.playStore,
                storeUrl: Constants.mypeachPlayStoreUrl,
              ),
          ],
        ),
        const Gap(20),
        Text(
          details,
          style: AppTextStyle.headline3.copyWith(color: Colors.black),
        ),
      ],
    );
  }

  Widget storeLinkButton({
    required StoreName store,
    required String storeUrl,
  }) {
    return TextButton(
      onPressed: () => launchUrlString(storeUrl),
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      child: Text(
        store == StoreName.appStore ? '(앱스토어 링크)' : '(플레이스토어 링크)',
        style: AppTextStyle.headline3.copyWith(color: Colors.grey.shade500),
      ),
    );
  }
}
