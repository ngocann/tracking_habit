import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_habit/core/widget/loading_indicator.dart';

import 'base_bloc.dart';

abstract class BaseStateless<T extends BaseCubit<dynamic>>
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final baseCubit = context.read<T>();
    baseCubit.streamMessage.listen((onData) {
      showConfirmDialog(
          context: context,
          message: onData,
          onPress: () {
            Navigator.of(context).pop();
          });
    });

    return Scaffold(
      body: StreamBuilder<bool>(
        stream: baseCubit.streamLoading,
        builder: (_, data) {
          return _buildLoadingBody(data);
        },
      ),
    );
  }

  Widget body();

  Widget _buildLoadingBody(AsyncSnapshot<bool> data) {
    return Stack(
      children: <Widget>[
        body(),
        _buildIndicatorChild(data),
      ],
    );
  }

  Widget _buildIndicatorChild(AsyncSnapshot<bool> data) {
    if (data.hasData && data.data!) {
      return Positioned.fill(child: LoadingIndicator());
    }
    return Container();
  }
}

Future showConfirmDialog({
  required BuildContext context,
  required String message,
  required VoidCallback onPress,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 6),
                const Icon(
                  Icons.warning,
                  color: Colors.orange,
                ),
                const SizedBox(height: 6),
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Divider(),
                FlatButton(
                  onPressed: onPress,
                  child: Text(
                    'Đồng ý',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                )
              ],
            ),
          ),
        );
      });
}
