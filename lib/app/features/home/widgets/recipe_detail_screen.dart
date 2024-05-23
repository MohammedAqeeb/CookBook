import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookbook/constants/colors.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class RecipeDetailedScreen extends StatelessWidget {
  final Recipe recipes;
  const RecipeDetailedScreen({
    required this.recipes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.appleRed,
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(recipes.title, textScaleFactor: 0.5),
                background: CachedNetworkImage(
                  imageUrl: recipes.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Text(
                  recipes.title,
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
                            Text("${recipes.readyInMinutes} Min",
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
                            Text(recipes.servings.toString(),
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
                            Text(recipes.pricePerServing.toString(),
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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Quick summary",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    HtmlWidget(
                      recipes.summary,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Preparation",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    HtmlWidget(recipes.instructions),
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
