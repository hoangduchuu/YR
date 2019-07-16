import 'package:your_reward_user/bloc/base/base_bloc_state.dart';

import 'BasePage.dart';
import 'BaseState.dart';

mixin ErrorMessageHandler<page extends BasePage> on BaseState<page> {
  void handleUIControlState(BaseBlocState state) {
    if (state is UIControlState) {
      if (state.isLoading) {
        showLoading();
      } else if (state.isSuccess) {
        hideLoading();
      } else if (state.isError) {
        hideLoading();
        showError(state.msg);
      }
    }
  }
}
