import 'package:flutter/material.dart';
import 'package:your_reward_user/model/Transaction.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';
import 'package:your_reward_user/widget/tranfer_history_row.dart';

class TransactionWidget extends StatefulWidget {
  List<Transaction> _transactions;

  TransactionWidget(this._transactions);

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildTransactionList(widget._transactions);
  }

  Widget _buildTransactionList(List<Transaction> mTransactions) {
    if (mTransactions == null || mTransactions.isEmpty) {
      return Container();
    } // Prevent while waiting data error
    return ListView.builder(
        itemCount: widget._transactions.length,
        itemBuilder: (context, index) {
          return TranferHistoryRow(
              tranferName: 'Giao dịch số ${index + 1}',
              time: CommonUtils.getTimeFormated(widget._transactions[index].time),
              date: CommonUtils.getDateFormat(widget._transactions[index].time),
              place: widget._transactions[index].storeLocation,
              price: widget._transactions[index].price.toString(),
              storeType: widget._transactions[index].logo,
              point: widget._transactions[index].point);
        });
  }
}
