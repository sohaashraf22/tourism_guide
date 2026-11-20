import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/attraction.dart';
import '../screens/details_screen.dart';
import '../providers/favorite_providers.dart';

class AttractionCard extends StatelessWidget {
  final Attraction attraction;

  const AttractionCard({
    super.key,
    required this.attraction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsScreen(
              attraction: attraction,
            ),
          ),
        );
      },

      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),

        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                attraction.image,
                width: 120,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      attraction.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      attraction.description,
                      maxLines: 2,
                    ),

                    const SizedBox(height: 5),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 18,
                        ),
                        Expanded(
                          child: Text(attraction.location),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    Consumer<FavoriteProvider>(
                      builder: (context, provider, child) {
                        final isFavorite =
                        provider.isFavorite(attraction);

                        return Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            onPressed: () {
                              provider.toggleFavorite(attraction);
                            },

                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),

                            label: Text(
                              isFavorite
                                  ? 'Added to Favorites'
                                  : 'Add to Favorite',
                            ),
                          ),
                        );
                      },
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