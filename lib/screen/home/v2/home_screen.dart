import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_reward_user/model/MembershipCard.dart';
import 'package:your_reward_user/model/Post.dart';
import 'package:your_reward_user/model/Transaction.dart';
import 'package:your_reward_user/repository/DataProvider.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/base/ErrorMessageHandler.dart';
import 'package:your_reward_user/screen/base/ScaffoldPage.dart';
import 'package:your_reward_user/screen/home/bloc/home_bloc.dart';
import 'package:your_reward_user/screen/home/bloc/home_event.dart';
import 'package:your_reward_user/screen/home/bloc/home_state_news.dart';
import 'package:your_reward_user/screen/home/bloc/home_state_stores.dart';
import 'package:your_reward_user/screen/home/bloc/home_state_transactions.dart';
import 'package:your_reward_user/screen/membership/detail/v2/card_store_detail_screen.dart';
import 'package:your_reward_user/screen/news/news_sreen.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/utils/logger.dart';
import 'package:your_reward_user/widget/v1/NetWorkImage.dart';
import 'package:your_reward_user/widget/v2/news_row.dart';
import 'package:your_reward_user/widget/v2/restaurant_card.dart';
import 'package:your_reward_user/widget/v2/shimmer/atm_shimmer.dart';
import 'package:your_reward_user/widget/v2/shimmer/shimmer_list.dart';
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
  List<Post> _posts;
  bool isSliderLoaded = false;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBLoc();
    _homeBloc.dispatch(GetMemberShipCardsRequest(DataProvider.user.id));
    _homeBloc.dispatch(GetTransactionRequest(DataProvider.user.id));
    _homeBloc.dispatch(GetPostsRequest());
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
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/accountinfo');
                  },
                  child: ImageLoader(
                    url: DataProvider.user.avatar,
                    radius: 25,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Center(
              child: Text(
                DataProvider.user.fullName,
                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: HColors.white,
      brightness: Brightness.light,
      elevation: 2.0,
      actions: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: IconButton(
            icon: Image.asset('assets/images/ic_notifi.png'),
            color: HColors.ColorSecondPrimary,
            onPressed: () {
              Navigator.pushNamed(context, '/notification');
            },
          ),
        ),
      ],
    );
  }

  @override
  Color getBgColor() {
    return HColors.bgColor;
  }

  Widget _buildBody() {
    return BlocListener(
      bloc: _homeBloc,
      listener: (context, state) {
        handleUIControlState(state, hasShimmer: true);
        if (state is GetMemberShipCardsEmptyState) {
          setState(() {
            isSliderLoaded = false;
            _memberships = state.memberships;
          });
          super.hideLoading();
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
        if (state is GetPostSuccessState) {
          super.hideLoading();
          setState(() {
            _posts = state.posts;
          });
        }
      },
      child: ListView(
        controller: _scrollController,
        children: <Widget>[
          YellowBarcode(
            DataProvider.user.phone,
          ),
          buildSlider(),
          Visibility(
            visible: !isSliderLoaded,
            child: Center(),
          ),
          _buildNewsUI(_posts)
        ],
      ),
    );
  }

  Widget buildSlider() {
    if (_memberships == null) {
      return ATMShimmer();
    }
    return Visibility(
      visible: isSliderLoaded,
      child: Hero(
        tag: "HUUHOANG",
        child: RestaurantCard(
          cb: (int index) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MemberShipStoreDetailScreen(
                          memberCard: _memberships[index],
                        )));
          },
          memberships: _memberships,
        ),
      ),
    );
  }

  Widget _buildNewsUI(List<Post> mTransactions) {
    if (mTransactions == null || mTransactions.isEmpty) {
      // Prevent while waiting data error
      return ListShimmer();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Text(
            "Tin Tức",
            style: TextStyle(color: HColors.black, fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              return NewsRow(
                Post(
                  title: _posts[index].title,
                  content: _posts[index].title,
                  image: _posts[index].image,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsScreen(
                                post: _posts[index],
                              )));
                },
              );
            })
      ],
    );
  }
}
