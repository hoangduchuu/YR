import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_reward_user/model/Coupon.dart';
import 'package:your_reward_user/model/MembershipCard.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/repository/DataProvider.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/base/ErrorMessageHandler.dart';
import 'package:your_reward_user/screen/base/ScaffoldPage.dart';
import 'package:your_reward_user/screen/news/news_sreen.dart';
import 'package:your_reward_user/screen/notification/notification_screen.dart';
import 'package:your_reward_user/screen/restaurant_detail/restaurant_detail_screen.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';
import 'package:your_reward_user/utils/const.dart';
import 'package:your_reward_user/widget/v1/hooray_barcode.dart';
import 'package:your_reward_user/widget/v1/member_card.dart';
import 'package:your_reward_user/widget/v1/restaurant_item.dart';
import 'package:your_reward_user/widget/v1/voucher.dart';

import 'bloc/membership_detail_bloc.dart';
import 'bloc/membership_detail_event.dart';
import 'bloc/membership_detail_state.dart';

class MemberShipStoreDetailScreen extends BasePage {
  final MembershipCard memberCard;

  @override
  _MemberShipStoreDetailScreenState createState() => _MemberShipStoreDetailScreenState();

  MemberShipStoreDetailScreen({Key key, @required this.memberCard}) : super(key: key);
}

class _MemberShipStoreDetailScreenState extends BaseState<MemberShipStoreDetailScreen>
    with ErrorMessageHandler, ScaffoldPage {
  ScrollController _scrollController = new ScrollController();
  MemberShipDetailBloc _bloc;
  List<Store> _stores;
  List<Coupon> _coupons;

  @override
  void initState() {
    super.initState();
    this._bloc = MemberShipDetailBloc();
    _bloc.dispatch(GetMemberShipDetailEvent(widget.memberCard.ownerId));
    _bloc.dispatch(GetVoucherEvent(DataProvider.user.id, widget.memberCard.ownerId));
  }

  @override
  Widget appBar() {
    return null;
  }

  @override
  Widget body() {
    return _body();
  }

  @override
  Color getBgColor() {
    return Color(0xFFF5F5F5);
  }

  Widget _body() {
    return BlocListener(
      bloc: _bloc,
      listener: (context, state) {
        handleUIControlState(state);
        if (state is OnGetMemberShipDetailSuccessState) {
          super.hideLoadingWithContext(context);
          setState(() {
            _stores = state.stores;
          });
        }
        if (state is OnGetCouponSuccessState) {
          super.hideLoadingWithContext(context);
          setState(() {
            _coupons = state.coupons;
          });
        }
      },
      child: ListView(
        controller: _scrollController,
        children: <Widget>[
          MemberCard(
              title: widget.memberCard.levelName,
              memberName: DataProvider.user.fullName,
              memberPoint: widget.memberCard.points,
              startDate: CommonUtils.getDateFormat(widget.memberCard.createdAt.toString()),
              times: widget.memberCard.accumulationPoints),
          SizedBox(
            height: 10,
          ),
          HoorayBarCode(
            content: DataProvider.user.phone.toString(),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Container(
                padding: EdgeInsets.only(bottom: 6),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
                ),
                child: Text(
                  'Cửa hàng',
                  style: TextStyle(
                      color: HColors.ColorSecondPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: Hfonts.PrimaryFontBold),
                ),
              )),
          Container(height: 250, child: _buildListStore(_stores)),
          Padding(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Container(
                padding: EdgeInsets.only(bottom: 6),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
                ),
                child: Text(
                  'Voucher',
                  style: TextStyle(
                      color: HColors.ColorSecondPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: Hfonts.PrimaryFontBold),
                ),
              )),
          Container(height: 250, child: _buildListVouchers(_coupons)),
        ],
      ),
    );
  }

  Widget _buildListStore(List<Store> stores) {
    if (stores == null || stores.isEmpty) {
      return Container();
    }
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stores.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              RestaurantItem(
                storeName: stores[index].name,
                storeImage: stores[index].storeLogo,
                onClick: () {
//                  Navigator.push(
//                      context, MaterialPageRoute(builder: (context) => RestaurantDetailScreen(store: stores[index])));
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => NewsScreen()));
                },
              ),
            ],
          );
        });
  }

  Widget _buildListVouchers(List<Coupon> coupons) {
    if (coupons == null || coupons.isEmpty) {
      return Container();
    }
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: coupons.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: <Widget>[
                Voucher(
                  coupon: coupons[index],
                  name: coupons[index].title,
                  imageUrl: _getVoucherThumb(coupons[index].image),
                  date: coupons[index].endDate,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          );
        });
  }

  _getVoucherThumb(String s) {
    if (s == null) {
      return NO_IMAGE;
    }
    return s;
  }
}
