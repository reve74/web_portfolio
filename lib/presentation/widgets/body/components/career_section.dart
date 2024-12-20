import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../app/style/app_text_style.dart';
import '../../../../core/constants.dart';
import '../../../../core/enums/screen_type_enum.dart';
import '../../../../core/enums/store_name_enum.dart';
import '../widgets/title_widget.dart';

class CareerSection extends StatelessWidget {
  final ScreenType type;

  const CareerSection(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(title: 'Career', type: type),
          const Gap(30),
          CareerCard(
            type: type,
            company: '아파트멘터리 – (2024.04 - 2024. 09)',
            title: '• 마이피치 앱 개발 및 유지보수',
            subtitle: '- 아파트멘터리의 현장 상담과 시공과정을 데이터화 한 앱 개발 및 운영',
            details: '• riverpod 클린 아키텍쳐 사용\n'
                '• riverpod 을 사용해 의존성 주입\n'
                '• 센드버드 sdk를 사용해 채팅 구현\n'
                '• Github actions 를 이용한 ci/cd 구축\n'
                '• flavor를 이용한 개발/프로덕션 앱 분리\n'
                '• 데이터 분석을 위해 amplitude sdk 사용\n'
                '• 디자인 시스템을 적용해 위젯 컴포넌트 모듈화 진행\n',
            appStoreUrl: Constants.mypeachAppStoreUrl,
            playStoreUrl: Constants.mypeachPlayStoreUrl,
            iconName: Constants.mypeachIconPath,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
          ),
          CareerCard(
            type: type,
            company: '리빌더에이아이 – (2022.11 - 2023.12)',
            title: '• VRIN-3D 월드 앱  개발 및 유지보수',
            subtitle: '- 3D 모델 생성 앱 개발',
            details: '• 메소드 채널 및 이벤트 채널로 iOS 카메라 통신 연결\n'
                '• riverpod 상태관리 사용\n'
                '• mvvm 아키텍쳐 사용\n'
                '• Github actions 를 - 애플 및 구글 스토어에서 테스트 결제 구현\n',
            playStoreUrl: Constants.vrinPlayStoreUrl,
            iconName: Constants.vrinIconPath,
          )
        ],
      ),
    );
  }
}

class CareerCard extends StatelessWidget {
  final String company;
  final String title;
  final String subtitle;
  final String details;
  final String iconName;
  final String? appStoreUrl;
  final String? playStoreUrl;
  final ScreenType type;

  const CareerCard({
    required this.company,
    required this.title,
    required this.subtitle,
    required this.details,
    required this.iconName,
    required this.type,
    this.appStoreUrl,
    this.playStoreUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle companyTextStyle;
    final TextStyle titleTextStyle;

    if (type == ScreenType.desktop) {
      companyTextStyle = AppTextStyle.headline1BoldDeskTop.copyWith(
        color: Colors.grey.shade900,
      );
    } else {
      companyTextStyle = AppTextStyle.headline1BoldMobile.copyWith(
        color: Colors.grey.shade900,
      );
    }

    if (type == ScreenType.desktop) {
      titleTextStyle = AppTextStyle.headline2DeskTop.copyWith(
        color: Colors.black,
      );
    } else {
      titleTextStyle = AppTextStyle.headline2Mobile.copyWith(
        color: Colors.black,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          company,
          style: companyTextStyle,
        ),
        const Gap(20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: type == ScreenType.mobile ? 60 : 80,
              child: Image.asset(iconName),
            ),
            Gap(type == ScreenType.mobile ? 15 : 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleTextStyle,
                  ),
                  Text(
                    subtitle,
                    style: titleTextStyle,
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
              ),
            ),
          ],
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
