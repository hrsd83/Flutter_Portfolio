import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:animate_do/animate_do.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  myArchives(type) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            type,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
        )
      ],
    );
  }

  mySpecialized(icon, tecnol) {
    return Container(
      margin: EdgeInsets.all(0.8),
      width: 105,
      height: 115,
      child: BounceInUp(
        child: Card(
          margin: const EdgeInsets.all(5),
          color: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 25),
                  child: Text(
                    tecnol,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
      //fondo de Background
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      //Hoja deslizante
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.4, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: Image.asset('assets/fondoPantalla.png')),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.49),
                child: Column(
                  children: const [
                    Text(
                      'Henry Sánchez',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Software Developer',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        builder: (context, state) {
          return Container(
              height: 500,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        myArchives('Flutter Developer'),
                        // myArchives('50', 'Clients'),
                        // myArchives('86', 'Messages'),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Skills',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Especializaciones
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mySpecialized(null, 'HTML'),
                            mySpecialized(null, 'CSS'),
                            mySpecialized(null, 'JavasScript'),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            mySpecialized(
                              null,
                              'Flutter',
                            ),
                            mySpecialized(
                              null,
                              'Git &\nGitHub',
                            ),
                            mySpecialized(null, 'VisualStudio'),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            mySpecialized(
                              null,
                              'FireBase',
                            ),
                            mySpecialized(null, 'Postman'),
                          ],
                        )
                      ],
                    )
                  ]));
        },
      ),
    );
  }
}
