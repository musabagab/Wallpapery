import '../enums/view_states.dart';
import 'package:scoped_model/scoped_model.dart';

export '../enums/view_states.dart'; // exposed to all models// exposed to all models

class BaseModel extends Model {
  ViewState _state;
  ViewState get state => _state;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }
}
