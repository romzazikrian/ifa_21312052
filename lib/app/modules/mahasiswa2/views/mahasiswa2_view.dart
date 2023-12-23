import 'package:ifa_21312097/app/modules/mahasiswa2/models/Mahasiswa.dart';
import 'package:ifa_21312097/app/modules/mahasiswa2/controllers/mahasiswa2_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ifa_21312097/app/modules/mahasiswa2/models/Mahasiswa.dart';

import '../controllers/mahasiswa2_controller.dart';

class Mahasiswa2View extends GetView<Mahasiswa2Controller> {
  const Mahasiswa2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListMahasiswa2();
  }
}

class ListMahasiswa2 extends StatefulWidget {
  @override
  State<ListMahasiswa2> createState() => _ListMahasiswa2State();
}

class _ListMahasiswa2State extends State<ListMahasiswa2> {
  List<Mahasiswa> _listMahasiswa = [];

  void getMahasiswa() async {
    _listMahasiswa = await Mahasiswa2Controller.getMahasiswa();

    setState(() {});
  }

  @override
  void initState() {
    getMahasiswa();
    super.initState();
  }

  void showOption(id) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {},
            title: Text('Update'),
          ),
          ListTile(
            onTap: () {},
            title: Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  Widget build(BuildContext context) {
    return Stack(children: [
      _listMahasiswa.length > 0
          ? ListView.builder(
              itemCount: _listMahasiswa.length,
              itemBuilder: (context, index) {
                Mahasiswa mahasiswa = _listMahasiswa[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                    backgroundColor: Colors.white,
                  ),
                  title: Text(mahasiswa.mhsNama ?? ''),
                  subtitle: Text(mahasiswa.mhsNpm ?? ''),
                  trailing: IconButton(
                      onPressed: () => showOption(mahasiswa),
                      icon: Icon(Icons.more_vert)),
                );
              },
            )
          : Center(
              child: Text("Data Kosong"),
            ),
    ]);
  }
}
