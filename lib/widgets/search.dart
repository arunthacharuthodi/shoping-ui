import 'package:flutter/material.dart';
import 'package:ekraft/utils/theme.dart';
import 'package:ekraft/widgets/field.dart';

class StoreSearch extends StatelessWidget {
  const StoreSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: StoreTheme.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const SearchField(),
    );
  }
}
