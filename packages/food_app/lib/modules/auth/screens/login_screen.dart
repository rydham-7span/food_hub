import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/app/enum.dart';
import 'package:food_app/app/routes/app_router.dart';
import 'package:food_app/modules/auth/bloc/auth_bloc.dart';
import 'package:food_app/modules/auth/model/user_model.dart';
import 'package:food_app/modules/auth/repository/auth_repository.dart';
import 'package:food_localization/food_localization.dart';
import 'package:food_ui/food_ui.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthService(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(authService: context.read<AuthService>()),
        ),
      ],
      child: this,
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userModel = const UserModel();
  final formKey = GlobalKey<FormState>();

  final txtEmail = TextEditingController();
  final txtPass = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWidget(
      appBarText: LocaleKeys.login.tr(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.loginStatus == FirebaseStatus.loaded) {
            context.router.pushAndPopUntil(
              const HomeRoute(),
              predicate: (Route<dynamic> route) => false,
            );
          } else if (state.loginStatus == FirebaseStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                context: context,
                message: state.errorMessage ?? '',
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 25),
                    child: AppText(
                      LocaleKeys.email.tr(),
                      fontSize: 20,
                      color: context.colorScheme.m3Grey,
                      fontWeight: AppFontWeight.light,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                    child: CommonTextField(
                      textEditingController: txtEmail,
                      borderType: TextFieldBorder.outlinedBorder,
                      hintText: LocaleKeys.enter_mail.tr(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.email_is_required.tr();
                        } else if (value.isValidEmail == false) {
                          return LocaleKeys.email_validation_msg.tr();
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 25),
                    child: AppText(
                      LocaleKeys.password.tr(),
                      fontSize: 20,
                      color: context.colorScheme.m3Grey,
                      fontWeight: AppFontWeight.light,
                    ),
                  ),
                  StatefulBuilder(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                        child: CommonTextField(
                          isObscure: isObscure,
                          textEditingController: txtPass,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.pass_is_required.tr();
                            } else if (value.length < 6) {
                              return LocaleKeys.pwd_validation_msg_len.tr();
                            } else if (value.isValidPassword == false) {
                              return LocaleKeys.pwd_validation_msg_type.tr();
                            } else {
                              return null;
                            }
                          },
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscure ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                              color: context.colorScheme.m3Grey.withAlpha(120),
                            ),
                            onPressed: () {
                              state(() {
                                isObscure = !isObscure;
                              });
                            },
                          ),
                          borderType: TextFieldBorder.outlinedBorder,
                          hintText: LocaleKeys.password.tr(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                      child: AppText(
                        LocaleKeys.forgot_your_pwd.tr(),
                        fontSize: 17,
                        color: context.colorScheme.mainThemeColor,
                        fontWeight: AppFontWeight.light,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                      child: CommonTextButtonWidget(
                        isLoading: state.loginStatus == FirebaseStatus.loading,
                        backGroundColor: context.colorScheme.mainThemeColor,
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                LogInEvent(
                                  userModel: userModel.copyWith(
                                    email: txtEmail.text,
                                    password: txtPass.text,
                                  ),
                                ),
                              );
                        },
                        foreGroundColor: Colors.white,
                        text: LocaleKeys.login.tr().toUpperCase(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            LocaleKeys.do_not_have_account.tr(),
                            fontSize: 16,
                            color: context.colorScheme.m3Grey,
                            fontWeight: AppFontWeight.light,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.router.pushAndPopUntil(
                                const SignupRoute(),
                                predicate: (Route<dynamic> route) => false,
                              );
                            },
                            child: AppText(
                              LocaleKeys.sign_up.tr(),
                              fontSize: 17,
                              color: context.colorScheme.mainThemeColor,
                              fontWeight: AppFontWeight.light,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
