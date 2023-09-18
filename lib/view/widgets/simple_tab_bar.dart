import 'package:flutter/material.dart';

// class SimpleTabBar extends StatefulWidget {
//   const SimpleTabBar({super.key});

//   @override
//   State<SimpleTabBar> createState() => _SimpleTabBarState();
// }

// class _SimpleTabBarState extends State<SimpleTabBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
class SimpleTabBar extends StatefulWidget {
  final tabLength;
  final List<Widget> tab;
  final List<Widget> children;
  const SimpleTabBar(
      {required this.tabLength,
      required this.tab,
      required this.children,
      super.key});

  @override
  State<SimpleTabBar> createState() => _SimpleTabBarState();
}

class _SimpleTabBarState extends State<SimpleTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.tabLength, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Color.fromRGBO(224, 243, 246, 1),
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            child: TabBar(
                controller: _tabController,
                padding: EdgeInsets.all(5),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  shape: BoxShape.rectangle,
                  color: Color.fromRGBO(0, 159, 183, 1),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Color.fromRGBO(0, 159, 183, 1),
                tabs: widget.tab),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController, children: widget.children),
          ),
        ],
      ),
    );
  }
}
