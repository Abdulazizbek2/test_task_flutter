import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FeaturedCard extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final Function()? onPressed;
  const FeaturedCard(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? "",
      imageBuilder: (context, imageProvider) => GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.only(left: 28, right: 28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 20,
                offset: const Offset(4, 4),
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: imageProvider,
            ),
          ),
          child: Container(
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 20, right: 40, bottom: 40),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                title ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'SF Pro Display',
                    height: 1.2,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )),
        ),
      ),
      placeholder: (context, url) => const SizedBox(
          width: double.infinity,
          height: 300,
          child: Center(child: CircularProgressIndicator.adaptive())),
      errorWidget: (context, url, error) => const SizedBox(
        width: double.infinity,
        height: 300,
        child: Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}

//create me image page with sliver

// Path: lib/screen/home/widgets/latest_card.dart
// Compare this snippet from lib/screen/home/view/home_screen.dart:
//           child: BlocBuilder<NewsBloc, NewsState>(
//             builder: (context, state) {
//               if (state.featureArticleList == null ||
//                   state.latestArticleList == null) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               final featureList = state.featureArticleList;
//               final latestList = state.latestArticleList;
//               return CustomScrollView(
//                 slivers: [
//                   SliverAppBar(
//                     backgroundColor: theme.primaryColor,
//                     title: const Text('Notifications',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w400,
//                         )),
//                     leading: IconButton(
//                       icon: const Icon(Icons.arrow_back_ios),
//                       onPressed: () {},
//                     ),
//                     actions: [
//                       TextButton(
//                         child: const Text(
//                           'Mark all read',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                   const SliverToBoxAdapter(child: SizedBox(height: 30)),
//                   const SliverToBoxAdapter(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 28),
//                       child: Text(
//                         "Featured",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w400),
//                       ),
//                     ),
//                   ),
//                   const SliverToBoxAdapter(child: SizedBox(height: 20)),
//                   SliverToBoxAdapter(
//                     child: SizedBox(
//                       height: 300,
//                       child: PageView.builder(
//                         controller: _pageController,
//                         itemCount: featureList.length,
//                         itemBuilder: (context, index) {
//                           return FeaturedCard(
//                             title: featureList[index].title,
//                             imageUrl: featureList[index].imageUrl,
//                             onPressed: () {
//                               Navigator.pushNamed(
//                                   context, AppRoutes.newsDetail,
//                                   arguments: featureList[index]);
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   const SliverToBoxAdapter(child: SizedBox(height: 30)),
//                   const SliverToBoxAdapter(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 28),
//                       child: Text(
//                         "Latest",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w400),
//                       ),
//                     ),
//                   ),
//                   const SliverToBoxAdapter(child: SizedBox(height: 20)),
//                   SliverList(
//                     delegate: SliverChildBuilderDelegate(
//                       (_, int index) {
//                         return LatestCard(
//                           title: latestList[index].title,
//                           imageUrl: latestList[index].imageUrl,
//                           onPressed: () {
//                             Navigator.pushNamed(
//                                 context, AppRoutes.newsDetail,
//                                 arguments: latestList[index]);
//                           },
//                         );
//                       },
//                       childCount: latestList.length,
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
// Compare this snippet from lib/screen/home/widgets/featured_card.dart:
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// class FeaturedCard extends StatelessWidget {
//   final String? title;
//   final String? imageUrl;
//   final Function()? onPressed;
//   const FeaturedCard(
//       {super.key,
//       required this.title,
//       required this.imageUrl,
//       required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: imageUrl ?? "",
//       imageBuilder: (context, imageProvider) => GestureDetector(
//         onTap: onPressed,
//         child: Container(
//           margin: const EdgeInsets.only(left: 28, right: 28),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.25),
//                 blurRadius: 20,
//                 offset: const Offset(4, 4),
//               ),
//             ],
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: imageProvider,
//             ),
//           ),
//           child: Container(
//               width: double.infinity,
//               alignment: Alignment.bottomLeft,
//               padding: const EdgeInsets.only(left: 20, right: 40, bottom: 40),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.7),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Text(
//                 title ?? "",
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                     fontSize: 28,
//                     height: 1.2,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.white),
//               )),
//         ),
//       ),
//       placeholder: (context, url) => const SizedBox(
//           width: double.infinity,
//           height: 300,
//           child: Center(child: CircularProgressIndicator.adaptive())),
//       errorWidget: (context, url, error) => const SizedBox(
//         width: double.infinity,
//         height: 300,
//         child: Center(
//           child: Icon(Icons.error),
//         ),
//       ),
//     );
//   }
// }
