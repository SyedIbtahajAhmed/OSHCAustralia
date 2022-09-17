import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Constants/AppConstants.dart';
import '../../../DataLayer/Data.dart';
import '../../../DataLayer/Database/database.dart';
import '../../../DataLayer/Providers/breadCrumbsProvider.dart';
import '../../../DataLayer/Providers/dataProvider.dart';
import '../../../UserControls/appButton.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return IntrinsicHeight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Quote and Providers Row
          Row(
            children: [
              // Quote Container
              Container(
                width: size.width * 0.15,
                height: size.height * 0.27,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppConstants.appBlackColor,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      AppConstants.appPaddingExtraSmall,
                      AppConstants.appPaddingExtraSmall,
                      0.0,
                      AppConstants.appPaddingExtraSmall),
                  child: Column(
                    children: [
                      Text(
                        'Your Quote',
                        style: TextStyle(
                          fontSize: AppConstants.appFontSizeh4,
                          color: AppConstants.appGreyTextColor,
                        ),
                      ),
                      SizedBox(
                        height: AppConstants.appPaddingSmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Adults',
                            style: TextStyle(
                              color: AppConstants.appGreyTextColor,
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            context.read<DataProvider>().Data['QuoteData']['adults'] == '1' ? '${context.read<DataProvider>().Data['QuoteData']['adults']} adult' : '${context.read<DataProvider>().Data['QuoteData']['adults']} adults',
                            style: TextStyle(
                              color: AppConstants.appGreyTextColor,
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppConstants.appPaddingSmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Children',
                            style: TextStyle(
                              color: AppConstants.appGreyTextColor,
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            context.read<DataProvider>().Data['QuoteData']['children'] == '1' ? '${context.read<DataProvider>().Data['QuoteData']['children']} child' : '${context.read<DataProvider>().Data['QuoteData']['children']} children',
                            style: TextStyle(
                              color: AppConstants.appGreyTextColor,
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppConstants.appPaddingSmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Policy Start',
                            style: TextStyle(
                              color: AppConstants.appGreyTextColor,
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            context.read<DataProvider>().Data['QuoteData']
                                    ['policyStartDate'] ??
                                '--',
                            style: TextStyle(
                              color: AppConstants.appGreyTextColor,
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppConstants.appPaddingSmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Policy End',
                            style: TextStyle(
                              color: AppConstants.appGreyTextColor,
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            context.read<DataProvider>().Data['QuoteData']
                                    ['policyEndDate'] ??
                                '--',
                            style: TextStyle(
                              color: AppConstants.appGreyTextColor,
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppConstants.appPaddingSmall,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: AppButton(
                            width: size.width * 0.13,
                            height: 30.0,
                            primaryColor: AppConstants.appDarkBlueColor,
                            borderRadius: 5.0,
                            text: 'Save Quote for Later',
                            textColor: AppConstants.appWhiteColor,
                            fontSize: AppConstants.appFontSizeh1,
                            fontWeight: FontWeight.normal,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Providers Container
              Expanded(
                child: Container(
                  height: size.height * 0.27,
                  // color: Colors.red,
                  padding: EdgeInsets.fromLTRB(
                      AppConstants.appPaddingSmall, 0.0, 0.0, 0.0),

                  child: StreamBuilder<Map<String, double>>(
                    stream: Database.getQuotes(
                        context,
                        context.read<DataProvider>().Data['QuoteData']
                                ['adults'] ??
                            '1',
                        context.read<DataProvider>().Data['QuoteData']
                                ['children'] ??
                            '0'),
                    // context.read<DataProvider>().Data['QuoteData']['adults'],
                    // context.read<DataProvider>().Data['QuoteData']
                    //     ['children']),
                    builder: (BuildContext context,
                        AsyncSnapshot<Map<String, double>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container();
                      } else {
                        if (!snapshot.hasError) {
                          Map<String, double> data = snapshot.data!;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (String key in data.keys)
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Provider Image Container
                                    Container(
                                      width: 140.0,
                                      height: 80.0,
                                      child: Center(
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/$key.jpg"),
                                          width: 120.0,
                                        ),
                                      ),
                                    ),
                                    // Price And Button Container
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: size.height * 0.14,
                                          color: AppConstants.appGreyColor,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 140.0,
                                                // height: 80.0,
                                                child: Text(
                                                  '\$${data[key]!.toStringAsFixed(2)}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: AppConstants
                                                        .appFontSizeh7,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppConstants
                                                    .appPaddingSmall,
                                              ),
                                              AppButton(
                                                width: 100.0,
                                                height: 50.0,
                                                primaryColor:
                                                    AppConstants.appGreenColor,
                                                borderRadius: 5.0,
                                                text: 'Buy Now',
                                                fontSize:
                                                    AppConstants.appFontSizeh1,
                                                fontWeight: FontWeight.normal,
                                                textColor:
                                                    AppConstants.appWhiteColor,
                                                onPressed: () {
                                                  setState(() {
                                                    context
                                                        .read<DataProvider>()
                                                        .setDataOnKey(
                                                            'SelectedProviderData',
                                                            {
                                                          'name': key,
                                                          'amount': data[key],
                                                        });
                                                    context
                                                        .read<
                                                            BreadCrumbsProvider>()
                                                        .incrementBreadCrumb();
                                                  });
                                                },
                                              ),
                                              SizedBox(
                                                height: AppConstants
                                                    .appPaddingSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          );
                        }

                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: AppConstants.appPaddingLarge,
          ),

          // Information Header Row
          // First Row
          Row(
            children: [
              // First Row
              Container(
                width: size.width * 0.15,
                height: 64.0,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 30.0,
                      color: AppConstants.appMidBlueColor,
                      child: Padding(
                        padding: EdgeInsets.all(
                            AppConstants.appPaddingExtraExtraSmall),
                        child: Text(
                          'Why buy with us?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppConstants.appWhiteColor,
                            fontSize: AppConstants.appFontSizeh4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.appPaddingExtraExtraSmall,
                    ),
                    Container(
                      color: AppConstants.appBlueColor,
                      height: 30.0,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(
                              AppConstants.appPaddingExtraExtraSmall),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.question_mark_outlined,
                                size: AppConstants.appFontSizeh5,
                                color: AppConstants.appWhiteColor,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Latest Offers',
                                style: TextStyle(
                                  color: AppConstants.appWhiteColor,
                                  fontSize: AppConstants.appFontSizeh3,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      AppConstants.appPaddingSmall, 0.0, 0.0, 0.0),
                  child: Container(
                    color: AppConstants.appMidBlueColor,
                    height: 64.0,
                    padding: EdgeInsets.fromLTRB(AppConstants.appPaddingSmall,
                        0.0, AppConstants.appPaddingSmall, 0.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.question_mark_outlined,
                          size: AppConstants.appFontSizeh5,
                          color: AppConstants.appWhiteColor,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Pay your OSHC with Cohort Go Payments and save.',
                          style: TextStyle(
                            color: AppConstants.appWhiteColor,
                            fontSize: AppConstants.appFontSizeh4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),

          // Visa Compliance
          // Second Row
          Padding(
            padding: EdgeInsets.only(top: AppConstants.appPaddingSmall),
            child: Row(
              children: [
                // Left Container
                IntrinsicHeight(
                  child: Container(
                    width: size.width * 0.15,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 30.0,
                          color: AppConstants.appMidBlueColor,
                          child: Padding(
                            padding: EdgeInsets.all(
                                AppConstants.appPaddingExtraExtraSmall),
                            child: Text(
                              'Visa Compliance?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppConstants.appWhiteColor,
                                fontSize: AppConstants.appFontSizeh4,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.appPaddingExtraExtraSmall,
                        ),
                        Container(
                          color: AppConstants.appBlueColor,
                          height: 30.0,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(
                                  AppConstants.appPaddingExtraExtraSmall),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.question_mark_outlined,
                                    size: AppConstants.appFontSizeh5,
                                    color: AppConstants.appWhiteColor,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Meets government requirements',
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.appPaddingExtraExtraSmall,
                        ),
                        Container(
                          color: AppConstants.appBlueColor,
                          height: 30.0,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(
                                  AppConstants.appPaddingExtraExtraSmall),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.question_mark_outlined,
                                    size: AppConstants.appFontSizeh5,
                                    color: AppConstants.appWhiteColor,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Apply directly on this website',
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        AppConstants.appPaddingSmall, 0.0, 0.0, 0.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: AppConstants.appPaddingExtraExtraSmall,
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0; i < 6; i++)
                                Container(
                                  width: 140.0,
                                  color: AppConstants.appGreyColor,
                                  child: Center(
                                    child: Icon(
                                      Icons.check_box,
                                      color: AppConstants.appGreenColor,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.appPaddingExtraExtraSmall,
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0; i < 6; i++)
                                Container(
                                  width: 140.0,
                                  color: AppConstants.appGreyColor,
                                  child: Center(
                                    child: Icon(
                                      Icons.check_box,
                                      color: AppConstants.appGreenColor,
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
              ],
            ),
          ),

          // In Hospital Treatment
          // Second Row
          Padding(
            padding: EdgeInsets.only(top: AppConstants.appPaddingSmall),
            child: Row(
              children: [
                // Left Container
                IntrinsicHeight(
                  child: Container(
                    width: size.width * 0.15,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 30.0,
                          color: AppConstants.appMidBlueColor,
                          child: Padding(
                            padding: EdgeInsets.all(
                                AppConstants.appPaddingExtraExtraSmall),
                            child: Text(
                              'In Hospital Treatment',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppConstants.appWhiteColor,
                                fontSize: AppConstants.appFontSizeh4,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.appPaddingExtraExtraSmall,
                        ),
                        Container(
                          color: AppConstants.appBlueColor,
                          height: 30.0,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(
                                  AppConstants.appPaddingExtraExtraSmall),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.question_mark_outlined,
                                    size: AppConstants.appFontSizeh5,
                                    color: AppConstants.appWhiteColor,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Accommodation',
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.appPaddingExtraExtraSmall,
                        ),
                        Container(
                          color: AppConstants.appBlueColor,
                          height: 50.0,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(
                                  AppConstants.appPaddingExtraExtraSmall),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.question_mark_outlined,
                                    size: AppConstants.appFontSizeh5,
                                    color: AppConstants.appWhiteColor,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Accident and Emergency Services',
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.appPaddingExtraExtraSmall,
                        ),
                        Container(
                          color: AppConstants.appBlueColor,
                          height: 30.0,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(
                                  AppConstants.appPaddingExtraExtraSmall),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.question_mark_outlined,
                                    size: AppConstants.appFontSizeh5,
                                    color: AppConstants.appWhiteColor,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Outpatient and Postoperative',
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.appPaddingExtraExtraSmall,
                        ),
                        Container(
                          color: AppConstants.appBlueColor,
                          height: 30.0,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(
                                  AppConstants.appPaddingExtraExtraSmall),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.question_mark_outlined,
                                    size: AppConstants.appFontSizeh5,
                                    color: AppConstants.appWhiteColor,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Doctor Services',
                                    style: TextStyle(
                                      color: AppConstants.appWhiteColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        AppConstants.appPaddingSmall, 0.0, 0.0, 0.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: AppConstants.appPaddingExtraExtraSmall,
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0; i < 6; i++)
                                Container(
                                  width: 140.0,
                                  color: AppConstants.appGreyColor,
                                  child: Center(
                                    child: Icon(
                                      Icons.check_box,
                                      color: AppConstants.appGreenColor,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.appPaddingExtraExtraSmall,
                        ),
                        SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 140.0,
                                color: AppConstants.appGreyColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check_box,
                                      color: AppConstants.appGreenColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: AppConstants
                                              .appPaddingExtraExtraSmall),
                                      child: Text(
                                        'All Hospitals',
                                        style: TextStyle(
                                          fontSize: AppConstants.appFontSizeh1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 140.0,
                                color: AppConstants.appGreyColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check_box,
                                      color: AppConstants.appGreenColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: AppConstants
                                              .appPaddingExtraExtraSmall),
                                      child: Text(
                                        'All Hospitals',
                                        style: TextStyle(
                                          fontSize: AppConstants.appFontSizeh1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 140.0,
                                color: AppConstants.appGreyColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check_box,
                                      color: AppConstants.appGreenColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: AppConstants
                                              .appPaddingExtraExtraSmall),
                                      child: Text(
                                        'Public and Agreement only',
                                        style: TextStyle(
                                          fontSize: AppConstants.appFontSizeh1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 140.0,
                                color: AppConstants.appGreyColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check_box,
                                      color: AppConstants.appGreenColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: AppConstants
                                              .appPaddingExtraExtraSmall),
                                      child: Text(
                                        'Public and Agreement only',
                                        style: TextStyle(
                                          fontSize: AppConstants.appFontSizeh1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 140.0,
                                color: AppConstants.appGreyColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check_box,
                                      color: AppConstants.appGreenColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: AppConstants
                                              .appPaddingExtraExtraSmall),
                                      child: Text(
                                        'All Hospitals',
                                        style: TextStyle(
                                          fontSize: AppConstants.appFontSizeh1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 140.0,
                                color: AppConstants.appGreyColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check_box,
                                      color: AppConstants.appGreenColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: AppConstants
                                              .appPaddingExtraExtraSmall),
                                      child: Text(
                                        'Public and Agreement only',
                                        style: TextStyle(
                                          fontSize: AppConstants.appFontSizeh1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.appPaddingExtraExtraSmall,
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0; i < 6; i++)
                                Container(
                                  width: 140.0,
                                  color: AppConstants.appGreyColor,
                                  child: Center(
                                    child: Icon(
                                      Icons.check_box,
                                      color: AppConstants.appGreenColor,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.appPaddingExtraExtraSmall,
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0; i < 6; i++)
                                Container(
                                  width: 140.0,
                                  color: AppConstants.appGreyColor,
                                  child: Center(
                                    child: Icon(
                                      Icons.check_box,
                                      color: AppConstants.appGreenColor,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
