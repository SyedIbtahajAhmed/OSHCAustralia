import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:oshcaustralia/Constants/AppConstants.dart';
import 'package:oshcaustralia/UserControls/appTextButton.dart';
import 'package:provider/provider.dart';

import '../../DataLayer/Providers/breadCrumbsProvider.dart';
import '../../DataLayer/Providers/dataProvider.dart';
import '../../UserControls/appButton.dart';
import 'ChildComponents/providerScreen.dart';

class GenericScreen extends StatefulWidget {
  const GenericScreen({Key? key}) : super(key: key);

  @override
  State<GenericScreen> createState() => _GenericScreenState();
}

class _GenericScreenState extends State<GenericScreen> {
  bool _male = false;
  bool _female = false;
  bool _declaration = false;
  bool _acceptance = false;
  DateTime? _selected;
  var adultsDropdownValue;
  var childrenDropdownValue;
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontsize = 13;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120.0,
        flexibleSpace: ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.transparent],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
          },
          blendMode: BlendMode.dstIn,
          child: Image.asset(
            'assets/images/main-back.jpg',
            height: 120.0,
            fit: BoxFit.cover,
          ),
        ),
        // backgroundColor: AppConstants.appBlueColor,
        title: SvgPicture.asset(
          'assets/svgs/logo-white.svg',
          height: size.width * 0.04,
        ),
        scrolledUnderElevation: 20.0,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          setState(() {
            context.read<BreadCrumbsProvider>().incrementBreadCrumb();
          });
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(80.0, 80.0),
          primary: AppConstants.appBlueColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: AppConstants.appWhiteColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
        child: Icon(
          Icons.message_outlined,
          size: AppConstants.appFontSizeh8,
          color: AppConstants.appWhiteColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Body Container
            IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.all(
                  AppConstants.appPaddingLarge,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Side Content
                        IntrinsicHeight(
                          child: SizedBox(
                            width: size.width * 0.25,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Your Quote Container
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: AppConstants.appPaddingSmall),
                                  child: Container(
                                    width: double.infinity,
                                    height: size.height * 0.45,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppConstants.appBlackColor,
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          AppConstants.appPaddingSmall),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Your Quote',
                                            style: TextStyle(
                                              color:
                                                  AppConstants.appGreyTextColor,
                                              fontSize:
                                                  AppConstants.appFontSizeh5,
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                AppConstants.appPaddingSmall,
                                          ),
                                          // Form Field Row
                                          Column(
                                            children: [
                                              // Adults Row
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Adults',
                                                    style: TextStyle(
                                                      color: AppConstants
                                                          .appGreyTextColor,
                                                      fontSize: AppConstants
                                                          .appFontSizeh3,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 200.0,
                                                    child: InputDecorator(
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10.0,
                                                                0.0,
                                                                10.0,
                                                                0.0),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: AppConstants
                                                                .appBlueColor,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                      ),
                                                      child:
                                                          DropdownButtonHideUnderline(
                                                        child: DropdownButton<
                                                            String>(
                                                          menuMaxHeight: 150.0,
                                                          value:
                                                              adultsDropdownValue,
                                                          hint: Text(
                                                            'Select Adults',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                              fontSize: AppConstants
                                                                  .appFontSizeh3,
                                                              color: AppConstants
                                                                  .appBlueColor,
                                                            ),
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_downward,
                                                            color: AppConstants
                                                                .appBlueColor,
                                                            size: 16.0,
                                                          ),
                                                          elevation: 12,
                                                          style: TextStyle(
                                                            color: AppConstants
                                                                .appBlueColor,
                                                          ),
                                                          dropdownColor:
                                                              AppConstants
                                                                  .appWhiteColor,
                                                          onChanged: (String?
                                                              newValue) {
                                                            setState(() {
                                                              adultsDropdownValue =
                                                                  newValue!;
                                                            });
                                                          },
                                                          items: <String>[
                                                            '1 Adult',
                                                            '2 Adults',
                                                          ].map<
                                                              DropdownMenuItem<
                                                                  String>>((String
                                                              value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child:
                                                                  Text(value),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: AppConstants
                                                    .appPaddingSmall,
                                              ),
                                              // Children Row
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Children',
                                                    style: TextStyle(
                                                      color: AppConstants
                                                          .appGreyTextColor,
                                                      fontSize: AppConstants
                                                          .appFontSizeh3,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 200.0,
                                                    child: InputDecorator(
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10.0,
                                                                0.0,
                                                                10.0,
                                                                0.0),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: AppConstants
                                                                .appBlueColor,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                      ),
                                                      child:
                                                          DropdownButtonHideUnderline(
                                                        child: DropdownButton<
                                                            String>(
                                                          menuMaxHeight: 150.0,
                                                          value:
                                                              childrenDropdownValue,
                                                          hint: Text(
                                                            'Select Children',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                              fontSize: AppConstants
                                                                  .appFontSizeh3,
                                                              color: AppConstants
                                                                  .appBlueColor,
                                                            ),
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_downward,
                                                            color: AppConstants
                                                                .appBlueColor,
                                                            size: 16.0,
                                                          ),
                                                          elevation: 12,
                                                          style: TextStyle(
                                                            color: AppConstants
                                                                .appBlueColor,
                                                          ),
                                                          dropdownColor:
                                                              AppConstants
                                                                  .appWhiteColor,
                                                          onChanged: (String?
                                                              newValue) {
                                                            setState(() {
                                                              childrenDropdownValue =
                                                                  newValue!;
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
                                                          ].map<
                                                              DropdownMenuItem<
                                                                  String>>((String
                                                              value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child:
                                                                  Text(value),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: AppConstants
                                                    .appPaddingSmall,
                                              ),
                                              // Start Date Row
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'My policy starts on',
                                                    style: TextStyle(
                                                      color: AppConstants
                                                          .appGreyTextColor,
                                                      fontSize: AppConstants
                                                          .appFontSizeh3,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 200.0,
                                                    child: TextFormField(
                                                      onTap: () {
                                                        _onPressed(
                                                            context: context,
                                                            field: 'startDate');
                                                      },
                                                      controller:
                                                          _startDateController,
                                                      textAlign:
                                                          TextAlign.center,
                                                      showCursor: false,
                                                      style: TextStyle(
                                                        color: AppConstants
                                                            .appBlueColor,
                                                        fontSize: AppConstants
                                                            .appFontSizeh3,
                                                      ),
                                                      decoration:
                                                          InputDecoration(
                                                        alignLabelWithHint:
                                                            true,
                                                        hintText:
                                                            'Select Start Date',
                                                        hintStyle: TextStyle(
                                                          color: AppConstants
                                                              .appBlueColor,
                                                          fontSize: AppConstants
                                                              .appFontSizeh3,
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10.0,
                                                                0.0,
                                                                10.0,
                                                                0.0),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: AppConstants
                                                                .appBlueColor,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: AppConstants
                                                                .appBlueColor,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: AppConstants
                                                    .appPaddingSmall,
                                              ),
                                              // End Date Row
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'My policy finishes on',
                                                    style: TextStyle(
                                                      color: AppConstants
                                                          .appGreyTextColor,
                                                      fontSize: AppConstants
                                                          .appFontSizeh3,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 200.0,
                                                    child: TextFormField(
                                                      controller:
                                                          _endDateController,
                                                      textAlign:
                                                          TextAlign.center,
                                                      onTap: () {
                                                        _onPressed(
                                                            context: context,
                                                            field: 'endDate');
                                                      },
                                                      showCursor: false,
                                                      style: TextStyle(
                                                        color: AppConstants
                                                            .appBlueColor,
                                                        fontSize: AppConstants
                                                            .appFontSizeh3,
                                                      ),
                                                      decoration:
                                                          InputDecoration(
                                                        alignLabelWithHint:
                                                            true,
                                                        hintText:
                                                            'Select End Date',
                                                        hintStyle: TextStyle(
                                                          color: AppConstants
                                                              .appBlueColor,
                                                          fontSize: AppConstants
                                                              .appFontSizeh3,
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10.0,
                                                                0.0,
                                                                10.0,
                                                                0.0),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: AppConstants
                                                                .appBlueColor,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: AppConstants
                                                                .appBlueColor,
                                                            width: 1.5,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          // Button
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: AppButton(
                                                width: size.width * 0.2,
                                                height: 40.0,
                                                primaryColor:
                                                    AppConstants.appBlueColor,
                                                borderRadius: 5.0,
                                                text: 'Update Quote',
                                                textColor:
                                                    AppConstants.appWhiteColor,
                                                fontSize:
                                                    AppConstants.appFontSizeh2,
                                                fontWeight: FontWeight.w600,
                                                onPressed: () {
                                                  var value = {
                                                    'adults':
                                                        '$adultsDropdownValue',
                                                    'children':
                                                        '$childrenDropdownValue',
                                                    'policyStartDate':
                                                        _startDateController
                                                            .text
                                                            .trim(),
                                                    'policyEndDate':
                                                        _endDateController.text
                                                            .trim()
                                                  };
                                                  context
                                                      .read<DataProvider>()
                                                      .setDataOnKey(
                                                          'getQuoteData',
                                                          value);
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context, '/generic');
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: size.height * 0.45,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppConstants.appBlackColor,
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        AppConstants.appPaddingSmall),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Save Even More',
                                          style: TextStyle(
                                            color:
                                                AppConstants.appGreyTextColor,
                                            fontSize:
                                                AppConstants.appFontSizeh5,
                                          ),
                                        ),
                                        SizedBox(
                                          height: AppConstants.appPaddingSmall,
                                        ),
                                        Text(
                                          'Pay with Cohort Go.',
                                          style: TextStyle(
                                            color:
                                                AppConstants.appGreyTextColor,
                                            fontSize:
                                                AppConstants.appFontSizeh3,
                                          ),
                                        ),
                                        SizedBox(
                                          height: AppConstants.appPaddingSmall,
                                        ),
                                        SvgPicture.asset(
                                          'assets/svgs/cohort-payment.svg',
                                          height: size.width * 0.06,
                                          theme: null,
                                        ),
                                        SizedBox(
                                          height: AppConstants.appPaddingSmall,
                                        ),
                                        Text(
                                          'Pay your OSHC, tuition, and other study related expenses with Cohort Go to save even more on your policy with competitive foreign exchange rates, multiple payments in the one transaction, and no fees!',
                                          textAlign: TextAlign.justify,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                          style: TextStyle(
                                            color:
                                                AppConstants.appGreyTextColor,
                                            fontSize:
                                                AppConstants.appFontSizeh3,
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: AppTextButton(
                                              text: 'See how it works.',
                                              fontSize:
                                                  AppConstants.appFontSizeh3,
                                              fontWeight: FontWeight.w600,
                                              textColor: Colors.blue.shade700,
                                              onPressed: () {},
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: AppConstants.appPaddingExtraSmall,
                        ),
                        // Right Side Content
                        Expanded(
                          child: IntrinsicHeight(
                            child: Container(
                              // height: size.height * 0.9,
                              // decoration: BoxDecoration(
                              //   border: Border.all(
                              //     color: AppConstants.appBlackColor,
                              //     width: 1.0,
                              //     style: BorderStyle.solid,
                              //   ),
                              //   borderRadius: BorderRadius.circular(5.0),
                              // ),
                              child: Column(
                                children: [
                                  // Bread Crumbs
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Bread Crumb
                                      for (int i = 0;
                                          i <
                                              AppConstants
                                                  .appBreadCrumbs.length;
                                          i++)
                                        Row(
                                          children: [
                                            Container(
                                              width: size.width * 0.15,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: i <=
                                                        context
                                                            .read<
                                                                BreadCrumbsProvider>()
                                                            .selected
                                                    ? AppConstants
                                                        .appDarkBlueColor
                                                    : AppConstants.appGreyColor,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: AppConstants
                                                            .appPaddingSmall),
                                                    child: Text(
                                                      AppConstants
                                                          .appBreadCrumbs[i],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        color: i <=
                                                                context
                                                                    .read<
                                                                        BreadCrumbsProvider>()
                                                                    .selected
                                                            ? AppConstants
                                                                .appWhiteColor
                                                            : AppConstants
                                                                .appDarkBlueColor,
                                                        fontSize: AppConstants
                                                            .appFontSizeh3,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            i !=
                                                    AppConstants.appBreadCrumbs
                                                            .length -
                                                        1
                                                ? Padding(
                                                    padding: EdgeInsets.only(
                                                        left: AppConstants
                                                            .appPaddingSmall),
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: i <
                                                              context
                                                                  .read<
                                                                      BreadCrumbsProvider>()
                                                                  .selected
                                                          ? AppConstants
                                                              .appGreenColor
                                                          : AppConstants
                                                              .appDarkBlueColor,
                                                      size: 20.0,
                                                    ),
                                                  )
                                                : Container(),
                                            i !=
                                                    AppConstants.appBreadCrumbs
                                                            .length -
                                                        1
                                                ? Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: i <
                                                            context
                                                                .read<
                                                                    BreadCrumbsProvider>()
                                                                .selected
                                                        ? AppConstants
                                                            .appGreenColor
                                                        : AppConstants
                                                            .appDarkBlueColor,
                                                    size: 20.0,
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppConstants.appPaddingLarge,
                                  ),
                                  // Quote and Providers Row
                                  const ProviderScreen(),
                                  Padding(padding: EdgeInsets.all(15)),
                                  Container(
                                    width: double.infinity,
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Student Details',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black87),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: AppConstants.appPaddingLarge),
                                    child: const Divider(
                                      color: Colors.black,
                                      thickness: 0.2,
                                    ),
                                  ),
                                  // Form
                                  IntrinsicHeight(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                          width: 200,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '* Title:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 200,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '* Given Name:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 200,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '* Surname:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 600,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '* Date of Birth:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.all(7)),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.all(7)),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '* Gender:  ',
                                              style:
                                                  TextStyle(fontSize: fontsize),
                                            ),
                                            Container(
                                              width: 150.0,
                                              child: CheckboxListTile(
                                                checkColor: Colors.green,
                                                activeColor: Colors.white,
                                                value: _male,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _male = value!;
                                                  });
                                                },
                                                title: Text("Male",
                                                    style: TextStyle(
                                                        fontSize: fontsize,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 2,
                                                        vertical: 2),
                                              ),
                                            ),
                                            Container(
                                              width: 150.0,
                                              child: CheckboxListTile(
                                                checkColor: Colors.green,
                                                activeColor: Colors.white,
                                                value: _female,
                                                onChanged: (value1) {
                                                  setState(() {
                                                    _female = value1!;
                                                  });
                                                },
                                                title: Text("Female",
                                                    style: TextStyle(
                                                        fontSize: fontsize,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 200,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '* Home Country:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 200,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '* Passport Number:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 200,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '* Visa Class:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 300,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '* Eductational Institution:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          child: const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Policy Details',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom:
                                                  AppConstants.appPaddingLarge),
                                          child: const Divider(
                                            color: Colors.black,
                                            thickness: 0.2,
                                          ),
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '* Policy Starts: ',
                                                style: TextStyle(
                                                  color: AppConstants
                                                      .appGreyTextColor,
                                                  fontSize: AppConstants
                                                      .appFontSizeh3,
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.all(15)),
                                              SizedBox(
                                                width: 200.0,
                                                child: TextFormField(
                                                  onTap: () {
                                                    _onPressed(
                                                        context: context,
                                                        field: 'startDate');
                                                  },
                                                  controller:
                                                      _startDateController,
                                                  textAlign: TextAlign.center,
                                                  showCursor: false,
                                                  style: TextStyle(
                                                    color: AppConstants
                                                        .appBlueColor,
                                                    fontSize: AppConstants
                                                        .appFontSizeh3,
                                                  ),
                                                  decoration: InputDecoration(
                                                    alignLabelWithHint: true,
                                                    hintText:
                                                        'Select Start Date',
                                                    hintStyle: TextStyle(
                                                      color: AppConstants
                                                          .appBlackColor,
                                                      fontSize: AppConstants
                                                          .appFontSizeh3,
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .fromLTRB(10.0,
                                                            0.0, 10.0, 0.0),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: AppConstants
                                                            .appBlackColor,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: AppConstants
                                                            .appBlackColor,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ]),
                                        Padding(padding: EdgeInsets.all(8)),
                                        const Text(
                                          "Your policy must start from the date you'll arrive in Australia, or the date that any previous policy ends (or is cancelled).",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '* Policy Ends: ',
                                                style: TextStyle(
                                                  color: AppConstants
                                                      .appGreyTextColor,
                                                  fontSize: AppConstants
                                                      .appFontSizeh3,
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.all(15)),
                                              SizedBox(
                                                width: 200.0,
                                                child: TextFormField(
                                                  onTap: () {
                                                    _onPressed(
                                                        context: context,
                                                        field: 'endDate');
                                                  },
                                                  controller:
                                                      _startDateController,
                                                  textAlign: TextAlign.center,
                                                  showCursor: false,
                                                  decoration: InputDecoration(
                                                    alignLabelWithHint: true,
                                                    hintText: 'Select End Date',
                                                    hintStyle: TextStyle(
                                                      color: AppConstants
                                                          .appBlackColor,
                                                      fontSize: AppConstants
                                                          .appFontSizeh3,
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .fromLTRB(10.0,
                                                            0.0, 10.0, 0.0),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: AppConstants
                                                            .appBlackColor,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: AppConstants
                                                            .appBlackColor,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ]),
                                        Container(
                                          width: double.infinity,
                                          child: const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Contact Details',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom:
                                                  AppConstants.appPaddingLarge),
                                          child: const Divider(
                                            color: Colors.black,
                                            thickness: 0.2,
                                          ),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 300,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '* Mobile Phone Number:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.grey,
                                                              width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 300,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '* Agent email:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText:
                                                        "hussain@visionconsultants.com.au",
                                                    border: OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.grey,
                                                                width: 5.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(8)),
                                        const Text(
                                          "A copy of your certificate will be sent to your agent which will include the personal details you've entered here.",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 300,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '* Email:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.grey,
                                                              width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 300,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '* Email confirmation:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.grey,
                                                              width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(8)),
                                        const Text(
                                          "A copy of your certificate will be sent to your agent which will include the personal details you've entered here.",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        Container(
                                          width: double.infinity,
                                          child: const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Australian Address Details',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom:
                                                  AppConstants.appPaddingLarge),
                                          child: const Divider(
                                            color: Colors.black,
                                            thickness: 0.2,
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(8)),
                                        Container(
                                          width: double.infinity,
                                          child: const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Leave these details blank if you don't yet have an Australian address",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 200,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Address:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 300,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Address2:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 200,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Postcode:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 300,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Suburb:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        SizedBox(
                                          height: 30,
                                          width: 200,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'State:  ',
                                                style: TextStyle(
                                                    fontSize: fontsize),
                                              ),
                                              Flexible(
                                                child: TextField(
                                                    decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        Container(
                                          width: double.infinity,
                                          child: const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Terms',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom:
                                                  AppConstants.appPaddingLarge),
                                          child: const Divider(
                                            color: Colors.black,
                                            thickness: 0.2,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Declaration:  ',
                                              style:
                                                  TextStyle(fontSize: fontsize),
                                            ),
                                            Container(
                                              width: 150.0,
                                              child: CheckboxListTile(
                                                checkColor: Colors.green,
                                                activeColor: Colors.white,
                                                value: _declaration,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _declaration = value!;
                                                  });
                                                },
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 2,
                                                        vertical: 2),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Acceptance of Terms:  ',
                                              style:
                                                  TextStyle(fontSize: fontsize),
                                            ),
                                            Container(
                                              width: 150.0,
                                              child: CheckboxListTile(
                                                checkColor: Colors.green,
                                                activeColor: Colors.white,
                                                value: _acceptance,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _acceptance = value!;
                                                  });
                                                },
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 2,
                                                        vertical: 2),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.all(15)),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: AppButton(
                                              width: size.width * 0.2,
                                              height: 40.0,
                                              primaryColor:
                                                  AppConstants.appGreenColor,
                                              borderRadius: 5.0,
                                              text: 'Next',
                                              textColor:
                                                  AppConstants.appWhiteColor,
                                              fontSize:
                                                  AppConstants.appFontSizeh2,
                                              fontWeight: FontWeight.w600,
                                              onPressed: () {
                                                var value = {
                                                  // 'adults':
                                                  //     '$adultsDropdownValue',
                                                  // 'children':
                                                  //     '$childrenDropdownValue',
                                                  // 'policyStartDate':
                                                  //     _startDateController.text
                                                  //         .trim(),
                                                  // 'policyEndDate':
                                                  //     _endDateController.text
                                                  //         .trim()
                                                };
                                                // context
                                                //     .read<DataProvider>()
                                                //     .setDataOnKey(
                                                //         'getQuoteData', value);
                                                // Navigator.pushReplacementNamed(
                                                //     context, '/generic');
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Website Footer
            IntrinsicHeight(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.4,
                    color: AppConstants.appBlueColor,
                    child: Padding(
                      padding: EdgeInsets.all(AppConstants.appPaddingLarge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                            child: Padding(
                              padding:
                                  EdgeInsets.all(AppConstants.appPaddingSmall),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Website Title
                                  SvgPicture.asset(
                                    'assets/svgs/logo-white.svg',
                                    height: size.width * 0.06,
                                    theme: null,
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  Text(
                                    'OSHC Australia was conceived after witnessing the high expense, lack of information and choice international students were getting on their OSHC purchases. We knew there must be a better way!',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          AppTextButton(
                                            text: 'Our Story',
                                            fontSize:
                                                AppConstants.appFontSizeh4,
                                            fontWeight: FontWeight.w500,
                                            textColor:
                                                AppConstants.appWhiteColor,
                                            onPressed: () {},
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          AppTextButton(
                                            text: 'Contact Us',
                                            fontSize:
                                                AppConstants.appFontSizeh4,
                                            fontWeight: FontWeight.w500,
                                            textColor:
                                                AppConstants.appWhiteColor,
                                            onPressed: () {},
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          AppTextButton(
                                            text: 'Blog',
                                            fontSize:
                                                AppConstants.appFontSizeh4,
                                            fontWeight: FontWeight.w500,
                                            textColor:
                                                AppConstants.appWhiteColor,
                                            onPressed: () {},
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          AppTextButton(
                                            text: 'Media',
                                            fontSize:
                                                AppConstants.appFontSizeh4,
                                            fontWeight: FontWeight.w500,
                                            textColor:
                                                AppConstants.appWhiteColor,
                                            onPressed: () {},
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.2,
                            child: Padding(
                              padding:
                                  EdgeInsets.all(AppConstants.appPaddingSmall),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Assistance',
                                    style: TextStyle(
                                      color: AppConstants.appYellowColor,
                                      fontSize: AppConstants.appFontSizeh6,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppTextButton(
                                          text: 'Get Quote Now',
                                          fontSize: AppConstants.appFontSizeh4,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppConstants.appWhiteColor,
                                          onPressed: () {},
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        AppTextButton(
                                          text: 'Studying in Australia',
                                          fontSize: AppConstants.appFontSizeh4,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppConstants.appWhiteColor,
                                          onPressed: () {},
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        AppTextButton(
                                          text: 'Government Info',
                                          fontSize: AppConstants.appFontSizeh4,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppConstants.appWhiteColor,
                                          onPressed: () {},
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        AppTextButton(
                                          text: 'About OSHC',
                                          fontSize: AppConstants.appFontSizeh4,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppConstants.appWhiteColor,
                                          onPressed: () {},
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        AppTextButton(
                                          text: 'Support',
                                          fontSize: AppConstants.appFontSizeh4,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppConstants.appWhiteColor,
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.2,
                            child: Padding(
                              padding:
                                  EdgeInsets.all(AppConstants.appPaddingSmall),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Legal',
                                    style: TextStyle(
                                      color: AppConstants.appYellowColor,
                                      fontSize: AppConstants.appFontSizeh6,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppTextButton(
                                          text: 'Privacy Policy',
                                          fontSize: AppConstants.appFontSizeh4,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppConstants.appWhiteColor,
                                          onPressed: () {},
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        AppTextButton(
                                          text: 'Terms and Conditions',
                                          fontSize: AppConstants.appFontSizeh4,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppConstants.appWhiteColor,
                                          onPressed: () {},
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        AppTextButton(
                                          text: 'Combined FSG and PDS',
                                          fontSize: AppConstants.appFontSizeh4,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppConstants.appWhiteColor,
                                          onPressed: () {},
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 2.0,
                    decoration: BoxDecoration(
                      color: AppConstants.appBlueColor,
                      border: Border(
                        top: BorderSide(
                          color: AppConstants.appBlackColor,
                          width: 1.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  IntrinsicHeight(
                    child: Container(
                      width: double.infinity,
                      color: AppConstants.appBlueColor,
                      child: Padding(
                        padding: EdgeInsets.all(AppConstants.appPaddingLarge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.all(AppConstants.appPaddingSmall),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Copyright © OSHC Australia Pty Ltd 2015-22 ABN 55 161 290 884',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh2,
                                    ),
                                  ),
                                  Text(
                                    'All purchases are protected by 256-bit SSL.',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 100.0),
                              child: SvgPicture.asset(
                                'assets/svgs/cohort.svg',
                                height: 50.0,
                                theme: null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
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
          _startDateController.text =
              '${_selected?.year}-${_selected?.month.toString().padLeft(2, '0')}';
        } else {
          _endDateController.text =
              '${_selected?.year}-${_selected?.month.toString().padLeft(2, '0')}';
        }
      });
    }
  }
}
