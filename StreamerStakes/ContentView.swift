import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showLoginFields: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Text("StreamerStakes")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    
                    if showLoginFields {
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color(white: 1, opacity: 0.1))
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color(white: 1, opacity: 0.1))
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                    
                    // Login Button
                    NavigationLink(destination: HomeView(), isActive: $isLoggedIn) {
                        Button(action: {
                            if showLoginFields {
                                Task {
                                    do {
                                        let user = try await SupabaseManager.shared.login(email: email, password: password)
                                        print("Login successful! User ID: \(user.uid)")
                                        isLoggedIn = true // Navigate to HomeView on success
                                    } catch {
                                        errorMessage = error.localizedDescription
                                    }
                                }
                            } else {
                                withAnimation {
                                    showLoginFields.toggle()
                                }
                            }
                        }) {
                            Text("Log In")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(5)
                        }
                    }
                    .padding(.top, 20)

                    // Display error message if login fails
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.top, 10)
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                // Sign-up message at the bottom
                Text("Sign up at streamerstakes.com")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
            }
            .background(Color.black.ignoresSafeArea())
        }
    }
}
#Preview {
    ContentView()
}
