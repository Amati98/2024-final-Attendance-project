import 'package:final_year/screens/staff_Login.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String dropDownValue = "<<Select Category>>";
  var items = ['<<Select Category>>', 'staff', 'student'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4FCA8A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //imageLOGO
              Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Image.asset(
                  "assets/logo.png",
                  height: 158,
                  width: 160,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 70,
              ),

              // dropdown Menu
              Container(
                width: 320,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: DropdownButton(
                    items: items.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          dropDownValue = newValue!;
                        },
                      );
                    },
                    value: dropDownValue,
                    borderRadius: BorderRadius.circular(5),
                    iconSize: 40,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),

              const SizedBox(
                height: 80,
              ),
              //button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFFFBC884),
                        ), // background
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => StaffLogin()),
                          // );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    )
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
