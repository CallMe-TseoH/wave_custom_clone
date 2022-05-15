part of 'security_cubit.dart';

class SecurityState extends Equatable {
  const SecurityState({this.status = EventStatusEnum.initial, this.pin = ''});

  final EventStatusEnum status;
  final String pin;

  @override
  List<Object> get props => [status, pin];

  SecurityState copyWith({EventStatusEnum? status, String? pin}) {
    return SecurityState(status: status ?? this.status, pin: pin ?? this.pin);
  }
}
