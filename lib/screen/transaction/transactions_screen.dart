import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_reward_user/model/Transaction.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/base/ErrorMessageHandler.dart';
import 'package:your_reward_user/screen/base/ScaffoldPage.dart';
import 'package:your_reward_user/screen/home/bloc/home_state_transactions.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_bloc.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_event.dart';
import 'package:your_reward_user/screen/transaction/transaction_row.dart';
import 'package:your_reward_user/widget/v2/YRAppBar.dart';

class TransactionScreen extends BasePage {
  final String ownerId;

  TransactionScreen({this.ownerId});
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends BaseState<TransactionScreen> with ScaffoldPage, ErrorMessageHandler {
  List<Transaction> _transactions;
  TransactionStoreBloc _bloc;

  @override
  void initState() {
    _bloc = TransactionStoreBloc();
    _bloc.dispatch(GetTransactionRequest(widget.ownerId));
  }

  _buildUI() {
    return ListView.builder(
      itemBuilder: _transactionCard,
      itemCount: 10,
    );
  }

  Widget _transactionCard(BuildContext context, int index) {
    return TransactionRow(title: 'Giao dịch số 0001', description: 'adfasdfasdfsadfsadfafds');
  }

  @override
  Widget appBar() {
    return YRAppBar(
      title: "CHI TIẾT GIAO DỊCH",
    );
  }

  @override
  Widget body() {
    return BlocListener(
        bloc: _bloc,
        listener: (context, state) {
          print("co state ${state.toString()}");

//          handleUIControlState(state);
          if (state is OnGetTransactionSuccess) {
            super.hideLoadingWithContext(context);
            setState(() {
              _transactions = state.transactions;
            });
          }
        },
        child: _buildUI());
    ;
  }

  @override
  Color getBgColor() {
    // TODO: implement getBgColor
    return null;
  }
}
