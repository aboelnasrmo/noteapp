import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'item_list.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(),
          SizedBox(
            height: 10,
          ),
          Expanded(child: ItemList()),
        ],
      ),
    );
  }
}
