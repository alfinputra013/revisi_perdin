import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revisi_perdin/core/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void resetData() {}
  bool cashAdvance = true;
  int maxRows = 2;
  List<int> rowList = [0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Revisi Perdin'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: colorBorder,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trip budget (1 days)",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: fromCssColor("#858585"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Text(
                              "Cash advance",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: fromCssColor("#858585"),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 15,
                              width: 20,
                              child: Transform.scale(
                                scale: 0.75,
                                child: CupertinoSwitch(
                                  value: cashAdvance,
                                  onChanged: (value) {
                                    setState(() {
                                      cashAdvance = value;
                                      if (cashAdvance) {
                                        print('Switch is ON');
                                      } else {
                                        print('Switch is OFF');
                                      }
                                      if (!cashAdvance) {
                                        resetData();
                                      }
                                    });
                                  },
                                  trackColor: Colors.grey[400],
                                  activeColor: blueMain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                    child: Center(
                      child: Divider(
                        color: fromCssColor("#A3A3A3"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.5,
                            ),
                            height: 20,
                            child: Text("Tranportasi")),
                        Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.5,
                            ),
                            height: 20,
                            child: Text("Rp. 200.000")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.5,
                            ),
                            height: 20,
                            child: Text("Meal")),
                        Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.5,
                            ),
                            height: 20,
                            child: Text("Rp. 100.000")),
                      ],
                    ),
                  ),
                  for (int index in rowList)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.5,
                            ),
                            height: 20,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              // controller: other[index]['type'],
                              decoration: InputDecoration(
                                hintText: "Type here",
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: fromCssColor("#212121"),
                                ),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 0,
                                ),
                              ),
                              maxLines: 1,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: fromCssColor("#212121"),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.5,
                              ),
                              height: 20,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  hintText: "Rp0",
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: fromCssColor("#212121"),
                                  ),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                ),
                                maxLines: 1,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: fromCssColor("#212121"),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                rowList.remove(index);
                              });
                            },
                            child: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: blueMain,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  Visibility(
                    visible: cashAdvance,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                          child: Center(
                            child: Divider(
                                color: fromCssColor("#A3A3A3"), thickness: 0.5),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cash Advance",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: fromCssColor("#212121"),
                              ),
                            ),
                            if (rowList.length < maxRows)
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    rowList.add(rowList.length);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Text(
                                      "Add",
                                      style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                    child: Center(
                      child: Divider(
                        color: fromCssColor("#A3A3A3"),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total trip budget",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: fromCssColor("#212121"),
                        ),
                      ),
                      Text(
                        "Rp. 200.000",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: fromCssColor("#212121"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
