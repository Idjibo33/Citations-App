import 'package:citations/models/citation.dart';
import 'package:citations/providers/citation_provider.dart';
import 'package:citations/providers/page_view_provider.dart';
import 'package:citations/providers/theme_provider.dart';
import 'package:citations/widgets/chargement_widget.dart';
import 'package:citations/widgets/citation_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AccueilEcran extends StatelessWidget {
  const AccueilEcran({super.key});

  @override
  Widget build(BuildContext context) {
    bool donneDisponible = context.watch<CitationProvider>().citationChargee;
    DateTime maintenant = DateTime.now();
    final List<Quotes> listes = context.watch<CitationProvider>().citations;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          Consumer<ThemeProvider>(
            builder: (context, value, child) => SliverAppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aujourd'hui",
                    style: GoogleFonts.inter(fontSize: 16, color: Colors.grey),
                  ),
                  Text(
                    DateFormat('EEEE, MMMM d, yyyy').format(maintenant),
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              actions: [
                value.isLightMode
                    ? IconButton(
                        icon: Icon(Icons.dark_mode),
                        onPressed: () {
                          value.changeThemeMode();
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.light_mode),
                        onPressed: () {
                          value.changeThemeMode();
                        },
                      ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: SizedBox.expand(
              child: Consumer<PageViewProvider>(
                builder: (context, value, child) {
                  return donneDisponible
                      ? PageView.builder(
                          onPageChanged: (index) {
                            context
                                .read<PageViewProvider>()
                                .obtenirPageViewIndex(index);
                          },
                          controller: value.controlleurPageView,
                          itemCount: listes.length,
                          itemBuilder: (context, index) {
                            return CitationWidget(
                              singleCitation: listes[index],
                            );
                          },
                        )
                      : ChargementWidget();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
