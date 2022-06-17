import 'package:flutter/material.dart';
import 'new_pet.dart';
import 'components/scroll_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedNum = 0;
  int selectedPage = 0;
  int selectedTab = 0;
  late PageController _pageController;

  List<String> images = [
    "https://png.pngtree.com/png-clipart/20200226/original/pngtree-cute-cartoon-dog-in-a-pocket-png-image_5317215.jpg",
    "https://img.freepik.com/free-vector/cute-dog-with-rose-flower-cartoon-illustration_138676-3234.jpg?w=2000",
    "https://m.media-amazon.com/images/I/81aCJakI4DL._SL1500_.jpg",
    "https://img.freepik.com/free-vector/cute-corgi-dog-eating-bone-cartoon_138676-2534.jpg?w=2000",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Plus_symbol.svg/1200px-Plus_symbol.svg.png"
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.3);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Center(
        child: Column(
          children: [
            scrollableNumberBar(
              selected: selectedNum,
              fun: (x) {
                setState(() {
                  selectedNum = x;
                });
              },
            ),
          ],
        ),
      ),
      Center(
        child: Text(
          "Page 2",
          style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
        ),
      ),
      Center(
        child: Text(
          "Page 3",
          style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
        ),
      ),
      Center(
        child: Text(
          "Page 4",
          style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
        ),
      ),
    ];
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80,
            width: size.width,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(size.width, 80),
                  painter: MyCustomPainter(),
                ),
                Center(
                  heightFactor: 0.6,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        selectedPage = 2;
                      });
                    },
                    backgroundColor: Colors.pink,
                    child: Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectedPage = 0;
                          });
                        },
                        icon: Icon(
                          Icons.home,
                          color: selectedPage == 0
                              ? Colors.pinkAccent
                              : Colors.white,
                          size: selectedPage == 0 ? 30 : 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectedPage = 1;
                          });
                        },
                        icon: Icon(
                          Icons.pets,
                          color: selectedPage == 1
                              ? Colors.pinkAccent
                              : Colors.white,
                          size: selectedPage == 1 ? 30 : 20,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectedPage = 3;
                          });
                        },
                        icon: Icon(
                          Icons.chat_outlined,
                          color: selectedPage == 3
                              ? Colors.pinkAccent
                              : Colors.white,
                          size: selectedPage == 3 ? 30 : 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectedPage = 4;
                          });
                        },
                        icon: Icon(
                          Icons.shop,
                          color: selectedPage == 4
                              ? Colors.pinkAccent
                              : Colors.white,
                          size: selectedPage == 4 ? 30 : 20,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/appbarBackground.jpg")),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.menu),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "My Pets",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_border),
                              Text(
                                "440",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    height: 200,
                    child: PageView.builder(
                        padEnds: false,
                        itemCount: images.length,
                        physics: NeverScrollableScrollPhysics(),
                        onPageChanged: (x) {
                          if (x != images.length - 1) {
                            setState(() {
                              selectedTab = x;
                            });
                          } else {
                            print("Last Page");
                          }
                        },
                        controller: _pageController,
                        itemBuilder: (context, pagePosition) {
                          return FractionallySizedBox(
                            heightFactor:
                                selectedTab == pagePosition ? 1 : 0.35,
                            child: GestureDetector(
                              onTap: () {
                                if (pagePosition != images.length - 1) {
                                  setState(() {
                                    selectedTab = pagePosition;
                                  });
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewPet()));
                                }
                                _pageController.animateTo(-100,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.linear);
                              },
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  images[pagePosition],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                // Container(
                //   height: 200,
                //   child: ListView.builder(
                //     itemCount: images.length,
                //     // physics: NeverScrollableScrollPhysics(),
                //     // shrinkWrap: true,
                //     controller: _pageController,
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (BuildContext context, int pagePosition) {
                //       return Padding(
                //         padding: const EdgeInsets.only(right: 10.0),
                //         child: FractionallySizedBox(
                //           heightFactor: selectedTab == pagePosition ? 1 : 0.35,
                //           child: GestureDetector(
                //             onTap: () {
                //               if (pagePosition != images.length - 1) {
                //                 setState(() {
                //                   selectedTab = pagePosition;
                //                 });
                //               } else {
                //                 Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                         builder: (context) => NewPet()));
                //               }
                //               _pageController.animateToPage(pagePosition,
                //                   duration: Duration(milliseconds: 200),
                //                   curve: Curves.linear);
                //             },
                //             child: CircleAvatar(
                //               backgroundImage: NetworkImage(
                //                 images[pagePosition],
                //               ),
                //               radius: 50,
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // )
              ],
            ),
            Container(
              height: 400,
              child: pages[selectedTab],
            )
          ],
        ),
      ]),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.indigo
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);

    path.quadraticBezierTo(size.width * 0.2, 0, size.width * 0.5, 0);
    path.quadraticBezierTo(size.width * 0.8, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    // canvas.drawShadow(path, Colors.white, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
