import 'package:crud_data_base/scrren/home_screen/contoller/home_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Read_Screen extends StatefulWidget {
  const Read_Screen({Key? key}) : super(key: key);

  @override
  State<Read_Screen> createState() => _Read_ScreenState();
}

class _Read_ScreenState extends State<Read_Screen> {
  @override
  void initState() {
    super.initState();
    controller.readTransaction();
  }

  Home_Controller controller = Get.put(Home_Controller());

  TextEditingController txtname_u = TextEditingController();
  TextEditingController txtphone_u = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Read Data",
            style: TextStyle(fontSize: 20),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.black,
                    child: TextButton(
                      onPressed: () {
                        controller.readTransaction();
                      },
                      child: Text(
                        "All Data",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orangeAccent.shade100),
                      child: Row(
                        children: [
                          Text("${controller.DataList[index]['id']}"),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("${controller.DataList[index]['name']}"),
                              Text("${controller.DataList[index]['phone']}"),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              txtname_u = TextEditingController(
                                  text:
                                      "${controller.DataList[index]['category']}");
                              txtphone_u = TextEditingController(
                                  text:
                                      "${controller.DataList[index]['amount']}");

                              updateDialog(index);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.deleteData(
                                id: controller.DataList[index]['id'],
                              );
                              controller.readTransaction();
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: controller.DataList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateDialog(int index) {
    Get.defaultDialog(
      content: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: txtname_u,
              onChanged: (value) {},
              decoration: InputDecoration(
                label: Text(
                  "name",
                  style: TextStyle(color: Colors.blueAccent.shade700),
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blueAccent.shade700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtphone_u,
              onChanged: (value) {},
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text(
                  "phone",
                  style: TextStyle(color: Colors.blueAccent.shade700),
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blueAccent.shade700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Cancel"),
                ),
                Spacer(),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    controller.updateData(
                      id: controller.DataList[index]['id'],
                      name: txtname_u.text,
                      phone: txtphone_u.text,
                    );
                    Get.back();
                  },
                  child: Text("Yes"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
