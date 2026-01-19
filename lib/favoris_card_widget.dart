import 'package:citations/constants.dart';
import 'package:flutter/material.dart';

class FavorisCardWidget extends StatelessWidget {
  const FavorisCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Text",
                style: Styles.textCitation.copyWith(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("auteur", style: Styles.textAuteur),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.ios_share_rounded),
                    label: Text("Share"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
