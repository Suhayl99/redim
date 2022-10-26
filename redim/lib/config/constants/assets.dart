abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();

  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get logo => "$basePath/ic_logo.svg";
  String get search => "$basePath/ic_search.svg";
  String get bell => "$basePath/ic_bell.svg";
  String get arrow => "$basePath/ic_arrow.svg";
  String get friends => "$basePath/ic_friends.svg";
  String get home => "$basePath/ic_home.svg";
  String get portfolio => "$basePath/ic_portfolio.svg";
  String get star => "$basePath/ic_star.svg";
  String get store => "$basePath/ic_store.svg";
  String get menu => "$basePath/ic_menu.svg";
  String get right => "$basePath/ic_right.svg";
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  String get google => "$basePath/im_google.png";
}
