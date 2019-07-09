import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/model/Transaction.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_bloc.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_event.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_state.dart';
import 'package:your_reward_user/styles/h_colors.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';
import 'package:your_reward_user/widget/TransactionWidget.dart';
import 'package:your_reward_user/widget/tranfer_history_row.dart';

class TransactionStoreScreen extends StatefulWidget {
  String ownerId;

  TransactionStoreScreen({this.ownerId});

  @override
  _TransactionStoreScreenState createState() => _TransactionStoreScreenState();
}

class _TransactionStoreScreenState extends BaseState<TransactionStoreScreen> {
  TransactionStoreBloc _bloc;
  List<Transaction> _transactions;

  @override
  void initState() {
    super.initState();
    this._bloc = TransactionStoreBloc();
    _bloc.dispatch(GetTransactionRequest(widget.ownerId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HColors.white,
          title: Text(
            "Lịch sử giao dịch",
            style: TextStyle(color: Colors.red),
          ),
          elevation: 0.0,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return BlocListener(
      bloc: _bloc,
      listener: (context, state) {
        if (state is GetTransactionState) {
          if (state.isError) {
            super.showErrorWithContext(state.errMsg,context);
          } else if (state.isLoading) {
            super.showLoadingWithContext(context);
          } else {
            super.hideLoadingWithContext(context);
          }
        }
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

  Widget _buildTransactionList(List<Transaction> mTransactions) {
    if (mTransactions == null || mTransactions.isEmpty) {
      return Container();
    } // Prevent while waiting data error
    return ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (context, index) {
          return TranferHistoryRow(
              tranferName: 'Giao dịch số ${index + 1}',
              time: CommonUtils.getTimeFormated(_transactions[index].time),
              date: CommonUtils.getDateFormat(_transactions[index].time),
              place: _transactions[index].storeLocation,
              price: _transactions[index].price.toString(),
              storeType: _transactions[index].logo,
              point: _transactions[index].point);
        });
  }
}
