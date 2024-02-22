class Methods {
  Methods._();
  static final instance = Methods._();
  factory Methods() => instance;

  bool validateEmail(String? email) {
    if (email == null || email.isEmpty) return false;
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]*@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regExp.hasMatch(email);
  }
}
