import 'package:ekraft/utils/theme.dart';
import 'package:flutter/material.dart';

class StoreTabs extends StatelessWidget {
  const StoreTabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TabBar(
        isScrollable: true,
        tabs: const [
          Tab(text: 'All Shoes'),
          Tab(text: 'New Arrivals'),
          Tab(text: 'Best Sellers'),
          Tab(text: 'Running'),
          Tab(text: 'Jordan'),
          Tab(text: 'Casual'),
        ],
        indicator: BoxDecoration(
          color: StoreTheme.primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        labelColor: StoreTheme.white,
        unselectedLabelColor: StoreTheme.black,
      ),
    );
  }
}
