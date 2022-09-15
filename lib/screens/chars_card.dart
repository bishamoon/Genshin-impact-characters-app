import 'dart:ui';

import 'package:flutter/material.dart';

class CharsCard extends StatefulWidget {
  const CharsCard({
    Key? key,
    required this.height,
    required this.customImage,
    required this.charName,
    required this.onTap,
    required Color customColor,
    required this.imB,
  }) : super(key: key);

  final double height;
  final String customImage;
  final String charName;
  final VoidCallback onTap;
  final String imB;

  @override
  State<CharsCard> createState() => _CharsCardState();
}

class _CharsCardState extends State<CharsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: Container(
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            width: 170.0,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
            child: Stack(children: [
              Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(widget.imB),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 170,
                  height: widget.height,
                  child: ClipRRect(
                      child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 39.0,
                        ),
                        Flexible(
                            child: Container(
                          padding: const EdgeInsets.only(left: 18.0, top: 16),
                          child: Text(
                            widget.charName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'zh-cn',
                                color: Colors.black),
                          ),
                        )),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45, right: 20),
                          child: Center(
                            child: Image.network(widget.customImage,
                                width: 150, height: 150.0, loadingBuilder:
                                    (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white)),
                                );
                              }
                            }),
                          ),
                        )
                      ],
                    ),
                  )))
            ])));
  }
}
