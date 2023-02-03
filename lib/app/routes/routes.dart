import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/app/bloc/app_bloc.dart';
import 'package:flutter_firebase_login/login/view/views.dart';

List<Page<dynamic>> onGeneratedAppViewPages(
    AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
