import 'package:flutter/material.dart';

class AboutContainer extends StatelessWidget {
  AboutContainer({Key? key, this.description}) : super(key: key);

  final String? description;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'About Me',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                '$description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
