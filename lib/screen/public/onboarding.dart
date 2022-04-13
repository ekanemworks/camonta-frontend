import 'package:camonta/screen/public/getstarted.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.light,
        accentColor: Colors.deepOrange,
      ),
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          color: Color(0xff534C4C),
          child: Stack(
            children: [
              PageView.builder(
                // scrollDirection: Axis.vertical,
                controller: _controller,
                itemCount: 3,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (_, indexx) {
                  // returning the container of the Image
                  return Container(
                    // Container of the Column of Texts
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height - 200,
                          width: MediaQuery.of(context).size.width - 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(23.0),
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/onboarding/grocery.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                              // height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23),
                                color: const Color.fromRGBO(0, 0, 0, 0.5),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Club Members',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.people,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    // color: Colors.purple,
                    padding: EdgeInsets.only(top: 20, bottom: 30),
                    // height: 20,
                    alignment: Alignment.center,
                    child: Container(
                      // color: Colors.red,
                      width: 105,
                      child: Row(
                        children: List.generate(3, (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(left: 4),
                            height: 8,
                            width: _currentPage == indexDots ? 40 : 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: _currentPage == indexDots
                                    ? Color(0xffC50303)
                                    : Colors.white),
                          );
                        }),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
                    // alignment: Alignment.centerLeft,
                    child: _currentPage == 2

                        // FOR GET STARTED AND LOGIN
                        // FOR GET STARTED AND LOGIN
                        ? Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Container(
                              height: 50,
                              // width: ,
                              decoration: BoxDecoration(
                                color: Color(0xffC50303),
                                borderRadius: BorderRadius.circular(23.0),
                                border: Border.all(
                                  color: Color(0xffC50303),
                                ),
                              ),
                              child: SizedBox(
                                width: double.maxFinite, // <-- Your width
                                height: 55,
                                child: ElevatedButton(
                                  child: const Text(
                                    'Get Started',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => GetStarted(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          )

                        // FOR SKIP AND NEXT
                        // FOR SKIP AND NEXT
                        : Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xffC50303),
                                    borderRadius: BorderRadius.circular(23.0),
                                    border: Border.all(
                                      color: Color(0xffC50303),
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: double.maxFinite, // <-- Your width
                                    height: 55,
                                    child: ElevatedButton(
                                      child: const Text(
                                        'Skip',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => GetStarted(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xffC50303),
                                    borderRadius: BorderRadius.circular(23.0),
                                    border: Border.all(
                                      color: Color(0xffC50303),
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: double.maxFinite, // <-- Your width
                                    height: 55,
                                    child: ElevatedButton(
                                      child: Icon(Icons.arrow_forward),
                                      onPressed: () {
                                        _controller.animateToPage(
                                            _currentPage + 1,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeIn);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
