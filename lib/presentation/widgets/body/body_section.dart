import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:web_portfolio/presentation/widgets/body/components/project_section.dart';

import '../../../app/style/app_text_style.dart';
import '../../../core/constants.dart';
import '../../../core/enums/screen_type_enum.dart';
import '../../../core/enums/store_name_enum.dart';
import 'components/career_section.dart';
import 'widgets/title_widget.dart';

final GlobalKey profileKey = GlobalKey();
final GlobalKey careerKey = GlobalKey();
final GlobalKey projectKey = GlobalKey();

class BodySection extends StatelessWidget {
  final ScreenType type;

  const BodySection(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => _body(ScreenType.desktop),
      tablet: (_) => _body(ScreenType.desktop),
      mobile: (_) => _body(ScreenType.mobile),
    );
  }

  Widget _body(ScreenType type) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: type == ScreenType.desktop ? 1000 : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(200),
                Container(key: profileKey, child: _profile(type)),
                const Gap(200),
                Container(key: careerKey, child: CareerSection(type)),
                const Gap(200),
                Container(key: projectKey, child: ProjectSection(type)),
                const Gap(200),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _profile(ScreenType type) {
    return Builder(
      builder: (context) {
        if (type == ScreenType.desktop) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(title: 'About Me', type: type),
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
                            type: type,
                          ),
                          contactIcon(
                            iconData: FontAwesomeIcons.github,
                            url: "https://github.com/reve74",
                            tooltip: "GitHub profile",
                            type: type,
                          ),
                          contactIcon(
                            iconData: FontAwesomeIcons.linkedinIn,
                            url: Constants.linkedInUrl,
                            tooltip: "LinkedIn profile",
                            type: type,
                          ),
                        ],
                      ),
                      Text(
                        '안녕하세요, 플러터 개발자 윤준호 입니다.',
                        style: AppTextStyle.headline1BoldDeskTop,
                      ),
                      const Gap(5),
                      Text(
                        '사용자 경험을 최우선으로 여기며 클린 아키텍쳐를 지향하는 개발자입니다.',
                        style: AppTextStyle.headline1SemiBoldDeskTop,
                      ),
                    ],
                  )
                ],
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(title: 'About Me', type: type),
              const Gap(25),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/me.jpg"),
                    minRadius: 60,
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      contactIcon(
                        iconData: FontAwesomeIcons.solidEnvelope,
                        url: "reve99@naver.com",
                        tooltip: "Email",
                        type: type,
                      ),
                      contactIcon(
                        iconData: FontAwesomeIcons.github,
                        url: "https://github.com/reve74",
                        tooltip: "GitHub profile",
                        type: type,
                      ),
                      contactIcon(
                        iconData: FontAwesomeIcons.linkedinIn,
                        url: Constants.linkedInUrl,
                        tooltip: "LinkedIn profile",
                        type: type,
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '안녕하세요, 플러터 개발자 윤준호 입니다.',
                    style: AppTextStyle.headline1BoldMobile,
                  ),
                  const Gap(5),
                  Text(
                    '사용자 경험을 최우선으로 여기며 클린 아키텍쳐를 지향하는 개발자입니다.',
                    style: AppTextStyle.headline1SemiBoldMobile,
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }

  Widget contactIcon({
    required IconData iconData,
    required String url,
    required String tooltip,
    required ScreenType type,
  }) {
    return IconButton(
      onPressed: () {
        launchUrlString(url);
      },
      tooltip: tooltip,
      icon: FaIcon(
        iconData,
        size: type == ScreenType.mobile
            ? Constants.faIconSizeRegular
            : Constants.faIconSizeLarge,
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
