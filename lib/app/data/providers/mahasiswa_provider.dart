import 'package:get/get.dart';

import '../models/mahasiswa_model.dart';

class MahasiswaProvider extends GetConnect {
  // @override
  // void onInit() {
  //   httpClient.defaultDecoder = (map) {
  //     if (map is Map<String, dynamic>) return Mahasiswa.fromJson(map);
  //     if (map is List)
  //       return map.map((item) => Mahasiswa.fromJson(item)).toList();
  //   };
  //   httpClient.baseUrl = 'YOUR-API-URL';
  // }
  Future<Response> getMahasiswa() async {
    final response = await get(
        'https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json');
    return response;
  }

  Future<
      Response<
          Mahasiswa>> postMahasiswa(Mahasiswa mahasiswa) async => await post(
      'https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json',
      mahasiswa.toJson());

  Future<Response> deleteMahasiswa(int id) async =>
      await delete('mahasiswa/$id');
}
