import 'package:citations/constants.dart';
import 'package:citations/page_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionsUtilisateurWidget extends StatelessWidget {
  const ActionsUtilisateurWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int pageIndex = context.watch<PageViewProvider>().pageViewIndex;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton.outlined(
                    onPressed: () {
                      context.read<PageViewProvider>().naviguerPagePrecedente();
                      if (pageIndex == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Aucune page précédente"),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Styles.couleurePrimaire,
                    ),
                  ),
                ),
                Text("Précedent"),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton.filled(
                    onPressed: () {
                      context.read<PageViewProvider>().naviguerPageSuivante();
                    },
                    icon: Icon(Icons.arrow_forward),
                  ),
                ),
                Text("Next"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
