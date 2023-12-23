import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pegawai_controller.dart';

class PegawaiAddView extends GetView<PegawaiController> {
  const PegawaiAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pegawai'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNokaryawan,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "No Karyawan"),
            ),
            SizedBox(
              height: 10,
            ),
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
              value: controller.cJabatan.text.isNotEmpty
                  ? controller.cJabatan.text
                  : null, // Nilai jabatan yang dipilih
              onChanged: (String? newValue) {
                controller.cJabatan.text = newValue ?? '';
              },
              items: <String>[
                'Pilih Status',
                'Karyawan Tetap',
                'Karyawan Sementara'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Jabatan',
                hintText: 'Pilih Jabatan',
              ),
            ),

            SizedBox(
              height: 30,
            ),

            ElevatedButton(
              onPressed: () => controller.add(
                controller.cNama.text,
                controller.cJabatan.text,
                controller.cNokaryawan.text,
              ),
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
