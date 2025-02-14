// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:pharmarx/cart_page.dart' as _i1;
import 'package:pharmarx/features/authentication/presentation/screens/login_screen.dart'
    as _i4;
import 'package:pharmarx/features/authentication/presentation/screens/register_screen.dart'
    as _i6;
import 'package:pharmarx/features/authentication/presentation/screens/verify_otp_screen.dart'
    as _i8;
import 'package:pharmarx/home_page.dart' as _i2;
import 'package:pharmarx/home_screen.dart' as _i3;
import 'package:pharmarx/profile_page.dart' as _i5;
import 'package:pharmarx/search_page.dart' as _i7;

/// generated route for
/// [_i1.CartPage]
class CartPage extends _i9.PageRouteInfo<void> {
  const CartPage({List<_i9.PageRouteInfo>? children})
    : super(CartPage.name, initialChildren: children);

  static const String name = 'CartPage';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.CartPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomePage extends _i9.PageRouteInfo<void> {
  const HomePage({List<_i9.PageRouteInfo>? children})
    : super(HomePage.name, initialChildren: children);

  static const String name = 'HomePage';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.ProfilePage]
class ProfilePage extends _i9.PageRouteInfo<void> {
  const ProfilePage({List<_i9.PageRouteInfo>? children})
    : super(ProfilePage.name, initialChildren: children);

  static const String name = 'ProfilePage';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfilePage();
    },
  );
}

/// generated route for
/// [_i6.RegisterScreen]
class RegisterRoute extends _i9.PageRouteInfo<void> {
  const RegisterRoute({List<_i9.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i7.SearchPage]
class SearchPage extends _i9.PageRouteInfo<void> {
  const SearchPage({List<_i9.PageRouteInfo>? children})
    : super(SearchPage.name, initialChildren: children);

  static const String name = 'SearchPage';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.SearchPage();
    },
  );
}

/// generated route for
/// [_i8.VerifyOTPScreen]
class VerifyOTPRoute extends _i9.PageRouteInfo<VerifyOTPRouteArgs> {
  VerifyOTPRoute({
    _i10.Key? key,
    required String email,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         VerifyOTPRoute.name,
         args: VerifyOTPRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'VerifyOTPRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyOTPRouteArgs>();
      return _i8.VerifyOTPScreen(key: args.key, email: args.email);
    },
  );
}

class VerifyOTPRouteArgs {
  const VerifyOTPRouteArgs({this.key, required this.email});

  final _i10.Key? key;

  final String email;

  @override
  String toString() {
    return 'VerifyOTPRouteArgs{key: $key, email: $email}';
  }
}
