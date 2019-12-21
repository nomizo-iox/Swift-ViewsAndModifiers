//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Samuel F. Ademola on 12/21/19.
//  Copyright © 2019 Nomizo. All rights reserved.
//

import SwiftUI


// Creating custome modifier
struct Title: ViewModifier {
    func body(content: Content) -> some View{
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack (alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}
// Extends the ability to use the Title struct as a modifier
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    
    func watermarkStyle(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}



struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .titleStyle()
            
            Text("Howdy")
                .frame(width: 300, height: 200)
            .watermarkStyle(with: "Hacking With SWift")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
