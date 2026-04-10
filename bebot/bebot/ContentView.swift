//
//  ContentView.swift
//  bebot
//
//  Created by abdul karim on 03/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var loginError = ""
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                
                VStack(spacing: 20) {
                    
                    
                    Text("Welcome back! Glad to see you, Again!")
                        .font(.largeTitle.bold())
                    
                    Spacer()
                    
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                    
                    HStack {
                        if showPassword {
                            TextField("Password", text: $password)
                        } else {
                            SecureField("Password", text: $password)
                        }
                        
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    
                    HStack {
                        Spacer()
                        Button("Forgot Password?") {}
                    }
                    
                    if !loginError.isEmpty {
                        Text(loginError)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                    
                    // LOGIN BUTTON
                    LoginButton()
                    
                    Spacer()
                    
                    DividerView()
                    
                    SocialButtons()
                    
                    HStack {
                        Text("Don't have an account?")
                        
                        Button("Register Now") {
                            
                        }
                        .foregroundColor(.blue)
                    }
                    
                }
                .padding()
            }
        }
    }
        func login() {
//            if email.lowercased() == "test@example.com" && password == "1234" {
                navigate = true
//            } else {
//                loginError = "Invalid email or password."
//            }
        }
        
        fileprivate func LoginButton() -> some View {
            
            ZStack {
                NavigationLink(
                    destination: NhomePage(),
                    isActive: $navigate
                ) {
                    EmptyView()
                }
                Button {
                    login()
                } label: {
                    Text("Log In")
                        .foregroundColor(.white)
                        .frame(maxWidth: 350, minHeight: 50)
                        .background(.black)
                        .cornerRadius(9)
                }
            }
        }
        // MARK: Extracted Views
        fileprivate func DividerView() -> some View {
            HStack {
                Rectangle().frame(height: 0.1).foregroundColor(.gray)
                Text("Or Login with")
                Rectangle().frame(height: 0.1).foregroundColor(.gray)
            }
        }
        
        fileprivate func SocialButtons() -> some View {
            HStack {
                ForEach(["ic_facebook", "ic_google", "ic_apple"], id: \.self) { icon in
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(8)
                        .frame(width: 80, height: 50)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 1)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
            }
        }
    }

#Preview {
    ContentView()
}




