import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
                child: const Center(
                    child: Text(
                  'Page 2',
                  style: TextStyle(color: Colors.white),
                )),
    );
  }
}