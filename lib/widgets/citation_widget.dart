import 'package:citations/constants.dart';
import 'package:citations/models/citation.dart';
import 'package:citations/widgets/actions_utilisateur_widget.dart';
import 'package:flutter/material.dart';

class CitationWidget extends StatelessWidget {
  final Quotes singleCitation;
  const CitationWidget({super.key, required this.singleCitation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '"${singleCitation.quote}"',
                  style: Styles.textCitation,
                  textAlign: TextAlign.center,
                ),
                Text('-${singleCitation.author}"', style: Styles.textAuteur),
              ],
            ),
            ActionsUtilisateurWidget(),
          ],
        ),
      ),
    );
  }
}
