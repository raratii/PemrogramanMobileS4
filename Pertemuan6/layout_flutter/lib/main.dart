import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(label, style: TextStyle(color: color)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Colors.blue;

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Wisata Gunung di Batu',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const Icon(Icons.star, color: Colors.red),
          const Text('41'),
        ],
      ),
    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Ini adalah contoh deskripsi tentang wisata gunung di Batu, Malang, Indonesia. Gunung ini menawarkan pemandangan yang indah dan udara yang segar, cocok untuk para pecinta alam dan pendaki. Dengan berbagai jalur pendakian yang menantang, gunung ini menjadi destinasi favorit bagi wisatawan lokal maupun mancanegara.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Ratih Purnama Dewi - 244107060055')),
        body: ListView(
          children: [
            Image.asset(
              'images/pantai.jpg', // sesuai modul
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}
