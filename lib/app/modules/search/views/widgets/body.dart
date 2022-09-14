import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'package:jobs_flutter_app/app/modules/search/views/widgets/search_bar.dart';
import 'package:jobs_flutter_app/app/modules/search/views/widgets/search_items.dart';




class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          searchbar(),
          searchItems()
        ],
    );
  }
}
