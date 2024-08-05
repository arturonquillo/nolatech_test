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

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? bSController;
  final TextEditingController namesController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool showError = false;

  @override
  void dispose() {
    Future.microtask(() {
      if (mounted) {
        BlocProvider.of<AuthBloc>(context).add(ResetAuthEvent());
      }
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print(state);
          if (state is AuthLoading) {
            _showLoadingSheet();
          } else if (state is AuthLoaded) {
            _closeSheet();
            _showSuccessSheet();
            BlocProvider.of<AuthBloc>(context).add(ResetAuthEvent());
          } else if (state is AuthError) {
            _closeSheet();

            _showErrorSheet(state.message);
            BlocProvider.of<AuthBloc>(context).add(ResetAuthEvent());
          
          } else if (state is RegisterValidationState) {
            _closeSheet();
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(AppAssets.topLogin),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: 40),
                              child: TitleUnderline(text: "Registro"),
                            ),
                            Column(
                              children: [
                                CustomTextFormfield(
                                  controller: namesController,
                                  title: 'Nombre y apellido',
                                  error: state is RegisterValidationState && state.namesError.isNotEmpty  && showError
                                      ? state.namesError
                                      : null,
                                  prefixIcon: Icons.email_outlined,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (p0) {
                                    BlocProvider.of<AuthBloc>(context)
                                        .add(ValidateRegisterEvent(
                                      names: p0,
                                      email: emailController.text,
                                      telephone: telephoneController.text,
                                      password: passwordController.text,
                                      confirmPassword:
                                          confirmPasswordController.text,
                                    ));
                                  },
                                ),
                                CustomTextFormfield(
                                  controller: emailController,
                                  title: 'email',
                                  error: state is RegisterValidationState && state.emailError.isNotEmpty && showError
                                      ? state.emailError
                                      : null,
                                  prefixIcon: Icons.email_outlined,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (p0) {
                                    BlocProvider.of<AuthBloc>(context)
                                        .add(ValidateRegisterEvent(
                                      names: namesController.text,
                                      email: p0,
                                      telephone: telephoneController.text,
                                      password: passwordController.text,
                                      confirmPassword:
                                          confirmPasswordController.text,
                                    ));
                                  },
                                ),
                                CustomTextFormfield(
                                  controller: telephoneController,
                                  title: 'Teléfono',
                                  error: state is RegisterValidationState  && state.telephoneError.isNotEmpty && showError
                                      ? state.telephoneError
                                      : null,
                                  prefixIcon: Icons.email_outlined,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (p0) {
                                    BlocProvider.of<AuthBloc>(context)
                                        .add(ValidateRegisterEvent(
                                      names: namesController.text,
                                      email: emailController.text,
                                      telephone: p0,
                                      password: passwordController.text,
                                      confirmPassword:
                                          confirmPasswordController.text,
                                    ));
                                  },
                                ),
                                CustomTextFormfield(
                                  controller: passwordController,
                                  title: 'Contraseña',
                                  error: state is RegisterValidationState  && state.passwordError.isNotEmpty && showError
                                      ? state.passwordError
                                      : null,
                                  prefixIcon: Icons.email_outlined,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (p0) {
                                    BlocProvider.of<AuthBloc>(context)
                                        .add(ValidateRegisterEvent(
                                      names: namesController.text,
                                      email: emailController.text,
                                      telephone: telephoneController.text,
                                      password: p0,
                                      confirmPassword:
                                          confirmPasswordController.text,
                                    ));
                                  },
                                ),
                                CustomTextFormfield(
                                  controller: confirmPasswordController,
                                  error: state is RegisterValidationState  && state.confirmPasswordError.isNotEmpty && showError
                                      ? state.confirmPasswordError
                                      : null,
                                  title: 'Confirmar contraseña',
                                  prefixIcon: Icons.email_outlined,
                                  textInputAction: TextInputAction.done,
                                  onChanged: (p0) {
                                    BlocProvider.of<AuthBloc>(context)
                                        .add(ValidateRegisterEvent(
                                      names: namesController.text,
                                      email: emailController.text,
                                      telephone: telephoneController.text,
                                      password: passwordController.text,
                                      confirmPassword:
                                          p0,
                                    ));
                                  },
                                ),
                                CustomButton(
                                  text: "Registrarme",
                                  margin: EdgeInsets.only(top: 40),
                                  loading: state is AuthLoading,
                                  onPressed: () {
                                    if(state is RegisterValidationState){
                                      setState(() {
                                        showError = true;
                                      });
                                    }
                                    if (state is AuthInitial) {
                                      BlocProvider.of<AuthBloc>(context)
                                          .add(RegisterEvent(
                                        names: namesController.text,
                                        email: emailController.text,
                                        telephone: telephoneController.text,
                                        password: passwordController.text,
                                        confirmPassword:
                                            confirmPasswordController.text,
                                      ));
                                    }
                                  },
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Ya tengo cuenta"),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .popAndPushNamed(
                                                    AppRouteEnum.login.name);
                                          },
                                          child: Text(
                                            "Iniciar sesión",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color:
                                                      AppColors.secondaryColor,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
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
                  child: Center(child: Text("Registro exitoso")),
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
