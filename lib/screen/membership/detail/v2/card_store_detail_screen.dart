import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
import 'package:your_reward_user/screen/transaction/transactions_screen.dart';
import 'package:your_reward_user/screen/voucher_detail/VoucherDetailScreen.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';
import 'package:your_reward_user/utils/const.dart';
import 'package:your_reward_user/widget/v1/YRText.dart';
import 'package:your_reward_user/widget/v2/card_membership.dart';
import 'package:your_reward_user/widget/v2/image_left_content_right_widget.dart';
import 'package:your_reward_user/widget/v2/restaurant_item.dart';
import 'package:your_reward_user/widget/v2/shimmer/shimmer_list.dart';
import 'package:your_reward_user/widget/v2/shimmer/shimmer_list_horizontal.dart';

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
    return AppBar(
        title: YRText(
          widget.memberCard.ownerName.toUpperCase(),
          color: Colors.black,
          font: "Lato",
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
        leading: IconButton(
            icon: ImageIcon(AssetImage('assets/images/ic_arrow.png')),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.history),
            color: HColors.ColorSecondPrimary,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TransactionScreen(
                            ownerId: widget.memberCard.ownerId,
                          )));
            },
          ),
        ]);
  }

  @override
  Widget body() {
    return _body();
  }

  @override
  Color getBgColor() {
    return HColors.bgColor;
  }

  Widget _body() {
    return BlocListener(
      bloc: _bloc,
      listener: (context, state) {
        handleUIControlState(state, hasShimmer: true);
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
          CardMemberShip(
            logo: widget.memberCard.logo,
            level: widget.memberCard.levelName,
            joinDate: CommonUtils.getDateFormat(widget.memberCard.createdAt.toString()),
            point: widget.memberCard.points.toString(),
          ),
          Padding(
              padding: EdgeInsets.only(left: 16, top: 10, right: 16),
              child: Text(
                'Cửa hàng',
                style: TextStyle(
                  color: HColors.ColorSecondPrimary,
                  fontSize: 22,
                ),
              )),
          SizedBox(
            height: 12,
          ),
          Container(height: 150, child: _buildListStore(_stores)),
          Padding(
              padding: EdgeInsets.only(left: 16, top: 12, right: 16),
              child: Text(
                'Voucher',
                style: TextStyle(
                  color: HColors.ColorSecondPrimary,
                  fontSize: 22,
                ),
              )),
          _buildListVouchers(_coupons),
        ],
      ),
    );
  }

  Widget _buildListStore(List<Store> stores) {
    if (_stores == null) {
      return ListShimmerHori();
    }
    if (_stores.isEmpty) {
      return Container();
    }
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _stores.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              SizedBox(
                width: 22,
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
    if (coupons == null) {
      return ListShimmer();
    }
    if (coupons.isEmpty) {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Text("chua co voucher"),
        ),
      );
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
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => VoucherDetailScreen(coupon: coupons[index])));
              },
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
