import 'package:animal_explain_app/src/model/animal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final animal = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              _detailContent(size, animal),
              _goBackButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _goBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(
        Icons.arrow_back,
        size: 80,
        color: Colors.white.withOpacity(0.8),
      ),
    );
  }

  Widget _detailContent(Size size, Animal animal) {
    return Column(
      children: [
        _head(size, animal),
        _description(animal),
        _soudButton(animal),
      ],
    );
  }

  Widget _head(Size size, Animal animal) {
    return Hero(
      tag: animal.name,
      child: Container(
        height: size.height * 0.45,
        padding: EdgeInsets.all(50),
        child: SvgPicture.asset(animal.photo),
        decoration: BoxDecoration(
          color: animal.color,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: animal.color.withOpacity(0.8),
              blurRadius: 15,
              spreadRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _description(Animal animal) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            animal.name,
            style: GoogleFonts.comicNeue(
                textStyle: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
            )),
          ),
          SizedBox(height: 20),
          Text(
            animal.description,
            style: GoogleFonts.comicNeue(
                textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              height: 1.8,
            )),
          )
        ],
      ),
    );
  }

  Widget _soudButton(Animal animal) {
    return Container(
      margin: EdgeInsets.all(16),
      height: 80,
      width: double.infinity,
      child: Icon(
        Icons.headset,
        size: 90,
        color: Colors.white.withOpacity(0.8),
      ),
      decoration: BoxDecoration(
        color: animal.color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
