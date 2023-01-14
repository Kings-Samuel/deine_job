import 'package:deine_job/helpers/color_palette.dart';
import 'package:deine_job/helpers/custom_texts.dart';
import 'package:deine_job/helpers/waveclipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sticky_headers/sticky_headers.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {
  bool _isHoveringLogin = false;
  bool _isHoveringMain = false;
  int _selectedSegment = 0;
  final ScrollController _controller = ScrollController();
  // bool isMobile = Device.screenType == ScreenType.mobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Device.screenType == ScreenType.mobile
            ? Container(
                height: 75,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 5, spreadRadius: 5, offset: Offset(0, 5))],
                    borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12))),
                child: InkWell(
                  onTap: () {
                    _controller.animateTo(0, duration: const Duration(milliseconds: 1000), curve: Curves.bounceIn);
                  },
                  onHover: (value) {
                    setState(() {
                      _isHoveringMain = value;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 45,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                            colors: const [Color(0xff319795), Color(0xff3182CE)],
                            begin: _isHoveringMain ? Alignment.topRight : Alignment.topLeft,
                            end: _isHoveringMain ? Alignment.bottomLeft : Alignment.bottomRight)),
                    child: Center(
                      child: bodyText(text: 'Kostenlos Registrieren', color: Colors.white),
                    ),
                  ),
                ),
              )
            : null,
        body: ImprovedScrolling(
          scrollController: _controller,
          enableMMBScrolling: true,
          enableKeyboardScrolling: true,
          enableCustomMouseWheelScrolling: true,
          keyboardScrollConfig: KeyboardScrollConfig(
            arrowsScrollAmount: 250.0,
            homeScrollDurationBuilder: (currentScrollOffset, minScrollOffset) {
              return const Duration(milliseconds: 100);
            },
            endScrollDurationBuilder: (currentScrollOffset, maxScrollOffset) {
              return const Duration(milliseconds: 2000);
            },
          ),
          customMouseWheelScrollConfig: const CustomMouseWheelScrollConfig(
            scrollAmountMultiplier: 2.0,
          ),
          child: ScrollConfiguration(
            behavior: const MaterialScrollBehavior(),
            child: SingleChildScrollView(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              child: StickyHeader(
                  header: Column(
                    children: [
                      // gradient top line
                      Container(
                        height: 5,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Palette.green, Palette.blue])),
                      ),
                      // header body
                      Container(
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(color: Color.fromARGB(40, 0, 0, 0), offset: Offset(0, 3), blurRadius: 6)
                            ]),
                        child: InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              _isHoveringLogin = value;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            margin: const EdgeInsets.only(right: 15),
                            alignment: Alignment.centerRight,
                            child: _isHoveringLogin
                                ? bodyText(text: 'Login', bold: true, color: Palette.green, underlineText: true)
                                : bodyText(text: 'Login', bold: true, color: Palette.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                  content: Column(
                    children: [
                      // showcase
                      ClipPath(
                        clipper: WaveClipper(),
                        child: Container(
                            height: 659,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                              colors: [Color(0xFFE6FFFA), Color(0xFFEBF4FF)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )),
                            child: Device.screenType == ScreenType.mobile
                                ? Column(
                                    children: [
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 5),
                                        width: 320,
                                        child: headingText(
                                            text: 'Deine Job Website', fontSize: 42, fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        height: 455,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                            image:
                                                DecorationImage(image: AssetImage('handshake.png'), fit: BoxFit.cover)),
                                      )
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // text and btn
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(bottom: 50),
                                            width: 320,
                                            child: headingText(
                                                text: 'Deine Job Website', fontSize: 65, textAlign: TextAlign.left),
                                          ),
                                          // button
                                          InkWell(
                                            onTap: () {},
                                            onHover: (value) {
                                              setState(() {
                                                _isHoveringMain = value;
                                              });
                                            },
                                            child: AnimatedContainer(
                                              duration: const Duration(milliseconds: 500),
                                              height: 45,
                                              width: 320,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  gradient: LinearGradient(
                                                      colors: const [Color(0xff319795), Color(0xff3182CE)],
                                                      begin: _isHoveringMain ? Alignment.topRight : Alignment.topLeft,
                                                      end: _isHoveringMain
                                                          ? Alignment.bottomLeft
                                                          : Alignment.bottomRight)),
                                              child: Center(
                                                child: bodyText(text: 'Kostenlos Registrieren', color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      // image
                                      Container(
                                        height: 455,
                                        width: 455,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            image:
                                                DecorationImage(image: AssetImage('handshake.png'), fit: BoxFit.fill)),
                                      )
                                    ],
                                  )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // segmented control bar
                      Center(
                          child: CupertinoSegmentedControl(
                        children: {
                          0: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            child: bodyText(
                                text: 'Arbeitnehmer',
                                color: _selectedSegment == 0 ? Colors.white : Palette.green,
                                bold: true),
                          ),
                          1: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            child: bodyText(
                                text: 'Arbeitgeber',
                                color: _selectedSegment == 1 ? Colors.white : Palette.green,
                                bold: true),
                          ),
                          2: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            child: bodyText(
                                text: 'Temporärbüro',
                                color: _selectedSegment == 2 ? Colors.white : Palette.green,
                                bold: true),
                          )
                        },
                        onValueChanged: (value) {
                          setState(() {
                            _selectedSegment = value;
                          });
                        },
                        groupValue: _selectedSegment,
                        selectedColor: Palette.green,
                        unselectedColor: Colors.white,
                      )),
                      // segment heading
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: Device.screenType == ScreenType.mobile ? 30 : 50,
                            horizontal: Device.screenType == ScreenType.mobile ? 20 : 0),
                        width: Device.screenType == ScreenType.mobile ? double.infinity : 390,
                        alignment: Alignment.center,
                        child: bodyText(
                          text: getSegmentHeading(),
                          fontSize: Device.screenType == ScreenType.mobile ? 21 : 40,
                          color: Palette.textColorDark,
                        ),
                      ),
                      // * body mobile
                      if (Device.screenType == ScreenType.mobile)
                        Column(children: [
                          // item 1
                          Container(
                            height: 254,
                            padding: const EdgeInsets.only(left: 15),
                            alignment: Alignment.center,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                bodyText(text: '1.', fontSize: 130),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      getAsset1(),
                                      height: 144,
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    bodyText(text: getText1(), fontSize: 16),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // item 2
                          Stack(
                            children: [
                              // clip paths
                              Column(
                                children: [
                                  Transform.scale(
                                    scale: -1,
                                    child: ClipPath(
                                      clipper: WaveClipper(),
                                      child: Container(
                                        height: 185,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Color(0xFFE6FFFA), Color(0xFFEBF4FF)],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ClipPath(
                                    clipper: WaveClipper(),
                                    child: Container(
                                      height: 195,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Color(0xFFE6FFFA), Color(0xFFEBF4FF)],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 25,
                                left: 30,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          bodyText(text: '2.', fontSize: 130),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Container(
                                              margin: const EdgeInsets.only(bottom: 25),
                                              child: bodyText(text: getText2(), fontSize: 16)),
                                        ],
                                      ),
                                      Image.asset(
                                        getAsset2(),
                                        height: 130,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // item 3
                          Stack(
                            children: [
                              Container(
                                height: 326,
                                color: Colors.white,
                              ),
                              Positioned(
                                left: -50,
                                child: Container(
                                  height: 350,
                                  width: 350,
                                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF7FAFC)),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 50,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          bodyText(text: '3.', fontSize: 130),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              margin: const EdgeInsets.only(bottom: 25),
                                              child: bodyText(text: getText3(), fontSize: 16)),
                                        ],
                                      ),
                                      Image.asset(
                                        getAsset3(),
                                        height: 130,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ])
                      // * body desktop
                      else
                        Column(children: [
                          // item 1
                          Container(
                            margin: EdgeInsets.only(top: 10, left: Device.screenType == ScreenType.tablet ? 100 : 200),
                            height: 400,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                bodyText(text: '1.', fontSize: 130),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    bodyText(text: getText1(), fontSize: 30),
                                  ],
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                Image.asset(getAsset1())
                              ],
                            ),
                          ),
                          // item 2
                          Stack(
                            children: [
                              // clip paths
                              Column(
                                children: [
                                  Transform.scale(
                                    scale: -1,
                                    child: ClipPath(
                                      clipper: WaveClipper(),
                                      child: Container(
                                        height: 200,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Color(0xFFE6FFFA), Color(0xFFEBF4FF)],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ClipPath(
                                    clipper: WaveClipper(),
                                    child: Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Color(0xFFE6FFFA), Color(0xFFEBF4FF)],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 10, left: Device.screenType == ScreenType.tablet ? 250 : 500),
                                  height: 400,
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Image.asset(getAsset2()),
                                      const SizedBox(
                                        width: 70,
                                      ),
                                      bodyText(text: '2.', fontSize: 130),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 50,
                                          ),
                                          bodyText(text: getText2(), fontSize: 30),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // item 3
                          Stack(
                            children: [
                              Container(
                                height: 400,
                                color: Colors.white,
                              ),
                              Positioned(
                                left: Device.screenType == ScreenType.tablet ? 210 : 320,
                                top: 120,
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF7FAFC)),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 10, left: Device.screenType == ScreenType.tablet ? 125 : 350),
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      bodyText(text: '3.', fontSize: 130),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 50,
                                          ),
                                          bodyText(text: getText3(), fontSize: 30),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 70,
                                      ),
                                      Image.asset(getAsset3())
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      SizedBox(
                        height: Device.screenType == ScreenType.mobile ? 55 : 200,
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }

  String getSegmentHeading() {
    if (_selectedSegment == 0) {
      return 'Drei einfache Schritte zu deinem neuen Job';
    } else {
      if (_selectedSegment == 1) {
        return 'Drei einfache Schritte zu deinem neuen Mitarbeiter';
      } else {
        return 'Drei einfache Schritte zur Vermittlung neuer Mitarbeiter';
      }
    }
  }

  String getText1() {
    if (_selectedSegment == 0) {
      return 'Erstellen dein Lebenslauf';
    } else {
      if (_selectedSegment == 1) {
        return 'Erstellen dein Unternehmensprofil';
      } else {
        return 'Erstellen dein Unternehmensprofil';
      }
    }
  }

  String getText2() {
    if (_selectedSegment == 0) {
      return 'Erstellen dein Lebenslauf';
    } else {
      if (_selectedSegment == 1) {
        return 'Erstellen ein Jobinserat';
      } else {
        return 'Erhalte Vermittlungs- angebot von Arbeitgeber';
      }
    }
  }

  String getText3() {
    if (_selectedSegment == 0) {
      return 'Mit nur einem Klick bewerben';
    } else {
      if (_selectedSegment == 1) {
        return 'Wähle deinen neuen Mitarbeiter aus;';
      } else {
        return 'Vermittlung nach Provision oder Stundenlohn';
      }
    }
  }

  String getAsset1() {
    if (_selectedSegment == 0) {
      return '1.png';
    } else {
      if (_selectedSegment == 1) {
        return '1.png';
      } else {
        return '1.png';
      }
    }
  }

  String getAsset2() {
    if (_selectedSegment == 0) {
      return '2.png';
    } else {
      if (_selectedSegment == 1) {
        return '5.png';
      } else {
        return '8.png';
      }
    }
  }

  String getAsset3() {
    if (_selectedSegment == 0) {
      return '3.png';
    } else {
      if (_selectedSegment == 1) {
        return '6.png';
      } else {
        return '9.png';
      }
    }
  }
}
