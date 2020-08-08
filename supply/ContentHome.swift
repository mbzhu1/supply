//
//  ContentHome.swift
//  supply
//
//  Created by Michael Zhu on 8/8/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//

import SwiftUI

struct ContentHome: View {
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Hi world")
            }
            .navigationBarTitle("Supply")
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                Text("Profile")
            }
        }
    }
}

struct ContentHome_Previews: PreviewProvider {
    static var previews: some View {
        ContentHome()
    }
}
