//
//  ContentView.swift
//  Memorise
//
//  Created by Caleb Ray Revill on 11/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍️", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    @State var emojiCount = 9
    @State var themeColor = Color.red
    
    var body: some View {
        VStack {
            ScrollView {
                Text("Memorize!")
                    .font(.largeTitle)
                LazyVGrid(columns: [GridItem(.adaptive(minimum:100))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Button {
                themeColor = Color.red
                emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒"]
                emojiCount = emojis.count
                emojis.shuffle()
            } label: {
                HStack {
                    Image(systemName: "car")
                    Text("Vehicle Theme")
                        .font(.footnote)
                }
                .foregroundColor(.red)
            }
            Button {
                themeColor = Color.blue
                emojis = ["🐳", "🦈", "🐬", "🐟", "🐡", "🦀", "🦐", "🪼", "🐙", "🦑"]
                emojiCount = emojis.count
                emojis.shuffle()
            } label: {
                HStack {
                    Image(systemName: "water.waves")
                    Text("Ocean Theme")
                        .font(.footnote)
                }
                .foregroundColor(.blue)
            }
            Button {
                themeColor = Color.yellow
                emojis = ["🦒", "🐘", "🦏", "🦛", "🦓", "🐆", "🐅", "🦬"]
                emojiCount = emojis.count
                emojis.shuffle()
            } label: {
                HStack {
                    Image(systemName: "globe.europe.africa.fill")
                    Text("Safari Theme")
                        .font(.footnote)
                }
                .foregroundColor(.yellow)
            }
            Button {
                themeColor = Color.green
                emojis = ["🌮", "🍔", "🌭", "🍗", "🥯", "🧆", "🌯", "🍱", "🍛", "🥓", "🍣", "🥟", "🍜", "🍕"]
                emojiCount = emojis.count
                emojis.shuffle()
            } label: {
                HStack {
                    Image(systemName: "fork.knife")
                    Text("Food Theme")
                        .font(.footnote)
                }
                .foregroundColor(.green)
            }
        }
        .foregroundColor(themeColor)
        .padding(.horizontal)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
