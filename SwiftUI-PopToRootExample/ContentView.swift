//
//  ContentView.swift
//  SwiftUI-PopToRootExample
//
//  Created by Chuck Hartman on 5/20/20.
//  Copyright © 2020 ForeTheGreen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive : Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Text("Root")
                NavigationLink(destination: ContentView2(), isActive: self.$isActive )
                { Text("Push") }
                    .isDetailLink(false)
            }
            .navigationBarTitle("Root")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environment(\.rootPresentationMode, self.$isActive)
    }
}

struct ContentView2: View {
    @State private var isActive : Bool = false
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @Environment(\.rootPresentationMode) private var rootPresentationMode: Binding<RootPresentationMode>
    var body: some View {
        VStack {
            Text("Two")
            NavigationLink(destination: ContentView3(), isActive: self.$isActive)
            { Text("Push") }
                .isDetailLink(false)
            Button (action: { self.presentationMode.wrappedValue.dismiss() } )
            { Text("Pop") }
            Button (action: { self.rootPresentationMode.wrappedValue.dismiss() } )
            { Text("Pop to root") }
        }
        .navigationBarTitle("Two")
    }
}
struct ContentView3: View {
    @State private var isActive : Bool = false
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @Environment(\.rootPresentationMode) private var rootPresentationMode: Binding<RootPresentationMode>
    var body: some View {
        VStack {
            Text("Three")
            NavigationLink(destination: ContentView4(), isActive: self.$isActive)
            { Text("Push") }
                .isDetailLink(false)
            Button (action: { self.presentationMode.wrappedValue.dismiss() } )
            { Text("Pop") }
            Button (action: { self.rootPresentationMode.wrappedValue.dismiss() } )
            { Text("Pop to root") }
        }
        .navigationBarTitle("Three")
    }
}

struct ContentView4: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @Environment(\.rootPresentationMode) private var rootPresentationMode: Binding<RootPresentationMode>
    var body: some View {
        VStack {
            Text("Four")
            Button (action: { self.presentationMode.wrappedValue.dismiss() } )
            { Text("Pop") }
            Button (action: { self.rootPresentationMode.wrappedValue.dismiss() } )
            { Text("Pop to root") }
        }
        .navigationBarTitle("Four")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
