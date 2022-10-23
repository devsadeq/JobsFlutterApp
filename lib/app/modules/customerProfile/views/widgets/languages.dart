import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../widgets/custom_info_card.dart';
import 'wrapped_chips.dart';

class Languages extends StatelessWidget {
  const Languages({
    Key? key,
    required this.languages,
  }) : super(key: key);
  final List<String>? languages;

  @override
  Widget build(BuildContext context) {
    final List<String> shortLanguages = List.from(languages!);
    if (languages!.length > 4) {
      shortLanguages.removeRange(4, languages!.length);
      shortLanguages.add('+${languages!.length - shortLanguages.length} more');
    }
    return languages == null
        ? const SizedBox()
        : CustomInfoCard(
            icon: HeroIcons.userCircle,
            title: "Languages",
            body: ExpandableNotifier(
              child: Expandable(
                collapsed: ExpandableButton(
                  child: WrappedChips(list: shortLanguages),
                ),
                expanded: ExpandableButton(
                  child: WrappedChips(list: languages!),
                ),
              ),
            ),
          );
  }
}
