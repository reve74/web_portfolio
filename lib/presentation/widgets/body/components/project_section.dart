import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:web_portfolio/app/style/app_text_style.dart';

import '../../../../core/enums/screen_type_enum.dart';
import '../../../../data/project_model.dart';
import '../widgets/title_widget.dart';

class ProjectSection extends StatelessWidget {
  final ScreenType type;

  const ProjectSection(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    List<ProjectModel> projects = [
      ProjectModel(
        title: '포트폴리오 웹사이트',
        subtitle: '포트폴리오를 정리한 웹사이트',
        imagePath: 'assets/images/web_portfolio.png',
      ),
      ProjectModel(
        title: 'Pokedex',
        imagePath: 'assets/images/pokedex.png',
        subtitle: '포켓몬 api를 활용한 iOS 앱',
      ),
      ProjectModel(
        title: '너랑나 - 커플 디데이',
        imagePath: 'assets/images/uandi.png',
        subtitle: '커플 디데이, 커플 기념일 및 다이어리 관리',
      ),
      ProjectModel(
        title: '모리- 모두의 영화 리뷰',
        imagePath: 'assets/images/mori.png',
        subtitle: 'TMDB api를 이용한 영화 리뷰앱',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(title: 'Projects', type: type),
        const Gap(30),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: type == ScreenType.mobile ? 5 : 10,
            mainAxisSpacing: type == ScreenType.mobile ? 5 : 10,
            childAspectRatio:  type == ScreenType.mobile ? 1.3 : 1.5,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return _projectCard(
              title: projects[index].title,
              imagePath: projects[index].imagePath,
              subtitle: projects[index].subtitle,
              type: type,
            );
          },
        ),
      ],
    );
  }

  Widget _projectCard({
    required String title,
    required String imagePath,
    required String subtitle,
    required ScreenType type,
  }) {
    final TextStyle titleTextStyle;
    final TextStyle subTitleTextStyle;

    if (type == ScreenType.desktop) {
      titleTextStyle = AppTextStyle.title2DeskTop.copyWith(color: Colors.white);
      subTitleTextStyle =
          AppTextStyle.body2DeskTop.copyWith(color: Colors.white);
    } else {
      titleTextStyle = AppTextStyle.title2Mobile.copyWith(color: Colors.white);
      subTitleTextStyle =
          AppTextStyle.body2Mobile.copyWith(color: Colors.white);
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade800,
        border: Border.all(
            color: Colors.grey, strokeAlign: BorderSide.strokeAlignInside),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(9),
              topRight: Radius.circular(9),
            ),
            child: Image.asset(
              imagePath,
              height: type == ScreenType.mobile ? 100 : 200,
              width: type == ScreenType.mobile ? 250 : 500,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: titleTextStyle,
                ),
                const Gap(5),
                Text(
                  subtitle,
                  style: subTitleTextStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
