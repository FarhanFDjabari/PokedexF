import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_f/app/pages/pokeball/pokeball_screen.dart';
import 'package:pokedex_f/app/pages/pokedex_list/bloc/pokedex_list_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_list/widgets/paged_pokedex_grid_view.dart';
import 'package:pokedex_f/app/routes/route_name.dart';
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
    return BlocProvider(
      create: (context) => getIt<PokedexListBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          extendBodyBehindAppBar: true,
          appBar: CollapseAppBar(
            size: UIHelper.appBarSize(context),
            controller: _scrollController,
            isCollapse: isCollapse,
          ),
          body: CustomScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: const [
              PokedexScrollViewHeader(
                bgImageUri: "assets/images/pokemon_field_bg.jpg",
              ),
              SliverPadding(
                padding: EdgeInsets.all(16),
                sliver: PagePokedexGridView(),
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     context.pushNamed(RouteName.pokeballScreen);
          //   },
          //   backgroundColor: Theme.of(context).colorScheme.primary,
          //   foregroundColor: Theme.of(context).colorScheme.onPrimary,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Image.asset(
          //       "assets/images/open_pokeball_icon.png",
          //       color: Theme.of(context).colorScheme.background,
          //     ),
          //   ),
          // ),
          floatingActionButton: OpenContainer(
            closedElevation: 6,
            openColor: Theme.of(context).colorScheme.background,
            closedColor: Theme.of(context).colorScheme.primary,
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
                        color: Theme.of(context).colorScheme.background,
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
