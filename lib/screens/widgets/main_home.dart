import 'package:ekraft/widgets/items_grid.dart';
import 'package:ekraft/widgets/search.dart';
import 'package:flutter/material.dart';

class ActualHome extends StatelessWidget {
  const ActualHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        StoreSearch(),
        SizedBox(
          height: 10,
        ),
        ItemsGridView(),
      ],
    );
  }
}
