part of 'zodiac_bloc.dart';

@freezed
class ZodiacState with _$ZodiacState {
  const factory ZodiacState.loading() = _Loading;
  const factory ZodiacState.failure(Failure failure) = _Failure;
  const factory ZodiacState.success(List<Zodiac> zodiacs) = _Success;
}
