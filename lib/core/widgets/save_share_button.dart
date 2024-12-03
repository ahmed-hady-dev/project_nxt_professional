import 'package:flutter/material.dart';
import 'package:project_nxt_professional/core/resources/style.dart';
import 'package:project_nxt_professional/core/widgets/save_button.dart';
import 'package:project_nxt_professional/core/widgets/share_button.dart';

class SaveShareButton extends StatelessWidget {
  const SaveShareButton({super.key, required this.isSaved, this.onSavedTap});
  final bool isSaved;
  final VoidCallback? onSavedTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SaveButton(
          isSaved: isSaved,
          onSavedTap: onSavedTap,
        ),
        FixedSizeBox.width12,
        const ShareButton(),
      ],
    );
  }
}
