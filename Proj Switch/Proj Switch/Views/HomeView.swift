//
//  ContentView.swift
//  Proj Switch
//  主界面
//  Created by Mac on 2021/5/6.
//

import SwiftUI
import CoreData

struct HomeView: View {
    //以下五个变量用来判断是否发生了点击Button这个事件
    @State var whetherTap1:Bool = false
    @State var whetherTap2:Bool = false
    @State var whetherTap3:Bool = false
    @State var whetherTap4:Bool = false
    @State var whetherTap5:Bool = false
    
    @State var show = false    //判断是否现实sheet这个view
    
    var body: some View {
        
        ZStack{
            Color("Color").ignoresSafeArea()    //忽略安全边界的颜色
            VStack{
                HStack{
                    Text("Proj Switch")    //标题
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding()
                        .opacity(0.9)
                        .shadow(radius: 15)
                    Spacer()
                    //点击Button触发ontapgesture修改show来弹出sheet
                    Button(action: {show = true}, label: {
                        Image(systemName: "folder.badge.person.crop").imageScale(.large)
                            .foregroundColor(.white)
                    })
                    Spacer().frame(width: 30, height: 1, alignment: .center)
                }
                Rating()  //用来记录分值的view
            }
            
            
        }.sheet(isPresented: $show, content: {   //这个sheet是看历史心情记录
            ZStack{
                Color("Color")
                VStack{
                    Text("History")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .opacity(0.9)
                        .padding()
                    //用来显示历史心情记录的view，主要是趋势，像柱形图
                    RecordListView(recordRectangle1: RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*1, color: Color("Score_5")), showReocrd: true, showTime: false), recordRectangle2: RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*0.2, color: Color("Score_1")), showReocrd: true, showTime: false),
                                   recordRectangle3: RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*0.8, color: Color("Score_4")), showReocrd: true, showTime: false),
                                   recordRectangle4: RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*0.2, color: Color("Score_1")), showReocrd: true, showTime: false),
                                   recordRectangle5: RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*0.4, color: Color("Score_2")), showReocrd: true, showTime: false),
                                   recordRectangle6: RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*0.6, color: Color("Score_3")), showReocrd: true, showTime: false),
                                   recordRectangle7: RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*1, color: Color("Score_5")), showReocrd: true, showTime: false))
                }
                
            }
        }
        ).shadow(radius: 15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

