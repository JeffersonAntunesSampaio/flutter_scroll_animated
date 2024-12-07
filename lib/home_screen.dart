import 'package:flutter/material.dart';
import 'package:test_scroll_animated/icon_button_custom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final kWhite = Colors.white.withOpacity(.1);
  double interpolation = .0;
  int i = 0;
  bool isVisible = true;
  bool isDown = false;
  double offsetDown = 0;
  final double heightContainers = 90;
  final durationAnimation = const Duration(milliseconds: 200);

  @override
  void initState() {
    _scrollController.addListener(scrollListenerCustom);
    super.initState();
  }

  void scrollListenerCustom() {
    final interpolationOld = interpolation;
    interpolation = _scrollController.offset /
        _scrollController.position.maxScrollExtent *
        100;


    final isDownOld = isDown;

    if (interpolation > interpolationOld) {
      isDown = true;
    } else {
      isDown = false;
    }

    if (isDown && isDownOld == false) {
      offsetDown = interpolation;
    }

    print("${_scrollController.offset}, $interpolation, $offsetDown, $isVisible");
    if(interpolation > offsetDown + 5) {
      isVisible = false;
    }else if (interpolation < interpolationOld){
      isVisible = true;
    }else {
      isVisible = true;
    }

    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.removeListener(scrollListenerCustom);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedContainer(
              clipBehavior: Clip.hardEdge,
              duration: const Duration(milliseconds: 100),
              height: isVisible ? 60 : 0,
              decoration: const BoxDecoration(
                color: Colors.transparent
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.volume_up)),
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: const Text(
                      "aA",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(.2),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image.asset(
                            'assets/global.png',
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "NAA",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            AnimatedPadding(
              duration: durationAnimation,
              padding: EdgeInsets.only(
                  bottom: isVisible ? heightContainers * 2: heightContainers, top: isVisible ? 60 : 0),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: 40 + 1,
                itemBuilder: (context, index) {
                  if(index == 40) return const SizedBox(height: 90);
                  return ListTile(
                    key: Key("$index"),
                    title: Text(
                      "Número: ${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
            AnimatedPositioned(
              bottom: isVisible ? heightContainers : 0,
              left: 0,
              right: 0,
              duration: durationAnimation,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: heightContainers,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  border: Border(top: BorderSide(color: Colors.white30)),
                ),
                child: Row(
                  children: [
                    AnimatedContainer(
                      clipBehavior: Clip.hardEdge,
                      duration: durationAnimation,
                      width: isVisible ? 40 : 0,
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        color: isVisible ? kWhite : Colors.black,
                        child: const Text(
                          "Livro X",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      clipBehavior: Clip.hardEdge,
                      duration: durationAnimation,
                      width: isVisible ? 40 : 0,
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(300),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow_sharp),
                      ),
                    )
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              bottom: isVisible ? 0 : -heightContainers,
              left: 0,
              right: 0,
              duration: durationAnimation,
              child: Container(
                height: heightContainers,
                color: Colors.black,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButtonCustom(
                      icon: Icons.home_filled,
                      label: "Início",
                    ),
                    IconButtonCustom(
                      icon: Icons.bookmarks_sharp,
                      label: "Biblia",
                    ),
                    IconButtonCustom(
                      icon: Icons.library_add_check_outlined,
                      label: "Planos",
                    ),
                    IconButtonCustom(
                      icon: Icons.search,
                      label: "Descubra",
                    ),
                    IconButtonCustom(
                      icon: Icons.menu,
                      label: "Mais",
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
