/*
Assets Helper. Provide convenient access to asset strings
e.g.
class Assets {
  static final String album1 = 'assets/images/albums/a1.jpg';
  static final String album2 = 'assets/images/albums/a2.jpg';
  ...
  static final String album10 = 'assets/images/albums/a10.jpg';
}
*/
//import 'package:fluids/utils/assets.dart';

final List<List<Album>> albumsList = [
  [
    Album(title: 'Juicy', artist: 'Willie Bobo', artwork: './images/nat.jpeg'),
    Album(title: 'Edicion Limitada', artist: 'Eddie Santiago', artwork: './images/nat.jpeg'),
  ],
  [
    Album(title: 'Infinito', artist: 'Oscar D\'Leon', artwork: './images/maus.jpeg'),
    Album(title: 'Para Ti', artist: 'Anthony Cruz', artwork: './images/maus.jpeg'),
  ],
  [
    Album(title: 'Tranquilo', artist: 'Frankie Ruiz', artwork: './images/tif.jpeg'),
    Album(title: '10 Exitos, Vol 2', artist: 'Tommy Olivencia', artwork: './images/tif.jpeg'),
  ],
  [
    Album(title: 'Uno Mismo', artist: 'Tony Vega', artwork: './images/yas.jpeg'),
    Album(title: 'Mi Meta', artist: 'Domingo Quinones', artwork: './images/yas.jpeg'),
  ],
  [
    Album(title: 'The Best', artist: 'Grupo Niche', artwork: './images/nat2.jpeg'),
    Album(title: 'Un Tipo Comun', artist: 'Tito Nieves', artwork: './images/nat2.jpeg'),
  ],
];

class Album {
  final String title;
  final String artist;
  final String artwork;

  Album({this.title, this.artist, this.artwork});
}
