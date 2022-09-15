import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CharsDetail extends StatelessWidget {
  const CharsDetail({
    Key? key,
    required this.name,
    required this.vision,
    required this.weapon,
    required this.nation,
    required this.affiliation,
    required this.rarity,
    required this.constellation,
    required this.birthday,
    required this.description,
    required this.obtain,
    required this.gender,
    required this.imagePortrait,
    required this.imageCard,
    required this.imageWish,
  }) : super(key: key);

  final String name;
  final String vision;
  final String weapon;
  final String nation;
  final String affiliation;
  final int rarity;
  final String constellation;
  final String birthday;
  final String description;
  final String obtain;
  final String gender;
  final String imagePortrait;
  final String imageCard;
  final String imageWish;

  @override
  Widget build(BuildContext context) {
    const String imgRarity4 =
        "https://static.wikia.nocookie.net/gensin-impact/images/7/77/Icon_4_Stars.png/revision/latest?cb=20201226100702";
    const String imgRarity5 =
        "https://static.wikia.nocookie.net/gensin-impact/images/2/2b/Icon_5_Stars.png/revision/latest?cb=20201226100736";

    String imgRarity = "";

    if (rarity == 5) {
      imgRarity = imgRarity5;
    } else {
      imgRarity = imgRarity4;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      color: const Color.fromARGB(255, 16, 7, 48),
                      child: Center(
                        child: Image.network(
                          imageWish,
                          height: MediaQuery.of(context).size.height * 0.4,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white)),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20.0,
                    left: 20.0,
                    right: 20.0,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(
                              12.0,
                            ),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.angleLeft,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.36,
                    bottom: 0.0,
                    right: 0.0,
                    left: 0.0,
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        left: 20.0,
                        right: 20.0,
                        bottom: 20.0,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'zh-cn',
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.006,
                            ),
                            Image.network(
                              imgRarity,
                              width: 90.0,
                              height: 30.0,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white)),
                                  );
                                }
                              },
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.006,
                            ),
                            Text(
                              gender,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'zh-cn',
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.006,
                            ),
                            Text(
                              "Birthday: $birthday",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'zh-cn',
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.006,
                            ),
                            Text(
                              "Constellation: $constellation",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'zh-cn',
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Row(
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.center,
                                  width: 100.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      color: vision == "Anemo"
                                          ? Colors.greenAccent
                                          : vision == "Dendro"
                                              ? Colors.green
                                              : vision == "Hydro"
                                                  ? Colors.lightBlueAccent
                                                  : vision == "Geo"
                                                      ? Colors.amberAccent
                                                      : vision == "Electro"
                                                          ? Colors.purpleAccent
                                                          : vision == "Pyro"
                                                              ? Colors.redAccent
                                                              : vision == "Cryo"
                                                                  ? Colors
                                                                      .cyanAccent
                                                                  : Colors.grey,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(
                                          10.0,
                                        ),
                                        topRight: Radius.circular(
                                          10.0,
                                        ),
                                        bottomLeft: Radius.circular(
                                          10.0,
                                        ),
                                        bottomRight: Radius.circular(
                                          10.0,
                                        ),
                                      )),
                                  child: Text(
                                    vision,
                                    style: const TextStyle(
                                      fontFamily: 'zh-cn',
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nation:",
                                      style: TextStyle(
                                        fontFamily: 'zh-cn',
                                        fontSize: 18.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      nation,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'zh-cn',
                                        fontSize: 30.0,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Text(
                              "Character Description",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontFamily: 'zh-cn',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.006,
                            ),
                            Text(
                              description,
                              style: TextStyle(
                                height: 1.4,
                                fontSize: 18.0,
                                fontFamily: 'zh-cn',
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Text(
                              "Obtain Via",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'zh-cn',
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.006,
                            ),
                            Text(
                              obtain,
                              style: TextStyle(
                                height: 1.4,
                                fontFamily: 'zh-cn',
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
