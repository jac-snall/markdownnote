import 'package:flutter/material.dart';

class SearchMenu extends StatelessWidget {
  const SearchMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Search',
          style: Theme.of(context).textTheme.headline6,
        ),
        const TextField(),
        const Text('Results'),
      ],
    );
  }
}
