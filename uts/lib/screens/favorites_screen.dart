import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteCharacters = [
      'Iron Man',
      'Spider-Man',
      'Thor',
      'Deadpool',
    ];

    return Scaffold(
      
      body: ListView.builder(
        itemCount: favoriteCharacters.length,
        itemBuilder: (context, index) {
          final character = favoriteCharacters[index];
          return ListTile(
            leading: Icon(Icons.star, color: Colors.yellow[700]),
            title: Text(character, style: const TextStyle(fontSize: 18)),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Logika untuk menghapus karakter dari favorit
              },
            ),
          );
        },
      ),
    );
  }
}
