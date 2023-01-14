import 'package:flutter/material.dart';

myArchives(type) {
  return Row(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          type,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
        ),
      )
    ],
  );
}
