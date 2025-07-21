import 'package:flutter/material.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';

class ErrorDescriptionWidget extends StatelessWidget {
  final VoidCallback onTryAgain;
  final String? errorMessage;
  final String assetPath;
  final RequestError? requestError;

  const ErrorDescriptionWidget({
    super.key,
    required this.onTryAgain,
    this.errorMessage,
    required this.assetPath,
    this.requestError,
  });

  @override
  Widget build(BuildContext context) {
    final error = requestError;

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Error Icon
          _buildErrorIcon(context, error),
          const SizedBox(height: 16),

          // Error Title
          Text(
            _getErrorTitle(context, error),
            style: context.typography.heading3.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          // Error Message
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              _getErrorMessage(context, error),
              style: context.typography.body2.copyWith(
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),

          // Try Again Button
          ElevatedButton(
            onPressed: onTryAgain,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              context.text.tryAgain,
              style: context.typography.body2.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isNetworkError(RequestError? error) {
    return error is ConnectionError;
  }

  Widget _buildErrorIcon(BuildContext context, RequestError? error) {
    if (_isNetworkError(error)) {
      return Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Icon(
          Icons.wifi_off,
          size: 40,
          color: AppColors.accent,
        ),
      );
    }

    if (_isServerError(error)) {
      return Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Icon(
          Icons.cloud_off,
          size: 40,
          color: AppColors.accent,
        ),
      );
    }

    return Image.asset(
      assetPath,
      width: 80,
      height: 80,
    );
  }

  bool _isServerError(RequestError? error) {
    return error is ServerError;
  }

  String _getErrorTitle(BuildContext context, RequestError? error) {
    if (error == null) {
      return context.text.errorGenericTitle;
    }
    switch (error.runtimeType) {
      case ConnectionError:
        return context.text.errorNoInternet;
      case ServerError:
        return context.text.errorServer;
      case RequestCancelled:
        return context.text.errorTimeout;
      case NoResultsFound:
        return context.text.noResults;
      default:
        return context.text.errorUnknown;
    }
  }

  String _getErrorMessage(BuildContext context, RequestError? error) {
    if (error == null) {
      return errorMessage ?? context.text.errorGenericMessage;
    }
    switch (error.runtimeType) {
      case ConnectionError:
        return context.text.errorNoInternetMessage;
      case ServerError:
        return context.text.errorServerMessage;
      case RequestCancelled:
        return context.text.errorTimeoutMessage;
      case NoResultsFound:
        return context.text.noResultsDescription;
      default:
        return context.text.errorUnknownMessage;
    }
  }
}
