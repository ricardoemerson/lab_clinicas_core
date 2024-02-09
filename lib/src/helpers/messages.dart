import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final class Messages {
  static void showInfo(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(message: message),
    );
  }

  static void showSuccess(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(message: message),
    );
  }

  static void showError(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(message: message),
    );
  }
}

mixin MessageStateMixin {
  final _infoMessage = signal<String?>(null);
  final _successMessage = signal<String?>(null);
  final _errorMessage = signal<String?>(null);

  String? get infoMessage => _infoMessage();

  String? get successMessage => _successMessage();

  String? get errorMessage => _errorMessage();

  void clearInfo() => _infoMessage.value = null;

  void clearSuccess() => _successMessage.value = null;

  void clearError() => _errorMessage.value = null;

  void clearAllMessages() {
    untracked(() {
      clearInfo();
      clearSuccess();
      clearError();
    });
  }

  void showInfo(String message) {
    untracked(() => clearInfo());

    _infoMessage.value = message;
  }

  void showSuccess(String message) {
    untracked(() => clearSuccess());

    _successMessage.value = message;
  }

  void showError(String message) {
    untracked(() => clearError());

    _errorMessage.value = message;
  }
}

mixin MessageViewMixin<T extends StatefulWidget> on State<T> {
  void messageListener(MessageStateMixin state) {
    effect(() {
      switch (state) {
        case MessageStateMixin(:final infoMessage?):
          Messages.showInfo(infoMessage, context);

        case MessageStateMixin(:final successMessage?):
          Messages.showSuccess(successMessage, context);

        case MessageStateMixin(:final errorMessage?):
          Messages.showError(errorMessage, context);
      }
    });
  }

  void showInfo(String message) => Messages.showInfo(message, context);

  void showSuccess(String message) => Messages.showSuccess(message, context);

  void showError(String message) => Messages.showError(message, context);
}
