import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';

class TransactionDetail extends StatelessWidget {

  TransactionDetail();

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
          'CHI TIẾT GIAO DỊCH',
          style: TextStyle(color: Colors.black, fontFamily: 'Lato'),
        ),
      ),
      backgroundColor: HColors.bgColor,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildTitle(context),
        SizedBox(height: 16,),
        _buildStore(context),
        SizedBox(height: 16,),
        _buildThongTinThanhToan(context),
        SizedBox(height: 16,),
        _buildDienTichLuy(context),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      color: HColors.ColorPrimary,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Đặt hàng thành công', style: TextStyle(color: HColors.black,
              fontSize: 16, fontWeight: FontWeight.bold),),
          SizedBox(height: 8,),
          Text('18:00 - 23/09/2019', style: TextStyle(color: HColors.black,
              fontSize: 14, fontWeight: FontWeight.w100),)
        ],
      ),
    );
  }

  Widget _buildStore(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Text(
              'CỬA HÀNG',
              style: TextStyle(fontSize: 18, fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          SizedBox(height: 12,),
          Container(
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s.',
                style: TextStyle(fontFamily: 'Lato'),
              )),
        ],
      ),
    );
  }

  Widget _buildThongTinThanhToan(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Text(
              'THÔNG TIN THANH TOÁN',
              style: TextStyle(fontSize: 18, fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          SizedBox(height: 12,),
          Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Tạm tính',
                          style: TextStyle(fontFamily: 'Lato'),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          CommonUtils.getMoneyFormat(100000, suffix: 'đ'),
                          textAlign: TextAlign.end,
                          style: TextStyle(fontFamily: 'Lato'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Giảm giá',
                          style: TextStyle(fontFamily: 'Lato'),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          CommonUtils.getMoneyFormat(100000, suffix: 'đ'),
                          textAlign: TextAlign.end,
                          style: TextStyle(fontFamily: 'Lato'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Tổng cộng',
                          style: TextStyle(fontFamily: 'Lato'),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          CommonUtils.getMoneyFormat(100000000, suffix: 'đ'),
                          textAlign: TextAlign.end,
                          style: TextStyle(fontFamily: 'Lato', color: HColors.ColorPrimary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )

                ],
              )
          ),
        ],
      ),
    );
  }

  Widget _buildDienTichLuy(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Text(
              'ĐIỂM TÍCH LŨY',
              style: TextStyle(fontSize: 18, fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          SizedBox(height: 12,),
          Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: Text(
                '10 điểm',
                style: TextStyle(fontFamily: 'Lato'),
              )),
        ],
      ),
    );
  }
}
