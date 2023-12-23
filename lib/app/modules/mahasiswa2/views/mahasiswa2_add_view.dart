import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Mahasiswa2AddView extends GetView {
  const Mahasiswa2AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahasiswa2AddView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Mahasiswa2AddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
