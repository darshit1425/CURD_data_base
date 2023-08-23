import 'package:crud_data_base/scrren/home_screen/contoller/home_contoller.dart';
import 'package:crud_data_base/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  Home_Controller controller = Get.put(Home_Controller());
  TextEditingController txtname = TextEditingController();
  TextEditingController txtphone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text("curd"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: txtname,
                onChanged: (value) {},
                decoration: InputDecoration(
                  label: Text(
                    "name",
                    style: TextStyle(color: Colors.black),
                  ),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtphone,
                onChanged: (value) {},
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    "phone",
                    style: TextStyle(color: Colors.black),
                  ),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () async {
                        DBHelper.dbHelper.insertData(
                          name: txtname.text,
                          phone: txtphone.text,
                        );
                      },
                      child: const Text(
                        "Insert",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () async {
                        Get.toNamed('/read');
                        controller.DataList.value =
                            await DBHelper.dbHelper.ReadData();
                      },
                      child: const Text(
                        "Read Data",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
