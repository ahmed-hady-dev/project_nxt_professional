import 'package:flutter/material.dart';

class CustomSolidTabBar extends StatefulWidget {
  const CustomSolidTabBar({Key? key, required this.tabTitleList, required this.tabViewList}) : super(key: key);
  final List<Tab> tabTitleList;
  final List<Widget> tabViewList;
  @override
  State<CustomSolidTabBar> createState() => _CustomSolidTabBarState();
}

class _CustomSolidTabBarState extends State<CustomSolidTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: widget.tabTitleList.length, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.black,
          child: TabBar(
            tabs: widget.tabTitleList,
            controller: _tabController,
            indicator: const BoxDecoration(color: Colors.transparent),
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: widget.tabViewList,
          ),
        )
      ],
    );
  }
}
