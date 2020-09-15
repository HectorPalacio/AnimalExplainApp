import 'package:animal_explain_app/src/model/animal.dart';
import 'package:animal_explain_app/src/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final List<Animal> animales = [
    Animal(
      'León',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'assets/leon.svg',
      Colors.orange[300],
    ),
    Animal(
      'Zorro',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'assets/zorro.svg',
      Colors.green[300],
    ),
    Animal(
      'Perro',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'assets/perro.svg',
      Colors.brown[300],
    ),
    Animal(
      'Gato',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'assets/gato.svg',
      Colors.deepOrange[300],
    ),
    Animal(
      'Cerdo',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'assets/cerdo.svg',
      Colors.pink[300],
    ),
    Animal(
      'Búho',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'assets/buho.svg',
      Colors.deepPurple[300],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            _animalListView(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: Colors.orange, size: 70),
          Text('Learn',
              style: GoogleFonts.comicNeue(
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              )),
          Container(
            padding: EdgeInsets.all(4),
            height: 50,
            width: 50,
            child: SvgPicture.asset('assets/leon.svg'),
            decoration: BoxDecoration(
              color: Colors.orange[300],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _animalListView() {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: animales.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'detail',
              arguments: animales[index]),
          child: Hero(
            tag: animales[index].name,
            child: CustomCard(
              title: animales[index].name,
              subtitle: animales[index].description,
              svgImage: animales[index].photo,
              color: animales[index].color,
            ),
          ),
        ),
      ),
    );
  }
}
