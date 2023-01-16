import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailErrorNotifier extends StateNotifier<String> {
  EmailErrorNotifier() : super(" ");
  bool valid = false;
  void checker(text) {
    if (text.length == 0) {
      state = "";
      valid = false;
    } else if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text)) {
      valid = true;
      state = "";
    } else {
      state = "Invalid Email Id";
      valid = false;
    }
  }

  void setVal(String text) {
    state = text;
  }
}

class PassErrorNotifier extends StateNotifier<String> {
  PassErrorNotifier() : super(" ");
  bool valid = false;
  void isStrong(password) {
    if (password.length == 0) {
      valid = false;
      state = "";
    } else {
      state = "Password must have ";
      if (!RegExp(r'^(?=.*?[a-z]).*').hasMatch(password)) {
        valid = false;
        state = "${state}one small character, ";
      }
      if (!RegExp(r'^(?=.*?[A-Z]).*').hasMatch(password)) {
        valid = false;
        state = "${state}one capital character, ";
      }
      if (!RegExp(r'^.*\W.*').hasMatch(password)) {
        valid = false;
        state = "${state}one symbol, ";
      }
      if (!RegExp(r'^(?=.*?[0-9]).*').hasMatch(password)) {
        valid = false;
        state = "${state}one digit, ";
      }
      if (password.length < 8) {
        valid = false;
        state = "${state}8 characters, ";
      }
      if (state == "Password must have ") {
        valid = true;
        state = "";
      }
    }
  }

  void setVal(String text) {
    state = text;
  }
}

class MobileNumberErrorNotifier extends StateNotifier<String> {
  MobileNumberErrorNotifier() : super(" ");

  void isValid(text) {
    if (text.length == 0) {
      state = "";
    } else if (RegExp(r'^[0-9]{10}$').hasMatch(text)) {
      state = " ";
    } else {
      state = "Invalid Mobile Number";
    }
  }
}

class ButtonLoaderNotifier extends StateNotifier<bool> {
  ButtonLoaderNotifier() : super(false);

  void toggle() {
    state = !state;
  }
}

class TimerNotifier extends StateNotifier<int?> {
  TimerNotifier() : super(DateTime.now().millisecondsSinceEpoch + 60000);

  void increaseTime(int sec) {
    if (state == null) {
      state = DateTime.now().millisecondsSinceEpoch;
    } else {
      state = DateTime.now().millisecondsSinceEpoch + (sec * 1000);
    }
  }

  void initTime() {
    state ??= DateTime.now().millisecondsSinceEpoch + 60000;
  }
}

class PanErrorNotifier extends StateNotifier<String> {
  PanErrorNotifier() : super("");

  void isValid(text) {
    if (text.length == 0) {
      state = "";
    } else if (RegExp(r"[A-Z]{5}[0-9]{4}[A-Z]{1}").hasMatch(text)) {
      state = " ";
    } else {
      state = "Invalid Pan Number";
    }
  }

  void setVal(text) {
    state = text;
  }
}

class NameErrorNotifier extends StateNotifier<String> {
  NameErrorNotifier() : super("");

  void isValid(text) {
    if (text.length == 0) {
      state = "";
    } else if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(text)) {
      state = " ";
    } else {
      state = "Enter Valid Name";
    }
  }
}
