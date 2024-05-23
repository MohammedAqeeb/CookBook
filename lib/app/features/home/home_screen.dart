import 'package:cookbook/app/data/data_provider/recipe_data_provider.dart';
import 'package:cookbook/app/features/home/widgets/recipe_grid_view.dart';
import 'package:cookbook/models/ingredient.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.strawberryRed,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: AppColors.offWhite,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
              color: AppColors.offWhite,
            ),
          ),
        ],
        title: Column(
          children: [
            Text(
              'Cook Book',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.offWhite,
                  ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerText(context),
              buildData(),
            ],
          ),
        ),
      ),
    );
  }

  headerText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 8),
      child: Text(
        'Random Recipe Reveal',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildData() {
    return FutureBuilder(
      future: RecipeDataProvider().getRecipes(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: Colors.redAccent,
                strokeWidth: 1.5,
                backgroundColor: Colors.grey,
              ),
            ),
          );
        } else {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              final List<Recipe> recipe = snapshot.data!;
              if (recipe.isEmpty) {
                return const Text('Data Empty');
              } else {
                return buildGridView(recipe);
              }
            } else {
              return const Text('Data Empty');
            }
          } else {
            return const Text('Data Empty');
          }
        }
      }),
    );
  }

  Widget buildGridView(List<Recipe> recipe) {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 13 / 16,
        mainAxisSpacing: 12,
      ),
      itemCount: recipe.length,
      itemBuilder: (context, index) {
        Recipe ingredient = recipe[index];
        return RecipeGridViewWidget(recipes: ingredient);
      },
    );
  }
}
