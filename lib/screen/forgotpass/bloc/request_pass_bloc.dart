import 'package:bloc/bloc.dart';
import 'package:your_reward_user/bloc/base/base_bloc_state.dart';
import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/repository/AuthRepo.dart';
import 'package:your_reward_user/screen/forgotpass/bloc/request_pass_event.dart';
import 'package:your_reward_user/screen/forgotpass/bloc/request_pass_state.dart';
import 'package:your_reward_user/utils/auth_utils.dart';

class RequestChangePassBloc extends Bloc<RequestPassBaseEvent, BaseBlocState> {
  AuthRepo _authRepo = injector<AuthRepo>();

  @override
  Stream<RequestPassBaseState> mapEventToState(RequestPassBaseEvent event) async* {
    if (event is RequestPassEvent) {
      yield* _handleRequestEmail(event.email);
    }
    if (event is ChangePassEvent) {
      yield* _handleChangePassword(event.code, event.email, event.password, event.rePassword);
    }
  }

  @override
  RequestPassBaseState get initialState => InitialState();

  Stream<BaseBlocState> _handleRequestEmail(String email) async* {
    if (!AuthUtils.validateEmailValid(email)) {
      yield UIControlState.showError('Email không hợp lệ');
      yield ResetState();
      return;
    }
    yield UIControlState.showLoading();
    try {
      bool result = await _authRepo.requestChangeEmail(email);
      if (result) {
        yield RequestPassSuccessState();
      } else {
        yield UIControlState.showError('Sai thông tin email');
      }
    } catch (e) {
      yield UIControlState.showError(e.toString());
    }
  }

  Stream<BaseBlocState> _handleChangePassword(String email, String code, String password, String repassword) async* {
    if (email == null || repassword == null || password == null) {
      yield UIControlState.showError('Không được để trống');
      yield ResetState();
      return;
    }
    if (repassword != password) {
      yield UIControlState.showError('Mật khẩu không khớp');
      yield ResetState();
      return;
    }

    if (!AuthUtils.validatePasswordValid(password)) {
      yield UIControlState.showError('Mật khẩu không hợp lệ');
      yield ResetState();
      return;
    }
    yield UIControlState.showLoading();
    try {
      bool result = await _authRepo.changePassword(email, code, password);
      if (result) {
        yield ChangePassSuccessState();
      } else {
        yield UIControlState.showError('Có lỗi, vui lòng kiểm tra lại');
      }
    } catch (e) {
      yield UIControlState.showError(e.toString());
    }
  }
}
