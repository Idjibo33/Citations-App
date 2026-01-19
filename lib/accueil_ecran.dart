import 'package:citations/chargement_widget.dart';
import 'package:citations/citation.dart';
import 'package:citations/citation_provider.dart';
import 'package:citations/citation_widget.dart';
import 'package:citations/favoris_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccueilEcran extends StatelessWidget {
  const AccueilEcran({super.key});

  @override
  Widget build(BuildContext context) {
    final maintenant = DateTime.now();
    final List<Quotes> listes = context.watch<CitationProvider>().citations;
    final bool donneeChargee = context
        .watch<CitationProvider>()
        .citationChargee;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listes.length.toString(),
                  style: GoogleFonts.inter(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  maintenant.toString(),
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              Icon(Icons.dark_mode),
              Icon(Icons.light_mode),
              SizedBox(width: 8),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: PageView.builder(
                itemCount: listes.length,
                itemBuilder: (context, index) {
                  return donneeChargee
                      ? CitationWidget(singleCitation: listes[index])
                      : ChargementWidget();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mes favoris",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '0',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return FavorisCardWidget();
            },
          ),
        ],
      ),
    );
  }
}
