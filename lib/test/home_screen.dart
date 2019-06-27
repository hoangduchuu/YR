import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/bloc/home/home_state_stores.dart';
import 'package:your_reward_user/bloc/home/home_bloc.dart';
import 'package:your_reward_user/bloc/home/home_event.dart';
import 'package:your_reward_user/bloc/home/home_state_transactions.dart';
import 'package:your_reward_user/model/MembershipCard.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/model/Transaction.dart';
import 'package:your_reward_user/repository/DataProvider.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';
import 'package:your_reward_user/widget/restaurant_card.dart';
import 'package:your_reward_user/widget/tranfer_history_row.dart';

import 'package:your_reward_user/screen/membership/membership_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = new ScrollController();
  HomeBLoc _homeBloc;
  List<MembershipCard> _memberships;
  List<Transaction> _transactions;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBLoc();
    _homeBloc.dispatch(GetMemberShipCardsRequest(DataProvider.user.id));
    _homeBloc.dispatch(GetTransactionRequest());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HColors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: HColors.ColorSecondPrimary,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                FontAwesomeIcons.userCircle,
                color: HColors.ColorSecondPrimary,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/accountinfo');
              }),
        ],
        elevation: 0.0,
      ),
      backgroundColor: HColors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocListener(
      bloc: _homeBloc,
      listener: (context, state) {
        if (state is GetMemberShipCards) {
          if (state.isError) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text('${state.errMsg}'),
                  backgroundColor: Colors.red));
          } else if (state.isLoading) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text('Đang tải...')));
          } else {
            Scaffold.of(context)..hideCurrentSnackBar();
          }
        } else if (state is GetMembershipCardSuccessState) {
          Scaffold.of(context)..hideCurrentSnackBar();
          setState(() {
            _memberships = state.memberships;
          });
        }
        if (state is OnGetTransactionSuccess) {
          Scaffold.of(context)..hideCurrentSnackBar();
          setState(() {
            _transactions = state.transactions;
          });
        }
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RestaurantCard(
              cb: (int index) {
                print('url==$index');
                Navigator.push(context, MaterialPageRoute(builder: (context) =>MemberShipScreen(storeOwnerId: "12",)));
              },
              memberships: _memberships,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 30, right: 20),
              child: Container(
                padding: EdgeInsets.only(bottom: 6),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black12, width: 1)),
                ),
                child: Text(
                  'Lịch sử giao dịch',
                  style: TextStyle(
                      color: HColors.ColorSecondPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: Hfonts.PrimaryFontBold),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: _buildTransactionList(_transactions),
            ),
          ],
        ),
      ),
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
