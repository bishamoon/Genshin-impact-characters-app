import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../colors.dart';
import '../model/characeter.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'dart:convert';

import 'chars_card.dart';
import 'chars_detail.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static const String homeRoute = 'homeRoute/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget appBarTitle =
      const Text("   ", style: TextStyle(color: Colors.blue, fontSize: 22.0));
  Icon actionIcon = const Icon(Icons.search, color: Colors.white);

  TextEditingController controller = TextEditingController();
  List<CharModel> charsData = [];
  List<CharModel> _filteredList = [];
  String filter = "";

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller.addListener(() {
      if (controller.text.isEmpty) {
        setState(() {
          filter = "";
          _filteredList = charsData;
        });
      } else {
        setState(() {
          filter = controller.text;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTopAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromARGB(255, 16, 7, 48),
      title: appBarTitle,
      actions: <Widget>[
        IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              if (actionIcon.icon == Icons.search) {
                actionIcon = const Icon(
                  Icons.close,
                  color: Colors.redAccent,
                );
                appBarTitle = TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: "Search Name...",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontFamily: 'zh-cn'),
                  ),
                  style: const TextStyle(
                      color: Colors.white, fontFamily: 'zh-cn', fontSize: 20.0),
                  autofocus: true,
                  cursorColor: Colors.black,
                );
              } else {
                actionIcon = const Icon(
                  Icons.search,
                  color: Colors.white,
                );
                appBarTitle = const Text("    ");
                _filteredList = charsData;
                controller.clear();
              }
            });
          },
        ),
      ],
    );
    if ((filter.isNotEmpty)) {
      List<CharModel> tmpListChar = <CharModel>[];
      for (int i = 0; i < _filteredList.length; i++) {
        if (_filteredList[i]
            .name!
            .toLowerCase()
            .contains(filter.toLowerCase())) {
          tmpListChar.add(_filteredList[i]);
        }
      }
      _filteredList = tmpListChar;
    }

    if (filter.isNotEmpty && _filteredList.isEmpty) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 16, 7, 48),
        appBar: appTopAppBar,
        body: Center(
          child: Text("Character ${filter.toString()} is not found!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white, fontFamily: 'zh-cn', fontSize: 22.0)),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 16, 7, 48),
        appBar: appTopAppBar,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {
              return _generateContainer(2);
            } else if (constraints.maxWidth < 900) {
              return _generateContainer(2);
            } else {
              return _generateContainer(2);
            }
          },
        ),
      );
    }
  }

  Widget _generateContainer(int value) {
    Future<List<CharModel>> readJsonData() async {
      //read json file
      final jsondata = await root_bundle.rootBundle
          .loadString('assets/characters_list.json');
      //decode json data as list
      final list = json.decode(jsondata) as List<dynamic>;

      //map json and initialize using DataModel
      return list.map((e) => CharModel.fromJson(e)).toList();
    }

    return Center(
      child: FutureBuilder(
        future: readJsonData(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            charsData = snapshot.data as List<CharModel>;
          } else {
            return const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
            );
          }

          if ((filter.isEmpty)) {
            _filteredList = charsData;
          }
          return ListView(physics: BouncingScrollPhysics(), children: [
            Image(
              image: AssetImage('assets/images/g.png'),
              height: 80,
              width: 99,
            ),
            SizedBox(height: 30),
            Text(
              'Choose your favoriate \ncharaceters',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30, fontFamily: 'zh-cn', color: Colors.white),
            ),
            SizedBox(
              height: 28,
            ),
            SizedBox(
                height: 500,
                child: MasonryGridView.count(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  mainAxisSpacing: 4,
                  shrinkWrap: true,
                  crossAxisSpacing: 4,
                  crossAxisCount: value,
                  itemCount: _filteredList.length,
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  itemBuilder: (context, index) {
                    return CharsCard(
                      height: _filteredList[index].name.toString().length > 14
                          ? 290
                          : 270,
                      customColor: _filteredList[index].rarity == 5
                          ? AppColor.rarity5
                          : AppColor.rarity4,
                      customImage:
                          _filteredList[index].imagePortrait.toString(),
                      charName: _filteredList[index].name.toString(),
                      imB: _filteredList[index].vision.toString() == 'Anemo'
                          ? 'assets/images/anemo.jpg'
                          : _filteredList[index].vision.toString() == 'Dendro'
                              ? 'assets/images/dendro.jpg'
                              : _filteredList[index].vision.toString() ==
                                      'Hydro'
                                  ? 'assets/images/hydro.jpg'
                                  : _filteredList[index].vision.toString() ==
                                          'Electro'
                                      ? 'assets/images/electro.jpg'
                                      : _filteredList[index]
                                                  .vision
                                                  .toString() ==
                                              'Cryo'
                                          ? 'assets/images/cryo.jpg'
                                          : _filteredList[index]
                                                      .vision
                                                      .toString() ==
                                                  'Geo'
                                              ? 'assets/images/geo.jpg'
                                              : _filteredList[index]
                                                          .vision
                                                          .toString() ==
                                                      'Pyro'
                                                  ? 'assets/images/pyro.jpg'
                                                  : 'assets/images/anemo.jpg',
                      onTap: () {
                        print('hhhhhhhhhhh');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CharsDetail(
                              name: _filteredList[index].name.toString(),
                              vision: _filteredList[index].vision.toString(),
                              weapon: _filteredList[index].weapon.toString(),
                              nation: _filteredList[index].nation.toString(),
                              affiliation:
                                  _filteredList[index].affiliation.toString(),
                              rarity: _filteredList[index].rarity!,
                              constellation:
                                  _filteredList[index].constellation.toString(),
                              birthday:
                                  _filteredList[index].birthday.toString(),
                              description:
                                  _filteredList[index].description.toString(),
                              obtain: _filteredList[index].obtain.toString(),
                              gender: _filteredList[index].gender.toString(),
                              imagePortrait:
                                  _filteredList[index].imagePortrait.toString(),
                              imageCard:
                                  _filteredList[index].imageCard.toString(),
                              imageWish:
                                  _filteredList[index].imageWish.toString(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ))
          ]);
        },
      ),
    );
  }
}

