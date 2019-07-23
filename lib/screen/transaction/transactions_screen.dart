import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_reward_user/screen/transaction/transaction_row.dart';
import 'package:your_reward_user/styles/styles.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
        leading: IconButton(
          icon: ImageIcon(AssetImage('assets/images/ic_arrow.png')),
          onPressed: () {
            Navigator.pop(context);
          }, color: Colors.black,),
        title: Text(
          'LỊCH SỬ GIAO DỊCH',
          style: TextStyle(color: Colors.black, fontFamily: 'Lato'),
        ),
      ),
      backgroundColor: HColors.bgColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return ListView.builder(
        itemBuilder: _transactionCard,
        itemCount: 10,
    );
  }

  Widget _transactionCard(BuildContext context, int index){
    return TransactionRow(title: 'Giao dịch số 0001',description: 'adfasdfasdfsadfsadfafds');
  }

}

