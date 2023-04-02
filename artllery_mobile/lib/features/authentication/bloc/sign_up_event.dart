abstract class SignUpEvent {}

class SignUpSubmittedEvent extends SignUpEvent{
  final Map<String,String> signUpData;

  SignUpSubmittedEvent({
    required this.signUpData
});
}