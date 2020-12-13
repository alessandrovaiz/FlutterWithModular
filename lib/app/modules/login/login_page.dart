import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lanchonete/app/widgets/textfield.dart';
import 'package:lanchonete/app/widgets/utils/colors.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Acessar aplicativo",
              style: TextStyle(color: colors.primary, fontSize: 10),
            ),
            Text(
              widget.title,
              style: TextStyle(color: colors.primary, fontSize: 16),
            ),
          ],
        ),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08),
              child: Text(
                "Olá!",
                style: TextStyle(fontSize: 40, color: colors.primaryDark),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: _formFields(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 55.0, left: 65),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Esqueci a senha",
                  style: TextStyle(color: colors.primary, fontSize: 12),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text("Login"),
                    color: colors.primary,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 3, color: colors.light))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    " - OU - ",
                    style: TextStyle(fontSize: 12, color: colors.primaryDark),
                  ),
                  padding: EdgeInsets.only(top: 16),
                ),
                SignInButton(
                  Buttons.Google,
                  text: "Acessar com o Google",
                  onPressed: () {},
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text("Não tem uma conta? Cadastre-se",
                      style: TextStyle(color: colors.primary, fontSize: 12)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _formFields() {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width * 0.7,
            child: AppText("Login", "Insira seu e-mail")),
        Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: AppText("Senha", "Insira a sua senha"))
      ],
    );
  }
}
