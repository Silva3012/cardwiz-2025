import 'package:cardwiz/models/dto/country/country_dto.dart';
import 'package:cardwiz/repositories/interfaces/i_credit_card_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cardwiz/core/errors/failures.dart';
import 'package:cardwiz/models/dto/credit_card/credit_card_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'credit_card_event.dart';
part 'credit_card_state.dart';

part 'credit_card_bloc.freezed.dart';

@LazySingleton()
class CreditCardBloc extends Bloc<CreditCardEvent, CreditCardState> {
  CreditCardBloc(this._creditCardRepository)
      : super(CreditCardState.initial()) {
    on<CreditCardEvent>((event, emit) async {
      await event.map(
        onGetCards: (e) async {
          emit(
            state.copyWith(
              isLoading: true,
              failure: null,
            ),
          );
          final result = await _creditCardRepository.getCards();
          result.fold(
            (failure) => emit(
              state.copyWith(
                isLoading: false,
                failure: failure,
              ),
            ),
            (cards) => emit(
              state.copyWith(
                isLoading: false,
                cards: cards,
              ),
            ),
          );
        },
        onAddCard: (e) async {
          emit(
            state.copyWith(
              isLoading: true,
              failure: null,
            ),
          );
          final result = await _creditCardRepository.addCard(e.card);
          if (result.isLeft()) {
            emit(
              state.copyWith(
                isLoading: false,
                failure: result.fold((f) => f, (_) => null),
                isCardAdded: false,
              ),
            );
          } else {
            final updatedResult = await _creditCardRepository.getCards();
            updatedResult.fold(
              (failure) => emit(
                state.copyWith(
                  isLoading: false,
                  failure: failure,
                  isCardAdded: false,
                ),
              ),
              (cards) => emit(
                state.copyWith(
                  isLoading: false,
                  cards: cards,
                  isCardAdded: true,
                ),
              ),
            );
          }
        },
        onDeleteCard: (e) async {
          emit(
            state.copyWith(
              isLoading: true,
              failure: null,
            ),
          );
          final result = await _creditCardRepository.deleteCard(e.cardNumber);
          if (result.isLeft()) {
            emit(
              state.copyWith(
                isLoading: false,
                failure: result.fold((f) => f, (_) => null),
              ),
            );
          } else {
            final updatedResult = await _creditCardRepository.getCards();
            updatedResult.fold(
              (failure) => emit(
                state.copyWith(
                  isLoading: false,
                  failure: failure,
                ),
              ),
              (cards) => emit(
                state.copyWith(
                  isLoading: false,
                  cards: cards,
                ),
              ),
            );
          }
        },
        onGetCountries: (e) async {
          emit(
            state.copyWith(
              isLoading: true,
              failure: null,
            ),
          );
          final result = await _creditCardRepository.getCountries();
          result.fold(
            (failure) => emit(
              state.copyWith(
                isLoading: false,
                failure: failure,
              ),
            ),
            (countries) => emit(
              state.copyWith(
                isLoading: false,
                countries: countries,
              ),
            ),
          );
        },
      );
    });
  }

  final ICreditCardRepository _creditCardRepository;
}
