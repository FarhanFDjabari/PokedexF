import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/bloc/pokedex_detail_bloc.dart';
import 'package:pokedex_f/app/widgets/collapse_app_bar_title_action.dart';
import 'package:pokedex_f/app/widgets/collapse_mixin.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/injection.dart';

class PokedexDetailScreen extends StatefulWidget {
  final String pokemonName;
  final Color dominantColor;
  const PokedexDetailScreen({
    required this.pokemonName,
    required this.dominantColor,
    super.key,
  });

  @override
  State<PokedexDetailScreen> createState() => _PokedexDetailScreenState();
}

class _PokedexDetailScreenState extends State<PokedexDetailScreen>
    with CollapseMixin {
  late final ScrollController _scrollController;
  Color get _dominantColor => widget.dominantColor;

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
      create: (context) => getIt<PokedexDetailBloc>(),
      child: BlocListener<PokedexDetailBloc, PokedexDetailState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Builder(builder: (context) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: CollapseAppBarTitleAction(
              controller: _scrollController,
              isCollapse: isCollapse,
              dominantColor: _dominantColor,
              size: UIHelper.appBarSize(context),
              title: "Pokedex",
              actions: [
                BlocBuilder<PokedexDetailBloc, PokedexDetailState>(
                  builder: (context, state) {
                    return Text(
                      '#001',
                      style: Theme.of(context).textTheme.titleMedium,
                    );
                  },
                ),
              ],
            ),
            extendBodyBehindAppBar: true,
            body: CustomScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          _dominantColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: Image.network(
                        "src",
                        scale: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
