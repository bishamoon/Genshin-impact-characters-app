import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onpressed;

  const Button(
      {super.key,
      required this.color,
      required this.title,
      required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1, left: 50, right: 50),
      child: Material(
        elevation: 7,
        color: color,
        borderRadius: BorderRadius.circular(200),
        child: MaterialButton(
          clipBehavior: Clip.none,
          onPressed: onpressed,
          minWidth: 200,
          height: 42,
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 19, fontFamily: 'zh-cn'),
          ),
        ),
      ),
    );
  }
}
