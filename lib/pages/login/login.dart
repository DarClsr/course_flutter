import 'package:courses/utils/global.dart';
import 'package:courses/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

   String? username;
   String? password;
   final GlobalKey<FormState> _loginFormKey=GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Column(
      children: [
        Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 100,
            bottom: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("hello, \nwelcome back",
                  style: Theme.of(context).textTheme.displayLarge
              ),
              Form(
                key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "请输入邮箱"
                        ),
                        validator: (value){
                          if(!Utils.isEmail(value as String)){
                            return "邮箱非法";
                          }
                          return null;
                        },
                        onSaved: (value){
                          print("邮箱 $value");
                          setState(() {
                            username=value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextFormField(
                        obscureText: true,
                        validator: (value)=>  (value as String).length<6? "密码长度不够" : null,
                        onSaved: (value){
                          setState(() {
                            password=value;
                          });
                        },

                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "密码"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: submit,
                      child: Text(
                        "忘记密码？",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Center(
                      child: Text(
                        "登录",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    onPressed: () {
                      if(_loginFormKey.currentState!.validate()){
                        _loginFormKey.currentState!.save();
                        if(password=='123456'){
                          G.router!.navigateTo(context,'/');
                        }else {
                          print("密码错误");
                        }
                      }else {
                        print("提交失败");
                      }
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "创建一个新账户",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ));
  }

  void submit (){
    G.router!.navigateTo(context,'/');
  }
}
