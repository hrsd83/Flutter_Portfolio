import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio_henry/home.dart';
import 'package:portfolio_henry/widgets/custom_page_route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
              .createShader(Rect.fromLTRB(0, 450, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: Stack(
          children: [
            BounceInUp(
              child: Container(
                  color: Colors.black,
                  margin: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Image.asset(
                    'assets/FotoPerfil3.png',
                    height: 400,
                    fit: BoxFit.contain,
                  )),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.50),
              child: Column(
                children: [
                  const Text(
                    'Hello I am',
                    style: TextStyle(color: Colors.white38, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Henry Sánchez',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Software Developer',
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 120,
                    child: FadeInDown(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(CustomPageRoute(child: const MyHome()));
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            primary: Colors.black),
                        child: const Text('Hire Me'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  BounceInUp(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            launchUrlString(
                                'https://www.instagram.com/hrsd83/');
                          },
                          icon: const Icon(FontAwesomeIcons.instagram),
                          color: Colors.orange[400],
                          iconSize: 35,
                        ),
                        IconButton(
                          onPressed: () {
                            launchUrlString(
                                'https://www.linkedin.com/in/henry-s%C3%A1nchez/');
                          },
                          icon: const Icon(FontAwesomeIcons.linkedin),
                          color: Colors.blue[700],
                          iconSize: 35,
                        ),
                        IconButton(
                          onPressed: () {
                            launchUrlString('https://github.com/hrsd83');
                          },
                          icon: const Icon(FontAwesomeIcons.github),
                          color: Colors.purple[700],
                          iconSize: 35,
                        ),
                        IconButton(
                          onPressed: () {
                            launchUrlString(
                                'https://www.facebook.com/henryrafael.sanchezdelgado');
                          },
                          icon: const Icon(FontAwesomeIcons.facebook),
                          color: Colors.blue[700],
                          iconSize: 35,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
