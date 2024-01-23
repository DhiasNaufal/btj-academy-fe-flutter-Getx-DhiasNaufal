import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/mahasiswa_model.dart';
import '../../../data/providers/mahasiswa_provider.dart';

class HomeController extends GetxController {
  TextEditingController namaController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController prodiController = TextEditingController();
  TextEditingController ipkController = TextEditingController();
  TextEditingController angkatanController = TextEditingController();

  MahasiswaProvider mahasiswaProvider = Get.find<MahasiswaProvider>();
  RxList<Mahasiswa> data = <Mahasiswa>[].obs;

  RxBool loading = false.obs;

  initData() async {
    print(loading);
    print("halo");
    try {
      loading(true);
      await mahasiswaProvider.getMahasiswa().then((value) async {
        print("cek data API");
        print(value.body);
        await value.body.entries.map((element) {
          var temp = Mahasiswa.fromJson(element.value);
          print(element.value);
          data.add(temp);
        }).toList();
        loading(false);
      });
    } catch (e) {
      print(e);
    }
  }

  void addData() async {
    try {
      await mahasiswaProvider
          .postMahasiswa(Mahasiswa(
        angkatan: angkatanController.text,
        ipk: ipkController.text,
        nama: namaController.text,
        nim: nimController.text,
        prodi: prodiController.text,
      ))
          .then((value) async {
        print(value.body);
        namaController.clear();
        nimController.clear();
        prodiController.clear();
        ipkController.clear();
        angkatanController.clear();
        Get.back();
      });
    } catch (e) {
      print(e);
    }
  }

  void addLocal() {
    data.add(Mahasiswa(
      angkatan: angkatanController.text,
      ipk: ipkController.text,
      nama: namaController.text,
      nim: nimController.text,
      prodi: prodiController.text,
    ));
  }

  void clearText() {
    namaController.clear();
    nimController.clear();
    prodiController.clear();
    ipkController.clear();
    angkatanController.clear();
  }

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    namaController.dispose();
    nimController.dispose();
    prodiController.dispose();
    ipkController.dispose();
    angkatanController.dispose();
    super.onClose();
  }
}
