import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/FoldCard.dart';
import 'screens.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoldCardMain(),
    ),
  );
}

class FoldCardMain extends StatefulWidget {
  const FoldCardMain({Key? key}) : super(key: key);

  @override
  State<FoldCardMain> createState() => _FoldCardMainState();
}

class _FoldCardMainState extends State<FoldCardMain> {
  final _foldcardKey1 = GlobalKey<FoldCardState>();
  final _foldcardKey2 = GlobalKey<FoldCardState>();
  final _foldcardKey3 = GlobalKey<FoldCardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        title: const Text('Projects'),
      ),
      body: SafeArea(
        child: FadeInDown(
          child: ListView(
            // padding: EdgeInsets.all(10),
            children: <Widget>[
              FoldCard(
                key: _foldcardKey1,
                frontWidget: _buildFrontWidget(_foldcardKey1,
                    " Portfolio Flutter", const Color.fromARGB(255, 7, 20, 33)),

                innerWidget: _buildInnerWidget(
                  _foldcardKey1,
                  "Developed with the Flutter framework",
                  "Flutter Language",
                  "assets/imgPortafolio.jpg",
                  const Color.fromARGB(255, 6, 6, 6),
                  const Color.fromARGB(255, 3, 3, 3),
                  IconButton(
                    onPressed: () {
                      launchUrlString('https://github.com/hrsd83');
                    },
                    icon: const Icon(FontAwesomeIcons.github),
                    color: Colors.purple[400],
                    iconSize: 45,
                  ),
                ),

                //Tamaño del Card
                cardSize: Size(MediaQuery.of(context).size.width, 220),
                padding: const EdgeInsets.all(15),
                animationDuration: const Duration(milliseconds: 400),
                borderRadius: 15,
                onOpen: () => {},
                onClose: () => {},
              ),
              FoldCard(
                key: _foldcardKey2,
                frontWidget: _buildFrontWidget(_foldcardKey2,
                    " Portfolio Flutter", const Color.fromARGB(255, 7, 20, 33)),

                innerWidget: _buildInnerWidget(
                  _foldcardKey2,
                  "Developed with the Flutter framework",
                  "Flutter Language",
                  "assets/imgPortafolio.jpg",
                  const Color.fromARGB(255, 6, 6, 6),
                  const Color.fromARGB(255, 3, 3, 3),
                  IconButton(
                    onPressed: () {
                      launchUrlString('https://github.com/hrsd83');
                    },
                    icon: const Icon(FontAwesomeIcons.github),
                    color: Colors.purple[400],
                    iconSize: 45,
                  ),
                ),

                //Tamaño del Card
                cardSize: Size(MediaQuery.of(context).size.width, 220),
                padding: const EdgeInsets.all(15),
                animationDuration: const Duration(milliseconds: 400),
                borderRadius: 15,
                onOpen: () => {},
                onClose: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFrontWidget(
    GlobalKey<FoldCardState> key,
    String title,
    Color colorName,
  ) {
    return Container(
      color: colorName,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                color: Colors.white70,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: 4,
            child: ElevatedButton(
              onPressed: () => key.currentState?.toggleFold(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(colorName),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: Text(
                'Open',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: colorName,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInnerWidget(
    GlobalKey<FoldCardState> key,
    String InnerText,
    String InnerTitleText,
    String InnerImg,
    Color innerColor,
    Color innerColorlight,
    IconButton innerIcon,
  ) {
    return Container(
      color: innerColorlight,
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 45,
              alignment: Alignment.topCenter,
              // color: Colors.red,
              width: double.infinity,
              child: Text(
                InnerTitleText,
                style: GoogleFonts.montserrat(
                  color: Colors.white70,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: double.infinity,
                  // color: Colors.red,
                  // padding: EdgeInsets.all(8),
                  child: Image.asset(InnerImg,
                      height: 210,
                      opacity: const AlwaysStoppedAnimation<double>(1)),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(top: 5),
                  // color: Colors.red,
                  child: Text(
                    textAlign: TextAlign.center,
                    InnerText,
                    style: GoogleFonts.montserrat(
                        color: Colors.white70,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //Styles de icono
                BounceInRight(
                  child: Container(
                    margin: const EdgeInsets.only(top: 5),
                    // color: Colors.red,
                    width: double.infinity,
                    height: 125,
                    alignment: Alignment.centerLeft,
                    child: BounceInRight(
                      child: IconButton(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.topRight,
                        iconSize: 50,
                        onPressed: () {},
                        icon: innerIcon,
                        // color: innerColor,
                      ),
                    ),
                  ),
                )
                //Icono de cada proyecto
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: ElevatedButton(
              onPressed: () => key.currentState?.toggleFold(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 118, 63, 255)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              child: Text(
                'Close',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: innerColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
