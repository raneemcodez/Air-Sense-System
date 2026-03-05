import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:airaystem/core/class/statuesrequest.dart';
import 'package:airaystem/core/constant/imageassets.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppRootError.loading))
        : statusRequest == StatusRequest.offlinefailure
        ? Center(child: Lottie.asset(AppRootError.offLine))
        : statusRequest == StatusRequest.serverfailure
        ? Center(child: Lottie.asset(AppRootError.server))
        : statusRequest == StatusRequest.failure
        ? Center(child: Lottie.asset(AppRootError.noData))
        : widget;
  }
}
