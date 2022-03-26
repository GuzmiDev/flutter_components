import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Card Widget"),
        ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 10),
          CustomCardType2(
            imageUrl: 'https://backlightblog.com/images/2021/04/landscape-photography-header.jpg', 
            name: "Un paisaje verde"),
          SizedBox(height: 10),
          CustomCardType2(
            imageUrl: 'https://wallpapercave.com/wp/wp7740670.jpg',
            ),
          SizedBox(height: 10),
          CustomCardType2(
            imageUrl: 'https://www.maxpixel.net/static/photo/1x/Orange-Mountain-Landscape-Color-Sunset-Nature-5500744.png',
            ),
        ],
      ),
    );
  }
}