import 'Screens/screens.dart';

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

  mySpecialized(icon, tecnol, col) {
    return Container(
      margin: EdgeInsets.all(0.8),
      width: 105,
      height: 115,
      child: Container(
        //BounceInUp
        child: Card(
          margin: const EdgeInsets.all(5),
          color: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: col,
                  size: 45,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 25),
                  child: Text(
                    tecnol,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
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
    return Scaffold(
      // fondo de Background
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: PopupMenuButton(
            iconSize: 30,
            color: Colors.black,
            icon: const Icon(Icons.menu),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: TextButton(
                      child: Text(
                        'Projects',
                        style: GoogleFonts.alegreya(
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(CustomPageRoute(child: const MyProjects()));
                        // Navigator.pushNamed(context, 'projects');
                      },
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: TextButton(
                      child: Text(
                        'About',
                        style: GoogleFonts.alegreya(
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(CustomPageRoute(child: const MyAbout()));
                      },
                    ),
                  )
                ]),
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
                    top: MediaQuery.of(context).size.height * 0.45),
                child: Column(
                  children: [
                    Text('Henry Sánchez',
                        style: GoogleFonts.alegreya(
                            textStyle:
                                TextStyle(fontSize: 30, color: Colors.white))),
                    Text('Software Developer',
                        style: GoogleFonts.alegreya(
                            textStyle:
                                TextStyle(fontSize: 30, color: Colors.white))),
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
                            mySpecialized(FontAwesomeIcons.html5, 'HTML',
                                Colors.orange[700]),
                            mySpecialized(FontAwesomeIcons.css3Alt, 'CSS',
                                Colors.blue[500]),
                            mySpecialized(FontAwesomeIcons.js, 'JavasScript',
                                Colors.yellow[400]),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            mySpecialized(
                              Icons.flutter_dash,
                              'Flutter',
                              Colors.blue[400],
                            ),
                            mySpecialized(
                              FontAwesomeIcons.git,
                              'Git',
                              Colors.orange[700],
                            ),
                            mySpecialized(FontAwesomeIcons.github, 'GitHub',
                                Colors.purple[700]),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            mySpecialized(
                              Icons.code,
                              'VisualStudio',
                              Colors.blue,
                            ),
                            mySpecialized(
                                Icons.data_array, 'Firebase', Colors.yellow),
                            mySpecialized(
                              Icons.data_array_rounded,
                              'Postman',
                              Colors.orange,
                            ),
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
