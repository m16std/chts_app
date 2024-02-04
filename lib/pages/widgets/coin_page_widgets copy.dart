import 'package:flutter/material.dart';

AppBar coinAppBar(BuildContext context, final bobrName) {
  return AppBar(
      scrolledUnderElevation: 0.0,
      backgroundColor: const Color.fromARGB(255, 37, 37, 48),
      title: Text(
        bobrName ?? '...',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/');
        },
        child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 37,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: const Icon(Icons.more_horiz)),
        ),
      ]);
}
