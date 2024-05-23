import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookbook/app/features/home/widgets/recipe_detail_screen.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:flutter/material.dart';

class RecipeGridViewWidget extends StatelessWidget {
  // final Recipe recipes;
  const RecipeGridViewWidget({
    // required this.recipes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const RecipeDetailedScreen(),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
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
          ),
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Container(
                  foregroundDecoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  width: double.infinity,
                  child: CachedNetworkImage(
                    // imageUrl: recipes.image,
                    imageUrl:
                        'https://img.spoonacular.com/recipes/638199-556x370.jpg',
                    fit: BoxFit.cover,
                    height: 150,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(9),
                child: const Text(
                  ' recipes.title dsajppdpi asd hy pfodijpiadf poijofpsdhopiuhfsodi oufhdsouhfsdih ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
