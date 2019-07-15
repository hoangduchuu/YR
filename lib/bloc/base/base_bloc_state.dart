import 'package:equatable/equatable.dart';

abstract class BaseBlocState extends Equatable{
  BaseBlocState([List props = const []]) : super(props);
}

class UIControlState extends BaseBlocState{
  bool isLoading;
  bool isSuccess;
  bool isError;
  String msg;

  UIControlState({this.isLoading = false, this.isSuccess = false,
    this.isError = false, this.msg = ''}) : super([isLoading, isSuccess, isError, msg]);

  factory UIControlState.showLoading() {
    return UIControlState(
      isLoading:  true,
      isSuccess: false,
      isError: false,
      msg: '');
  }

  factory UIControlState.success() {
    return UIControlState(
        isLoading:  false,
        isSuccess: true,
        isError: false,
        msg: '');
  }

  factory UIControlState.showError(String msg) {
    return UIControlState(
        isLoading:  false,
        isSuccess: false,
        isError: true,
        msg: msg);
  }

}