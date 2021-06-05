import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class Vanimals extends StatelessWidget {
  static AudioCache player = AudioCache();

  //deklarasi sound
  void playSound(String animalName) {
    final player = AudioCache();
    //untuk memanggil sound dari folder asset
    player.play('$animalName.wav');
  }

  //deklarasi untuk gambar icon saat di klik
  Container _buildWidget(String animalName) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: InkWell(
            onTap: () {
              //untuk memanggil sound pada saat di tekan
              playSound(animalName);
            },
            child: Card(
              elevation: 6,
              child: Image.asset('img/$animalName.png'),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("img/Background.png"), fit: BoxFit.cover)),
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Text(
              "Pengenalan Suara Hewan",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Monserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
          Expanded(
            child: GridView.count(crossAxisCount: 2, children: [
              //untuk memanggil widget yang sudah di deklarasikan
              _buildWidget("cow"),
              _buildWidget("cat"),
              _buildWidget("chicken"),
              _buildWidget("sheep"),
              _buildWidget("dog"),
              _buildWidget("bird"),
            ]),
          ),
          Container(
            child: Text(
              "Tekan gambar \n untuk mendengarkan",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          )
        ],
      ),
    ));
  }
}
