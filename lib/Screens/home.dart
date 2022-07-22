import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';

import '../Constants/AppConstants.dart';
import '../DataLayer/Providers/dataProvider.dart';
import '../UserControls/appButton.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime? _selected;
  var adultsDropdownValue;
  var childrenDropdownValue;
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/main-back.jpg'),
          fit: BoxFit.fill,
        )),
        child: Center(
          child: Container(
            height: size.height * 0.7,
            width: size.width * 0.6,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: size.height * 0.2,
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    color: AppConstants.appLightBlueColor,
                    borderRadius: BorderRadius.vertical(
                        top: const Radius.circular(10.0),
                        bottom: const Radius.circular(0.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(AppConstants.appPaddingLarge),
                    child: SizedBox(
                      child: SvgPicture.asset(
                        'assets/svgs/logo.svg',
                        height: size.width*0.07,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.2,
                  width: size.width * 0.6,
                  color: AppConstants.appLightBlueColor,
                  child: Padding(
                    padding: EdgeInsets.all(AppConstants.appPaddingLarge),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Did you know you have choice in your Overseas Student Health Cover (OSHC) provider?',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: AppConstants.appFontSizeh4,
                          ),
                        ),
                        Text(
                          'Compare your options and meet your Australian visa requirements without paying too much.',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: AppConstants.appFontSizeh4,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'Compare Australian Government-approved providers in one place;',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: AppConstants.appFontSizeh5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'buy your policy and have it in minutes.',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: AppConstants.appFontSizeh5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.25,
                  width: size.width * 0.6,
                  color: AppConstants.appBlueColor.withOpacity(0.8),
                  child: Padding(
                    padding: EdgeInsets.all(
                      AppConstants.appPaddingMedium,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: size.width * 0.1,
                              child: Column(
                                children: [
                                  Text(
                                    'Adults',
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  InputDecorator(
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10.0, 0.0, 10.0, 0.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppConstants.appWhiteColor,
                                          width: 1.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        menuMaxHeight: 150.0,
                                        value: adultsDropdownValue,
                                        hint: Text(
                                          'Select Adults',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize:
                                                AppConstants.appFontSizeh3,
                                            color: AppConstants.appWhiteColor,
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.arrow_downward,
                                          color: AppConstants.appWhiteColor,
                                          size: 16.0,
                                        ),
                                        elevation: 12,
                                        style: TextStyle(
                                          color: AppConstants.appWhiteColor,
                                        ),
                                        dropdownColor: AppConstants.appBlueColor,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            adultsDropdownValue = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          '1 Adult',
                                          '2 Adults',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.1,
                              child: Column(
                                children: [
                                  Text(
                                    'Children',
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  InputDecorator(
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10.0, 0.0, 10.0, 0.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppConstants.appWhiteColor,
                                          width: 1.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        menuMaxHeight: 150.0,
                                        value: childrenDropdownValue,
                                        hint: Text(
                                          'Select Children',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize:
                                                AppConstants.appFontSizeh3,
                                            color: AppConstants.appWhiteColor,
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.arrow_downward,
                                          color: AppConstants.appWhiteColor,
                                          size: 16.0,
                                        ),
                                        elevation: 12,
                                        style: TextStyle(
                                          color: AppConstants.appWhiteColor,
                                        ),
                                        dropdownColor: AppConstants.appBlueColor,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            childrenDropdownValue = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          '0 Children',
                                          '1 Children',
                                          '2 Children',
                                          '3 Children',
                                          '4 Children',
                                          '5 Children',
                                          '6 Children',
                                          '7 Children',
                                          '8 Children',
                                          '9 Children',
                                          '10 Children',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.15,
                              child: Column(
                                children: [
                                  Text(
                                    'My policy starts on',
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  TextFormField(
                                    onTap: () {
                                      _onPressed(context: context, field: 'startDate');
                                    },
                                    controller: _startDateController,
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                    ),
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      hintText: 'Select Start Date',
                                      hintStyle: TextStyle(
                                        color: AppConstants.appWhiteColor,
                                        fontSize: AppConstants.appFontSizeh3,
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10.0, 0.0, 10.0, 0.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppConstants.appWhiteColor,
                                          width: 1.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppConstants.appWhiteColor,
                                          width: 1.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.15,
                              child: Column(
                                children: [
                                  Text(
                                    'My policy finishes on',
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  TextFormField(
                                    controller: _endDateController,
                                    textAlign: TextAlign.center,
                                    onTap: () {
                                      _onPressed(context: context, field: 'endDate');
                                    },
                                    showCursor: false,
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                    ),
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      hintText: 'Select End Date',
                                      hintStyle: TextStyle(
                                        color: AppConstants.appWhiteColor,
                                        fontSize: AppConstants.appFontSizeh3,
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10.0, 0.0, 10.0, 0.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppConstants.appWhiteColor,
                                          width: 1.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppConstants.appWhiteColor,
                                          width: 1.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: AppButton(
                              width: size.width*0.25,
                              height: 60.0,
                              primaryColor: AppConstants.appGreenColor,
                              borderRadius: 10.0,
                              text: 'Get Quote Now',
                              textColor: AppConstants.appWhiteColor,
                              fontSize: AppConstants.appFontSizeh7,
                              fontWeight: FontWeight.w600,
                              onPressed: () {
                                var value = {
                                  'adults' : '$adultsDropdownValue',
                                  'children' : '$childrenDropdownValue',
                                  'policyStartDate' : _startDateController.text.trim(),
                                  'policyEndDate' : _endDateController.text.trim()
                                };
                                context.read<DataProvider>().setDataOnKey('QuoteData', value);
                                Navigator.pushReplacementNamed(context, '/generic');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    color: AppConstants.appBlackColor.withOpacity(0.7),
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(0.0),
                        bottom: Radius.circular(10.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info_rounded,
                        color: AppConstants.appWhiteColor,
                        size: AppConstants.appFontSizeh8,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppConstants.appPaddingExtraSmall),
                        child: Text(
                          'OSHC is a visa-length cover - you need to get a policy that covers the entire length of your student visa.',
                          style: TextStyle(
                            fontSize: AppConstants.appFontSizeh2,
                            color: AppConstants.appWhiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Message',
        child: const Icon(Icons.message_outlined),
      ),
    );
  }

  Future<void> _onPressed({
    required BuildContext context,
    required String field,
  }) async {
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2024),
    );
    if (selected != null) {
      setState(() {
        _selected = selected;
        if (field == 'startDate') {
          _startDateController.text = '${_selected?.year}-${_selected?.month.toString().padLeft(2, '0')}';
        } else {
          _endDateController.text = '${_selected?.year}-${_selected?.month.toString().padLeft(2, '0')}';
        }
      });
    }
  }
}
