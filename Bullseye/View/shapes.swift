//
//  shapes.swift
//  Bullseye
//
//  Created by Diana  on 12/26/20.
//

import SwiftUI

struct shapes: View {
    @State private var wideShapes = true
    
    var body: some View {
        VStack{
            if !wideShapes {
            Circle()
                .strokeBorder(Color.blue, lineWidth: 20.0 )
                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                .transition(.scale)
            }
            RoundedRectangle(cornerRadius: 20.0 )
                .fill(Color.blue)
                .frame( width: wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                .animation(.easeInOut)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                
            Button(action: { withAnimation {
                    wideShapes.toggle()}
            }) {
                    Text( "Animate" )
                }
        }
        .background(Color.green)
    }
}

struct shapes_Previews: PreviewProvider {
    static var previews: some View {
        shapes()
    }
}
