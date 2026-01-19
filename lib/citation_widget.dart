import 'package:citations/citation.dart';
import 'package:citations/constants.dart';
import 'package:flutter/material.dart';

class CitationWidget extends StatelessWidget {
  final Quotes singleCitation;
  const CitationWidget({super.key, required this.singleCitation});

  @override
  Widget build(BuildContext context) {
    bool isLiked = false;
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
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Stack(
                            children: [
                              isLiked == false
                                  ? IconButton.outlined(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_outline),
                                    )
                                  : IconButton.outlined(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_outlined),
                                    ),
                            ],
                          ),
                        ),
                        Text("Like"),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: IconButton.outlined(
                            onPressed: () {},
                            icon: Icon(Icons.ios_share_rounded),
                          ),
                        ),
                        Text("Share"),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: IconButton.filled(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward),
                          ),
                        ),
                        Text("Next"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
