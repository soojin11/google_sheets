import 'package:saving_data_google_sheets/feedback_form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FormController {
  final Function(String) callback;
  static const String url =
      "주소넣기";
  static const status_success = "SUCCESS";

  FormController(this.callback);
  void submitForm(FeedbackForm feedbackForm) async {
    try {
      await http.get(Uri.parse(url + feedbackForm.toParams())).then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      print(e);
    }
  }
}
