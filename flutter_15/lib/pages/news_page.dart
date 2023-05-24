import 'package:flutter/material.dart';
import 'package:newsapp_lite/utils/remote_repository.dart';

import 'package:newsapp_lite/widgets/news_builder.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin {
  RemoteRepository remoteRepository = RemoteRepository();
  int titleIndex = 0;
  int _bottomIndex = 0;


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        // tab controller set up
        final tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // allows to change appbar title
            setState(() {
              titleIndex = tabController.index;
            });
          }
        });
        return Scaffold(
          appBar: AppBar(
            title: Center(
              // appbar title changing depence on tabbar and bottom bar index
              child: _bottomIndex == 0
                  ? Text([
                      'Everything',
                      'Top Headlines',
                    ][tabController.index])
                  : const Text('Закладки'),
            ),

            // tab icons
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.list),
              ),
              Tab(
                icon: Icon(Icons.list_sharp),
              )
            ]),
          ),
          // page content dapends on bottom index
          body: _bottomIndex == 0
              // news page
              ? TabBarView(
                  children: [
                    // this page shows news from v2/everything endpoint
                    Tab(
                        child: NewsBuilder(
                            future: remoteRepository
                                .getArticlesFromEverything('Steam'))),
                    // this page shows news from v2/top-headlines endpoint
                    Tab(
                        child: NewsBuilder(
                            future: remoteRepository
                                .getArticlesFromTopHeadliners('Steam'))),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _bottomIndex,
            onTap: (value) {
              setState(() {
                _bottomIndex = _bottomIndex == 0 ? 1 : 0;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper), label: 'Новости'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border), label: 'Закладки'),
            ],
          ),
        );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
