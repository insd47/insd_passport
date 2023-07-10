import "package:flutter/material.dart";

PageRouteBuilder insdForwardRoute(BuildContext context, Widget to) =>
    PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            to,
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: const Cubic(0, 0, .33, 1),
          );

          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: FadeTransition(
              opacity: curvedAnimation,
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 240),
        reverseTransitionDuration: const Duration(milliseconds: 180));

PageRouteBuilder insdBackwardClearRoute(BuildContext context, Widget to) =>
    PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            to,
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: const Cubic(.33, 0, 0, 1),
          );

          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: FadeTransition(
              opacity: curvedAnimation,
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 240));

PageRouteBuilder insdClearRoute(BuildContext context, Widget to) =>
    PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            to,
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          var curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: const Cubic(0, 0, .45, 1),
          );

          return FadeTransition(
            opacity: curvedAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 200));
