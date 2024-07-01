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
class SignupScreen extends StatefulWidget implements AutoRouteWrapper {
  const SignupScreen({super.key});

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
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  final txtName = TextEditingController();
  final txtEmail = TextEditingController();
  final txtPass = TextEditingController();
  final userModel = UserModel();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWidget(
      appBarText: LocaleKeys.sign_up.tr(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.signupStatus == FirebaseStatus.loaded) {
            context.router.pushAndPopUntil(
              const UserHomeRoute(),
              predicate: (Route<dynamic> route) => false,
            );
          } else if (state.signupStatus == FirebaseStatus.error) {
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
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 25),
                    child: AppText(
                      LocaleKeys.name.tr(),
                      fontSize: 20,
                      color: context.colorScheme.m3Grey,
                      fontWeight: AppFontWeight.light,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                    child: CommonTextField(
                      textEditingController: txtName,
                      validator: (p0) {
                        if (p0?.isEmpty ?? false) {
                          return LocaleKeys.name_is_required.tr();
                        } else {
                          return null;
                        }
                      },
                      borderType: TextFieldBorder.outlinedBorder,
                      hintText: LocaleKeys.enter_first_name.tr(),
                    ),
                  ),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.email_is_required.tr();
                        } else if (value.isValidEmail == false) {
                          return LocaleKeys.email_validation_msg.tr();
                        } else {
                          return null;
                        }
                      },
                      borderType: TextFieldBorder.outlinedBorder,
                      hintText: LocaleKeys.enter_mail.tr(),
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
                          borderType: TextFieldBorder.outlinedBorder,
                          hintText: LocaleKeys.password.tr(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Align(
                      child: CommonTextButtonWidget(
                        isLoading: state.signupStatus == FirebaseStatus.loading,
                        backGroundColor: context.colorScheme.mainThemeColor,
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            context.read<AuthBloc>().add(
                                  SignUpEvent(
                                    userModel: userModel.copyWith(
                                      name: txtName.text,
                                      email: txtEmail.text.toLowerCase(),
                                      password: txtPass.text,
                                      isAdmin: false,
                                    ),
                                  ),
                                );
                          }
                        },
                        foreGroundColor: Colors.white,
                        text: LocaleKeys.sign_up.tr().toUpperCase(),
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
                            LocaleKeys.already_have_an_account.tr(),
                            fontSize: 15,
                            color: context.colorScheme.m3Grey,
                            fontWeight: AppFontWeight.light,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.router.push(
                                const LoginRoute(),
                                // predicate: (Route<dynamic> route) => false,
                              );
                            },
                            child: AppText(
                              LocaleKeys.login.tr(),
                              fontSize: 16,
                              color: context.colorScheme.mainThemeColor,
                              fontWeight: AppFontWeight.light,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            LocaleKeys.register_admin_txt.tr(),
                            fontSize: 15,
                            color: context.colorScheme.m3Grey,
                            fontWeight: AppFontWeight.light,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.router.push(
                                const RegisterAdminRoute(),
                                // predicate: (Route<dynamic> route) => false,
                              );
                            },
                            child: AppText(
                              LocaleKeys.register.tr(),
                              fontSize: 16,
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
