import 'package:bloc/bloc.dart';
import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/model/Coupon.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/provider/CouponProvider.dart';
import 'package:your_reward_user/repository/AuthRepo.dart';
import 'package:your_reward_user/repository/CouponRepo.dart';
import 'package:your_reward_user/repository/StoreRepo.dart';
import 'package:your_reward_user/repository/TransactionRepo.dart';
import 'package:your_reward_user/screen/forgotpass/bloc/request_pass_event.dart';
import 'package:your_reward_user/screen/forgotpass/bloc/request_pass_state.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/auth_utils.dart';
import 'package:your_reward_user/utils/pair.dart';

class RequestChangePassBloc
    extends Bloc<RequestPassBaseEvent, RequestPassBaseState> {
  AuthRepo _authRepo = injector<AuthRepo>();

  @override
  Stream<RequestPassBaseState> mapEventToState(
      RequestPassBaseEvent event) async* {
    if (event is RequestPassEvent) {
      yield* _handleRequestEmail(event.email);
    }
    if (event is ChangePassEvent) {
      yield* _handleChangePassword(
          event.code, event.email, event.password, event.rePassword);
    }
  }

  @override
  RequestPassBaseState get initialState => InitialState();

  Stream<RequestPassBaseState> _handleRequestEmail(String email) async* {
    if (!AuthUtils.validateEmailValid(email)) {
      yield RequestPassState.invalidEmail();
      yield ResetState();
      return;
    }
    yield RequestPassState.isLoading();
    try {
      bool result = await _authRepo.requestChangeEmail(email);
      if (result) {
        yield RequestPassState.success();
      } else {
        yield RequestPassState.isError(errMsg: "Sai thông tin email");
      }
    } catch (e) {
      yield RequestPassState.isError(errMsg: e.toString());
    }
  }

  Stream<RequestPassBaseState> _handleChangePassword(
      String email, String code, String password, String repassword) async* {
    if (email == null || repassword == null || password == null) {
      yield ChangePassState.Error("Không được để trống");
      yield ResetState();
      return;
    }
    if (repassword != password) {
      yield ChangePassState.Error("Mật khẩu không khớp");
      yield ResetState();
      return;
    }

    if (!AuthUtils.validatePasswordValid(password)) {
      yield ChangePassState.Error("Mật khẩu không hợp lệ");
      yield ResetState();
      return;
    }
    yield ChangePassState.Loading();
    try {
      bool result = await _authRepo.changePassword(email, code, password);
      if (result) {
        yield ChangePassState.Success();
      } else {
        yield ChangePassState.Error("Có lỗi, vui lòng kiểm tra lại");
      }
    } catch (e) {
      yield ChangePassState.Error(e.toString());
    }
  }
}
