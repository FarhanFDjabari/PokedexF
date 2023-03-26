import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_f/app/pages/pokeball/pokeball_screen.dart';
import 'package:pokedex_f/app/pages/pokedex_list/bloc/pokedex_list_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_list/widgets/paged_pokedex_grid_view.dart';
import 'package:pokedex_f/app/routes/route_name.dart';
import 'package:pokedex_f/app/routes/route_path.dart';
import 'package:pokedex_f/app/styles/colors.dart';
import 'package:pokedex_f/app/widgets/collapse_app_bar.dart';
import 'package:pokedex_f/app/widgets/collapse_mixin.dart';
import 'package:pokedex_f/app/widgets/pokedex_scroll_view_header.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/injection.dart';

class PokedexListScreen extends StatefulWidget {
  const PokedexListScreen({super.key});

  @override
  State<PokedexListScreen> createState() => _PokedexListScreenState();
}

class _PokedexListScreenState extends State<PokedexListScreen>
    with CollapseMixin {
  late final ScrollController _scrollController;
  late final PokedexListBloc _pokedexListBloc;

  @override
  void initState() {
    super.initState();
    _pokedexListBloc = getIt<PokedexListBloc>();
    _scrollController = ScrollController();
    listenCollapse(controller: _scrollController);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pokedexListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => _pokedexListBloc,
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: theme.colorScheme.background,
          extendBodyBehindAppBar: true,
          appBar: CollapseAppBar(
            size: UIHelper.appBarSize(context),
            controller: _scrollController,
            isCollapse: isCollapse,
            theme: theme,
          ),
          body: CustomScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              PokedexScrollViewHeader(
                bgImageUri: "assets/images/pokemon_field_bg.jpg",
                theme: theme,
              ),
              SliverToBoxAdapter(
                child: InkWell(
                  onTap: () {
                    context.go("${RoutePath.pokedexScreen}/search");
                  },
                  child: ColoredBox(
                    color: theme.colorScheme.background,
                    child: Container(
                      width: UIHelper.mediaWidth(context, 1),
                      height: 56,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
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
                padding: const EdgeInsets.all(16),
                sliver: PagePokedexGridView(
                  theme: theme,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.asset(
                        "assets/images/open_pokeball_icon.png",
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
        );
      }),
    );
  }
}
