import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:web_portfolio/presentation/widgets/body/components/career_card.dart';

import '../../../app/style/app_text_style.dart';
import '../../../core/constants.dart';

enum StoreName { appStore, playStore }

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(200),
            _profile(),
            const Gap(200),
            _career(),
            const Gap(500),
          ],
        ),
      ),
    );
  }

  Widget _profile() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: AppTextStyle.highlightDeskTop
                .copyWith(color: Colors.grey.shade700),
          ),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/me.jpg"),
                minRadius: 80,
              ),
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      contactIcon(
                        iconData: FontAwesomeIcons.solidEnvelope,
                        url: "reve99@naver.com",
                        tooltip: "Email",
                      ),
                      contactIcon(
                        iconData: FontAwesomeIcons.github,
                        url: "https://github.com/reve74",
                        tooltip: "GitHub profile",
                      ),
                      contactIcon(
                        iconData: FontAwesomeIcons.linkedinIn,
                        url: Constants.linkedInUrl,
                        tooltip: "LinkedIn profile",
                      ),
                    ],
                  ),
                  Text(
                    '안녕하세요, 플러터 개발자 윤준호 입니다.',
                    style: AppTextStyle.headline1Bold,
                  ),
                  const Gap(5),
                  Text(
                    '사용자 경험을 최우선으로 여기며 클린 아키텍쳐를 지향하는 개발자입니다.',
                    style: AppTextStyle.headline1SemiBold,
                  ),
                ],
              )
            ],
          ),
        ],
      );
    });
  }

  Widget _career() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Career',
              style: AppTextStyle.highlightDeskTop
                  .copyWith(color: Colors.grey.shade700),
            ),
            const Gap(30),
            CareerCard(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: 1,
                color: Colors.grey.shade300,
              ),
            ),
            CareerCard(
              company: '리빌더에이아이 – (2022.11 - 2023.12)',
              title: '• VRIN-3D 월드 앱  개발 및 유지보수',
              subtitle: '- 3D 모델 생성 앱 개발',
              details: '• 메소드 채널 및 이벤트 채널로 iOS 카메라 통신 연결\n'
                  '• riverpod 상태관리 사용\n'
                  '• mvvm 아키텍쳐 사용\n'
                  '• Github actions 를 - 애플 및 구글 스토어에서 테스트 결제 구현\n',
              playStoreUrl: Constants.vrinPlayStoreUrl,
            )
          ],
        ),
      ),
    );
  }

  Widget contactIcon({
    required IconData iconData,
    required String url,
    required String tooltip,
  }) {
    return IconButton(
      onPressed: () {
        launchUrlString(url);
      },
      tooltip: tooltip,
      icon: FaIcon(
        iconData,
        size: Constants.faIconSizeLarge,
      ),
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
