# chmod +x create_folder.sh
function to_pascal_case() {
  echo "$1" | awk -F_ '{
    for (i = 1; i <= NF; i++) {
      $i = toupper(substr($i, 1, 1)) tolower(substr($i, 2))
    }
  } 1' OFS=""
}

function to_custom_case() {
  echo "$1" | awk -F_ '{
    for (i = 1; i <= NF; i++) {
      $i = (i == 1 ? tolower($i) : toupper(substr($i, 1, 1)) tolower(substr($i, 2)))
    }
  } 1' OFS=""
}

function to_dash_case() {
  echo "$1" | sed 's/_/-/g'
}

pascal_case_name=$(to_pascal_case "$1")
custom_case_name=$(to_custom_case "$1")
dash_case_name=$(to_dash_case "$1")
app_folder=$(basename "$(pwd)")

mkdir -p lib/app/$1/bloc lib/app/$1/model lib/app/$1/page lib/app/$1/repository lib/app/$1/widget

echo "import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:${app_folder}/app/$1/model/$1_model.dart';
import 'package:${app_folder}/app/$1/repository/$1_repository.dart';
import 'package:${app_folder}/core/util/failure.dart';

part '$1_bloc.freezed.dart';
part '$1_event.dart';
part '$1_state.dart';

class ${pascal_case_name}Bloc extends Bloc<${pascal_case_name}Event, ${pascal_case_name}State> {
  static ${pascal_case_name}Repository _${custom_case_name}Repository = ${pascal_case_name}RepositoryImpl();

  ${pascal_case_name}Bloc() : super(${pascal_case_name}State.loading()) {
    on<_Fetch>(_fetch);
  }

  void _fetch(_, emit) async {
    final either = await _${custom_case_name}Repository.get${pascal_case_name}s();

    either.fold(
      (l) {
        emit(${pascal_case_name}State.failure(l));
      },
      (r) {
        emit(${pascal_case_name}State.loading());
        emit(${pascal_case_name}State.success(r));
      },
    );
  }
}

class Custom${pascal_case_name}Bloc extends StatelessWidget {
  final Widget Function(List<${pascal_case_name}>) success;

  const Custom${pascal_case_name}Bloc({
    super.key,
    required this.success,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<${pascal_case_name}Bloc, ${pascal_case_name}State>(
      builder: (context, state) {
        return state.when(
          loading: () {
            return Container();
          },
          failure: (_) {
            return Container();
          },
          success: (List<${pascal_case_name}> ${custom_case_name}s) {
            return success(${custom_case_name}s);
          },
        );
      },
    );
  }
}" > lib/app/$1/bloc/$1_bloc.dart

echo "part of '$1_bloc.dart';

@freezed
class ${pascal_case_name}Event with _\$${pascal_case_name}Event {
  const factory ${pascal_case_name}Event.fetch() = _Fetch;
}" > lib/app/$1/bloc/$1_event.dart

echo "part of '$1_bloc.dart';

@freezed
class ${pascal_case_name}State with _\$${pascal_case_name}State {
  const factory ${pascal_case_name}State.loading() = _Loading;
  const factory ${pascal_case_name}State.failure(Failure failure) = _Failure;
  const factory ${pascal_case_name}State.success(List<${pascal_case_name}> ${custom_case_name}s) = _Success;
}" > lib/app/$1/bloc/$1_state.dart

echo "import 'package:freezed_annotation/freezed_annotation.dart';

part '$1_model.freezed.dart';
part '$1_model.g.dart';

@freezed
class ${pascal_case_name} with _\$${pascal_case_name} {
  const ${pascal_case_name}._();
  const factory ${pascal_case_name}(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  ) = _${pascal_case_name};

  factory ${pascal_case_name}.fromJson(Map<String, dynamic> json) => _\$${pascal_case_name}FromJson(json);
}" > lib/app/$1/model/$1_model.dart

echo "import 'package:dartz/dartz.dart';
import 'package:${app_folder}/app/$1/model/$1_model.dart';
import 'package:${app_folder}/core/util/failure.dart';
import 'package:${app_folder}/core/util/fetch.dart';

abstract class ${pascal_case_name}Repository {
  Future<Either<Failure, List<${pascal_case_name}>>> get${pascal_case_name}s();
}

class ${pascal_case_name}RepositoryImpl implements ${pascal_case_name}Repository {
  @override
  Future<Either<Failure, List<${pascal_case_name}>>> get${pascal_case_name}s() async {
    try {
      final List<dynamic> data = await fetchData(
        method: 'get',
        path: '${dash_case_name}s',
      );

      final List<${pascal_case_name}> ${custom_case_name}s = data
          .map(
            (e) => ${pascal_case_name}.fromJson(e),
          )
          .toList();

      return Right(${custom_case_name}s);
    } catch (e) {
      return Left(Failure('get${pascal_case_name}s', e));
    }
  }
}" > lib/app/$1/repository/$1_repository.dart

echo "import 'package:flutter/material.dart';
import 'package:${app_folder}/core/widget/body.dart';
import 'package:${app_folder}/core/widget/scaffold.dart';

class ${pascal_case_name}Page extends StatefulWidget {
  const ${pascal_case_name}Page({super.key});

  @override
  State<${pascal_case_name}Page> createState() => _${pascal_case_name}PageState();
}

class _${pascal_case_name}PageState extends State<${pascal_case_name}Page> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: CustomBody(
        children: [],
      ),
    );
  }
}" > lib/app/$1/page/$1_page.dart

echo "import 'package:flutter/material.dart';

class ${pascal_case_name}Card extends StatelessWidget {
  const ${pascal_case_name}Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}" > lib/app/$1/widget/$1_widget.dart