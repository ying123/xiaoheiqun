import 'dart:async';
import "package:dio/dio.dart";
import 'package:flutter/material.dart';
import 'common/tinker.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  @override
  var xieyi1 = "image/sel_@2x_290.png";
  var xieyi2 = "image/sel_@2x_290.png";
  var select1 = 0;
  var select2 = 0;
  Timer _timer;
  int _countdownTime = 0;
  Widget build(BuildContext context) {
    // TODO: implement build

    return Material(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 70),
                  child: Image.asset(
                    "image/logo@2x.png",
                    width: 60,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  child: Column(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Colors.black26))),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: TextField(
                              controller: phone,
                              decoration: InputDecoration(
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "请输入手机号",
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black26,
                                  )),
                            ),
                          )),
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Colors.black26))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: 200,
                                child: TextField(
                                  controller: code,
                                  decoration: InputDecoration(
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "请输入验证码",
                                      hintStyle: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black26,
                                      )),
                                ),
                              ),
                              GestureDetector(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      _countdownTime == 0
                                          ? "获取验证码"
                                          : "$_countdownTime     ",
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    if (_countdownTime == 0) {
                                      //Http请求发送验证码
                                      getCode();
                                    }
                                  }),
                            ],
                          )),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Colors.black26))),
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TextField(
                            decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "请输入邀请码(选填)",
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black26,
                                )),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 35, 0, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Image.asset(
                                  "$xieyi1",
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  if (select1 == 0) {
                                    xieyi1 = "image/sel_@2x_294.png";
                                    select1 = 1;
                                  } else {
                                    xieyi1 = "image/sel_@2x_290.png";
                                    select1 = 0;
                                  }
                                });
                              },
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "我同意",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    "《用户注册协议》",
                                    style: TextStyle(fontSize: 13),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  child: Container(
                                    child: Image.asset(
                                      "$xieyi2",
                                      width: 15,
                                      height: 15,
                                    ),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (select2 == 0) {
                                        xieyi2 = "image/sel_@2x_294.png";
                                        select2 = 1;
                                      } else {
                                        xieyi2 = "image/sel_@2x_290.png";
                                        select2 = 0;
                                      }
                                    });
                                  },
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "我同意",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      Text(
                                        "《隐私协议》",
                                        style: TextStyle(fontSize: 13),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 60, vertical: 35),
                    child: Text(
                      "注册/登录",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    login();
                  },
                )
              ],
            )),
      ),
    );
  }

  var phone = TextEditingController.fromValue(TextEditingValue());
  var code = TextEditingController.fromValue(TextEditingValue());
  var loginType = 0;
  var qycode;

  void login() {
    FormData p = FormData.from({
      "phone": phone.text,
      "type": "0",
      "code": code.text,
      "poll": "",
    });
    if (select1 == 1 && select2 == 1) {
      if (phone.text == "") {
        Tinker.toast("手机号不能为空");
      } else if (code.text == "") {
        Tinker.toast("验证码不为空");
      } else {
//        Tinker.toast("无");
        Tinker.post("/api/user/login", (data) {
//          Tinker.toast("成功");
          Tinker.setStrong(data["rows"]["userId"]);
          Tinker.getStrong();
          Navigator.pop(context);
//          Tinker.queryUserInfo(data["rows"]["userId"], (data) {
//            Tinker.setStrong(data);
//            Tinker.getStrong();
//            print(data);
//            print("=============================1");
//            Tinker.toast("登录成功");
//          });
        }, params: p);
      }
    } else
      Tinker.toast("请同意相关协议");
  }

  void getCode() {
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    bool matched = exp.hasMatch(phone.text);
//    Tinker.toast(phone.text);
    if (matched) {
//      Tinker.toast("正确");
      _countdownTime = 60;
      //开始倒计时
      startCountdownTimer();
      FormData param = FormData.from({"phone": phone.text});
      Tinker.get("/api/user/getCode", (data) {
//        Tinker.toast(data);
        Tinker.toast("发送验证码成功");
      }, params: param);
    } else {
      Tinker.toast("请输入正确的手机号");
    }
  }

  void startCountdownTimer() {
    const oneSec = const Duration(seconds: 1);

    var callback = (timer) => {
          setState(() {
            if (_countdownTime < 1) {
              _timer.cancel();
            } else {
              _countdownTime = _countdownTime - 1;
            }
          })
        };

    _timer = Timer.periodic(oneSec, callback);
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
