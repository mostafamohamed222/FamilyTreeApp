import 'dart:io';
import 'package:date_field/date_field.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/homepage.dart';
import 'package:treeapp/Screen/uploadimageapi.dart';
import 'package:treeapp/models/memberContorller.dart';

class Update extends StatefulWidget {
  String type;
  Update({this.type});
  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  bool loading = false;
  UploadTask task;
  DateTime birthDate;
  DateTime deathDate;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameTextController = TextEditingController();
  TextEditingController _numberTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _cityTextController = TextEditingController();
  TextEditingController _addressTextController = TextEditingController();
  TextEditingController _jobTextController = TextEditingController();


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
  String url;
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
  Future uploadImage()async{
    if(imageFile==null)return;
    final imagename=imageFile.path;
    final des= 'files/$imagename';
    task =FirebaseApi.uploadFile(des, imageFile);
    if(task==null)return;
    final snapshot=await task.whenComplete(() {});
    final urlDownload=await snapshot.ref.getDownloadURL();
    url = urlDownload;
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
    if (widget.type == "first") {
      print("hi");

      _firstNameTextController.text =
          Provider.of<MemberContorller>(context).currentModel.name;
      _cityTextController.text =
          Provider.of<MemberContorller>(context).currentModel.city;
      _addressTextController.text =
          Provider.of<MemberContorller>(context).currentModel.add;
      _numberTextController.text =
          Provider.of<MemberContorller>(context).currentModel.phone;
      _jobTextController.text =
          Provider.of<MemberContorller>(context).currentModel.job;
      _emailTextController.text =
          Provider.of<MemberContorller>(context).currentModel.email;
      _cityTextController.text =
          Provider.of<MemberContorller>(context).currentModel.city;
      widget.type = "";
      print(_emailTextController.text);
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              imagaeView(),
                              IconButton(
                                icon: const Icon(Icons.photo_camera,
                                    size: 50, color: Colors.brown),
                                tooltip: 'حدد صورة',
                                onPressed: () async {
                                  await showCoiceDialog(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      filed(
                        hintText: "الوظيقة",
                        validatorMass: "من فضلك ادخل الوظفية",
                        cont: _jobTextController,
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
                          controller: _emailTextController,
                        ),
                      ),
                      filed(
                        hintText: "اسم المدينة",
                        validatorMass: "من فضلك ادخل اسم المدينة",
                        cont: _cityTextController,
                      ),
                      filed(
                        hintText: "الحي",
                        validatorMass: "من فضلك ادخل الحي",
                        cont: _addressTextController,
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
                      alive == false
                          ? DateTimeFormField(
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
                          suffixText: 'تاريخ الوفاة',
                        ),
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        onDateSelected: (DateTime value) {
                          deathDate = value;
                        },
                      )
                          :Text("") ,
                      Divider(
                        color: Colors.indigo,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 35.0, 8.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.indigo,
                          child: MaterialButton(
                            onPressed: () async{
                              await uploadImage();
                              if (_formKey.currentState.validate()) {
                                for (var x in Provider.of<MemberContorller>(
                                    context,
                                    listen: false)
                                    .allMember) {
                                  if (x.id ==
                                      Provider.of<MemberContorller>(context,
                                          listen: false)
                                          .currentModel
                                          .id) {
                                    x.image=url!=null?url:x.image;
                                    x.city = _cityTextController.text;
                                    x.phone = _numberTextController.text;
                                    x.job = _jobTextController.text;
                                    x.email = _emailTextController.text;
                                    x.alive = alive == false ? "متوفي" : "حي";
                                    x.add=_addressTextController.text;
                                 if(deathDate!=null){
                                   x.dday = deathDate.day.toString();
                                   x.dmon = deathDate.month.toString();
                                   x.dyear = deathDate.year.toString();
                                 }
                                  }
                                }
                                Provider.of<MemberContorller>(context,
                                    listen: false)
                                    .update(Provider.of<MemberContorller>(
                                    context,
                                    listen: false)
                                    .currentModel
                                    .id);
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
                              "تعديل",
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