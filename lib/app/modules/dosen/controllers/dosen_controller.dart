import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DosenController extends GetxController {
  //TODO: Implement pegawaiController
  late TextEditingController cNidn;
  late TextEditingController cNama;
  late TextEditingController cStatus;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference dosen = firestore.collection('dosen_11312097');
    return dosen.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference dosen = firestore.collection('dosen_11312097');
    return dosen.snapshots();
  }

  void add(String nama, String nidn, String status) async {
    CollectionReference products = firestore.collection("dosen_11312097");

    try {
      await products.add({
        "nama": nama,
        "status": status,
        "nidn": nidn,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data Dosen",
          onConfirm: () {
            cNama.clear();
            cStatus.clear();
            cNidn.clear();
            Get.back();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Dosen.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("dosen_11312097").doc(id);

    return docRef.get();
  }

  void Update(String nama, String status, String nidn, String id) async {
    DocumentReference pegawaiById =
        firestore.collection("pegawai_21312097").doc(id);

    try {
      await pegawaiById.update({
        "nama": nama,
        "status": status,
        "nidn": nidn,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Dosen.",
        onConfirm: () {
          cNama.clear();
          cStatus.clear();
          cNidn.clear();
          Get.back();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Dosen.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("dosen_11312097").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cStatus = TextEditingController();
    cNidn = TextEditingController();
    cNama = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cStatus.dispose();
    cNidn.dispose();
    cNama.dispose();
    super.onClose();
  }
}
