import 'package:artllery_mobile/features/artist/screens/artist_screen.dart';
import 'package:go_router/go_router.dart';


class AppRouter{
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: "/artist",
        builder: (context, GoRouterState state) => const ArtistScreen(),
      ),
      GoRoute(
        path: "/",
        builder: (context, GoRouterState state) => const ArtistScreen(),
      ),
    ],
  );
}