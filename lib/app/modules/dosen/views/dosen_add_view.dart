import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dosen_controller.dart';

class DosenAddView extends GetView<DosenController> {
  const DosenAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Dosen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNama,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            SizedBox(
              height: 10,
            ),
            // Ganti TextField dengan DropdownButtonFormField
            DropdownButtonFormField<String>(
              value: controller.cStatus.text.isNotEmpty
                  ? controller.cStatus.text
                  : null, // Nilai Status yang dipilih
              onChanged: (String? newValue) {
                controller.cStatus.text = newValue ?? '';
              },
              items: <String>['Dosen Tetap', 'Dosen Sementara', 'Dosen Panjang']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Status',
                hintText: 'Pilih Status',
              ),
            ),

            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNidn,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "NIDN"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.cNama.text,
                controller.cStatus.text,
                controller.cNidn.text,
              ),
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
