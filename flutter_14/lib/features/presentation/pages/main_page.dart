import 'package:flutter/material.dart';
import 'package:flutter_14/features/presentation/widgets/profile_color_inh.dart';
import 'package:flutter_14/features/presentation/widgets/weather_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

List<double> data = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];

MainTheme _firstTheme = MainTheme(
  textSize: 16,
  bgColor: Colors.white,
  headerColor: Colors.blueAccent,
  textColor: Colors.black,
  buttonBg: Colors.blueAccent,
  buttonFg: Colors.white,
);
MainTheme _secondTheme = MainTheme(
  textSize: 16,
  bgColor: Colors.black,
  headerColor: Colors.grey,
  textColor: Colors.white,
  buttonBg: Colors.grey,
  buttonFg: Colors.white,
);
bool isFirstTheme = true;

class _MainPageState extends State<MainPage> {
  double state = 0;
  @override
  Widget build(BuildContext context) {
    // print(state);
    return Scaffold(
        body: SingleChildScrollView(
          child: MainThemeStyle(
            theme: isFirstTheme ? _firstTheme : _secondTheme,
            child: Builder(
              builder: (innerContext) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: MainThemeStyle.of(innerContext).headerColor,
                      height: 100,
                    ),
                    Container(
                      width: MediaQuery.of(innerContext).size.width,
                      decoration: BoxDecoration(
                        color: MainThemeStyle.of(innerContext).bgColor,
                      ),
                      child: Center(
                        child: Text(
                          state.toString(),
                          style: TextStyle(
                            color: MainThemeStyle.of(innerContext).textColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: MainThemeStyle.of(innerContext).bgColor,
                      height: MediaQuery.of(context).size.height - 260,
                      child: SizedBox(
                        child: CustomPaint(
                          willChange: true,
                          painter: WeatherPainter(state: state),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            decoration: BoxDecoration(
                              color: MainThemeStyle.of(innerContext).bgColor,
                            ),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ...data.map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 3),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: MainThemeStyle.of(innerContext)
                                            .headerColor,
                                      ),
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      child: ListTile(
                                        onTap: () {
                                          setState(() {
                                            state = e;
                                          });
                                        },
                                        title: Center(
                                          child: Text(e.toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: MainThemeStyle.of(innerContext).bgColor,
                      ),
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                    )
                  ],
                );
              },
            ),
          ),
        ),
        floatingActionButton: MainThemeStyle(
            theme: isFirstTheme ? _firstTheme : _secondTheme,
            child: Builder(
              builder: (buttonContext) {
                return FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      isFirstTheme = !isFirstTheme;
                    });
                  },
                  backgroundColor: MainThemeStyle.of(buttonContext).buttonBg,
                  foregroundColor: MainThemeStyle.of(buttonContext).buttonFg,
                  child: isFirstTheme
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode),
                );
              },
            )));
  }
}
