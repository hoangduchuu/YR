import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_reward_user/model/Transaction.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/base/ErrorMessageHandler.dart';
import 'package:your_reward_user/screen/base/ScaffoldPage.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_bloc.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_event.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_state.dart';
import 'package:your_reward_user/styles/h_colors.dart';
import 'package:your_reward_user/widget/TransactionWidget.dart';

class TransactionStoreScreen extends BasePage {
  final String ownerId;

  TransactionStoreScreen({this.ownerId});

  @override
  _TransactionStoreScreenState createState() => _TransactionStoreScreenState();
}

class _TransactionStoreScreenState extends BaseState<TransactionStoreScreen> with ScaffoldPage, ErrorMessageHandler {
  TransactionStoreBloc _bloc;
  List<Transaction> _transactions;

  @override
  void initState() {
    super.initState();
    this._bloc = TransactionStoreBloc();
    _bloc.dispatch(GetTransactionRequest(widget.ownerId));
  }

  @override
  Widget appBar() {
    return AppBar(
      backgroundColor: HColors.white,
      brightness: Brightness.light,
      title: Text(
        "Lịch sử giao dịch",
        style: TextStyle(color: Colors.red),
      ),
      elevation: 0.0,
    );
  }

  @override
  Widget body() {
    return _buildBody();
  }

  @override
  Color getBgColor() {
    return HColors.white;
  }

  Widget _buildBody() {
    return BlocListener(
      bloc: _bloc,
      listener: (context, state) {
        handleUIControlState(state);
        if (state is OnGetTransactionSuccess) {
          super.hideLoadingWithContext(context);
          setState(() {
            _transactions = state.transactions;
          });
        }
      },
      child: TransactionWidget(_transactions),
    );
  }
}
