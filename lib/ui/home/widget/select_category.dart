import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoryOfAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, String>(
      builder: (context, selectedCategory) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryTile('Home', Icons.location_pin, selectedCategory),
            CategoryTile('Office', Icons.location_pin, selectedCategory),
            CategoryTile('Apartment', Icons.location_pin, selectedCategory),
          ],
        );
      },
    );
  }
}



class CategoryTile extends StatelessWidget {
  final String categoryName;
  final IconData icon;
  final String selectedCategory;

  const CategoryTile(this.categoryName, this.icon, this.selectedCategory, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryCubit = BlocProvider.of<CategoryCubit>(context);
    bool isSelected = categoryName == selectedCategory;

    return GestureDetector(
      onTap: () {
        categoryCubit.selectCategory(categoryName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.amber),
          color: isSelected ? Colors.amber : Colors.white,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.amber,
            ),
            const SizedBox(width: 10),
            Text(
              categoryName,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class CategoryCubit extends Cubit<String> {
  CategoryCubit() : super('Home');

  void selectCategory(String category) {
    emit(category);
  }
}

