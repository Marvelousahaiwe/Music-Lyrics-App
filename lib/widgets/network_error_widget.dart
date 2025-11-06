// import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lottie/lottie.dart';

class NetworkErrorWidget extends StatelessWidget {
  final Function onRetryClicked;

  const NetworkErrorWidget({required this.onRetryClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Lottie.asset("assets/lottie_animations/network_error.json",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animate: true
                  // animation: "no_network",
                  ),
            ),
            Opacity(
              opacity: 0.8,
              child: Text(
                "Error :(",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                onRetryClicked.call();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
              child: Text("Try Again"),
            ),
          ],
        ),
      ),
    );
  }
}
