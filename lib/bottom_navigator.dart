import 'package:flutter/material.dart';

class BottomNavBarCustom extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBarCustom({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // مهم! اجازه می‌ده دکمه وسط بیرون بزنه
      children: [
        // نوار اصلی
        Container(
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildItem(0, "img/icons/Home.png", "Home"),
              _buildItem(1, "img/icons/Articles.png", "Articles"),
              const SizedBox(width: 70), // جای خالی برای دکمه وسط
              _buildItem(2, "img/icons/Search.png", "Search"),
              _buildItem(3, "img/icons/Menu.png", "Menu"),
            ],
          ),
        ),

        // دکمه وسط — بیرون از نوار (مثل اینستاگرام)
        Positioned(
          top: -20, // منفی = بالا می‌ره و بیرون می‌زنه
          left: 0,
          right: 0,
          child: Center(
            child: InkWell(
              onTap: () {
                // برو به صفحه پست جدید
                print("دکمه وسط کلیک شد");
              },
              borderRadius: BorderRadius.circular(35),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xff376AED),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(Icons.add_circle, size: 40, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(int index, String iconPath, String label) {
    bool isActive = currentIndex == index;
    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 32,
            color: isActive ? const Color(0xff376AED) : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isActive ? const Color(0xff376AED) : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
