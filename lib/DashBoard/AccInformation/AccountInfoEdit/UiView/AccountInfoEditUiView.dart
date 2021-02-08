import 'dart:convert';
import 'dart:io';
import 'package:ciblecommerce/DashBoard/AccInformation/AccountInfoEdit/BlocState/AccountInfoEdit_Event.dart';
import 'package:http/http.dart' as http;
import 'package:ciblecommerce/DashBoard/AccInformation/AccInfoDetailsUi.dart';
import 'package:ciblecommerce/DashBoard/AccInformation/AccountInfoEdit/BlocState/AccountInfoEdit_Bloc.dart';
import 'package:ciblecommerce/DashBoard/AccInformation/AccountInfoEdit/BlocState/AccountInfoEdit_States.dart';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:ciblecommerce/widgets/CircularImageShow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountInfoEditUi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountInformationEdit();
  }
}

class AccountInformationEdit extends State<AccountInfoEditUi> {
  SharedPreferences sharedPreferences;
  String imageurl, gender="Male", user_Id;
  File imageFile;
  Future<File> image;
  bool pickupfile;
  int value = 0;
  bool blocvisibility;
  AccountInfoEdit_Bloc accountInfoEdit_Bloc;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController phone = TextEditingController();
  String base64Image;

  final updateUser=GlobalKey<FormState>();
  @override
  void initState() {
    pickupfile = false;
    blocvisibility = false;

    accountInfoEdit_Bloc = BlocProvider.of<AccountInfoEdit_Bloc>(context);
    shahredpreferenceinitial();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AccountInfoDetails())),
          ),
          title: Text(
            "Edit Account Information",
            style: TextStyle(color: CustomColors.TextGrey),
          ),
        ),
        body: Form(
          key: updateUser,
          child: Stack(
            children: [
              blocvisibility==false?ListView(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      pickupfile
                          ? showImage()
                          : CircularImageShow(
                        imageurl: imageurl,
                      ),
                      Positioned(
                        top: 7,
                        right: MediaQuery.of(context).size.width * .38,
                        child: Container(
                          child: InkWell(
                            child: Icon(
                              Icons.edit,
                            ),
                            onTap: () {
                              showPickerImagePickerOption(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .05,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .03),
                            child: TextFormField(
                              controller: firstname,
                              style: TextStyle(fontSize: 14),
                              keyboardType: TextInputType.text,
                              validator: (value){
                                if(value.isEmpty){
                                  return "Name should not empty";
                                }
                                return null;

                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                isDense: true,
                                labelText: "First Name",
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: CustomColors.BellYellow),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * .03),
                            child: TextField(
                              controller: lastname,
                              keyboardType: TextInputType.text,
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                isDense: true,
                                labelText: "Last Name",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: CustomColors.green),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .03),
                    child: TextFormField(
                        controller: phone,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(fontSize: 14),
                        validator: (value){
                          if(value.isEmpty){
                            return "Phone should not empty";
                          }else if(value.length<11){
                            return "Phone number should not less then 11 digit";
                          }
                          return null;

                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          //Left Icon
                          labelText: "Phone Number",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12, width: 0),
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ), //Add rounded corners
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .03),
                    child: TextFormField(
                        controller: email,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 14),
                        validator: (value){
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if(value.isEmpty){
                            return "Email should not empty";
                          }else if(!regex.hasMatch(value)){
                            return 'Enter Valid Email';
                          }
                          return null;

                        },

                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          //Left Icon
                          labelText: "Email Address",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ), //Add rounded corners
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .03),
                    child: TextFormField(
                        controller: address,
                        textAlign: TextAlign.left,
                        validator: (value){
                          if(value.isEmpty){
                            return "Address should not empty";
                          }
                          return null;

                        },
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                          //Left Icon
                          labelText: "Address",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12, width: 0),
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ), //Add rounded corners
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .03),
                    child: Text(
                      "Select Gender:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => setState(() {
                            value = 0;
                            gender = "Male";
                          }),
                          child: Container(
                            height: 56,
                            width: 56,
                            color: value == 0 ? Colors.grey : Colors.transparent,
                            child: Icon(MdiIcons.humanMale),
                          ),
                        ),
                        SizedBox(width: 4),
                        GestureDetector(
                          onTap: () => setState(() {
                            value = 1;
                            gender = "Female";
                          }),
                          child: Container(
                            height: 56,
                            width: 56,
                            color: value == 1 ? Colors.grey : Colors.transparent,
                            child: Icon(MdiIcons.humanFemale),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .03),
                            child: TextField(
                              controller: city,
                              style: TextStyle(fontSize: 14),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                isDense: true,
                                labelText: "City",
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: CustomColors.BellYellow),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * .03),
                            child: TextField(
                              controller: zip,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                isDense: true,
                                labelText: "Zip Code",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: CustomColors.green),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .03),
                            child: TextField(
                              style: TextStyle(fontSize: 14),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                isDense: true,
                                labelText: "District",
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: CustomColors.BellYellow),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * .03),
                            child: TextField(
                              controller: country,
                              keyboardType: TextInputType.text,
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                isDense: true,
                                labelText: "Country",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: CustomColors.green),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .03),
                    child: ButtonTheme(
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            side: BorderSide(color: Colors.red)),
                        onPressed: () {

                          if(updateUser.currentState.validate()){
                            setState(() {
                              FocusScope.of(context).unfocus();
                              blocvisibility = true;
                              pickupfile=false;
                            });
                            if(gender==null){
                              gender="";
                            }

                           accountInfoEdit_Bloc.add(FetchAccountInfoEditEvent(user_id: user_Id, email: email.text, first_name: firstname.text, last_name: lastname.text, phone: phone.text, gender: gender, picture: /*imageFile*/base64Image, address: address.text, city: city.text, country: country.text, zip: zip.text));
                          /*  accountinfoedit(user_id: user_Id, email: email.text, first_name: firstname.text, last_name: lastname.text, phone: phone.text, gender: gender,
                                picture: base64Image, address: address.text, city: city.text, country: country.text, zip: zip.text);
*/

                          }
                        },
                        textColor: Colors.white,
                        padding: EdgeInsets.all(5.0),
                        child: Text("Update", style: TextStyle(fontSize: 14)),
                        color: Colors.red,
                      ),
                    ),
                  ),

                ],
              ):
              Container(child:Visibility(
                visible: blocvisibility,
                child: BlocBuilder<AccountInfoEdit_Bloc, AccountInfoEditState>(
                  builder: (context, state) {
                    if (state is AccountInfoEditInitialState) {
                      return buildLoading();
                    } else if (state is AccountInfoEditLoadingState) {
                      return buildLoading();
                    } else if (state is AccountInfoEditLoadedState) {
                      var response = state.response;
                      Configuration alertdialog = Configuration();
                      if (response == "true") {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          /* SweetAlert.show(context,
                            subtitle: "Your Login Success",
                            style: SweetAlertStyle.success,
                            showCancelButton: false, onPress: (bool isConfirm) {

                              if(isConfirm){
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) => Home()
                                )
                                );
                              }
                              return false;
                            });*/
                          alertdialog.successSweetAlert(
                              context,
                              "Your Account Information Updated Successfully",
                              "success",
                                  () => AccountInfoDetails());
                        });
                      }
                      else {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          alertdialog.loginFailedAlert(context,
                              "Account Information Update Failed", () => AccountInfoEditUi());
                          /* SweetAlert.show(context,
                            subtitle: "Login Filed",
                            style: SweetAlertStyle.error,
                            showCancelButton: false,
                            onPress: (bool isConfirm) {
                              loginbloc.add(InitialEvent());
                              if(isConfirm){
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    LoginRegUI()), (Route<dynamic> route) => false);
                                //Navigator.of(context).pop();
                              }
                              return false;
                            });*/
                        });
                      }
                      return Container();
                    } else {
                      return buildLoading();
                    }
                  },
                ),
              ),) ,
            ],
          ),
        )

    );
  }

  Future shahredpreferenceinitial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      gender="Male";
      imageurl = sharedPreferences.getString("picture");
      if(imageurl==""){
        imageurl = sharedPreferences.getString("profile_image");
      }
      user_Id = sharedPreferences.getString("user_id");

      if(sharedPreferences.getString("firstname")!=""||sharedPreferences.getString("firstname")!=null){
        firstname.text=sharedPreferences.getString("firstname");
      }
      if(sharedPreferences.getString("laststname")!=""||sharedPreferences.getString("laststname")!=null){
        lastname.text=sharedPreferences.getString("laststname");
      }
      if(sharedPreferences.getString("phone")!=""||sharedPreferences.getString("phone")!=null){
        phone.text=sharedPreferences.getString("phone");
      }
      if(sharedPreferences.getString("email")!=""||sharedPreferences.getString("email")!=null){
        email.text=sharedPreferences.getString("email");
      }
      if(sharedPreferences.getString("address")!=""||sharedPreferences.getString("address")!=null){
        address.text=sharedPreferences.getString("address");
      }
      if(sharedPreferences.getString("city")!=""||sharedPreferences.getString("city")!=null){
        city.text=sharedPreferences.getString("city");
      }
      if(sharedPreferences.getString("zip")!=""||sharedPreferences.getString("zip")!=null){
        zip.text=sharedPreferences.getString("zip");
      }
      if(sharedPreferences.getString("country")!=""||sharedPreferences.getString("country")!=null){
        country.text=sharedPreferences.getString("country");
      }
      if(sharedPreferences.getString("gender")!=""||sharedPreferences.getString("gender")!=null){
        gender=sharedPreferences.getString("gender");
      }else{
        gender="Male";
      }

    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: image,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          sharedPreferences.setString("profile_image", base64Image);
          return CircleAvatar(
              radius: 70,
              backgroundColor: Color(0xffCACECE),
              child: ClipOval(

                  child: Image.file(
                    snapshot.data,
                    width: 120,
                    height: 120,
                    fit: BoxFit.fill,
                  ),

              ));
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  pickImageFromGallery(ImageSource source) async {
    final picker = ImagePicker();
  //  final pickedFile =  await picker.getImage(source: source);
    setState(() {
      pickupfile = true;
      image =  ImagePicker.pickImage(source: source);
      image.then((value){
        this.imageFile=value;
      });
      imageFile=imageFile;
      //image =(File(pickedFile.path)) as Future<File>;
    });


  }

  Widget buildLoading({bool frominit = true}) {
    return frominit
        ? Center(
            child: Visibility(
              visible: true,
              child: CircularProgressIndicator(),
            ),
          )
        : Container();
  }


  accountinfoedit({String user_id, String email, String first_name, String last_name, String phone, String gender,
    String picture, String address, String city, String country, String zip})async{
    buildLoading();

    Map body={
      "user_id":user_id,
      "first_name":first_name,
      "last_name":last_name,
      "phone":phone,
      "gender":gender,
      "picture":picture,
      "address":address,
      "city":city,
      "zip":zip,
      "email":email,
      "country":country
    };

    try{
      print(Configuration.BASE_URLSean+"api/customers/edit");
      final response=await http.post(Configuration.BASE_URL+"api/customers/update",
        body: body,);
      print(response.statusCode);
      Configuration alertdialog = Configuration();
      if(response.statusCode==200){
        String responses=response.body.toString();
        var responsedecode=json.decode(responses);
        var isSuccess=responsedecode["success"];
        if(isSuccess==true){
          WidgetsBinding.instance.addPostFrameCallback((_) {
            alertdialog.successSweetAlert(
                context,
                "Your Account Information Updated Successfully",
                "success",
                    () => AccountInfoDetails());
          });

          //return "true";
        }else{
          WidgetsBinding.instance.addPostFrameCallback((_) {
            alertdialog.loginFailedAlert(context,
                "Account Information Update Failed", () => AccountInfoEditUi());
            /* SweetAlert.show(context,
                            subtitle: "Login Filed",
                            style: SweetAlertStyle.error,
                            showCancelButton: false,
                            onPress: (bool isConfirm) {
                              loginbloc.add(InitialEvent());
                              if(isConfirm){
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    LoginRegUI()), (Route<dynamic> route) => false);
                                //Navigator.of(context).pop();
                              }
                              return false;
                            });*/
          });

        }

      }
    }catch(e){

    }
  }

  void showPickerImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        pickImageFromGallery(ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      pickImageFromGallery(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


}
