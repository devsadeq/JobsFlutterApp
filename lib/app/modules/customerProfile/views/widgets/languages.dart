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
    if (languages!.length > 6) {
      shortLanguages.removeRange(6, languages!.length);
      shortLanguages.add('+${languages!.length - shortLanguages.length} more');
    }
    return languages == null || languages!.isEmpty
        ? const SizedBox()
        : CustomInfoCard(
            icon: HeroIcons.language,
            title: "Languages",
            child: ExpandableNotifier(
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
