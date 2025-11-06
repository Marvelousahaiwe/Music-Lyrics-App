import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FavoriteIconWidget extends StatefulWidget {
  final double size;
  final bool isSaved;
  final Function onIconClicked;

  const FavoriteIconWidget(
    this.isSaved,
    this.onIconClicked, {
    this.size = 28,
  });

  @override
  _FavoriteIconWidgetState createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  String favoriteAnimation = "Favorite";
  String unFavoriteAnimation = "Unfavorite";
  String? animation;
  double? size;

  @override
  void initState() {
    super.initState();
    size = widget.size;
    animation = widget.isSaved ? favoriteAnimation : unFavoriteAnimation;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeAnimation,
      child: !widget.isSaved
          ? Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
              size: size,
            )
          : Center(
              child: Container(
                height: 100,
                width: 100,
                child: Lottie.asset(
                  "assets/lottie_animations/favourite.json",
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  animate: true,
                  repeat: false,
                ),
              ),
            ),
    );
  }

  void changeAnimation() {
    setState(
      () {
        animation = (animation == favoriteAnimation)
            ? unFavoriteAnimation
            : favoriteAnimation;
        widget.onIconClicked();
      },
    );
  }
}
