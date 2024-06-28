import 'package:flutter/material.dart';
import 'package:food_ui/food_ui.dart';

class CommonScaffoldWidget extends StatelessWidget {
  const CommonScaffoldWidget({
    required this.body,
    super.key,
    this.appBarText,
    this.backgroundColor,
    this.bottomNavigationBar,
  });

  // final PreferredSizeWidget? appBar;
  final String? appBarText;
  final Widget body;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor ?? context.colorScheme.backgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white.withAlpha(0),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              if (Navigator.of(context).canPop())
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 25),
                    child: IconButton(
                      style: IconButton.styleFrom(
                        elevation: 10,
                        shadowColor: Colors.black45,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                        size: 17,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                )
              else
                const SizedBox.shrink(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 10),
                  child: AppText(
                    appBarText ?? '',
                    fontSize: 45,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -15,
            left: -35,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 35,
                  color: context.colorScheme.mainThemeColor,
                ),
                borderRadius: BorderRadius.circular(600),
              ),
            ),
          ),
          Positioned(
            top: -85,
            left: 0,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(600),
                color: context.colorScheme.secondaryThemeColor,
              ),
            ),
          ),
          Positioned(
            top: -60,
            right: -60,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(600),
                color: context.colorScheme.mainThemeColor,
              ),
            ),
          ),
          SafeArea(child: body),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
