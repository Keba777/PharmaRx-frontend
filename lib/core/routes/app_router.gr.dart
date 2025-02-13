// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:pharmarx/features/authentication/presentation/screens/login_screen.dart'
    as _i2;
import 'package:pharmarx/features/authentication/presentation/screens/register_screen.dart'
    as _i3;
import 'package:pharmarx/features/authentication/presentation/screens/verify_otp_screen.dart'
    as _i4;
import 'package:pharmarx/home_screen.dart' as _i1;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginScreen();
    },
  );
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i5.PageRouteInfo<void> {
  const RegisterRoute({List<_i5.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i4.VerifyOTPScreen]
class VerifyOTPRoute extends _i5.PageRouteInfo<VerifyOTPRouteArgs> {
  VerifyOTPRoute({
    _i6.Key? key,
    required String email,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         VerifyOTPRoute.name,
         args: VerifyOTPRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'VerifyOTPRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyOTPRouteArgs>();
      return _i4.VerifyOTPScreen(key: args.key, email: args.email);
    },
  );
}

class VerifyOTPRouteArgs {
  const VerifyOTPRouteArgs({this.key, required this.email});

  final _i6.Key? key;

  final String email;

  @override
  String toString() {
    return 'VerifyOTPRouteArgs{key: $key, email: $email}';
  }
}
