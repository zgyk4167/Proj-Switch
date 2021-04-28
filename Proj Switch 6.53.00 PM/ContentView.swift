//
//  ContentView.swift
//  Proj Switch
//
//  Created by Mac on 2021/4/25.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    
    @State var showScore1 = false
    @State var showScore2 = false
    @State var showScore3 = false
    @State var showScore4 = false
    @State var showScore5 = false
    
    @State var showHistory = false
    
    @State var showList = false
    
    @State var whetherRecord = false
    
    var body: some View {
        ZStack {
            
            Color.init(UIColor(red: 0/225, green: 49/225, blue: 79/225, alpha: 1))
                .opacity(0.4)
                .ignoresSafeArea()
            VStack {
                TitleView()
                Spacer()
                    .frame(height: 55)
                VStack(spacing: 25.0) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(showScore5 ? Color.yellow : Color.black)
                        .frame(width: 60, height: 60)
                        .opacity(showScore5 ? 1: 0.4)
                        .shadow(radius: showScore5  ? 40: -40)
                        .onTapGesture {
                            self.showScore5.toggle()
                        }
                        .animation(.easeOut(duration: 0.1))
                        .blur(radius: showScore5  ? 0: 1.3)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(showScore4 || showScore5 ? Color.yellow : Color.black)
                        .frame(width: 60, height: 60)
                        .opacity(showScore4 || showScore5 ? 0.8: 0.4)
                        .shadow(radius: showScore4 || showScore5  ? 40: -40)
                        .onTapGesture {
                            self.showScore4.toggle()
                        }
                        .animation(.easeOut(duration: 0.2))
                        .blur(radius: showScore4 || showScore5  ? 0: 1.3)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(showScore3 || showScore4 || showScore5 ? Color.yellow : Color.black)
                        .frame(width: 60, height: 60)
                        .opacity(showScore3 || showScore4 || showScore5 ? 0.6: 0.4)
                        .shadow(radius: showScore3 || showScore4 || showScore5  ? 40: -40)
                        .onTapGesture {
                            self.showScore3.toggle()
                        }
                        .animation(.easeOut(duration: 0.3))
                        .blur(radius: showScore3 || showScore4 || showScore5  ? 0: 1.3)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(showScore2 || showScore3 || showScore4 || showScore5 ? Color.yellow : Color.black)
                        .frame(width: 60, height: 60)
                        .opacity(showScore2 || showScore3 || showScore4 || showScore5 ? 0.4: 0.4)
                        .shadow(radius: showScore2 || showScore3 || showScore4 || showScore5  ? 40: -40)
                        .onTapGesture {
                            self.showScore2.toggle()
                        }
                        .animation(.easeOut(duration: 0.4))
                        .blur(radius: showScore2 || showScore3 || showScore4 || showScore5  ? 0: 1.3)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(showScore1 || showScore2 || showScore3 || showScore4 || showScore5 ? Color.yellow : Color.black)
                        .frame(width: 60, height: 60)
                        .opacity(showScore1 || showScore2 || showScore3 || showScore4 || showScore5  ? 0.2: 0.4)
                        .shadow(radius: showScore1 || showScore2 || showScore3 || showScore4 || showScore5  ? 40: -40)
                        .blur(radius: showScore1 || showScore2 || showScore3 || showScore4 || showScore5  ? 0: 1.3)
                        .onTapGesture {
                            self.showScore1.toggle()
                        }
                        .animation(.easeOut(duration: 0.5))
                    
                }.alert(isPresented: $whetherRecord) {
                    Alert(
                                title: Text("okay~"),
                                    message: Text("more?")
                                )
                }
                .padding([.leading, .bottom, .trailing])
                Spacer()
                    .frame(height: 10)
                RecordView()
                    .padding()
                    .onTapGesture{
                        whetherRecord = true
                    }
                Spacer()
                    
            }

                
                VStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 6)
                            .foregroundColor(.black)
                    Text("Cheer up!")
                    Spacer()
                
                    VStack(spacing: 30.0) {
                        MultiLineChartView(data: [([8,32,11,23,40,28,50,60], GradientColors.green), ([90,99,78,111,70,60,77,50,60], GradientColors.purple), ([34,56,72,38,43,100,50,50,60], GradientColors.orngPink)], title: "This month")
                            .onTapGesture{
                            showList = true
                            }
                            
                        MultiLineChartView(data: [([8,32,11,23,40,28,50,60], GradientColors.green), ([90,99,78,111,70,60,77,50,60], GradientColors.purple), ([34,56,72,38,43,100,50,50,60], GradientColors.orngPink)], title: "Last month")
                            .padding()
                        }.offset(x: 0, y: showHistory ? -180 : 650)
                    .animation(.spring())
                    .onTapGesture {
                        self.showHistory.toggle()
                        
                    }.sheet(isPresented: $showList) {
                        NavigationView {
                            List(0 ..< 20) { item in
                                VStack(alignment: .leading){
                                    Text("you looks good today").font(.headline)
                                    Text("2021-4-28").font(.caption)
                                }
                            }.navigationTitle("This month")
                        }
                        
                    }
                    
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .background( Color.init(UIColor(red: 0/225, green: 49/225, blue: 79/225, alpha: 1))
                                .ignoresSafeArea())
                .cornerRadius(10)
                .shadow(radius: 5)
                .offset(x: 0, y: showHistory ? 0 : 650)
                .animation(.spring())
                .onTapGesture {
                    self.showHistory.toggle()
                }

        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TitleView: View {
    var body: some View {
        HStack {
            Text("Proj Switch")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding(.leading)
            Spacer()
        }
    }
}

struct RecordView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .padding()
                .frame(width: 120, height: 80)
                .foregroundColor(.white)
            Text("Record!")
        }
        .shadow(radius: 5)
        .padding()
    }
}
}
