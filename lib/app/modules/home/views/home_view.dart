import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobile_getx_dhias/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Data Mahasiswa',
          style: TextStyle(fontSize: 26, color: Color(0xff4F4539)),
        ),
        backgroundColor: Color(0xFFEBE5D9),
        surfaceTintColor: Color(0xFFEBE5D9),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.data.clear();
          controller.onInit();
        },
        child: Obx(
          () => controller.loading.value
              ? Center(
                  child: LoadingAnimationWidget.waveDots(
                      color: Color(0xff815500), size: 64),
                )
              : ListView.builder(
                  itemBuilder: (context, index) => _dataCard(context, index),
                  itemCount: controller.data.length,
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFD3EABC),
        onPressed: () {
          Get.dialog(_formDialog);
          controller.clearText();
        },
        child: Icon(
          Icons.add,
          color: Color(0xff271904),
        ),
      ),
    );
  }

  Widget _dataCard(context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        child: Card(
          clipBehavior: Clip.hardEdge,
          color: Color(0xffF2EFE8),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: InkWell(
            onTap: () {
              Get.toNamed(
                Routes.DETAIL,
                arguments: {
                  'nama': controller.data[index].nama ?? '-',
                  'nim': controller.data[index].nim ?? '-',
                  'prodi': controller.data[index].prodi ?? '-',
                  'ipk': controller.data[index].ipk ?? '-',
                  'angkatan': controller.data[index].angkatan ?? '-',
                },
              );
              print(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${controller.data[index].nama ?? "-"}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff271904)),
                      ),
                      // Text("${controller.data[index].nim ?? "-"}"),
                      Text(
                        "${controller.data[index].prodi ?? "-"}",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff271904)),
                      ),
                      // Row(
                      //   children: [
                      //     Text("IPK : ${controller.data[index].ipk ?? "-"}"),
                      //     SizedBox(
                      //       width: 20,
                      //     ),
                      //     Text("${controller.data[index].angkatan ?? "-"}"),
                      //   ],
                      // )
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff815500),
                      ),
                      child: Text(
                        "${controller.data[index].angkatan ?? "-"}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 13, vertical: 16),
                  //   color: Color(0xFF403C57),
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(16),
                  //     child: Image.asset(
                  //       "assets/img/mahasiswa.png",
                  //       width: 100,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      );

  Widget get _formDialog => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Add Mahasiswa",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff271904)),
                ),
                SizedBox(
                  height: 64,
                  child: TextField(
                    controller: controller.namaController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        fillColor: Color(0xff815500),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff815500))),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        labelText: 'Nama',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                SizedBox(
                  height: 64,
                  child: TextField(
                    controller: controller.nimController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        labelText: 'NIM',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                SizedBox(
                  height: 64,
                  child: TextField(
                    controller: controller.prodiController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        labelText: 'Prodi',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                SizedBox(
                  height: 64,
                  child: TextField(
                    controller: controller.ipkController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        labelText: 'IPK',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                SizedBox(
                  height: 64,
                  child: TextField(
                    controller: controller.angkatanController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        labelText: 'Angkatan',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFFDAD6)),
                          onPressed: () {
                            controller.clearText();
                            Get.back();
                          },
                          child: Text(
                            "Batal",
                            style: TextStyle(color: Color(0xff410002)),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFEDCB3)),
                          onPressed: () {
                            controller.addData();
                            controller.addLocal();
                            Get.back();
                          },
                          child: Text(
                            "Simpan",
                            style: TextStyle(color: Color(0xff291800)),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
