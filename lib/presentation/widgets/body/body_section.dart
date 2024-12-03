import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:web_portfolio/presentation/widgets/body/components/project_section.dart';

import '../../../app/style/app_text_style.dart';
import '../../../core/constants.dart';
import 'components/career_section.dart';
import 'widgets/title_widget.dart';

enum StoreName { appStore, playStore }

final GlobalKey profileKey = GlobalKey();
final GlobalKey careerKey = GlobalKey();
final GlobalKey projectKey = GlobalKey();

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => _body(),
      tablet: (_) => _body(),
      mobile: (_) => _body(),
    );
  }

  Widget _body() {


    return Builder(builder: (context) {
      return Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 1000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(200),
              Container(key: profileKey, child: _profile()),
              const Gap(200),
              Container(key: careerKey, child: const CareerSection()),
              const Gap(200),
              Container(key: projectKey, child: const ProjectSection()),
              const Gap(500),
            ],
          ),
        ),
      );
    });
  }

  Widget _profile() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWidget('About Me'),
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
