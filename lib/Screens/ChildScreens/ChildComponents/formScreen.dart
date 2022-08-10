import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../../Constants/AppConstants.dart';
import '../../../DataLayer/Database/database.dart';
import '../../../UserControls/appButton.dart';

enum Gender { male, female }

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // Student Details Variables
  var _titleDropdownValue;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  DateTime? _selected;
  DateTime date = DateTime.now();
  TextEditingController _dobController = TextEditingController();
  var _homeCountryDropdownValue;
  TextEditingController _passportNoController = TextEditingController();
  var _visaClassDropdownValue;
  TextEditingController _educationInsController = TextEditingController();
  TextEditingController _educationAgentController = TextEditingController();
  Gender? _character = Gender.male;

  // Policy Details Variables
  TextEditingController _policyStartController = TextEditingController();
  TextEditingController _policyEndController = TextEditingController();

  // Contact Details Variables
  TextEditingController _mobilePhoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _emailConfirmationController = TextEditingController();
  bool subscribeCheckbox = false;

  // Australian Address Details Variables
  TextEditingController _addressController = TextEditingController();
  TextEditingController _secondAddressController = TextEditingController();
  TextEditingController _postcodeController = TextEditingController();
  TextEditingController _suburbController = TextEditingController();
  var _stateDropdownValue;

  // Terms Variables
  bool acceptanceCheckbox = false;
  bool declarationCheckbox = false;

  clearFieldsOnSubmit() {
    // Student Details Variables
    _titleDropdownValue = '';
    _nameController.text = '';
    _surnameController.text = '';
    _dobController.text = '';
    _homeCountryDropdownValue = '';
    _passportNoController.text = '';
    _visaClassDropdownValue = '';
    _educationInsController.text = '';
    _educationAgentController.text = '';
    Gender? _character = Gender.male;

    // Policy Details Variables
    _policyStartController.text = '';
    _policyEndController.text = '';

    // Contact Details Variables
    _mobilePhoneController.text = '';
    _emailController.text = '';
    _emailConfirmationController.text = '';
    subscribeCheckbox = false;

    // Australian Address Details Variables
    _addressController.text = '';
    _secondAddressController.text = '';
    _postcodeController.text = '';
    _suburbController.text = '';
    _stateDropdownValue = '';

    // Terms Variables
    acceptanceCheckbox = false;
    declarationCheckbox = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Policy Section
        Text(
          'Policy Summary',
          style: TextStyle(
            fontSize: AppConstants.appFontSizeh8,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.0,
          ),
        ),
        SizedBox(
          height: AppConstants.appPaddingSmall,
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {1: FractionColumnWidth(.8)},
          border: TableBorder.all(
            width: 0.5,
            color: AppConstants.appDarkGreyColor,
          ),
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: AppConstants.appGreyColor,
              ),
              children: [
                SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                        child: Text(
                          "Provider :",
                          style: TextStyle(
                            fontSize: AppConstants.appFontSizeh3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                        child: Text(
                          "CBHS",
                          style: TextStyle(
                            fontSize: AppConstants.appFontSizeh3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: BoxDecoration(
                color: AppConstants.appWhiteColor,
              ),
              children: [
                SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                        child: Text(
                          "Category :",
                          style: TextStyle(
                            fontSize: AppConstants.appFontSizeh3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                        child: Text(
                          "Single",
                          style: TextStyle(
                            fontSize: AppConstants.appFontSizeh3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: BoxDecoration(
                color: AppConstants.appGreyColor,
              ),
              children: [
                SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                        child: Text(
                          "Policy Duration :",
                          style: TextStyle(
                            fontSize: AppConstants.appFontSizeh3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                        child: Text(
                          "2022-09-01  -  2024-08-31",
                          style: TextStyle(
                            fontSize: AppConstants.appFontSizeh3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: BoxDecoration(
                color: AppConstants.appWhiteColor,
              ),
              children: [
                SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                        child: Text(
                          "Cost :",
                          style: TextStyle(
                            fontSize: AppConstants.appFontSizeh3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                        child: Text(
                          "AUD \$1,118.60",
                          style: TextStyle(
                            fontSize: AppConstants.appFontSizeh3,
                            fontWeight: FontWeight.w400,
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
        SizedBox(
          height: AppConstants.appPaddingSmall,
        ),

        // Different Provider Button
        InkWell(
            onTap: () {},
            child: Text(
              'Select a Different Provider',
              style: TextStyle(
                fontSize: AppConstants.appFontSizeh3,
                color: AppConstants.appDarkBlueColor,
              ),
            )),
        SizedBox(
          height: AppConstants.appPaddingLarge,
        ),

        // Form Section Student Information
        const SizedBox(
          width: double.infinity,
          child: Align(
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
          padding: EdgeInsets.only(bottom: AppConstants.appPaddingLarge),
          child: const Divider(
            color: Colors.black,
            thickness: 0.2,
          ),
        ),
        // Student Form Section
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 6,
              md: 4,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Title',
                            style: TextStyle(
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 50.0,
                            child: InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  menuMaxHeight: 150.0,
                                  value: _titleDropdownValue,
                                  hint: Text(
                                    'Select Title',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: AppConstants.appFontSizeh3,
                                      color: AppConstants.appBlueColor,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.arrow_downward,
                                    color: AppConstants.appBlueColor,
                                    size: 16.0,
                                  ),
                                  elevation: 12,
                                  style: TextStyle(
                                    color: AppConstants.appBlueColor,
                                  ),
                                  dropdownColor: AppConstants.appWhiteColor,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _titleDropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Mr',
                                    'Mrs',
                                    'Ms',
                                    'Miss',
                                    'Dr',
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
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 4,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Given Name',
                            style: TextStyle(
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 50.0,
                            child: TextFormField(
                              controller: _nameController,
                              textAlign: TextAlign.left,
                              showCursor: true,
                              style: TextStyle(
                                color: AppConstants.appBlueColor,
                                fontSize: AppConstants.appFontSizeh3,
                              ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: 'Enter Name',
                                hintStyle: TextStyle(
                                  color: AppConstants.appBlueColor,
                                  fontSize: AppConstants.appFontSizeh3,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 4,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      // print(constraints);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Surname',
                            style: TextStyle(
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 50.0,
                            child: TextFormField(
                              controller: _surnameController,
                              textAlign: TextAlign.left,
                              showCursor: true,
                              style: TextStyle(
                                color: AppConstants.appBlueColor,
                                fontSize: AppConstants.appFontSizeh3,
                              ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: 'Enter Surname',
                                hintStyle: TextStyle(
                                  color: AppConstants.appBlueColor,
                                  fontSize: AppConstants.appFontSizeh3,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 6,
              md: 4,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Date of Birth',
                            style: TextStyle(
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 50.0,
                            child: TextFormField(
                              controller: _dobController,
                              textAlign: TextAlign.left,
                              onTap: () async {
                                DateTime? result = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2040),
                                );
                                if (result == null) return;

                                setState(() {
                                  _dobController.text =
                                      '${result.year}-${result.month.toString().padLeft(2, '0')}-${result.day.toString().padLeft(2, '0')}';
                                });
                              },
                              showCursor: false,
                              style: TextStyle(
                                color: AppConstants.appBlueColor,
                                fontSize: AppConstants.appFontSizeh3,
                              ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: 'Select End Date',
                                hintStyle: TextStyle(
                                  color: AppConstants.appBlueColor,
                                  fontSize: AppConstants.appFontSizeh3,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 4,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Gender',
                            style: TextStyle(
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 60.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: (constraints.maxWidth - 150.0) / 2,
                                  height: 60.0,
                                  child: ListTile(
                                    title: const Text('Male'),
                                    leading: Radio<Gender>(
                                      value: Gender.male,
                                      groupValue: _character,
                                      onChanged: (Gender? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  width: (constraints.maxWidth - 150.0) / 2,
                                  height: 60.0,
                                  child: ListTile(
                                    title: const Text('Female'),
                                    leading: Radio<Gender>(
                                      value: Gender.female,
                                      groupValue: _character,
                                      onChanged: (Gender? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 4,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Home Country',
                            style: TextStyle(
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 50.0,
                            child: InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  menuMaxHeight: 150.0,
                                  value: _homeCountryDropdownValue,
                                  hint: Text(
                                    'Select Country',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: AppConstants.appFontSizeh3,
                                      color: AppConstants.appBlueColor,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.arrow_downward,
                                    color: AppConstants.appBlueColor,
                                    size: 16.0,
                                  ),
                                  elevation: 12,
                                  style: TextStyle(
                                    color: AppConstants.appBlueColor,
                                  ),
                                  dropdownColor: AppConstants.appWhiteColor,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _homeCountryDropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Pakistan',
                                    'India',
                                    'United Arab Emirates',
                                    'Afghanistan',
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
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 6,
              md: 4,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Passport No.',
                            style: TextStyle(
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 50.0,
                            child: TextFormField(
                              controller: _passportNoController,
                              textAlign: TextAlign.left,
                              showCursor: true,
                              style: TextStyle(
                                color: AppConstants.appBlueColor,
                                fontSize: AppConstants.appFontSizeh3,
                              ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: 'Enter No.',
                                hintStyle: TextStyle(
                                  color: AppConstants.appBlueColor,
                                  fontSize: AppConstants.appFontSizeh3,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 8,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Visa Class',
                            style: TextStyle(
                              fontSize: AppConstants.appFontSizeh3,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 50.0,
                            child: InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  menuMaxHeight: 150.0,
                                  value: _visaClassDropdownValue,
                                  hint: Text(
                                    'Select Visa',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: AppConstants.appFontSizeh3,
                                      color: AppConstants.appBlueColor,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.arrow_downward,
                                    color: AppConstants.appBlueColor,
                                    size: 16.0,
                                  ),
                                  elevation: 12,
                                  style: TextStyle(
                                    color: AppConstants.appBlueColor,
                                  ),
                                  dropdownColor: AppConstants.appWhiteColor,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _visaClassDropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    '500 - Student Visa',
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
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 6,
              md: 4,
              child: Container(
                height: 95,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Education Institute',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 95.0,
                            child: Column(
                              children: [
                                Container(
                                  height: 40.0,
                                  child: TextFormField(
                                    controller: _educationInsController,
                                    textAlign: TextAlign.left,
                                    showCursor: true,
                                    style: TextStyle(
                                      color: AppConstants.appBlueColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                    ),
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      hintText: 'Enter Institute',
                                      hintStyle: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: AppConstants.appBlueColor,
                                        fontSize: AppConstants.appFontSizeh3,
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10.0, 0.0, 10.0, 0.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppConstants.appBlueColor,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppConstants.appBlueColor,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      AppConstants.appPaddingSmall),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "The institution that you'll be studying at.",
                                      style: TextStyle(
                                        fontSize: AppConstants.appFontSizeh2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 8,
              child: Container(
                height: 95,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Education Agent',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 95.0,
                            child: Column(
                              children: [
                                Container(
                                  height: 40.0,
                                  child: TextFormField(
                                    controller: _educationAgentController,
                                    textAlign: TextAlign.left,
                                    showCursor: true,
                                    style: TextStyle(
                                      color: AppConstants.appBlueColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                    ),
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      hintText: 'Enter Agent',
                                      hintStyle: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: AppConstants.appBlueColor,
                                        fontSize: AppConstants.appFontSizeh3,
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10.0, 0.0, 10.0, 0.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppConstants.appBlueColor,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppConstants.appBlueColor,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      AppConstants.appPaddingSmall),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "The name of your education agent's company. Leave blank if you don't have an agent.",
                                      style: TextStyle(
                                        fontSize: AppConstants.appFontSizeh2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),

        // Form Section Policy Details
        const SizedBox(
          width: double.infinity,
          child: Align(
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
          padding: EdgeInsets.only(bottom: AppConstants.appPaddingLarge),
          child: const Divider(
            color: Colors.black,
            thickness: 0.2,
          ),
        ),
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 6,
              md: 6,
              child: Container(
                height: 125,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Policy Start',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 125.0,
                            child: Column(
                              children: [
                                Container(
                                  width: constraints.maxWidth - 150.0,
                                  height: 40.0,
                                  child: TextFormField(
                                    controller: _policyStartController,
                                    textAlign: TextAlign.left,
                                    onTap: () async {
                                      DateTime? result = await showDatePicker(
                                        context: context,
                                        initialDate: date,
                                        firstDate: DateTime(2020),
                                        lastDate: DateTime(2040),
                                      );
                                      if (result == null) return;

                                      setState(() {
                                        _policyStartController.text =
                                        '${result.year}-${result.month.toString().padLeft(2, '0')}-${result.day.toString().padLeft(2, '0')}';
                                      });
                                    },
                                    showCursor: false,
                                    style: TextStyle(
                                      color: AppConstants.appBlueColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                    ),
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      hintText: 'Select Start Date',
                                      hintStyle: TextStyle(
                                        color: AppConstants.appBlueColor,
                                        fontSize: AppConstants.appFontSizeh3,
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10.0, 0.0, 10.0, 0.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppConstants.appBlueColor,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppConstants.appBlueColor,
                                          width: 1.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      AppConstants.appPaddingSmall),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Your policy must start from the date you'll arrive in Australia, or the date that any previous policy ends (or is cancelled).",
                                      style: TextStyle(
                                        fontSize: AppConstants.appFontSizeh2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 6,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Policy End',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 50.0,
                            child: TextFormField(
                              controller: _policyEndController,
                              textAlign: TextAlign.left,
                              onTap: () async {
                                DateTime? result = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2040),
                                );
                                if (result == null) return;

                                setState(() {
                                  _policyEndController.text = '${result.year}-${result.month.toString().padLeft(2, '0')}-${result.day.toString().padLeft(2, '0')}';
                                });
                              },
                              showCursor: false,
                              style: TextStyle(
                                color: AppConstants.appBlueColor,
                                fontSize: AppConstants.appFontSizeh3,
                              ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: 'Select End Date',
                                hintStyle: TextStyle(
                                  color: AppConstants.appBlueColor,
                                  fontSize: AppConstants.appFontSizeh3,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),

        // Form Section Contact Details
        const SizedBox(
          width: double.infinity,
          child: Align(
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
          padding: EdgeInsets.only(bottom: AppConstants.appPaddingLarge),
          child: const Divider(
            color: Colors.black,
            thickness: 0.2,
          ),
        ),
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 6,
              md: 6,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Mobile Phone',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: _mobilePhoneController,
                              textAlign: TextAlign.left,
                              showCursor: true,
                              style: TextStyle(
                                color: AppConstants.appBlueColor,
                                fontSize: AppConstants.appFontSizeh3,
                              ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: 'Enter No.',
                                hintStyle: TextStyle(
                                  color: AppConstants.appBlueColor,
                                  fontSize: AppConstants.appFontSizeh3,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 6,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: _emailController,
                              textAlign: TextAlign.left,
                              showCursor: true,
                              style: TextStyle(
                                color: AppConstants.appBlueColor,
                                fontSize: AppConstants.appFontSizeh3,
                              ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: 'Enter Email',
                                hintStyle: TextStyle(
                                  color: AppConstants.appBlueColor,
                                  fontSize: AppConstants.appFontSizeh3,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 6,
              md: 6,
              child: Container(
                height: 125,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Email Confirmation',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 125.0,
                            child: Column(
                              children: [
                                Container(
                                  width: constraints.maxWidth - 150.0,
                                  height: 40.0,
                                  child: TextFormField(
                                    controller: _emailConfirmationController,
                                    textAlign: TextAlign.left,
                                    showCursor: true,
                                    style: TextStyle(
                                      color: AppConstants.appBlueColor,
                                      fontSize: AppConstants.appFontSizeh3,
                                    ),
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      hintText: 'Re-Enter Email',
                                      hintStyle: TextStyle(
                                        color: AppConstants.appBlueColor,
                                        fontSize: AppConstants.appFontSizeh3,
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10.0, 0.0, 10.0, 0.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppConstants.appBlueColor,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppConstants.appBlueColor,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      AppConstants.appPaddingSmall),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "We'll be sending your certificate by email, so make sure we've got the right one!",
                                      style: TextStyle(
                                        fontSize: AppConstants.appFontSizeh2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 6,
              child: Container(
                height: 125,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Subscribe',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 125.0,
                            child: Column(
                              children: [
                                Container(
                                  width: constraints.maxWidth - 150.0,
                                  height: 40.0,
                                  child: CheckboxListTile(
                                    title: Text(
                                        "Sign up to receive monthly email newsletters with the latest international study ideas, tips and news. Don’t worry, you can unsubscribe at anytime."),
                                    value: subscribeCheckbox,
                                    onChanged: (newValue) {
                                      setState(() {
                                        subscribeCheckbox = newValue!;
                                      });
                                    },
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      AppConstants.appPaddingSmall),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "View Our ",
                                          style: TextStyle(
                                            fontSize:
                                                AppConstants.appFontSizeh2,
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {},
                                            child: Text(
                                              'Privacy Policy',
                                              style: TextStyle(
                                                color: AppConstants
                                                    .appDarkBlueColor,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),

        // Form Section Australian Address Details
        const SizedBox(
          width: double.infinity,
          child: Align(
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
          padding: EdgeInsets.only(bottom: AppConstants.appPaddingLarge),
          child: const Divider(
            color: Colors.black,
            thickness: 0.2,
          ),
        ),
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 6,
              md: 6,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Address',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: _addressController,
                              textAlign: TextAlign.left,
                              showCursor: true,
                              style: TextStyle(
                                color: AppConstants.appBlueColor,
                                fontSize: AppConstants.appFontSizeh3,
                              ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: 'Enter Address',
                                hintStyle: TextStyle(
                                  color: AppConstants.appBlueColor,
                                  fontSize: AppConstants.appFontSizeh3,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 6,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Second Address',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: _secondAddressController,
                              textAlign: TextAlign.left,
                              showCursor: true,
                              style: TextStyle(
                                color: AppConstants.appBlueColor,
                                fontSize: AppConstants.appFontSizeh3,
                              ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: 'Enter Address',
                                hintStyle: TextStyle(
                                  color: AppConstants.appBlueColor,
                                  fontSize: AppConstants.appFontSizeh3,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 6,
              md: 6,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Postcode',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: _postcodeController,
                              textAlign: TextAlign.left,
                              showCursor: true,
                              style: TextStyle(
                                color: AppConstants.appBlueColor,
                                fontSize: AppConstants.appFontSizeh3,
                              ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: 'Enter Postcode',
                                hintStyle: TextStyle(
                                  color: AppConstants.appBlueColor,
                                  fontSize: AppConstants.appFontSizeh3,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 6,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Suburb',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: _suburbController,
                              textAlign: TextAlign.left,
                              showCursor: true,
                              style: TextStyle(
                                color: AppConstants.appBlueColor,
                                fontSize: AppConstants.appFontSizeh3,
                              ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: 'Enter Suburb',
                                hintStyle: TextStyle(
                                  color: AppConstants.appBlueColor,
                                  fontSize: AppConstants.appFontSizeh3,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 6,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'State',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 50.0,
                            child: InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppConstants.appBlueColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  menuMaxHeight: 150.0,
                                  value: _stateDropdownValue,
                                  hint: Text(
                                    'Select State',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: AppConstants.appFontSizeh3,
                                      color: AppConstants.appBlueColor,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.arrow_downward,
                                    color: AppConstants.appBlueColor,
                                    size: 16.0,
                                  ),
                                  elevation: 12,
                                  style: TextStyle(
                                    color: AppConstants.appBlueColor,
                                  ),
                                  dropdownColor: AppConstants.appWhiteColor,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _stateDropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'ACT',
                                    'NSW',
                                    'NT',
                                    'QLD',
                                    'SA',
                                    'TAS',
                                    'VIC',
                                    'WA',
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
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),

        // Form Section Australian Address Details
        const SizedBox(
          width: double.infinity,
          child: Align(
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
          padding: EdgeInsets.only(bottom: AppConstants.appPaddingLarge),
          child: const Divider(
            color: Colors.black,
            thickness: 0.2,
          ),
        ),
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 6,
              md: 12,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Acceptance of Terms',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 40.0,
                            child: CheckboxListTile(
                              title: const Text(
                                  "I accept the OSHC Australia Terms and Conditions."),
                              value: acceptanceCheckbox,
                              onChanged: (newValue) {
                                setState(() {
                                  acceptanceCheckbox = newValue!;
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 12,
              child: Container(
                height: 60,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: Center(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Declaration',
                                  style: TextStyle(
                                    fontSize: AppConstants.appFontSizeh3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth - 150.0,
                            height: 40.0,
                            child: CheckboxListTile(
                              title: const Text(
                                  "I confirm that I will be the primary visa holder and I am eligible to apply for this policy."),
                              value: declarationCheckbox,
                              onChanged: (newValue) {
                                setState(() {
                                  declarationCheckbox = newValue!;
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),

        // Submit Button
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 6,
              md: 4,
              child: Container(
                height: 80,
                alignment: const Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.appPaddingSmall),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppButton(
                            width: constraints.maxWidth - 150.0,
                            height: 80.0,
                            primaryColor: AppConstants.appGreenColor,
                            borderRadius: 10.0,
                            text: 'Submit Form',
                            textColor: AppConstants.appWhiteColor,
                            fontSize: AppConstants.appFontSizeh7,
                            fontWeight: FontWeight.w600,
                            onPressed: () async {
                              if (_titleDropdownValue != '' &&
                                  _nameController.text != '' &&
                                  _surnameController.text != '' &&
                                  _dobController.text != '' &&
                                  _homeCountryDropdownValue != '' &&
                                  _passportNoController.text != '' &&
                                  _visaClassDropdownValue != '' &&
                                  _educationInsController.text != '' &&
                                  _policyStartController.text != '' &&
                                  _policyEndController.text != '' &&
                                  _mobilePhoneController.text != '' &&
                                  _emailController.text != '' &&
                                  _emailConfirmationController.text != '' &&
                                  acceptanceCheckbox &&
                                  declarationCheckbox) {
                                try {
                                  // Making The Map To Save In DB
                                  Map<String, dynamic> objectToSave = {
                                    'Title' : '$_titleDropdownValue',
                                    'Name' : _nameController.text.trim(),
                                    'Surname' : _surnameController.text.trim(),
                                    'DOB' : _dobController.text.trim(),
                                    'Gender' : _character.toString().split('.')[1],
                                    'HomeCountry' : '$_homeCountryDropdownValue',
                                    'PassportNumber' : _passportNoController.text.trim(),
                                    'VisaClass' : '$_visaClassDropdownValue',
                                    'EducationInstitute' : _educationInsController.text.trim(),
                                    'EducationAgent' : _educationAgentController.text.trim(),
                                    'PolicyStart' : _policyStartController.text.trim(),
                                    'PolicyEnd' : _policyEndController.text.trim(),
                                    'MobilePhoneNumber' : _mobilePhoneController.text.trim(),
                                    'Email' : _emailConfirmationController.text.trim(),
                                    'Subscription' : subscribeCheckbox,
                                    'Address' : _addressController.text.trim(),
                                    'SecondAddress' : _secondAddressController.text.trim(),
                                    'Postcode' : _postcodeController.text.trim(),
                                    'Suburb' : _suburbController.text.trim(),
                                    'State' : '$_stateDropdownValue',
                                  };
                                  var apiResult = await Database.addItem(dataMap: objectToSave);
                                  if (apiResult == 'Form added to the database') {
                                    var snackBar = SnackBar(
                                      content: Text(
                                        'In The Database.',
                                        style: TextStyle(
                                            fontSize: AppConstants.appFontSizeh4),
                                      ),
                                    );
                                    if (mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  }
                                } catch (e) {
                                  var snackBar = SnackBar(
                                    content: Text(
                                      'Something went Wrong.',
                                      style: TextStyle(
                                          fontSize: AppConstants.appFontSizeh4),
                                    ),
                                  );
                                  if (mounted) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                }
                              } else {
                                var snackBar = SnackBar(
                                  content: Text(
                                    'Please Fill All Required Fields.',
                                    style: TextStyle(
                                        fontSize: AppConstants.appFontSizeh4),
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
