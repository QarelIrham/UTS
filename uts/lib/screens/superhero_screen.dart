import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'superhero_detail.dart'; // Pastikan mengimpor SuperheroDetail

class SuperheroScreen extends StatelessWidget {
  const SuperheroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final superheroes = [
      {
        'name': 'Iron Man',
        'image': 'assets/ironman.png',
        'character': 
        '''Tony Stark adalah seorang jenius miliarder yang berubah menjadi pahlawan super setelah menciptakan baju zirah berteknologi tinggi untuk melarikan diri dari penculiknya. Dengan identitas sebagai Iron Man, ia melindungi dunia dengan teknologi canggih dan dedikasi tanpa batas.''',
      },
      {
        'name': 'Spider-Man',
        'image': 'assets/spiderman.png',
        'character': 
        '''Peter Parker adalah remaja biasa yang mendapatkan kekuatan laba-laba setelah digigit oleh laba-laba radioaktif. Dengan kekuatannya, ia melindungi New York City dari ancaman berbahaya, sambil menghadapi tantangan menjadi pahlawan muda.''',
      },
      {
        'name': 'Deadpool',
        'image': 'assets/detpul.jpg',
        'character': 
        '''Deadpool, dikenal karena selera humornya yang gelap dan kemampuan regenerasinya, adalah anti-hero yang melakukan misi dengan cara yang tidak konvensional. Dia sering melanggar aturan, tetapi tetap memiliki sisi kebaikan di balik kepribadiannya yang eksentrik.''',
      },
      {
        'name': 'Thor',
        'image': 'assets/thor.png',
        'character': 
        '''Thor, Dewa Petir dan putra Odin, adalah pelindung Asgard yang kuat dengan palu magisnya, Mjolnir. Sebagai pahlawan kosmik, ia melawan ancaman besar untuk melindungi Asgard, Bumi, dan seluruh alam semesta.''',
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical, // Enable vertical scrolling to contain the entire content
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Membuat Row untuk superhero yang scrollable secara horizontal
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Horizontal scrolling
              child: Row(
                children: superheroes.map((hero) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            name: hero['name']!,
                            image: hero['image']!,
                            description: hero['character']!,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 6,
                      margin: const EdgeInsets.only(right: 10), // Spacing between cards
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              hero['image'] ?? 'assets/placeholder.png',
                              height: 250, // Adjust the height to match the desired size
                              width: 200, // Adjust width to give horizontal scroll effect
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.withOpacity(0.6),
                                  Colors.black.withOpacity(0.4),
                                  Colors.red.withOpacity(0.5),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Text(
                              hero['name']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),
            const SuperheroDetail(), // Tampilkan widget SuperheroDetail setelah daftar superhero
          ],
        ),
      ),
    );
  }
}
