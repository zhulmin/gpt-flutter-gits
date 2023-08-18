class JTheme {

static final ThemeData lightTheme = ThemeData(
        tabBarTheme: TabBarTheme(
          labelColor: Colors.red,
        ),
        brightness: Brightness.light,
        useMaterial3: true,
        canvasColor: Colors.green[40],
        scaffoldBackgroundColor: JColors.background,

        textTheme: const TextTheme(
          bodySmall: TextStyle(color: Colors.white, fontSize: 16),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
          displayLarge: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
        ),

        bottomAppBarTheme: BottomAppBarTheme(color: Colors.amber),
        inputDecorationTheme:InputDecorationTheme(
          fillColor: JColors.inputBackground
        ),
        // bottomAppBarTheme: BottomAppBarTheme(
        //   color: Colors.blue //🐣-----
        // ),
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          color: JColors.background, //🐣🐣
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      // locale: Locale('zh', 'CN'),
    )



}