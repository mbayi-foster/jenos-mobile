class LoginPageState {
    bool error;
    bool loading;

    LoginPageState({
        this.error = false,
        this.loading = false,
    });

    LoginPageState copyWith({
        bool? error,
        bool? loading,
    }) => 
        LoginPageState(
            error: error ?? this.error,
            loading: loading ?? this.loading,
        );
}
