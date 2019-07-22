import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/entity/enums.dart';
import 'package:your_reward_user/model/MembershipCard.dart';
import 'package:your_reward_user/model/Transaction.dart';
import 'package:your_reward_user/repository/DataProvider.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/base/ErrorMessageHandler.dart';
import 'package:your_reward_user/screen/base/ScaffoldPage.dart';
import 'package:your_reward_user/screen/home/bloc/home_bloc.dart';
import 'package:your_reward_user/screen/home/bloc/home_event.dart';
import 'package:your_reward_user/screen/home/bloc/home_state_stores.dart';
import 'package:your_reward_user/screen/home/bloc/home_state_transactions.dart';
import 'package:your_reward_user/screen/membership/membership_screen.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';
import 'package:your_reward_user/widget/v1/NetWorkImage.dart';
import 'package:your_reward_user/widget/v1/YRText.dart';
import 'package:your_reward_user/widget/v1/empty_membership_widget.dart';
import 'package:your_reward_user/widget/v1/tranfer_history_row.dart';
import 'package:your_reward_user/widget/v2/restaurant_card.dart';
import 'package:your_reward_user/widget/v2/yellow_barcode.dart';

class HomeScreen extends BasePage {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> with ErrorMessageHandler, ScaffoldPage {
  ScrollController _scrollController = new ScrollController();
  HomeBLoc _homeBloc;
  List<MembershipCard> _memberships;
  List<Transaction> _transactions;
  bool isSliderLoaded = false;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBLoc();
    _homeBloc.dispatch(GetMemberShipCardsRequest(DataProvider.user.id));
    _homeBloc.dispatch(GetTransactionRequest(DataProvider.user.id));
  }

  @override
  Widget body() {
    return _buildBody();
  }

  @override
  Widget appBar() {
    return AppBar(
      title: Row(
        children: <Widget>[
          Center(
            child: Container(
              width: 35,
              height: 35,
              decoration: new BoxDecoration(
                color: Colors.white30,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: ImageLoader(
                  url: DataProvider.user.avatar,
                  radius: 25,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              DataProvider.user.fullName,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
      backgroundColor: HColors.white,
      brightness: Brightness.light,
      elevation: 2.0,
      actions: <Widget>[
        IconButton(
          icon: Icon(FontAwesomeIcons.userCircle),
          color: HColors.ColorSecondPrimary,
          onPressed: () {
            Navigator.pushNamed(context, '/accountinfo');
          },
        ),
      ],
    );
  }

  @override
  Color getBgColor() {
    return HColors.white;
  }

  Widget _buildBody() {
    return BlocListener(
      bloc: _homeBloc,
      listener: (context, state) {
        handleUIControlState(state);
        if (state is GetMemberShipCardsEmptyState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => EmptyCardScreen.user(DataProvider.user)));
        } else if (state is GetMembershipCardSuccessState) {
          super.hideLoading();
          setState(() {
            isSliderLoaded = true;
            _memberships = state.memberships;
          });
        } else if (state is OnGetTransactionSuccess) {
          super.hideLoading();
          setState(() {
            _transactions = state.transactions;
          });
        }
      },
      child: ListView(
        controller: _scrollController,
        children: <Widget>[
          YellowBarcode(
            DataProvider.user.phone,
          ),
          Visibility(
            visible: isSliderLoaded,
            child: RestaurantCard(
              cb: (int index) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MemberShipScreen(
                              memberCard: _memberships[index],
                            )));
              },
              memberships: _memberships,
            ),
          ),
          Visibility(
            visible: !isSliderLoaded,
            child: Center(child: Text("Đang tải....")),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 30, right: 20),
            child: Container(
              padding: EdgeInsets.only(bottom: 6),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
              ),
              child: YRText(
                "Lịch sử giao dịch",
                textFontStyle: TextFontStyle.BOLD,
                color: HColors.ColorSecondPrimary,
                fontSize: 20,
              ),
            ),
          ),
          _buildTransactionList(_transactions)
        ],
      ),
    );
  }

  Widget _buildTransactionList(List<Transaction> mTransactions) {
    if (mTransactions == null || mTransactions.isEmpty) {
      return Container();
    } // Prevent while waiting data error
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
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