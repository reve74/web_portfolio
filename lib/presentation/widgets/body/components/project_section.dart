import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:web_portfolio/app/style/app_text_style.dart';

import '../../../../data/project_model.dart';
import '../widgets/title_widget.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

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
        const TitleWidget('Projects'),
        const Gap(30),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return _projectCard(
              title: projects[index].title,
              imagePath: projects[index].imagePath,
              subtitle: projects[index].subtitle,
            );
            // return SizedBox(
            //   height: 300,
            //   child: _projectCard(title: '너랑 나 - 커플 디데이'),
            // );
          },
        ),
      ],
    );
  }

  Widget _projectCard({
    required String title,
    required String imagePath,
    required String subtitle,
  }) {
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
              // 'assets/images/uandi.png',
              imagePath,
              height: 200,
              width: 500,
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
                  style: AppTextStyle.title2.copyWith(color: Colors.white),
                ),
                const Gap(5),
                Text(
                  subtitle,
                  style: AppTextStyle.body2.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
