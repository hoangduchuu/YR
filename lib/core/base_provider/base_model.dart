import 'package:flutter/foundation.dart';

import 'view_states.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState value) {
    _state = value;
  }
}
