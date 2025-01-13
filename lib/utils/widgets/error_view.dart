import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String error;
  final Function onClick;
  const ErrorView({
    super.key,
    required this.error,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(error),
         ElevatedButton(
          onPressed: (){
            onClick();
          },
          child: Text('Retry'),
        ),
      ],
    );
  }
}