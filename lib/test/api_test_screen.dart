import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/data/AuthRepo.dart';
import 'package:your_reward_user/data/PostRepo.dart';
import 'package:your_reward_user/model/RegisterFacbookRequest.dart';
import 'package:your_reward_user/model/RegisterRequest.dart';
import 'package:your_reward_user/styles/h_colors.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';
import 'package:your_reward_user/utils/log_prefix.dart';

class ApiScreenTest extends StatefulWidget {
  @override
  _ApiScreenTestState createState() => _ApiScreenTestState();
}

class _ApiScreenTestState extends State<ApiScreenTest> {
  AuthRepo repo;
  PostRepo postRepo;
  var _loginStatus = "Login";

  @override
  void initState() {
    repo = AuthRepo();
    postRepo = PostRepo();
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
      body: Center(
          child: Column(
        children: <Widget>[
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
        ],
      )),
    );
  }

  void _onAuthenticationLogin() {
    print(LogPrefix.methodName("Authentication (login)"));
    repo.login("huu@example.com", "john.doe").then((onValue) {
      print(LogPrefix.okResponse(onValue));
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
    postRepo.getPosts().then((onValue) {
      print(LogPrefix.okResponse(onValue));
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }
}
