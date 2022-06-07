import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'databox.dart';

class ContentCategory extends StatefulWidget {
  const ContentCategory({Key? key}) : super(key: key);
  @override
  ContentCategoryState createState() => ContentCategoryState();
}

class ContentCategoryState extends State<ContentCategory> {
  var _datas = [];
  String? inputValue;

  // Dropdown
  String? currentDdValue = "Fetch All Datas";
  List<String> ddItems = [
    "Fetch All Datas",
    "Fetch With Company",
    "Fetch With Department",
    "Fetch With Employee Name",
    "Fetch With Staff Id",
  ];

  // Fetch Datas depend on api
  void fetchContents() async {
    var dio = Dio();
    var url;
    switch (currentDdValue) {
      case "Fetch All Datas":
        url = 'http://13.251.102.176/blog/public/list';
        break;
      case "Fetch With Company":
        url = 'http://13.251.102.176/blog/public/listcom/$inputValue';
        break;
      case "Fetch With Department":
        url = 'http://13.251.102.176/blog/public/listdep/$inputValue';
        break;
      case "Fetch With Employee Name":
        url = 'http://13.251.102.176/blog/public/listemp/$inputValue';
        break;
      case "Fetch With Staff Id":
        url = 'http://13.251.102.176/blog/public/liststaffid/$inputValue';
        break;
      default:
    }

    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      List data = response.data;
      setState(() => _datas = data);
    } else {
      print("Not Okay");
      print('${response.statusCode}, ${response.statusMessage}');
    }
  }

  // Delete employee with id
  void deleteEmployee(int eid) async {
    Dio dio = Dio();
    Response response = await dio.delete(
        "http://13.251.102.176/blog/public/employeedel",
        data: {"id": eid});
    print(response.statusCode);
    print(response.data);
    // if(response.statusCode == 200){
    //   response.data
    // } else {
    //   print("Error in deleting");
    // }
  }

  bool showInputFun() {
    bool? showInput;
    currentDdValue == "Fetch All Datas" ? showInput = false : showInput = true;
    return showInput;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contents",
        ),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: DropdownButton(
                value: currentDdValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: ddItems
                    .map(
                      (item) => DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      ),
                    )
                    .toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    currentDdValue = newValue;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 5.0, 32.0, 10.0),
              child: showInputFun()
                  ? TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(hintText: "Types..."),
                      onChanged: (String value) => inputValue = value)
                  : null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: fetchContents,
                  child: const Text("Load Datas"),
                ),
              ],
            ),
            ...(_datas).map(
              (data) => DataBox(
                cname: data["cname"],
                caddress: data["caddress"],
                cemail: data["cemail"],
                fname: data["fname"],
                staffid: data["staffid"],
                lname: data["lname"],
                department: data["department"],
                sphone: data["sphone"],
                semail: data["semail"],
                saddress: data["saddress"],
                onDeleted: deleteEmployee,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.toc), label: 'Main'),
          BottomNavigationBarItem(icon: Icon(Icons.toc), label: 'Sub'),
        ],
      ),
    );
  }
}
