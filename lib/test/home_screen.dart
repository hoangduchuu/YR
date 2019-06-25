import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/bloc/home/home_bloc.dart';
import 'package:your_reward_user/bloc/home/home_event.dart';
import 'package:your_reward_user/bloc/home/home_state.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/repository/StoreRepo.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/restaurant_card.dart';
import 'package:your_reward_user/widget/textfield.dart';
import 'package:your_reward_user/widget/tranfer_history_row.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = new ScrollController();
  HomeBLoc _homeBloc;
  List<Store> _stores;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBLoc();
    _homeBloc.dispatch(GetStoreRequest());
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
        if (state is GetStoresState) {
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
        } else if (state is OnGetStoresSuccess) {
          Scaffold.of(context)..hideCurrentSnackBar();
          setState(() {
            _stores = state.stores;
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
                Navigator.pushNamed(context, '/bottombar');
              },
              store: _stores,
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
              child: ListView(
                children: <Widget>[
                  TranferHistoryRow(
                      tranferName: 'Giao dịch số 1',
                      time: '18:00',
                      date: '16/5/2019',
                      place: 'KFC',
                      price: '100000đ',
                      storeType: 'assets/images/burgers.png',
                      point: 50),
                  TranferHistoryRow(
                      tranferName: 'Giao dịch số 2',
                      time: '15:00',
                      date: '16/5/2019',
                      place: 'Pizza Huts',
                      price: '100000đ',
                      storeType: 'assets/images/coffee-cup.png',
                      point: 20),
                  TranferHistoryRow(
                      tranferName: 'Giao dịch số 3',
                      time: '17:00',
                      date: '16/5/2019',
                      place: 'KFC',
                      price: '100000đ',
                      storeType: 'assets/images/pizza.png',
                      point: 100),
                  TranferHistoryRow(
                      tranferName: 'Giao dịch số 4',
                      time: '12:00',
                      date: '16/5/2019',
                      place: 'Lotteria',
                      price: '100000đ',
                      storeType: 'assets/images/movie-theatre.png',
                      point: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
