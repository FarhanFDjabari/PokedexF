import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_f/app/pages/pokeball/bloc/pokeball_bloc.dart';
import 'package:pokedex_f/app/widgets/collapse_app_bar.dart';
import 'package:pokedex_f/app/widgets/collapse_app_bar_title_action.dart';
import 'package:pokedex_f/app/widgets/collapse_mixin.dart';
import 'package:pokedex_f/app/widgets/pokedex_scroll_view_header.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/injection.dart';

class PokeballScreen extends StatefulWidget {
  const PokeballScreen({super.key});

  @override
  State<PokeballScreen> createState() => _PokeballScreenState();
}

class _PokeballScreenState extends State<PokeballScreen> with CollapseMixin {
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
      create: (context) => getIt<PokeballBloc>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        extendBodyBehindAppBar: true,
        appBar: CollapseAppBarTitleAction(
          size: UIHelper.appBarSize(context),
          controller: _scrollController,
          title: 'Pokeball',
          isCenterTitle: false,
          actions: const [],
          isCollapse: isCollapse,
        ),
        body: CustomScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: const [
            PokedexScrollViewHeader(
              bgImageUri: "assets/images/pokeball_overlay.png",
            ),
          ],
        ),
      ),
    );
  }
}
