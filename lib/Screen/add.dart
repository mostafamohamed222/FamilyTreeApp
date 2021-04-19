import 'dart:io';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/homepage.dart';
import 'package:treeapp/models/memberContorller.dart';

class Manager extends StatefulWidget {
  String type;
  Manager({this.type});
  @override
  _ManagerState createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {
  bool loading = false;
  DateTime birthDate;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameTextController = TextEditingController();
  TextEditingController _lastNameTextController = TextEditingController();
  TextEditingController _numberTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _cityTextController = TextEditingController();
  TextEditingController _addressTextController = TextEditingController();

  //select gender method
  List gender = ["ذكر", "انثي"];
  String genderr;
  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: genderr,
          onChanged: (value) {
            setState(() {
              print(value);
              genderr = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  //select live or dead
  List<bool> status = [true, false];
  bool alive;
  Row addRadioButtonn(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: status[btnValue],
          groupValue: alive,
          onChanged: (value) {
            setState(() {
              print(value);
              alive = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  //select manager or client
  List<int> client = [0, 1];
  int clientORmanager;
  Row addRadioButtonnn(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: client[btnValue],
          groupValue: clientORmanager,
          onChanged: (value) {
            setState(() {
              print(value);
              clientORmanager = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  //select image picker dailog
  File imageFile;
  final picker = ImagePicker();
  Future<void> showCoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              '..حدد طريقة اختيار الصورة',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
                      child: Text('معرض الصور'),
                    ),
                    onTap: () {
                      opengallary(context);
                    },
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
                      child: Text('التقاط صورة'),
                    ),
                    onTap: () {
                      opencamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  opengallary(BuildContext context) async {
    var picture = await ImagePicker().getImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = File(picture.path);
    });
    Navigator.of(context).pop();
  }

  opencamera(BuildContext context) async {
    var picture = await ImagePicker().getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = File(picture.path);
    });
    Navigator.of(context).pop();
  }

  Widget imagaeView() {
    if (imageFile == null) {
      return Text('لم يتم تحديد الصورة');
    } else {
      return ClipOval(
        child: Image.file(
          imageFile,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  filed({
    String hintText,
    String validatorMass,
    TextEditingController cont,
    TextInputType keyBord = TextInputType.multiline,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        textAlign: TextAlign.right,
        keyboardType: keyBord,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return validatorMass;
          } else {
            return null;
          }
        },
        controller: cont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == "1") {
      _lastNameTextController.text =
          Provider.of<MemberContorller>(context).currentModel.name;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
        ),
        body: ListView(
          children: [
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     child: Column(
                      //       children: [
                      //         imagaeView(),
                      //         IconButton(
                      //           icon: const Icon(Icons.photo_camera,
                      //               size: 50, color: Colors.brown),
                      //           tooltip: 'حدد صورة',
                      //           onPressed: () async {
                      //             await showCoiceDialog(context);
                      //           },
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            addRadioButton(1, 'انثي'),
                            addRadioButton(0, 'ذكر'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: addRadioButtonnn(1, 'مدير'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: addRadioButtonnn(0, 'مستخدم'),
                            ),
                          ],
                        ),
                      ),
                      filed(
                        hintText: "الاسم الاول",
                        validatorMass: "من فضلك ادخل الاسم الاول",
                        cont: _firstNameTextController,
                      ),
                      filed(
                        hintText: "اسم الاب ",
                        validatorMass: "من فضلك ادخل  اسم الاب",
                        cont: _lastNameTextController,
                      ),
                      filed(
                        hintText: "رقم الهاتف ",
                        validatorMass: "من فضلك ادخل   رقم الهاتف",
                        cont: _numberTextController,
                        keyBord: TextInputType.number,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.multiline,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: ' البريد الالكتروني ',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'من فضلك ادخل البريد الالكتروني';
                            } else {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value)) {
                                return 'هذا البريد غير صحيح';
                              }
                              return null;
                            }
                          },
                          controller: _emailTextController,
                        ),
                      ),
                      filed(
                        hintText: "اسم المدينة",
                        validatorMass: "من فضلك ادخل اسم المدينة",
                        cont: _cityTextController,
                      ),
                      filed(
                        hintText: "العنوان",
                        validatorMass: "من فضلك ادخل العنوان",
                        cont: _addressTextController,
                      ),
                      DateTimeFormField(
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.black45,
                          ),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          prefixIcon: Icon(Icons.event_note),
                          labelText: '',
                          suffixText: 'تاريخ الميلاد',
                        ),
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) => (e?.day ?? 0) == 1
                            ? 'Please not the first day'
                            : null,
                        onDateSelected: (DateTime value) {
                          birthDate = value;
                          print(birthDate);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: addRadioButtonn(1, 'ميت'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: addRadioButtonn(0, 'حي'),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.indigo,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 35.0, 8.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.indigo,
                          child: MaterialButton(
                            onPressed: () {
                              String birthDay = new DateFormat("yyyy-MM-dd")
                                  .format(birthDate);
                              final String email = _emailTextController.text;
                              if (_formKey.currentState.validate()) {
                                Provider.of<MemberContorller>(context,
                                        listen: false)
                                    .addmember(
                                  type: widget.type,
                                  address: _addressTextController.text,
                                  city: _cityTextController.text,
                                  date: birthDate,
                                  email: _emailTextController.text,
                                  firstName: _firstNameTextController.text,
                                  lastName: _lastNameTextController.text,
                                  phone: _numberTextController.text,
                                  parent: Provider.of<MemberContorller>(context,
                                          listen: false)
                                      .currentModel
                                      .id,
                                );
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (Route<dynamic> route) => false,
                                );
                              } else {
                                return null;
                              }
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              " تسجيل",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: loading ?? true,
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.white.withOpacity(0.7),
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
