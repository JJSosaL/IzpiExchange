import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izpi_exchange/shared/styles/font.style.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.body, required this.title});

  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainLayoutAppBar(title: title),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 30), child: body),
      bottomNavigationBar: MainLayoutNavigationBar(),
    );
  }
}

class MainLayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainLayoutAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Row(children: [_getTitleWidget()]),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);

  Widget _getTitleWidget() {
    return Text(title, style: defaultFontStyle(fontSize: 25, fontWeight: FontWeight.bold));
  }
}

class MainLayoutNavigationBar extends StatelessWidget {
  const MainLayoutNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: _getNavigationBarLinkWidgets()),
      ),
    );
  }

  List<_NavigationBarItem> _getNavigationBarItems() {
    return [
      _NavigationBarItem(icon: Icons.home_rounded, label: 'Inicio', location: '/'),
      _NavigationBarItem(icon: Icons.inbox_rounded, label: 'Bandeja', location: '/inbox'),
      _NavigationBarItem(icon: Icons.add_circle_rounded, label: 'Crear', location: '/products/create'),
      _NavigationBarItem(icon: Icons.chat_rounded, label: 'Chats', location: '/chats'),
      _NavigationBarItem(icon: Icons.account_circle_rounded, label: 'Cuenta', location: '/account'),
    ];
  }

  List<Widget> _getNavigationBarLinkWidgets() {
    return _getNavigationBarItems()
        .map((item) => MainLayoutNavigationBarLink(label: item.label, location: item.location, icon: item.icon))
        .toList();
  }
}

class MainLayoutNavigationBarLink extends StatelessWidget {
  const MainLayoutNavigationBarLink({super.key, required this.icon, required this.label, required this.location});

  final IconData icon;
  final String label;
  final String location;

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouterState.of(context);
    final goRouterCurrentPath = goRouter.uri.path;

    return TextButton(
      onPressed: () => goRouterCurrentPath == location ? null : context.push(location),
      style: TextButton.styleFrom(padding: const EdgeInsets.all(10), shape: const CircleBorder()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 2.5,
        children: [_getIconWidget(), _getLabelWidget()],
      ),
    );
  }

  Widget _getIconWidget() {
    return Icon(icon);
  }

  Widget _getLabelWidget() {
    return Text(label, style: defaultFontStyle(fontSize: 7.5, fontWeight: FontWeight.bold));
  }
}

class _NavigationBarItem {
  const _NavigationBarItem({required this.icon, required this.label, required this.location});

  final IconData icon;
  final String label;
  final String location;
}
