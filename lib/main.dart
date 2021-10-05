import 'package:flutter/material.dart';
import 'package:saving_data_google_sheets/controller.dart';
import 'package:saving_data_google_sheets/feedback_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      FeedbackForm feedbackForm = FeedbackForm(
          emailController.text,
          feedbackController.text,
          phoneNumberController.text,
          nameController.text);
      FormController formController = FormController((String response) {
        print(response);
        if (response == FormController.status_success) {
          _showSnackBar("Feedback Submitted");
        } else {
          _showSnackBar("Error Occured!");
        }
      });
      _showSnackBar("Submitting Feedback");
      formController.submitForm(feedbackForm);
    }
  }

  _showSnackBar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
    );
    _scaffoldKey.currentState!.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Valid Name";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Name"),
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Valid Email";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Email"),
                ),
                TextFormField(
                  controller: phoneNumberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Valid Mobile Number";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Mobile Number"),
                ),
                TextFormField(
                  controller: feedbackController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Valid Feedback";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Feedback"),
                ),
                ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    child: Text("Save Data"))
              ],
            ),
          ),
        ));
  }
}
