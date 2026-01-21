import 'package:flutter/material.dart';

class ChargementWidget extends StatelessWidget {
  const ChargementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [CircularProgressIndicator(), Text('Chargement des données')],
      ),
    );
  }
}
