import 'package:breaking_bad_app/features/breaking_bad_api_call/data/data_sources/local/web_series_list.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/presentation/widgets/series_home_page_view.dart';
import 'package:flutter/material.dart';

import '../widgets/dot_indicator_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            padding: const EdgeInsets.all(14),
            indicator: const DotIndicator(),
            tabs: const [
              Tab(text: 'Breaking Bad'),
              Tab(text: 'Better Call Soul'),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SeriesHomePageView(webSeriesModel: webSeriesList[0]),
                SeriesHomePageView(webSeriesModel: webSeriesList[1])
              ],
            ),
          ),
        ],
      )),
    );
  }
}
