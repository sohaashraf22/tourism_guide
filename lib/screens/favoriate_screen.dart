import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorite_providers.dart';
import '../widgets/attraction_card.dart';

class FavoriateScreen extends StatelessWidget {
  const FavoriateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, provider, child) {
        if (provider.favorites.isEmpty) {
          return const Center(
            child: Text("No Favorites Yet"),
          );
        }

        return ListView.builder(
          itemCount: provider.favorites.length,
          itemBuilder: (context, index) {
            return AttractionCard(
              attraction: provider.favorites[index],
            );
          },
        );
      },
    );
  }
}