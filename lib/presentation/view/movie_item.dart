import 'package:flutter/material.dart';
import 'package:movie/models/model.dart';

Widget buildMovieItem(Results model) => Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      elevation: 10,
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.teal[700],
        ),
        child: Column(
          children: [
            Text(
              model.title,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(
              height: 12,
            ),
            Image.network(
              model.backdropPath,
              fit: BoxFit.cover,
              height: 250,
            ),
          ],
        ),
      ),
    );
