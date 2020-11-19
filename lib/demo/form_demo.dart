import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FormDemo"),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.black),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [RegisterForm()],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;

  void submitRegisterForm() {
    registerFormKey.currentState.validate();
    registerFormKey.currentState.save();
    debugPrint("username: $username And password: $password!");
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("Registering Success!")));
  }

  String validatorUsername(String value) {
    if (value.isEmpty) {
      return "Username is required.";
    }
    return null;
  }

  String validatorPassword(String value) {
    if (value.isEmpty) {
      return "Password is required.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: registerFormKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                helperText: '',
                // icon: Icon(Icons.person),
              ),
              onSaved: (value) {
                username = value;
              },
              validator: validatorUsername,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                helperText: '',
                // icon: Icon(Icons.person),
              ),
              onSaved: (value) {
                password = value;
              },
              validator: validatorPassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 2.0,
                onPressed: submitRegisterForm,
              ),
            )
          ],
        ));
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController.text = 'hi';
    textEditingController.addListener(() {
      debugPrint("input: ${textEditingController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: 'Enter the post title.',
        border: OutlineInputBorder(),
        filled: true,
      ),
      // onChanged: (value) => debugPrint("chang: $value"),
      onSubmitted: (value) => debugPrint("submit:  $value"),
    );
  }
}
