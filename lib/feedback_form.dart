class FeedbackForm {
  String _name;
  String _email;
  String _mobileno;
  String _feedback;

  FeedbackForm(this._email, this._feedback, this._mobileno, this._name);

  String toParams() =>
      "?name=$_name&email=$_email&mobileNo=$_mobileno&feedback=$_feedback";
}
