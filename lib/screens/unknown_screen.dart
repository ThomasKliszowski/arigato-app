import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("Oops, nous n'avons pas trouvé cette page."));
  }
}
