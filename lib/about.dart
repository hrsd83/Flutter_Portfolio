import 'package:flutter/material.dart';

class MyAbout extends StatefulWidget {
  const MyAbout({super.key});

  @override
  State<MyAbout> createState() => _MyAboutState();
}

class _MyAboutState extends State<MyAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //fondo de Background
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent])
              .createShader(Rect.fromLTRB(0, -250, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: Stack(
          children: [
            Container(
                color: Colors.black,
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
                child: Image.asset('assets/FotoPerfil3.png')),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.49),
              // child: Column(
              //   children: const [
              //     Text(
              //       'Henry Sánchez',
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 30,
              //           fontWeight: FontWeight.bold),
              //     ),
              //     Text(
              //       'Software Developer',
              //       style: TextStyle(color: Colors.white, fontSize: 20),
              //     ),
              //   ],
              // ),
            )
          ],
        ),
      ),
    );
  }
}
