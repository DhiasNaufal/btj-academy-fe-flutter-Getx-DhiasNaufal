import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

// ignore: must_be_immutable
class DetailView extends GetView<DetailController> {
  var arguments = Get.arguments;
  DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nama = arguments['nama'];
    print(nama);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Mahasiswa'),
        centerTitle: true,
        backgroundColor: Color(0xffEBE5D9),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCard,
              SizedBox(
                height: 10,
              ),
              // projectName,
              detail,
              SizedBox(
                height: 5,
              ),
              action,
              // siteAddress,
              // otherInformation
            ],
          ),
        ),
      ),
    );
  }

  Widget get buildCard => Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff291800),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 100,
                    ),
                    Text(
                      arguments['nama'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(arguments['prodi'],
                            style: TextStyle(color: Color(0xffFEDCB3))),
                        SizedBox(
                          width: 5,
                        ),
                        Text(arguments['angkatan'],
                            style: TextStyle(color: Color(0xffFEDCB3))),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  Widget get detail => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Informasi Mahasiswa",
            style: TextStyle(fontSize: 16),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nama Lengkap"),
                  Text(arguments['nama']),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("NIM"),
                  Text(arguments['nim']),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Program Studi"),
                  Text(arguments['prodi']),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Angkatan"),
                  Text(arguments['angkatan']),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("IPK"),
                  Text(arguments['ipk']),
                ],
              ),
            ),
          ),
        ],
      );
  Widget get action => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Aksi",
            style: TextStyle(fontSize: 16),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sunting Data",
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Unduh Data"),
                  Icon(
                    Icons.download,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bagikan Data"),
                  Icon(
                    Icons.share,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hapus Data"),
                  Icon(
                    Icons.delete,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
