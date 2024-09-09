import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  BorderRadius? border;
  Color? color;
  double? height;
  double? width;
  bool? animate;
  bool? textAppear;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animate = false;
    textAppear = false;
    changer(animate!);
  }

  void changer(bool a) {
    setState(() {
      if (a) {
        height = 400;
        width = 500;
        color = Colors.blue;
        border = BorderRadius.circular(40);
        Future.delayed(Duration(milliseconds: 300), () {
          setState(() {
            textAppear = true;
          });
        });
      } else {
        height = 370;
        width = 370;
        color = Colors.red;
        border = BorderRadius.circular(300);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              animate = true;
              changer(animate!);
            });
          },
          onTapDown: (a) {
            setState(() {
              animate = false;
              changer(animate!);
              textAppear = false;
            });
          },
          child: Container(
            height: 600,
            width: 500,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: AnimatedContainer(
                    height: height,
                    width: width,
                    duration: Duration(milliseconds: 275),
                    padding:
                        EdgeInsets.only(left: 20,top: 20),
                    decoration: BoxDecoration(
                      borderRadius: border!,
                      color: color!,
                    ),
                    child: AnimatedOpacity(
                      opacity: textAppear! ? 1 : 0,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeOut,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Peposi",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                          Container(
                            width: 200,

                            padding: EdgeInsets.only(top: 10,left: 5),
                            child: Text(
                              "Pepsi is one of the world’s most iconic soft drinks, known for its refreshing and bold flavor. It is a carbonated cola beverage that was first introduced in the late 19th century by Caleb Bradham, a pharmacist in North Carolina. Originally named Brad’s Drink it was later rebranded as Pepsi-Cola, with the name reflecting its digestive health benefits, linked to the enzyme pepsin.",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0),
                  child: AnimatedContainer(
                    padding: EdgeInsets.only(left: animate! ? 200 : 0),
                    duration: Duration(milliseconds: 270),
                    height: height! + 30,
                    child: Container(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage("assets/a.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
