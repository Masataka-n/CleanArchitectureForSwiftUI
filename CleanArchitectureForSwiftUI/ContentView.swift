//
//  ContentView.swift
//  CleanArchitectureForSwiftUI
//
//  Created by Masataka Nakagawa on 2021/03/21.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {

    var body: some View {
        if let uid: String = Auth.auth().currentUser?.uid {
            VStack {
                Text("uid: \(uid)")
            }
        } else {
            EntranceView()
        }
    }
}

struct EntranceView: View {

    var body: some View {
        VStack {
            Button(action: {
                self.signIn()
            }, label: {
                Text("Login")
            })
            .buttonStyle(PlainButtonStyle())
        }
    }

    func signIn() {
        Auth.auth().signInAnonymously() { (authResult, error) in

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
