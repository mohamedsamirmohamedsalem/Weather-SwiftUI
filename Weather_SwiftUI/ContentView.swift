//
//  ContentView.swift
//  Weather_SwiftUI
//
//  Created by Mohamed Samir on 19/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            LinearGradientView(isNight: $isNight)
            VStack{
                WeatherText(text: "Cupertino, CA",size: 32,color: .white)
                
                VStack(spacing: 0){
                    WeatherImage(imageName:  "cloud.sun.fill", imageWidth: 160, imageHeight: 160)
                    WeatherText(text:"76°",size: 40,color: .white)
                }.padding(0)
                HStack(spacing:0){
                    WeatherVerticalData(title: "TUE", imageName: "cloud.sun.fill", temp: 74)
                    WeatherVerticalData(title: "WED", imageName: "sun.max.fill", temp: 88)
                    WeatherVerticalData(title: "THU", imageName: "sun.max.fill", temp: 64)
                    WeatherVerticalData(title: "FRI", imageName: "wind.snow", temp: 53)
                    WeatherVerticalData(title: "SAT", imageName: "sunset.fill", temp: 80)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label : {
                    WeatherText(text: "Change Day Theme", size: 20, color: .blue).frame( height:40).background(Color.white).cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct LinearGradientView: View {
    @Binding var isNight :Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors:  [isNight ? .gray : Color("lightBlue"),
                                       isNight ? .black : Color.blue]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct WeatherText: View {
    var text : String
    var size: CGFloat
    var color:Color
    
    var body: some View {
        Text(text).font(.system(size: size, weight: .medium, design: .default)).foregroundColor(color).padding()
    }
}

struct WeatherImage: View {
    var imageName :String
    var imageWidth : CGFloat
    var imageHeight :CGFloat
    var body: some View {
        Image(systemName:imageName).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: imageWidth, height: imageHeight)
    }
}


struct WeatherVerticalData : View {
   
    var title : String
    var imageName : String
    var temp:Int
    
    var body: some View {
        VStack{
            WeatherText(text: title, size: 13, color: .white)
            WeatherImage(imageName: imageName, imageWidth: 40, imageHeight: 40)
            WeatherText(text: "\(temp)°", size: 17, color: .white)
        }
    }
}
