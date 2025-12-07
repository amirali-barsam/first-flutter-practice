import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  actionsPadding: EdgeInsets.symmetric(horizontal: 20),
                  backgroundColor: Colors.white,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back), // آیکون بازگشت
                    ),
                  ),

                  // 2. آیکون سمت چپ (بیشتر) را در actions قرار دهید.
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded), // آیکون بیشتر
                    ),
                    // توجه: این آیکون به صورت خودکار به لبه نوار بالایی می‌چسبد.
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed([
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: 16),
                            Text(
                              "Four Things Every Woman Needs To Know",
                              style: TextStyle(
                                fontFamily: "Avenir",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    "img/stories/story_2.jpg",
                                    width: 40,
                                    height: 40,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Richard Gervain",
                                      style: TextStyle(
                                        fontFamily: "Avenir",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "2m ago",
                                      style: TextStyle(
                                        fontFamily: "Avenir",
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.share,
                                  color: const Color.fromARGB(
                                    255,
                                    13,
                                    109,
                                    187,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Icon(
                                  Icons.bookmark_outline,
                                  color: const Color.fromARGB(
                                    255,
                                    13,
                                    109,
                                    187,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipRRect(
                      child: Image.asset("img/articles/single_post.png"),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        children: [
                          Text(
                            "A man's sexuality is never your mind responsiblity.",
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.white, Colors.white10],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(255, 21, 118, 198),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Like"), behavior: SnackBarBehavior.fixed),
            );
          },
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("img/icons/Thumbs.svg", width: 26),
              const SizedBox(width: 8),
              const Text(
                "2.1K",
                style: TextStyle(
                  fontFamily: "Avenir",
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
