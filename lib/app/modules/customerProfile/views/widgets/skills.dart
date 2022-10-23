import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../widgets/custom_info_card.dart';
import 'wrapped_chips.dart';

class Skills extends StatelessWidget {
  const Skills({
    Key? key,
    required this.skills,
  }) : super(key: key);
  final List<String>? skills;

  @override
  Widget build(BuildContext context) {
    final List<String> shortSkills = List.from(skills!);
    if (skills!.length > 4) {
      shortSkills.removeRange(4, skills!.length);
      shortSkills.add('+${skills!.length - shortSkills.length} more');
    }
    return skills == null
        ? const SizedBox()
        : CustomInfoCard(
            icon: HeroIcons.userCircle,
            title: "Skills",
            body: ExpandableNotifier(
              child: Expandable(
                collapsed: ExpandableButton(
                  child: WrappedChips(list: shortSkills),
                ),
                expanded: ExpandableButton(
                  child: WrappedChips(list: skills!),
                ),
              ),
            ),
          );
  }
}
