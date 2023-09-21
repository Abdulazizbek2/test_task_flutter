import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_flutter/application/home/news_bloc.dart';
import 'package:test_task_flutter/repositories/news/repository.dart';
import 'package:test_task_flutter/screen/home/widgets/latest_card.dart';

import '../../../route/app_route.dart';
import '../widgets/featured_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.primaryColor,
        body: BlocProvider(
          create: (context) => NewsBloc(MockNewsRepository())
            ..add(const NewsEvent.getFeaturedArticles())
            ..add(const NewsEvent.getLatestArticles()),
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state.featureArticleList == null ||
                  state.latestArticleList == null) {
                return const Center(child: CircularProgressIndicator());
              }
              final featureList = state.featureArticleList;
              final latestList = state.latestArticleList;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: theme.primaryColor,
                    title: const Text('Notifications',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SF Pro Display',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        )),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {},
                    ),
                    actions: [
                      TextButton(
                        child: const Text(
                          'Mark all read',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () {
                          context
                              .read<NewsBloc>()
                              .add(const NewsEvent.allReaded());
                        },
                      ),
                    ],
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 30)),
                  const SliverToBoxAdapter(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      "Featured",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400),
                    ),
                  )),
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 300,
                      child: PageView.builder(
                        clipBehavior: Clip.hardEdge,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.featureArticleList?.length ?? 2,
                        itemBuilder: (context, index) {
                          return FeaturedCard(
                            title: featureList?[index].title ?? "",
                            imageUrl: featureList?[index].imageUrl ?? "",
                            onPressed: () {
                              context.read<NewsBloc>().add(NewsEvent.readed(
                                  latestList?[index].id ?? ""));
                              Navigator.of(context).push(AppRoutes.news(context,
                                  id: featureList?[index].id ?? ""));
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 30)),
                  const SliverToBoxAdapter(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      "Latest news",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400),
                    ),
                  )),
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return LatestCard(
                          isReaded: latestList?[index].readed ?? false,
                          date: latestList?[index].publicationDate,
                          title: latestList?[index].title ?? "",
                          imageUrl: latestList?[index].imageUrl ?? "",
                          onPressed: () {
                            context.read<NewsBloc>().add(
                                NewsEvent.readed(latestList?[index].id ?? ""));
                            Navigator.of(context).push(AppRoutes.news(context,
                                id: latestList?[index].id ?? ""));
                          },
                        );
                      },
                      childCount: latestList?.length ?? 2,
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
