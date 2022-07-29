import 'package:flutter/material.dart';
import 'package:ekraft/utils/theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        hintText: "Search...",
        hintStyle: const TextStyle(
          color: StoreTheme.black,
        ),
        suffixIcon: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 20,
                width: 2,
                color: Colors.black26,
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(
                Icons.search,
                color: StoreTheme.black,
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
