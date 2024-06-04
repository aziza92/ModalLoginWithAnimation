//
//  ContentView.swift
//  ModalLoginWithAnimation
//
//  Created by KARMANI Aziza on 11/09/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var pseudo = ""
    @State var email = ""
    @State var password = ""
    @State var isFocused = false
    @State var showAlert = false
    @State var alertMessage = "Error"
    @State var isLoading = false
    @State var isSuccessful = false
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
    
    func login(){
        self.hideKeyboard()
        self.isFocused = false
        self.isLoading = true
        
        if pseudo.isEmpty || email.isEmpty || password.isEmpty  {
            alertMessage = "veuillez remplir le pseudo, l'email et le password svp!."
            showAlert = true
            isLoading = false
            return
        }
        else {
            self.isLoading = true
            self.isSuccessful = true
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
               
                self.email = ""
                self.password = ""
                self.isSuccessful = false
                
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .top) {
                Color(.white).opacity(0.7)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .edgesIgnoringSafeArea(.bottom)
                
                CoverView()
                textFiled
                VStack{
                    Button { self.login()
                    } label:{
                        Text("Se connecter")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .padding(10)
                    .padding(.horizontal, 20)
                    .background(.gray, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 20)
                    .alert(isPresented: $showAlert){
                        Alert(title: Text("Error"), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .bottom)
                .padding()
                .padding(.bottom, 30)
                
            }
            .offset(y: isFocused ? -350 : 0)
            .animation(isFocused ? .easeInOut : nil, value: self.isFocused)
            .onTapGesture {
                self.isFocused = false
                self.hideKeyboard()
            }
        }
    }
    
    //View Text Field
    var textFiled : some View {
        
        VStack {
            HStack {
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.black.opacity(0.6))
                    .font(.title)
                    .frame(width: 40, height: 40)
                    .background(.white, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 5)
                    .padding(.leading)
                
                TextField("entrez votre nom".uppercased(), text: $pseudo)
                    .keyboardType(.emailAddress)
                    .font(.subheadline)
                    .padding(.leading)
                    .frame(height: 40)
                    .onTapGesture {
                        self.isFocused = true
                    }
            }
            
            Divider()
                .padding(.leading, 80)
                .padding(.trailing, 10)
            HStack {
                Image(systemName: "envelope.circle.fill")
                    .foregroundColor(.black.opacity(0.6))
                    .font(.title)
                    .frame(width: 40, height: 40)
                    .background(.white, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 5)
                    .padding(.leading)
                
                TextField("Votre Email".uppercased(), text: $email)
                    .keyboardType(.emailAddress)
                    .font(.subheadline)
                    .padding(.leading)
                    .frame(height: 40)
                    .onTapGesture {
                        self.isFocused = true
                    }
            }
            
            Divider()
                .padding(.leading, 80)
                .padding(.trailing, 10)
            
            HStack {
                Image(systemName: "lock.circle.fill")
                    .foregroundColor(.black.opacity(0.6))
                    .font(.title)
                    .frame(width: 40, height: 40)
                    .background(.white, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 5)
                    .padding(.leading)
                
                SecureField("Mot de passe".uppercased(), text: $password)
                    .keyboardType(.default)
                    .font(.subheadline)
                    .padding(.leading)
                    .frame(height: 40)
                    .onTapGesture {
                        self.isFocused = true
                    }
            }
        }
        .frame(height: 170)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.4), radius: 20, x: 0, y: 20)
        .padding(.horizontal)
        .offset(y: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
