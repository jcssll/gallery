import 'package:flutter/material.dart';

class Category {
  final String name;
  final String imageUrl;

  Category(this.name, this.imageUrl);
}

void main() => runApp(const CardExampleApp());

class CardExampleApp extends StatelessWidget {
  const CardExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Talk Ease')),
      body:  CardExample(),
    );
  }
}

class CardExample extends StatelessWidget {
   CardExample({Key? key}) : super(key: key);

  // List of categories with names and image URLs
  final List<Category> categories = [
    Category('Hungry', 'web/assets/Hungry.png'),
    Category('Thirsty', 'web/assets/Thirsty.png'),
    Category('Bathroom', 'web/assets/Bathroom.png'),
    Category('Play', 'web/assets/I want to play legos.png'),
    
    // Add more categories with names and image URLs
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3, // Number of rows
      itemBuilder: (context, rowIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: List.generate(
              3, // Number of cards in each row
              (cardIndex) {
                int categoryIndex = rowIndex * 3 + cardIndex;

                // Check if categoryIndex is within the categories list bounds
                if (categoryIndex < categories.length) {
                  Category category = categories[categoryIndex];

                  return SizedBox(
                    width: 150,
                    height: 150,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(category.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          // You can customize the content inside the card here
                          // For example, you can add a Text widget to display the category name
                          child: Text(
                            category.name,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                  );
                } else {
                  return Container(); // Placeholder for empty spaces
                }
              },
            ),
          ),
        );
      },
    );
  }
}
