import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_f/app/pages/pokeball/pokeball_screen.dart';
import 'package:pokedex_f/app/pages/pokedex_list/bloc/pokedex_list_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_list/widgets/paged_pokedex_grid_view.dart';
import 'package:pokedex_f/app/routes/route_path.dart';
import 'package:pokedex_f/app/widgets/collapse_app_bar.dart';
import 'package:pokedex_f/app/widgets/collapse_mixin.dart';
import 'package:pokedex_f/app/widgets/pokedex_scroll_view_header.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/di/injection.dart';

class PokedexListScreen extends StatefulWidget {
  const PokedexListScreen({super.key});

  @override
  State<PokedexListScreen> createState() => _PokedexListScreenState();
}

class _PokedexListScreenState extends State<PokedexListScreen>
    with CollapseMixin {
  late final ScrollController _scrollController;
  final PokedexListBloc _pokedexListBloc = Injector.resolve<PokedexListBloc>();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    listenCollapse(controller: _scrollController);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return BlocProvider(
      create: (context) => _pokedexListBloc,
      child: Builder(builder: (context) {
        return BlocListener<PokedexListBloc, PokedexListState>(
          listener: (context, state) {
            if (state.goToSearch) {
              context.go("${RoutePath.pokedexScreen}/search");
            }
          },
          child: Scaffold(
            backgroundColor: theme.colorScheme.background,
            primary: false,
            extendBodyBehindAppBar: true,
            appBar: CollapseAppBar(
              size: UIHelper.appBarSize(context),
              controller: _scrollController,
              isCollapse: isCollapse,
              backgroundColor: theme.colorScheme.primary,
            ),
            body: CustomScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              slivers: [
                PokedexScrollViewHeader(
                  bgImageUri: "assets/images/pokemon_field_bg.jpg",
                  bgImageUriDark: "assets/images/pokemon_field_night_bg.png",
                  isDarkMode: brightness == Brightness.dark,
                  backgroundColor: theme.colorScheme.background,
                ),
                SliverToBoxAdapter(
                  child: InkWell(
                    onTap: () {
                      context
                          .read<PokedexListBloc>()
                          .add(const PokedexListEvent.goToSearch());
                    },
                    child: ColoredBox(
                      color: theme.colorScheme.background,
                      child: Container(
                        width: UIHelper.mediaWidth(context, 1),
                        height: 56,
                        padding: UIHelper.padAll(8),
                        margin: UIHelper.padSymmetric(
                            horizontal: 16, cwLeft: 16, cwRight: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: theme.colorScheme.primary.withOpacity(0.5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_outlined,
                              color: theme.colorScheme.onBackground,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Pokemon Search',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.onBackground,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: UIHelper.padAll(
                    16,
                    cwLeft: 16,
                    cwRight: 16,
                    cwTop: 16,
                    cwBottom: 32,
                  ),
                  sliver: PagePokedexGridView(
                    pokedexListBloc: _pokedexListBloc,
                    defaultColor: theme.colorScheme.primary,
                    backgroundColor: theme.colorScheme.background,
                    errorTextStyle: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.onBackground,
                    ),
                    buttonTextStyle: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.background,
                    ),
                    itemTitleTextStyle: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: OpenContainer(
              closedElevation: 6,
              openColor: theme.colorScheme.background,
              closedColor: theme.colorScheme.primary,
              closedShape: const CircleBorder(),
              closedBuilder: (context, action) {
                return InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    action();
                  },
                  child: SizedBox(
                    height: 56,
                    width: 56,
                    child: Padding(
                      padding: UIHelper.padAll(8),
                      child: Center(
                        child: UIHelper.assetImageLoader(
                          assetUri: "assets/images/open_pokeball_icon.png",
                          color: theme.colorScheme.background,
                        ),
                      ),
                    ),
                  ),
                );
              },
              openBuilder: (context, action) {
                return const PokeballScreen();
              },
            ),
          ),
        );
      }),
    );
  }
}
