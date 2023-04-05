abstract class SignUpState{}

class PreSignUpState extends SignUpState{

}
class SignUpSubmittingState extends SignUpState {

}
class SignUpSuccessState extends SignUpState {

}
class SignUpFailedState extends SignUpState {
  final String? exception;

  SignUpFailedState({ this.exception});
}