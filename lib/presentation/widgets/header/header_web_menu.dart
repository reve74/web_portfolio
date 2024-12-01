// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:web_portfolio/app/style/app_text_style.dart';
//
// class HeaderWebMenu extends StatelessWidget {
//   const HeaderWebMenu({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       color: Colors.greenAccent,
//       child: Row(
//         // mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               menuItems(
//                 title: "Github",
//                 onTap: () {
//                   const githubUrl = 'https://github.com/reve74';
//                   _launchURL(githubUrl);
//                 },
//               ),
//               menuItems(
//                   title: "LinkedIn",
//                   onTap: () {
//                     const linkedInUrl =
//                         'https://www.linkedin.com/in/junho-yoon-43834b254/';
//                     _launchURL(linkedInUrl);
//                   }),
//             ],
//           ),
//           Row(
//             children: [
//               Text('Skills'),
//               Text('Carrer'),
//               Text('Portfolio'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _launchURL(String url) async {
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url));
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   Widget menuItems({required String title, required Function() onTap}) {
//     return Builder(
//       builder: (context) {
//         return Container(
//           height: 30,
//           padding: const EdgeInsets.only(right: 20),
//           child: InkWell(
//             onTap: onTap,
//             child: Text(
//               title,
//               style: AppTextStyle.title1.copyWith(
//                 color: Colors.black,
//                 decoration: TextDecoration.underline,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
