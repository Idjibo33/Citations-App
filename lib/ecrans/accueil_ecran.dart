import 'package:citations/citation.dart';
import 'package:citations/citation_provider.dart';
import 'package:citations/citation_widget.dart';
import 'package:citations/page_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccueilEcran extends StatelessWidget {
  const AccueilEcran({super.key});

  @override
  Widget build(BuildContext context) {
    final maintenant = DateTime.now();
    final List<Quotes> listes = context.watch<CitationProvider>().citations;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
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
          SliverFillRemaining(
            child: SizedBox.expand(
              child: Consumer<PageViewProvider>(
                builder: (context, value, child) => PageView.builder(
                  onPageChanged: (index) {
                    context.read<PageViewProvider>().obtenirPageViewIndex(
                      index,
                    );
                  },
                  controller: value.controlleurPageView,
                  itemCount: listes.length,
                  itemBuilder: (context, index) {
                    return CitationWidget(singleCitation: listes[index]);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
