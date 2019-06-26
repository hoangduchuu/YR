import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/provider/AuthProvider.dart';
import 'package:your_reward_user/provider/CouponProvider.dart';
import 'package:your_reward_user/provider/PostProvider.dart';
import 'package:your_reward_user/entity/LoginEntity.dart';
import 'package:your_reward_user/entity/RegisterFacbookRequest.dart';
import 'package:your_reward_user/entity/RegisterRequest.dart';
import 'package:your_reward_user/provider/TransactionProvider.dart';
import 'package:your_reward_user/styles/h_colors.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';
import 'package:your_reward_user/utils/UserProvider.dart';
import 'package:your_reward_user/utils/log_prefix.dart';

class ApiScreenTest extends StatefulWidget {
  @override
  _ApiScreenTestState createState() => _ApiScreenTestState();
}

class _ApiScreenTestState extends State<ApiScreenTest> {
  AuthProvider repo;
  PostRepo postRepo;
  CouponRepo couponRepo;
  TransactionProvider _transactionRepo;
  var _loginStatus = "Login";
  var _userProfile = "Press login";

  @override
  void initState() {
    repo = AuthProvider();
    postRepo = PostRepo();
    couponRepo = CouponRepo();
    _transactionRepo = TransactionProvider();
    _onAuthenticationLogin();
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                child: SizedBox(
                    child: Text(
              _userProfile,
              style: TextStyle(
                  backgroundColor: Colors.blue,
                  color: Colors.white,
                  fontSize: 18),
            ))),
            RaisedButton(
              onPressed: _onAuthenticationLogin,
              child: Text(_loginStatus),
            ),
            RaisedButton(
              onPressed: _onRegister,
              child: Text("Register"),
            ),
            RaisedButton(
              onPressed: _onforgotPassword,
              child: Text("Lost password"),
            ),
            RaisedButton(
              onPressed: _onLoginFacebook,
              child: Text("Login FB API"),
            ),
            RaisedButton(
              onPressed: _onGetPosts,
              child: Text("getPosts"),
            ),
            RaisedButton(
              onPressed: _onGetPostDetail,
              child: Text("getPostsDetail"),
            ),
            RaisedButton(
              onPressed: _onCreateNewPost,
              child: Text("createNewPost"),
            ),
            RaisedButton(
              onPressed: _onGetGeneralCoupons,
              child: Text("getGeneral Coupons"),
            ),
            RaisedButton(
              onPressed: _onGetCouponDetails,
              child: Text("getGeneral Coupons Details"),
            ),
            RaisedButton(
              onPressed: _onGetMemberShips,
              child: Text("get card"),
            ),
            RaisedButton(
              onPressed: _onGetStores,
              child: Text("get Stores"),
            ),
            RaisedButton(
              onPressed: _onGetTransactionByStoreId,
              child: Text("getTransactionByStoreID"),
            ),
            RaisedButton(
              onPressed: _onGetTransactionOverTheWorld,
              child: Text("_onGetTransactionOverTheWorld"),
            ),
            RaisedButton(
              onPressed: _onGetCouponsOfUser,
              child: Text("_onGetCouponsOfUser"),
            ),
            RaisedButton(
              onPressed: _onGetCouponDetailById,
              child: Text("_onGetCouponDetailById"),
            ),
          ],
        ),
      ),
    );
  }

  void _onAuthenticationLogin() {
    print(LogPrefix.methodName("Authentication (login)"));
    repo.login("huu@example.com", "john.doe").then((onValue) {
      // provide token
      LoginEntity entity = onValue;
      UserProvider.loginEntity = entity;
      UserProvider.userEntity = entity.user;
      print(LogPrefix.okResponse(entity.accessToken));
      setState(() {
        _userProfile =
            'Welcome: ${UserProvider.userEntity.email} - ${UserProvider.userEntity.fullname}';
      });
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }

  void _onRegister() {
    print(LogPrefix.methodName("_onRegister"));
    String thumb =
        "https://itviec.com/assets/logo-itviec-65afac80e92140efa459545bc1c042ff4275f8f197535f147ed7614c2000ab0f.png";
    RegisterRequest requestBody = RegisterRequest(
        email: CommonUtils.getRandomEmail(),
        role: "client",
        fullName: "H Hoang",
        password: "123456",
        confirmPasswrod: "123456",
        thumbnail: thumb,
        gender: "male",
        phone: CommonUtils.getRandomInt().toString(),
        status: "active");
    repo.register(requestBody).then((onValue) {
      print(LogPrefix.okResponse(onValue));
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }

  void _onforgotPassword() {
    print(LogPrefix.methodName("_onforgotPassword"));
    print(LogPrefix.errorResponse("chưa có API này, nhắc backend "));
  }

  void _onLoginFacebook() {
    print(LogPrefix.methodName("_onLoginFacebook"));
    RegisterFacebookRequest body = RegisterFacebookRequest(
        facebookId: "9929992",
        email: CommonUtils.getRandomEmail(),
        avatar:
            "https://s.vnecdn.net/vnexpress/restruct/i/v75/graphics/img_logo_vne_web.gif",
        tokenKey: "abcdaskljdlkasjdslkjdalsj093784jklshfs",
        strategy: "facebook");
    repo.registerWithFacebook(body).then((onValue) {
      print(LogPrefix.okResponse(onValue));
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }

  void _onGetPosts() {
    print(LogPrefix.methodName("_onGetPosts"));
    postRepo.getPosts("Chung","page").then((onValue) {
      print(LogPrefix.okResponse(onValue));
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }

  void _onGetPostDetail() {
    print(LogPrefix.methodName("_onGetPostDetail"));
    postRepo.getPostDetail("5c9a02f7a6151b1603bcad7c").then((onValue) {
      print(LogPrefix.okResponse(onValue));
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }

  void _onCreateNewPost() {
    print(LogPrefix.methodName("_onCreateNewPost"));
//    CreatePostRequest body = CreatePostRequest(
//        objectType: "page",
//        status: "active",
//        title: " Post Title From IOS- ANDROID",
//        code: "4",
//        description: " Horray News from APP",
//        thumbnail: "https://s120.avatar.talk.zdn.vn/default");
//
//    postRepo.createNewPost(body).then((onValue) {
//      print(LogPrefix.okResponse(onValue));
//    }).catchError((e) {
//      print(LogPrefix.errorResponse(e));
//    });
    print(LogPrefix.okResponse("Tạo mới có phải là phần bên WEB-ADMIN?"));
  }

  void _onGetGeneralCoupons() {
    print(LogPrefix.methodName("_onGetGeneralCoupons"));
    couponRepo.getCoupons().then((onValue) {
      print(LogPrefix.okResponse(onValue));
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }

  void _onGetCouponDetails() {
    print(LogPrefix.methodName("_onGetGeneralCoupons"));
    couponRepo.getCouponDetails("5d0764974ea8b268344fc7b9").then((onValue) {
      print(LogPrefix.okResponse(onValue));
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }

  void _onGetMemberShips() {
    print(LogPrefix.methodName("_onGetMemberShips"));
    couponRepo
        .getMemberShipCards("5ce0061bc151ae4a211e7508", limit: 2, skip: 0)
        .then((onValue) {
      print(LogPrefix.okResponse(onValue));
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }

  void _onGetStores() {
    print(LogPrefix.methodName("_onGetStores"));
    couponRepo
        .getStores("5ce3704714fcb561a3d7a277", limit: 2, skip: 0)
        .then((onValue) {
      print(LogPrefix.okResponse(onValue));
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }

  void _onGetTransactionByStoreId() {
    print(LogPrefix.methodName("_onGetTransactionByStoreId"));
    couponRepo
        .getTransactionByStoreId("5cdfeb2b04456d438bb0ae4b", limit: 2, skip: 0)
        .then((onValue) {
      print(LogPrefix.okResponse(onValue));
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }

  void _onGetTransactionOverTheWorld() {
    print(LogPrefix.methodName("_onGetTransactionOverTheWorld"));
    _transactionRepo.getAllTransactions(limit: 2, skip: 0).then((onValue) {
      print(LogPrefix.okResponse(onValue));
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }

  void _onGetCouponsOfUser() {
    print(LogPrefix.methodName("_onGetCouponsOfUser"));
    couponRepo.getCouponsOfUser(limit: 2, skip: 0).then((onValue) {
      print(LogPrefix.okResponse(onValue));
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }

  void _onGetCouponDetailById() {
    print(LogPrefix.methodName("_onGetCouponDetailById"));
    couponRepo.getCouponDetailById("5ce02b3db37edf5d3983e258").then((onValue) {
      print(LogPrefix.okResponse(onValue));
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }
}
