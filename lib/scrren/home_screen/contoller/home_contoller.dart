import 'package:crud_data_base/utils/db_helper.dart';
import 'package:get/get.dart';

class Home_Controller extends GetxController {
  RxList<Map> DataList = <Map>[].obs;

  Future<void> readTransaction() async {
    DataList.value = await DBHelper.dbHelper.ReadData();
  }

  void deleteData({required id}) {
    DBHelper.dbHelper.deleteData(id: id);
  }

  Future<void> updateData({
    required id,
    required name,
    required phone,
  }) async {
    DBHelper.dbHelper.updateData(
      id: id,
      name: name,
      phone: phone,
    );
    readTransaction();
  }
}
