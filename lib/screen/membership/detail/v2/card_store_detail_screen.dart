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
import 'package:your_reward_user/screen/membership/detail/bloc/membership_detail_bloc.dart';
import 'package:your_reward_user/screen/membership/detail/bloc/membership_detail_event.dart';
import 'package:your_reward_user/screen/membership/detail/bloc/membership_detail_state.dart';
import 'package:your_reward_user/screen/restaurant_detail/restaurant_detail_screen.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/utils/const.dart';
import 'package:your_reward_user/widget/v2/YRAppBar.dart';
import 'package:your_reward_user/widget/v2/image_left_content_right_widget.dart';
import 'package:your_reward_user/widget/v2/member_card.dart';
import 'package:your_reward_user/widget/v2/restaurant_item.dart';

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
    return YRAppBar(
      title: widget.memberCard.ownerName,
    );
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
          MemberCard(),
          Padding(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Container(
                padding: EdgeInsets.only(bottom: 6),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
                ),
                child: Text(
                  'Cửa hàng',
                  style: TextStyle(
                    color: HColors.ColorSecondPrimary,
                    fontSize: 30,
                    fontFamily: Hfonts.PrimaryFontRegular,
                  ),
                ),
              )),
          Container(height: 150, child: _buildListStore(_stores)),
          Padding(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Container(
                padding: EdgeInsets.only(bottom: 6),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
                ),
                child: Text(
                  'Voucher',
                  style: TextStyle(
                    color: HColors.ColorSecondPrimary,
                    fontSize: 30,
                    fontFamily: Hfonts.PrimaryFontRegular,
                  ),
                ),
              )),
          _buildListVouchers(_coupons),
        ],
      ),
    );
  }

  Widget _buildListStore(List<Store> stores) {
    if (stores == null || stores.isEmpty) {
      return Container();
    }
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: stores.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              RestaurantItem(
                height: 150,
                width: 250,
                storeName: stores[index].name,
                storeImage: stores[index].storeLogo,
                onClick: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => RestaurantDetailScreen(store: stores[index])));
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
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: coupons.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: ImageLeftContentRightRow(
              imageUrl: _getVoucherThumb(coupons[index].image),
              title: coupons[index].title,
              content: coupons[index].getDescription(),
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
