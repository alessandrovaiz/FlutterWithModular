import 'package:lanchonete/app/modules/home/home_page.dart';
import 'package:lanchonete/app/modules/login/login_module.dart';
import 'package:lanchonete/app/shared/auth/auth_controller.dart';
import 'package:lanchonete/app/shared/auth/repositories/auth_repository.dart';
import 'package:lanchonete/app/shared/auth/repositories/auth_repository_interface.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:lanchonete/app/app_widget.dart';
import 'package:lanchonete/app/modules/home/home_module.dart';

class RoutesModel {
  //adicionar rotas nomeadas
  static const String homePage = '/home';
}

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: LoginModule()),
        ModularRouter(RoutesModel.homePage, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
