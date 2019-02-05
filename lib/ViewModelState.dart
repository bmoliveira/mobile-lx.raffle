import 'package:scoped_model/scoped_model.dart';

class ViewModelState<T> extends Model {
  T _value;

  T get value => _value;
  set value(T newValue) {
    _value = newValue;
    notifyListeners();
  }

  ViewModelState(this._value) : super();
}
