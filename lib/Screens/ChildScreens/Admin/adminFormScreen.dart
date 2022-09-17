import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oshcaustralia/Constants/AppConstants.dart';
import 'package:oshcaustralia/UserControls/appButton.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../DataLayer/Database/database.dart';
import '../../../UserControls/AppPopDialog.dart';

class AdminFormScreen extends StatefulWidget {
  const AdminFormScreen({Key? key}) : super(key: key);

  @override
  State<AdminFormScreen> createState() => _AdminFormScreenState();
}

class _AdminFormScreenState extends State<AdminFormScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
        stream: Database.readItems(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (!snapshot.hasError) {
              var data = snapshot.data!;
              return Column(
                children: [
                  Center(
                    child: Text(
                      'Forms Information',
                      style: TextStyle(
                        fontSize: AppConstants.appFontSizeh12,
                        color: AppConstants.appBlueColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                      ),
                    ),
                  ),
                  // Table Start
                  // Table Header Row
                  SizedBox(
                    height: AppConstants.appPaddingLarge,
                  ),
                  ResponsiveGridRow(
                    children: [
                      ResponsiveGridCol(
                        xs: 8,
                        md: 2,
                        child: Container(
                          padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                          height: 60.0,
                          color: AppConstants.appBlueColor,
                          child: Center(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  color: AppConstants.appWhiteColor,
                                  fontSize: AppConstants.appFontSizeh5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 8,
                        md: 1,
                        child: Container(
                          padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                          height: 60.0,
                          color: AppConstants.appBlueColor,
                          child: Center(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Surname',
                                style: TextStyle(
                                  color: AppConstants.appWhiteColor,
                                  fontSize: AppConstants.appFontSizeh5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 8,
                        md: 2,
                        child: Container(
                          padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                          height: 60.0,
                          color: AppConstants.appBlueColor,
                          child: Center(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Passport No.',
                                style: TextStyle(
                                  color: AppConstants.appWhiteColor,
                                  fontSize: AppConstants.appFontSizeh5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 8,
                        md: 2,
                        child: Container(
                          padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                          height: 60.0,
                          color: AppConstants.appBlueColor,
                          child: Center(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  color: AppConstants.appWhiteColor,
                                  fontSize: AppConstants.appFontSizeh5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 8,
                        md: 2,
                        child: Container(
                          padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                          height: 60.0,
                          color: AppConstants.appBlueColor,
                          child: Center(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Policy Start Date',
                                style: TextStyle(
                                  color: AppConstants.appWhiteColor,
                                  fontSize: AppConstants.appFontSizeh5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 8,
                        md: 2,
                        child: Container(
                          padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                          height: 60.0,
                          color: AppConstants.appBlueColor,
                          child: Center(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Policy End Date',
                                style: TextStyle(
                                  color: AppConstants.appWhiteColor,
                                  fontSize: AppConstants.appFontSizeh5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 8,
                        md: 1,
                        child: Container(
                          padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                          height: 60.0,
                          color: AppConstants.appBlueColor,
                          child: Center(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Action',
                                style: TextStyle(
                                  color: AppConstants.appWhiteColor,
                                  fontSize: AppConstants.appFontSizeh5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ResponsiveGridRow(
                          children: [
                            ResponsiveGridCol(
                              xs: 8,
                              md: 2,
                              child: Container(
                                padding: EdgeInsets.all(
                                    AppConstants.appPaddingSmall),
                                height: 60.0,
                                color: AppConstants.appGreyColor,
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${data[index]['Name']}',
                                      style: TextStyle(
                                        color: AppConstants.appDarkBlueColor,
                                        fontSize: AppConstants.appFontSizeh5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ResponsiveGridCol(
                              xs: 8,
                              md: 1,
                              child: Container(
                                padding: EdgeInsets.all(
                                    AppConstants.appPaddingSmall),
                                height: 60.0,
                                color: AppConstants.appGreyColor,
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${data[index]['Surname']}',
                                      style: TextStyle(
                                        color: AppConstants.appDarkBlueColor,
                                        fontSize: AppConstants.appFontSizeh5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ResponsiveGridCol(
                              xs: 8,
                              md: 2,
                              child: Container(
                                padding: EdgeInsets.all(
                                    AppConstants.appPaddingSmall),
                                height: 60.0,
                                color: AppConstants.appGreyColor,
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${data[index]['PassportNumber']}',
                                      style: TextStyle(
                                        color: AppConstants.appDarkBlueColor,
                                        fontSize: AppConstants.appFontSizeh5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ResponsiveGridCol(
                              xs: 8,
                              md: 2,
                              child: Container(
                                padding: EdgeInsets.all(
                                    AppConstants.appPaddingSmall),
                                height: 60.0,
                                color: AppConstants.appGreyColor,
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${data[index]['Email']}',
                                      style: TextStyle(
                                        color: AppConstants.appDarkBlueColor,
                                        fontSize: AppConstants.appFontSizeh5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ResponsiveGridCol(
                              xs: 8,
                              md: 2,
                              child: Container(
                                padding: EdgeInsets.all(
                                    AppConstants.appPaddingSmall),
                                height: 60.0,
                                color: AppConstants.appGreyColor,
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${data[index]['PolicyStart']}',
                                      style: TextStyle(
                                        color: AppConstants.appDarkBlueColor,
                                        fontSize: AppConstants.appFontSizeh5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ResponsiveGridCol(
                              xs: 8,
                              md: 2,
                              child: Container(
                                padding: EdgeInsets.all(
                                    AppConstants.appPaddingSmall),
                                height: 60.0,
                                color: AppConstants.appGreyColor,
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${data[index]['PolicyEnd']}',
                                      style: TextStyle(
                                        color: AppConstants.appDarkBlueColor,
                                        fontSize: AppConstants.appFontSizeh5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ResponsiveGridCol(
                              xs: 8,
                              md: 1,
                              child: Container(
                                padding: EdgeInsets.all(
                                    AppConstants.appPaddingSmall),
                                height: 60.0,
                                color: AppConstants.appGreyColor,
                                child: Center(
                                  child: AppButton(
                                    height: 40.0,
                                    width: 70.0,
                                    textColor: AppConstants.appWhiteColor,
                                    primaryColor: AppConstants.appDarkBlueColor,
                                    text: 'Info',
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppConstants.appFontSizeh3,
                                    borderRadius: 10.0,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AppPopUpDialog(
                                          actionButtonText: 'Close',
                                          titleText: 'Form Details',
                                          content: Column(
                                            children: [
                                              for (int i = 0;
                                                  i < data[index].keys.length;
                                                  i++)
                                                ResponsiveGridRow(
                                                  children: [
                                                    ResponsiveGridCol(
                                                      xs: 8,
                                                      md: 6,
                                                      child: Container(
                                                        padding: EdgeInsets.all(
                                                            AppConstants.appPaddingSmall),
                                                        height: 50.0,
                                                        color: AppConstants.appWhiteColor,
                                                        child: Center(
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              data[index].keys.toList()[i],
                                                              style: TextStyle(
                                                                color: AppConstants.appDarkBlueColor,
                                                                fontSize: AppConstants.appFontSizeh5,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    ResponsiveGridCol(
                                                      xs: 8,
                                                      md: 6,
                                                      child: Container(
                                                        padding: EdgeInsets.all(
                                                            AppConstants.appPaddingSmall),
                                                        height: 50.0,
                                                        color: AppConstants.appWhiteColor,
                                                        child: Center(
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              '${data[index][data[index].keys.toList()[i]]}',
                                                              style: TextStyle(
                                                                color: AppConstants.appDarkBlueColor,
                                                                fontSize: AppConstants.appFontSizeh5,
                                                                fontWeight: FontWeight.w500,
                                                              ),
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
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              );
            } else {
              return Container(
                child: const Text("Error"),
              );
            }
          }
        });
    // return StreamBuilder<QuerySnapshot>(
    //   stream: Database.readItems(),
    //   builder: (BuildContext context, snapshot) {
    //     List<Widget> children = [];
    //     if (snapshot.hasError) {
    //       children = <Widget>[
    //         const Icon(
    //           Icons.error_outline,
    //           color: Colors.red,
    //           size: 60,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 16),
    //           child: Text('Error: ${snapshot.error}'),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 8),
    //           child: Text('Stack trace: ${snapshot.stackTrace}'),
    //         ),
    //       ];
    //     } else {
    //       switch (snapshot.connectionState) {
    //         case ConnectionState.none:
    //           children = const <Widget>[
    //             Icon(
    //               Icons.info,
    //               color: Colors.blue,
    //               size: 60,
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 16),
    //               child: Text('Select a lot'),
    //             )
    //           ];
    //           break;
    //         case ConnectionState.waiting:
    //           children = const <Widget>[
    //             SizedBox(
    //               width: 60,
    //               height: 60,
    //               child: CircularProgressIndicator(),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 16),
    //               child: Text('Awaiting Data...'),
    //             )
    //           ];
    //           break;
    //         case ConnectionState.active:
    //           snapshot.data!.docs.map((e) => print(e));// as List<String>;
    //           // print(data);
    //           // children = <Widget>[
    //           //   IntrinsicHeight(
    //           //     child: Container(
    //           //       width: double.infinity,
    //           //       // height: 500.0,
    //           //       child: ListView(
    //           //         children:
    //           //             snapshot.data!.docs.map((DocumentSnapshot document) {
    //           //           Map<String, dynamic> data =
    //           //               document.data()! as Map<String, dynamic>;
    //           //           // print(data);
    //           //           return ListTile(
    //           //             title: Text('Ibtahaj'),
    //           //             subtitle: Text('test'),
    //           //           );
    //           //         }).toList(),
    //           //       ),
    //           //     ),
    //           //   ),
    //           // ];
    //           break;
    //         case ConnectionState.done:
    //           children = <Widget>[
    //             const Icon(
    //               Icons.info,
    //               color: Colors.blue,
    //               size: 60,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(top: 16),
    //               child: Text(' (closed)'),
    //             )
    //           ];
    //           break;
    //       }
    //     }
    //
    //     return Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: children,
    //     );
    //   },
    // );
  }
}
