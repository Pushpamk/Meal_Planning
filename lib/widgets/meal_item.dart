import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    this.id,
    this.title,
    this.imgUrl,
    this.duration,
    this.complexity,
    this.affordability,
  });

  String get complexityText {
    if (complexity == Complexity.Simple)
      return 'Simple';
    else if (complexity == Complexity.Challenging)
      return 'Challenging';
    else
      return 'Hard';
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable)
      return 'Affordable';
    else if (affordability == Affordability.Pricey)
      return 'Pricey';
    else
      return 'Luxurious';
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imgUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black54,
                  ),
                  bottom: 5,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.timer),
                      Text(duration.toString()),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[Icon(Icons.work), Text(complexityText)],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      Text(affordabilityText),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
