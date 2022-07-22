import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Constants/AppConstants.dart';
import '../../../DataLayer/Data.dart';
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
    return Column(
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
                padding: EdgeInsets.all(AppConstants.appPaddingExtraSmall),
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
                          context.read<DataProvider>().Data['QuoteData']
                                  ['adults'] ??
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
                          'Children',
                          style: TextStyle(
                            color: AppConstants.appGreyTextColor,
                            fontSize: AppConstants.appFontSizeh3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          context.read<DataProvider>().Data['QuoteData']
                                  ['children'] ??
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
                          fontSize: AppConstants.appFontSizeh2,
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
                padding: EdgeInsets.fromLTRB(AppConstants.appPaddingSmall, 0.0,
                    AppConstants.appPaddingSmall, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < Data.providerImages.length; i++)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Provider Image Container
                          Container(
                            width: 120.0,
                            height: 80.0,
                            child: Center(
                              child: Image(
                                image:
                                    AssetImage(Data.providerImages[i]['image']),
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 120.0,
                                      // height: 80.0,
                                      child: Text(
                                        Data.providerImages[i]['price'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: AppConstants.appFontSizeh7,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppConstants.appPaddingSmall,
                                    ),
                                    AppButton(
                                      width: 100.0,
                                      height: 50.0,
                                      primaryColor: AppConstants.appGreenColor,
                                      borderRadius: 5.0,
                                      text: 'Buy Now',
                                      fontSize: AppConstants.appFontSizeh2,
                                      fontWeight: FontWeight.normal,
                                      textColor: AppConstants.appWhiteColor,
                                      onPressed: () {},
                                    ),
                                    SizedBox(
                                      height: AppConstants.appPaddingSmall,
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
          ],
        ),

        SizedBox(
          height: AppConstants.appPaddingLarge,
        ),

        // Information Header Row
        Row(
          children: [
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
                padding: EdgeInsets.fromLTRB(AppConstants.appPaddingSmall, 0.0,
                    AppConstants.appPaddingSmall, 0.0),
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
      ],
    );
  }
}
