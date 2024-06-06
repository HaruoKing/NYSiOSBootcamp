//
//  ContentView.swift
//  Week1_Homework
//
//  Created by Victor Rodriguez on 6/6/24.
//

import SwiftUI

struct ContentView: View {
  @State private var redValue: Double = 75
  @State private var greenValue: Double = 40
  @State private var blueValue: Double = 75
  @State private var rectangleValue: Color = Color(red: 75/255, green: 40/255, blue: 75/255)
  
    var body: some View {
       Text("Color Picker")
        .font(.largeTitle)
        .padding()
      
      RoundedRectangle(cornerRadius: 0)
        .fill(rectangleValue)
        .frame(width: 300, height: 300)
        .padding()
      
      VStack{
        SliderView(value: $redValue, label: "Red")
        SliderView(value: $greenValue, label: "Green")
        SliderView(value: $blueValue, label: "Blue")
      }
      .padding()
      
      Button(action: {
        self.rectangleValue = Color(red: redValue/255, green: greenValue/255, blue: blueValue/255)
      }) {
        Text("Set Color")
          .font(.title2)
          .padding()
          .background(Color.blue)
          .foregroundColor(.white)
          .cornerRadius(10)
      }
    }
}

struct SliderView: View {
  @Binding var value: Double
  var label: String
  
  var body: some View {
    HStack {
      Text(label)
        .frame(width: 50, alignment: .leading)
    }
    HStack {
      Slider(value: $value, in: 0...255, step: 1)
        .accentColor(.blue)
      Text("\(Int(value))")
        .frame(width: 35, alignment: .trailing)
    }
  }
}

#Preview {
    ContentView()
}
