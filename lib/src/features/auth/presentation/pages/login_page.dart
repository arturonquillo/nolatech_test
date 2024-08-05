// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_conditional_assignment

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_time/src/core/router/app_route_enum.dart';
import 'package:tennis_time/src/core/utils/assets.dart';
import 'package:tennis_time/src/core/utils/colors.dart';
import 'package:tennis_time/src/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:tennis_time/src/features/auth/presentation/blocs/auth_event.dart';
import 'package:tennis_time/src/features/auth/presentation/blocs/auth_state.dart';
import 'package:tennis_time/src/features/auth/presentation/widgets/custom_text_formfield.dart';
import 'package:tennis_time/src/features/auth/presentation/widgets/title_underline.dart';
import 'package:tennis_time/src/shared/widgets/custom_buttom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? bSController;
  bool _errorShown = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            _showLoadingSheet();
          } else if (state is AuthLoaded) {
            _closeSheet();
            _showSuccessSheet();
            Future.delayed(Duration(seconds: 1), () {
              _closeSheet();
              Navigator.of(context).popAndPushNamed(AppRouteEnum.home.name);
            });
          } else if (state is AuthError) {
            _closeSheet();
            if (!_errorShown) {
              _showErrorSheet(state.message);
            }
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(AppAssets.topLogin),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 60),
                                child: TitleUnderline(text: "Iniciar sesión"),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    CustomTextFormfield(
                                      controller: emailController,
                                      title: 'Email',
                                      hintText: "usuario@gmail.com",
                                      prefixIcon: Icons.email_outlined,
                                    ),
                                    CustomTextFormfield(
                                      controller: passwordController,
                                      title: 'Contraseña',
                                      hintText: "*********",
                                      prefixIcon: Icons.lock_outline,
                                      isObscured: true,
                                    ),
                                    CheckboxListTile(
                                      dense: true,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      contentPadding: EdgeInsets.zero,
                                      title: Text("Recordar contraseña"),
                                      value: true,
                                      onChanged: (val) {},
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "¿Olvidaste tu contraseña?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: AppColors.secondaryColor,
                                            ),
                                      ),
                                    ),
                                    CustomButton(
                                      text: "Iniciar sesión",
                                      margin: EdgeInsets.only(top: 22),
                                      loading: state is AuthLoading,
                                      onPressed: () {
                                        _errorShown = false;
                                        BlocProvider.of<AuthBloc>(context).add(
                                            LoginEvent(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text));
                                      },
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("¿Aun no tienes cuenta?"),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .popAndPushNamed(
                                                          AppRouteEnum
                                                              .register.name);
                                                },
                                                child: Text(
                                                  "Regístrate",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: AppColors
                                                            .secondaryColor,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showLoadingSheet() {
    if (bSController == null) {
      bSController = _scaffoldKey.currentState?.showBottomSheet(
        (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (BuildContext context) {
              return Container(
                height: 80,
                child: Center(child: CircularProgressIndicator()),
              );
            },
          );
        },
      );
    }
  }

  void _showSuccessSheet() {
    if (bSController == null) {
      bSController = _scaffoldKey.currentState?.showBottomSheet(
        (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (BuildContext context) {
              return Material(
                child: Container(
                  height: 80,
                  child: Center(child: Text("Inicio exitoso")),
                ),
              );
            },
          );
        },
      );
      Future.delayed(Duration(seconds: 5), () {
        _closeSheet();
      });
    }
  }

  void _showErrorSheet(String message) {
    if (bSController == null) {
      _errorShown = true;
      bSController = _scaffoldKey.currentState?.showBottomSheet(
        (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (BuildContext context) {
              return Material(
                child: Container(
                  height: 80,
                  child: Center(child: Text(message)),
                ),
              );
            },
          );
        },
      );
      Future.delayed(Duration(seconds: 5), () {
        _closeSheet();
      });
    }
  }

  void _closeSheet() {
    if (bSController != null) {
      bSController!.close();
      bSController = null;
    }
  }
}
