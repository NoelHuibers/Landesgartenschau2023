import 'package:flutter/material.dart';
import 'stands/widgets/list_stands.dart';

class Stands extends StatelessWidget {
  const Stands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stands'),
      ),
      body: const Standslist(),
    );
  }
}
