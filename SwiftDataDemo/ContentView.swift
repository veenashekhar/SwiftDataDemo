//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by Veena Shekhar on 22/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State public var progress: CGFloat = 1.0
    
    
    var body: some View {
        ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    ActivityRingView(progress: $progress)
                        .fixedSize()
            MyView(progress: $progress).fixedSize()
                }


        
    }
    
}

extension Color{
    public static var outlineRed: Color {
            return Color(decimalRed: 34, green: 0, blue: 3)
        }
        
        public static var darkRed: Color {
            return Color(decimalRed: 221, green: 31, blue: 59)
        }
        
        public static var lightRed: Color {
            return Color(decimalRed: 239, green: 54, blue: 128)
        }
        
        public init(decimalRed red: Double, green: Double, blue: Double) {
            self.init(red: red / 255, green: green / 255, blue: blue / 255)
        }

}

/* struct LargeButton: View {
 var text = "Download files"

 var body: some View {
     Button(action: {}) {
         Text(text)
             .bold()
     }
     .frame(maxWidth: .infinity)
     .padding(12)
     .background(Color.blue)
     .foregroundColor(.white)
     .cornerRadius(12)
 }
}*/

public struct ActivityRingView: View {
    @Binding var progress: CGFloat

    var colors: [Color] = [Color.darkRed, Color.lightRed]
        
        public var body: some View {
            ZStack {
                        Circle()
                            .stroke(Color.outlineRed, lineWidth: 20)
                
                        Circle()
                            .trim(from: 0, to: progress)
                            .stroke(
                                AngularGradient(
                                    gradient: Gradient(colors: colors),
                                    center: .center,
                                    startAngle: .degrees(0),
                                    endAngle: .degrees(360)
                                ),
                                style: StrokeStyle(lineWidth: 20, lineCap: .round)
                            ).rotationEffect(.degrees(-90))
                 
                Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.darkRed)
                                .offset(y: -150)
                              // .offset(y: -100)
                Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(progress > 0.95 ? Color.lightRed: Color.lightRed.opacity(0))
                                .offset(y: -150)
                               // .offset(y: -100)
                                .rotationEffect(Angle.degrees(360 * Double(progress)))
                                .shadow(color: progress > 0.96 ? Color.black.opacity(0.1): Color.clear, radius: 3, x: 4, y: 0)

                    }.frame(idealWidth: 300, idealHeight: 300, alignment: .center)
            //300
        }
}
struct MyView : View{
    @Binding var progress: CGFloat

    var body: some View {
        //var colours:[Color] = [Color.darkRed, Color.lightRed]
        var colours:[Color] = [Color.indigo, Color.white]
        ZStack{
            Circle()
                .stroke(Color.outlineRed,lineWidth:20)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: colours),
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360)
                    ),
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
                ).rotationEffect(.degrees(-90))
             
            Circle()
                            .frame(width: 20, height: 20)
                           .foregroundColor(Color.indigo)
                          .offset(y: -200)
            
            Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(progress > 0.95 ? Color.white: Color.indigo.opacity(0))
                            .offset(y: -200)
                           // .offset(y: -100)
                            .rotationEffect(Angle.degrees(360 * Double(progress)))
                            .shadow(color: progress > 0.96 ? Color.black.opacity(0.1): Color.clear, radius: 3, x: 4, y: 0)


                
        }.frame(idealWidth: 400, idealHeight: 400, alignment: .center)

    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
