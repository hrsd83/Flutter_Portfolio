import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  myProj(lang, title, github) {
    //Projectos
    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: const Color(0xff262628),
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                lang,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                github,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.github,
                    color: Colors.white,
                    size: 45,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff252525),
        title: const Text('Projects'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              myProj(
                  'Html, Css, Javascript', 'Ecommerce', 'Carrito de Compras'),
              myProj('Flutter', 'Click 2 Code', 'An online Code'),
              myProj('Flutter', 'Click 2 Code', 'An online Code'),
              myProj('Flutter', 'Click 2 Code', 'An online Code'),
              myProj('Flutter', 'Click 2 Code', 'An online Code'),
              myProj('Flutter', 'Click 2 Code', 'An online Code'),
              myProj('Flutter', 'Click 2 Code', 'An online Code'),
              myProj('Flutter', 'Click 2 Code', 'An online Code'),
              myProj('Flutter', 'Click 2 Code', 'An online Code'),
              myProj('Flutter', 'Click 2 Code', 'An online Code'),
              myProj('Flutter', 'Click 2 Code', 'An online Code'),
            ],
          ),
        ),
      ),
    );
  }
}
