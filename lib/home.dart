import 'package:flutter/material.dart';
import 'package:test/bottom_navigator.dart';
import 'package:test/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(child: const HomeScreen()),
//           Positioned(left: 0, right: 0, bottom: 0, child: BottomNavBarItem()),
//         ],
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi, Amirali!",
                    style: themeData.textTheme.headlineMedium,
                  ),
                  Image.asset(
                    "img/icons/notification.png",
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
              child: Text(
                "Explore today's",
                style: themeData.textTheme.headlineLarge,
              ),
            ),

            _StoryList(stories: stories, themeData: themeData),

            SizedBox(height: 16),
            CarouselSlider(
              options: CarouselOptions(
                height: 300, // ارتفاع اسلایدر

                autoPlay: true, // خودکار حرکت کنه
                // aspectRatio: 2.0, // نسبت ابعاد ، عرض دوبرابر ارتفاع، اگر height نباشه این اجرا میشه
                autoPlayInterval: const Duration(
                  seconds: 4,
                ), // هر 4 ثانیه یکبار حرکت کنه

                autoPlayAnimationDuration: const Duration(
                  milliseconds: 800,
                ), //سرعت تغییر اسلاید از تصویری به تصویر دیگه (کمتر باشه سرعتش بیشتره)

                autoPlayCurve: Curves
                    .fastOutSlowIn, //نوع انیمیشن تغییر اسلاید مثلا soft, linear , easeInOut و ...

                enlargeCenterPage: true, // آیتم وسط بزرگ‌تر بشه (خیلی قشنگه!)

                enlargeFactor: 0.3, // میزان بزرگ‌تر شدن آیتم وسط بر حسب درصد

                viewportFraction:
                    0.7, // هر آیتم چقدر از صفحه رو بگیره اینجا 80 درصده

                initialPage: 0, // صفحه شروع از کدوم باشه

                enableInfiniteScroll:
                    false, // بی‌نهایت بچرخه، وقتی به آخر برسه دوباره برگرده به اول

                reverse: false, //برعکس بچرخه اسکرول

                scrollDirection: Axis.horizontal, // جهت اسکرول افقی باشه

                pageSnapping:
                    true, //وقتی تصویر رو رها میکنیم اسلاید کامل بره روی یه صفحه یا نیمه کاره بمونه

                pauseAutoPlayOnTouch: true, //وقتی دست میزنیم توقف کنه

                padEnds:
                    false, //,وقتی به اول یا آخر رسید، فاصله خالی نشون بده؟ (برای infinite scroll بهتره false باشه)

                disableCenter:
                    false, //مرکز اسلاید رو نادیده بگیره (برای حالت enlargeCenterPage بهتره false باشه)
                scrollPhysics:
                    const BouncingScrollPhysics(), //فیزیک اسکرول، اینجا حالت کشسان داره

                enlargeStrategy: CenterPageEnlargeStrategy
                    .height, // بزرگ‌تر شدن بر اساس ارتفاع
                // clipBehavior: Clip.hardEdge, //حالت برش زدن گوشه‌ها، antiAlias کیفیت بهتری داره، آیا خارج از محدوده برش بخوره؟

                // onPageChanged :(index, reason) => print("Page changed to $index, because of $reason"), //، برای نقطه های زیر اسلاید مهمه اگر قرار بدی

                //                   onScrolled: (position) {
                //                     // موقع اسکرول این تابع صدا زده میشه
                //                     // print("Scrolled to position $position");
                // }
              ),
              items: AppDatabase.categories.map((category) {
                return Builder(
                  builder: (BuildContext context) {
                    return _CategoryItem(category: category);
                  },
                );
              }).toList(),
            ),
            _PostList(),
          ],
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;

  const _CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: 100,
          bottom: 30,
          left: 40,
          right: 40,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 20, color: Color(0xaa0D253C))],
            ),
          ),
        ),
        Container(
          // width: 20,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.blue,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              'img/posts/large/${category.imageFileName}',
              fit: BoxFit.cover,
              width: 300,
            ),
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Color.fromARGB(255, 7, 20, 33), Colors.transparent],
            ),
          ),
        ),
        Positioned(
          left: 32,
          bottom: 50,
          child: Text(
            category.title,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.apply(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({super.key, required this.stories, required this.themeData});

  final List<Story> stories;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
        itemCount: stories.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        itemBuilder: (context, index) {
          var story = stories[index];
          return Column(
            children: [
              _Story(story: story),
              SizedBox(height: 8),
              Text(story.name, style: themeData.textTheme.bodySmall),
            ],
          );
        },
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({super.key, required this.story});

  final Story story;

  @override
  Widget build(BuildContext context) {
    return story.isViewed
        ? _profileImageViewed(context)
        : _profileImageNormal();
  }

  Widget _profileImageNormal() {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [Color(0xff376AED), Color(0xff49B0E2), Color(0xff9CECFB)],
        ),
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(5),
            child: _profileImage('normal'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "img/icons/${story.iconFileName}",
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileImageViewed(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          borderPadding: EdgeInsets.all(3),
          radius: Radius.circular(20),
          dashPattern: [5, 3, 8, 3],
          strokeWidth: 3,
          color: const Color.fromARGB(255, 75, 75, 75),
        ),
        child: Container(
          margin: const EdgeInsets.fromLTRB(6, 0, 6, 0),
          width: 68,
          height: 68,
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
          child: _profileImage('viewed'),
        ),
      ),
    );
  }

  Widget _profileImage(type) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(type == "viewed" ? 24 : 16),
      child: Image.asset("img/stories/${story.imageFileName}"),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 20, 32, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest News",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "More",
                  style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: Color.fromARGB(255, 80, 167, 221),
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: posts.length,
            itemExtent: 141,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Post(post: post);
            },
          ),
        ],
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({super.key, required this.post});

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 149,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 16, color: Color(0x1a5282FF))],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset("img/posts/small/${post.imageFileName}"),
          ),
          // SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 4, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.caption,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff376AED),
                    ),
                  ),
                  Text(
                    post.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff0D253C),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.thumb_up, size: 16, color: Color(0xff2D4379)),
                      SizedBox(width: 4),
                      Text(
                        post.likes,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff2D4379),
                        ),
                      ),
                      SizedBox(width: 16),
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: Color(0xff2D4379),
                      ),
                      SizedBox(width: 4),
                      Text(
                        post.time,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff2D4379),
                        ),
                      ),
                      SizedBox(width: 45),
                      Icon(
                        post.isBookmarked
                            ? Icons.bookmark_added_rounded
                            : Icons.bookmark_add_outlined,
                        size: 18,
                        color: Color(0xff2D4379),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
