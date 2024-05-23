import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookbook/constants/colors.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class RecipeDetailedScreen extends StatelessWidget {
  // final Recipe recipes;
  const RecipeDetailedScreen({
    // required this.recipes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.watermelonGreen,
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('recipes.title', textScaleFactor: 0.5),
                background: CachedNetworkImage(
                  imageUrl:
                      'https://img.spoonacular.com/recipes/638199-556x370.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Text(
                  'Random Recipe Reveal',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26.0, vertical: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(-2, -2),
                        blurRadius: 12,
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                      ),
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 5,
                        color: Color.fromRGBO(0, 0, 0, 0.10),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.orangeOrange,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Text('.readyInMinutes'.toString() + " Min",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            Text(
                              "Ready in",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Text('widget.info.servings'.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            Text(
                              "Servings",
                              style: TextStyle(color: Colors.grey.shade600),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Text('widget.info.pricePerServing'.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            Text("Price/Servings",
                                style: TextStyle(color: Colors.grey.shade600))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(26.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quick summary",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    HtmlWidget(
                      "The recipe Chicken Mulligatawny Soup can be made <b>in around 45 minutes</b>. This main course has <b>368 calories</b>, <b>27g of protein</b>, and <b>10g of fat</b> per serving. This recipe serves 6. For <b>${2.5} per serving</b>, this recipe <b>covers 22%</b> of your daily requirements of vitamins and minerals. A couple people made this recipe, and 36 would say it hit the spot. It is brought to you by Foodista. <b>Autumn</b> will be even more special with this recipe. Head to the store and pick up apples, basmati rice, cayenne pepper, and a few other things to make it today. With a spoonacular <b>score of 74%</b>, this dish is pretty good. <a href=\"https://spoonacular.com/recipes/chicken-mulligatawny-soup-1589473\">Chicken Mulligatawny Soup</a>, <a href=\"https://spoonacular.com/recipes/chicken-mulligatawny-soup-678904\">Chicken Mulligatawny Soup</a>, and <a href=\"https://spoonacular.com/recipes/mulligatawny-soup-chicken-94598\">Mulligatawny Soup ( Chicken )</a> are very similar to this recipe.",
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(26.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Preparation",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    HtmlWidget(
                      "The recipe Chicken Mulligatawny Soup can be made <b>in around 45 minutes</b>. This main course has <b>368 calories</b>, <b>27g of protein</b>, and <b>10g of fat</b> per serving. This recipe serves 6. For <b>${2.5} per serving</b>, this recipe <b>covers 22%</b> of your daily requirements of vitamins and minerals. A couple people made this recipe, and 36 would say it hit the spot. It is brought to you by Foodista. <b>Autumn</b> will be even more special with this recipe. Head to the store and pick up apples, basmati rice, cayenne pepper, and a few other things to make it today. With a spoonacular <b>score of 74%</b>, this dish is pretty good. <a href=\"https://spoonacular.com/recipes/chicken-mulligatawny-soup-1589473\">Chicken Mulligatawny Soup</a>, <a href=\"https://spoonacular.com/recipes/chicken-mulligatawny-soup-678904\">Chicken Mulligatawny Soup</a>, and <a href=\"https://spoonacular.com/recipes/mulligatawny-soup-chicken-94598\">Mulligatawny Soup ( Chicken )</a> are very similar to this recipe.",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
