import 'dart:math' as math show pi;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screens/screens.dart';

void main() {
  runApp(
    MaterialApp(
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
        backgroundColor: Color(00000000),
        title: const Text('Projects'),
      ),
      body: SafeArea(
        child: FadeInDown(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              FoldCard(
                key: _foldcardKey1,
                frontWidget: _buildFrontWidget(
                  _foldcardKey1,
                  " Portfolio Flutter",
                  Color(0xff262628),
                ),

                innerWidget: _buildInnerWidget(
                  _foldcardKey1,
                  "Developed with the Flutter framework",
                  "Flutter Language",
                  "assets/imgPortafolio.jpg",
                  Color.fromARGB(255, 133, 194, 255),
                  Color(0xff262628),
                  IconButton(
                    onPressed: () {
                      launchUrlString('https://github.com/hrsd83');
                    },
                    icon: const Icon(FontAwesomeIcons.github),
                    color: Colors.purple[700],
                    iconSize: 45,
                  ),
                ),

                //Tamaño del Card

                cardSize: Size(MediaQuery.of(context).size.width, 220),
                padding: EdgeInsets.all(15),
                animationDuration: Duration(milliseconds: 500),
                borderRadius: 12,
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
      padding: EdgeInsets.only(top: 10),
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
                  margin: EdgeInsets.only(top: 30),
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
                  margin: EdgeInsets.only(top: 5),
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
                Container(
                  margin: EdgeInsets.only(top: 5),
                  // color: Colors.red,
                  width: double.infinity,
                  height: 125,
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.topRight,
                    iconSize: 50,
                    onPressed: () {},
                    icon: innerIcon,
                    color: innerColor,
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
                    Color.fromARGB(255, 118, 63, 255)),
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

/// Folding Cell Widget
class FoldCard extends StatefulWidget {
  FoldCard(
      {Key? key,
      required this.frontWidget,
      required this.innerWidget,
      this.cardSize = const Size(100.0, 100.0),
      this.unfoldCell = false,
      this.skipAnimation = false,
      this.padding =
          const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
      this.animationDuration = const Duration(milliseconds: 1000),
      this.borderRadius = 0.0,
      this.onOpen,
      this.onClose})
      : assert(frontWidget != null),
        assert(innerWidget != null),
        assert(cardSize != null),
        assert(unfoldCell != null),
        assert(skipAnimation != null),
        assert(padding != null),
        assert(animationDuration != null),
        assert(borderRadius != null && borderRadius >= 0.0),
        super(key: key);

  final Widget? frontWidget;
  final Widget? innerWidget;
  final Size? cardSize;
  final EdgeInsetsGeometry? padding;
  final Duration? animationDuration;
  final double? borderRadius;
  final VoidCallback? onOpen;
  final bool? unfoldCell;
  final bool? skipAnimation;
  final VoidCallback? onClose;

  @override
  FoldCardState createState() => FoldCardState();
}

class FoldCardState extends State<FoldCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.onOpen != null) widget.onOpen!();
      } else if (status == AnimationStatus.dismissed) {
        if (widget.onClose != null) widget.onClose!();
      }
    });

    if (widget.unfoldCell == true) {
      _animationController.value = 1;
      _isExpanded = true;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          final angle = _animationController.value * pi;
          final cellWidth = widget.cardSize?.width;
          final cellHeight = widget.cardSize?.height;

          return Padding(
            padding: widget.padding!,
            child: Container(
              color: Colors.transparent,
              width: cellWidth,
              height: cellHeight! + (cellHeight * _animationController.value),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(widget.borderRadius!),
                        topRight: Radius.circular(widget.borderRadius!)),
                    child: Container(
                      width: cellWidth,
                      height: cellHeight,
                      child: OverflowBox(
                        minHeight: cellHeight,
                        maxHeight: cellHeight * 2,
                        alignment: Alignment.topCenter,
                        child: ClipRect(
                          child: Align(
                            heightFactor: 0.5,
                            alignment: Alignment.topCenter,
                            child: widget.innerWidget,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(angle),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationX(pi),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(widget.borderRadius!),
                            bottomRight: Radius.circular(widget.borderRadius!)),
                        child: Container(
                          width: cellWidth,
                          height: cellHeight,
                          child: OverflowBox(
                            minHeight: cellHeight,
                            maxHeight: cellHeight * 2,
                            alignment: Alignment.topCenter,
                            child: ClipRect(
                              child: Align(
                                heightFactor: 0.5,
                                alignment: Alignment.bottomCenter,
                                child: widget.innerWidget,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(angle),
                    child: Opacity(
                      opacity: angle >= 1.5708 ? 0.0 : 1.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(widget.borderRadius!),
                            topRight: Radius.circular(widget.borderRadius!)),
                        child: Container(
                          width: angle >= 1.5708 ? 0.0 : cellWidth,
                          height: angle >= 1.5708 ? 0.0 : cellHeight,
                          child: widget.frontWidget,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void toggleFold() {
    if (_isExpanded) {
      if (widget.skipAnimation == true) {
        _animationController.value = 0;
      } else {
        _animationController.reverse();
      }
    } else {
      if (widget.skipAnimation == true) {
        _animationController.value = 1;
      } else {
        _animationController.forward();
      }
    }
    _isExpanded = !_isExpanded;
  }
}


























// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class MyProjects extends StatefulWidget {
//   const MyProjects({super.key});

//   @override
//   State<MyProjects> createState() => _MyProjectsState();
// }

// class _MyProjectsState extends State<MyProjects> {
//   myProj(lang, title, github) {
//     //Projectos
//     return Container(
//       height: 220,
//       width: MediaQuery.of(context).size.width * 0.9,
//       child: Card(
//         color: const Color(0xff262628),
//         child: Container(
//           margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 lang,
//                 style: const TextStyle(color: Colors.white, fontSize: 20),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 title,
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 github,
//                 style: const TextStyle(
//                     color: Colors.white70,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold),
//               ),
//               IconButton(
//                   alignment: Alignment.centerRight,
//                   onPressed: () {},
//                   icon: const Icon(
//                     FontAwesomeIcons.github,
//                     color: Colors.white,
//                     size: 45,
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: const Color(0xff252525),
//         title: const Text('Projects'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           alignment: Alignment.center,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               myProj(
//                   'Html, Css, Javascript', 'Ecommerce', 'Carrito de Compras'),
//               myProj('Flutter', 'Click 2 Code', 'An online Code'),
//               myProj('Flutter', 'Click 2 Code', 'An online Code'),
//               myProj('Flutter', 'Click 2 Code', 'An online Code'),
//               myProj('Flutter', 'Click 2 Code', 'An online Code'),
//               myProj('Flutter', 'Click 2 Code', 'An online Code'),
//               myProj('Flutter', 'Click 2 Code', 'An online Code'),
//               myProj('Flutter', 'Click 2 Code', 'An online Code'),
//               myProj('Flutter', 'Click 2 Code', 'An online Code'),
//               myProj('Flutter', 'Click 2 Code', 'An online Code'),
//               myProj('Flutter', 'Click 2 Code', 'An online Code'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
