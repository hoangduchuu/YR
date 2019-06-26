import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_reward_user/model/Coupon.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/repository/DataProvider.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/bar_code.dart';
import 'package:your_reward_user/widget/member_card.dart';
import 'package:your_reward_user/widget/restaurant_item.dart';
import 'package:your_reward_user/widget/voucher.dart';

import 'bloc/membership_detail_bloc.dart';
import 'bloc/membership_detail_event.dart';
import 'bloc/membership_detail_state.dart';

class MemberShipStoreDetailScreen extends StatefulWidget {
  String storeOwnerId;

  @override
  _MemberShipStoreDetailScreenState createState() =>
      _MemberShipStoreDetailScreenState();

  MemberShipStoreDetailScreen({Key key, @required this.storeOwnerId})
      : super(key: key);
}

class _MemberShipStoreDetailScreenState
    extends State<MemberShipStoreDetailScreen> {
  ScrollController _scrollController = new ScrollController();
  MemberShipDetailBloc _bloc;
  List<Store> _stores;
  List<Coupon> _coupons;

  @override
  void initState() {
    super.initState();
    this._bloc = MemberShipDetailBloc();
    _bloc.dispatch(GetMemberShipDetailEvent(widget.storeOwnerId));
    _bloc.dispatch(GetVoucherEvent(widget.storeOwnerId));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener(
      bloc: _bloc,
      listener: (context, state) {
        if (state is GetMemmberShipDetailState) {
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
        } else if (state is OngetMemberShipDetailSuccessState) {
          Scaffold.of(context)..hideCurrentSnackBar();
          setState(() {
            _stores = state.stores;
          });
        }
        if (state is OngetGetCouponSuccessState) {
          setState(() {
            _coupons = state.coupons;
            print("SUCCESS COUPON: ${state.coupons}");
          });
        }
      },
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: ListView(
        controller: _scrollController,
        children: <Widget>[
          MemberCard(
              memberName: 'Phan Nguyễn Song Toàn',
              memberPoint: 2048,
              startDate: '25/01/2018',
              times: 10),
          SizedBox(
            height: 10,
          ),
          BarCode(phone: DataProvider.user.phone,),
          Padding(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Container(
                padding: EdgeInsets.only(bottom: 6),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black12, width: 1)),
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
          Container(height: 160, child: _buildListStore(_stores)),
          Padding(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Container(
                padding: EdgeInsets.only(bottom: 6),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black12, width: 1)),
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
          Container(height: 215, child: _buildListVouchers(_coupons)),
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
                  Navigator.pushNamed(context, '/restaurantdetail');
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
          return Row(
            children: <Widget>[
              Voucher(
                name: coupons[index].title,
                imageUrl: _getVoucherThumb(coupons[index].image),
                date: coupons[index].endDate,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          );
        });
  }

  // FIXME: get exactly data
  _getVoucherThumb(String s) {
    if (s == null) {
      return "https://images.foody.vn/res/g17/165353/prof/s576x330/foody-mobile-dsvdvs-jpg.jpg";
    }
    return s;
  }
}
