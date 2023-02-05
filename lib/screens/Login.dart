import 'package:easy_shopping/custom-widgets/MyText.dart';
import '/models/user.dart';
import 'package:easy_shopping/services/shared_preferences_service.dart';
import 'package:easy_shopping/custom-widgets/MyTextField.dart';
import 'package:easy_shopping/utilities/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  User user = User(email: '', password: '');
  bool isValid = true;
  PrefService prefService = PrefService();

  Future<void> validate() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var userData = await prefService.readCache();

      if (user.email == userData.email && user.password == userData.password) {
        prefService.authenticate();
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          isValid = false;
        });
      }
    }
  }

  void isLoggedIn() async {
    var isAuthenticated = await prefService.isAuthenticated();
    if (isAuthenticated) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void initState() {
    super.initState();
    isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(displayActionBar: false),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                width: 170.0,
                image: AssetImage('images/login.png'),
              ),
              MyTextField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Required'),
                  EmailValidator(errorText: 'Please enter a valid email'),
                ]),
                onSaved: (val) {
                  user.email = val!;
                },
                label: "Email",
                icon: Icon(Icons.email),
                autoFocus: true,
              ),
              MyTextField(
                isPassword: true,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Required'),
                  MinLengthValidator(6, errorText: 'Min length should be 6'),
                  MaxLengthValidator(12, errorText: 'Max length should be 12'),
                ]),
                onSaved: (val) {
                  user.password = val!;
                },
                label: "Password",
                icon: Icon(Icons.lock),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                  onPressed: () {
                    validate();
                  },
                  child: Text('Login'),
                  color: Colors.blue,
                  elevation: 2.0,
                  hoverColor: Colors.blue[300],
                  minWidth: 200.0,
                  padding: EdgeInsets.all(8.0),
                  textColor: Colors.white,
                ),
              ),
              !isValid
                  ? MyText(
                      text: "Either username or password is incorrect!",
                      paddingAll: 20.0,
                      color: Colors.red,
                    )
                  : MyText(
                      text: '',
                    ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: MyText(
                    text: 'New user, register first!',
                    paddingAll: 20.0,
                    color: Colors.blue,
                    size: 20.0,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
