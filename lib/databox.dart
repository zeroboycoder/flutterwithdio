import 'package:flutter/material.dart';
import './displaytext.dart';

class DataBox extends StatelessWidget {
  final String? cname;
  final String? cemail;
  final String? caddress;
  final String? fname;
  final String? lname;
  final String? department;
  final String? semail;
  final String? sphone;
  final int? staffid;
  final String? saddress;
  final Function? onDeleted;

  const DataBox(
      {Key? key,
      this.cname,
      this.cemail,
      this.caddress,
      this.fname,
      this.lname,
      this.department,
      this.sphone,
      this.semail,
      this.staffid,
      this.saddress,
      this.onDeleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          elevation: 6,
          child: Column(
            children: [
              Container(
                color: Colors.grey.shade200,
                width: double.maxFinite,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DisplayText(
                            text: cname,
                            textSty: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Id : $staffid',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      DisplayText(text: cemail),
                      DisplayText(text: caddress),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DisplayText(text: fname),
                      DisplayText(text: department),
                      DisplayText(text: sphone),
                      DisplayText(text: semail),
                      DisplayText(text: saddress),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                  child: OutlinedButton(
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        onDeleted!(staffid);
                      }),
                ),
              ),
            ],
          )),
    );
  }
}
