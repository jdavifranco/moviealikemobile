import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:moviealike/presentation/common/dialogs/global_dialog.dart';

@singleton
class DialogService {

  DialogService();

  GlobalKey? _globalKey;

  void init(GlobalKey key) {
    _globalKey = key;
  }

  Future<void> _show(Widget dialog) async {
    if (_globalKey?.currentContext != null) {
      return showDialog(
        context: _globalKey!.currentContext!,
        barrierDismissible: false,
        builder: (context) => dialog,
      );
    }
  }

  Future<void> showGlobalDialog({
    required VoidCallback onClickToAction,
  }) {
    return _show(GlobalDialog(
      onClickToAction: onClickToAction,
    ));
  }

}