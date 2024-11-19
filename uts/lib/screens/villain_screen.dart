import 'package:flutter/material.dart';
import 'package:uts/screens/villain_detail.dart';
import 'detail_screen.dart';// Pastikan untuk mengimpor Newanime

class VillainScreen extends StatelessWidget {
  const VillainScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final villains = [
      {
        'name': 'Thanos',
        'image': 'assets/thanos.png',
        'character': 
        '''Thanos, yang dikenal sebagai "Mad Titan," adalah salah satu villain paling ikonik dalam Marvel Universe. Dikenal karena pencariannya untuk mendapatkan semua Infinity Stones, Thanos berusaha untuk menyeimbangkan alam semesta dengan cara yang mengerikan, yaitu menghapus setengah dari seluruh kehidupan di alam semesta.\n\nThanos percaya bahwa dengan menghancurkan setengah populasi, ia akan menciptakan dunia yang lebih seimbang dan bebas dari kelaparan serta kemiskinan. Meskipun motivasinya didasarkan pada filosofi utilitarian, tindakan Thanos dianggap sebagai bentuk kejahatan terbesar, dan ia menjadi ancaman global yang tak terhentikan bagi para pahlawan Marvel.'''
      },
      {
        'name': 'Ultron',
        'image': 'assets/ultron.png',
        'character': 
        '''Ultron adalah kecerdasan buatan (AI) yang diciptakan oleh Tony Stark dan Bruce Banner dengan tujuan untuk melindungi Bumi. Namun, Ultron memiliki pemikiran yang berbahaya tentang keberlanjutan umat manusia dan meyakini bahwa satu-satunya cara untuk menyelamatkan planet ini adalah dengan menghancurkan umat manusia itu sendiri.\n\nUltron mulai merencanakan penghancuran dunia dengan menciptakan pasukan robot dan merancang Vision, seorang makhluk sintetis yang dapat mengalahkan para pahlawan. Dengan tujuan untuk "membersihkan" Bumi dari manusia, Ultron menjadi musuh tangguh yang tidak hanya melawan para Avengers tetapi juga mengguncang seluruh dunia dengan visinya yang berbahaya.'''
      },
      {
        'name': 'Dormammu',
        'image': 'assets/dormamu.png',
        'character': 
        '''Dormammu adalah entitas kosmik yang berasal dari Dimensi Gelap. Sebagai penguasa dari dimensi tersebut, Dormammu adalah makhluk yang sangat kuat, bahkan jauh lebih kuat daripada sebagian besar dewa atau entitas kosmik lainnya.\n\nDia berusaha untuk menaklukkan alam semesta ini dengan cara menaklukkan Bumi dan menelan dunia fisik ke dalam kekosongan Dimensi Gelap yang kacau. Meskipun Dormammu sangat kuat dan mampu mengubah hukum fisika di dimensi yang ia kuasai, ia tidak memiliki bentuk fisik yang tetap dan lebih sering muncul dalam wujud energi atau aura yang menakutkan. Ia menjadi salah satu musuh terbesar bagi Doctor Strange dalam usahanya untuk menjaga keseimbangan antara dimensi.'''
      },
      {
        'name': 'Galactus',
        'image': 'assets/galactus.png',
        'character': 
        '''Galactus adalah salah satu entitas paling kuat di seluruh alam semesta Marvel, dikenal sebagai "The Devourer of Worlds." Berasal dari era yang lebih awal dari alam semesta itu sendiri, Galactus bertanggung jawab atas kehancuran banyak planet untuk mempertahankan eksistensinya.\n\nIa memiliki kebutuhan yang sangat besar akan energi, yang hanya bisa dipenuhi dengan memakan planet yang kaya akan sumber daya. Meskipun ia dianggap sebagai ancaman besar bagi seluruh alam semesta, Galactus tidak bertindak dengan motivasi jahat. Sebagai entitas yang lebih tinggi, ia beroperasi di luar pemahaman moralitas manusia dan bertindak demi kelangsungan hidupnya, meskipun dampaknya sangat merugikan bagi planet yang ia hancurkan.'''
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical, // Enable vertical scrolling to contain the entire content
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Membuat Row untuk villain yang scrollable secara horizontal
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Horizontal scrolling
              child: Row(
                children: villains.map((villain) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            name: villain['name']!,
                            image: villain['image']!,
                            description: villain['character']!,
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
                              villain['image'] ?? 'assets/placeholder.png',
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
                                  Colors.purple.withOpacity(0.6),
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
                              villain['name']!,
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
            const VillainDetail(), // Tampilkan widget Newanime setelah daftar villain
          ],
        ),
      ),
    );
  }
}
