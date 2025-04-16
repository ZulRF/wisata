import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

//App utama
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Wisata Sarangan'; //Judul App
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(image: 'images/sarangan.jpg'), //widget image
              TitleSection(
                name: 'Telaga Sarangan',
                location: 'Magetan, Jawa Timur',
              ), //Penambahan name dan location
              ButtonSection(), //widget button gambar
              TextSection(
                description:
                    'Telaga Sarangan, juga dikenal sebagai Telaga Pasir adalah '
                    'telaga alami yang berada di ketinggian 1.200 meter di atas '
                    'permukaan laut dan terletak di lereng Gunung Lawu, Kecamatan '
                    'Plaosan, Magetan. Telaga ini berjarak sekitar 16 kilometer '
                    'arah barat Kota Magetan. Telaga ini luasnya sekitar 30 hekta'
                    're dan berkedalaman 28 meter. Dengan suhu udara antara 15 '
                    'hingga 20 derajat Celsius. Telaga Sarangan mampu menarik ra'
                    'tusan ribu pengunjung setiap tahunnya. Telaga Sarangan ada'
                    'lah objek wisata andalan di Magetan.',
              ), // widget Teks deskripsi tempat wisata
            ],
          ),
        ),
      ),
    );
  }
}

// widget, Nama, lokasi
class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name; //nama tempat
  final String location; //lokasi

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          /*3*/
          const FavoriteWidget(),
        ],
      ),
    );
  }
}

//widgeet
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ), //panggil Widget Button bawah Call
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ), //panggil Widget Button bawah Route
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ), //panggil Widget Button bawah Share
        ],
      ),
    );
  }
}

// Widget Stateless deskripsi tempat
class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}

//Widget three button with text
class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

//widget images
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}

//Widget stateful favorite button
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 11;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon:
                (_isFavorited
                    ? const Icon(Icons.star)
                    : const Icon(Icons.star_border)),
            color: Colors.lightBlue[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(width: 18, child: SizedBox(child: Text('$_favoriteCount'))),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  // ···
}
