import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_reward_user/model/Transaction.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/base/ErrorMessageHandler.dart';
import 'package:your_reward_user/screen/base/ScaffoldPage.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_bloc.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_event.dart';
import 'package:your_reward_user/screen/membership/store_transaction/store_transaction_state.dart';
import 'package:your_reward_user/screen/transaction/transaction_row.dart';
import 'package:your_reward_user/screen/transaction_detail/transaction_detail_screen.dart';
import 'package:your_reward_user/styles/h_colors.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';
import 'package:your_reward_user/widget/v2/YRAppBar.dart';
import 'package:your_reward_user/widget/v2/shimmer/shimmer_list.dart';

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
    super.initState();
    _bloc = TransactionStoreBloc();
    _bloc.dispatch(GetTransactionRequest(widget.ownerId));
  }

  _buildUI() {
    if (_transactions == null) {
      return ListShimmer();
    }
    if (_transactions.isEmpty) {
      return Container(
        child: Center(child: Text("Chưa có giao dịch nào")),
      );
    }
    return ListView.builder(
      itemBuilder: _transactionCard,
      itemCount: _transactionCount(),
    );
  }

  Widget _transactionCard(BuildContext context, int index) {
    if (_transactions == null || _transactions.isEmpty) {
      return Container();
    }
    return TransactionRow(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TransactionDetail(transaction: _transactions[index])));
      },
      title: "Giao dịch số ${index + 1}",
      description:
          "Vào lúc ${CommonUtils.getDateFormat(_transactions[index].time)}. Tại ${_transactions[index].storeLocation}",
      points: _transactions[index].point,
    );
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
          handleUIControlState(state, hasShimmer: true);
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
    return HColors.bgColor;
  }

  int _transactionCount() {
    if (_transactions == null || _transactions.isEmpty) {
      return 0;
    }
    return _transactions.length;
  }
}
