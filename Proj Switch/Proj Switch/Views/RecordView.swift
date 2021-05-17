//
//  RecordView.swift
//  Proj Switch
//  单个记录的view组件
//  Created by Mac on 2021/5/15.
//

import SwiftUI

struct RecordView: View {
    
    var record:recordModel
    @State var showReocrd:Bool
    @State var showTime:Bool
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(record.color)
                .frame(width: showReocrd ? record.score : 0, height: 65,alignment: .leading)
                .animation(.spring())
                .shadow(radius: 10)
                .onTapGesture {
                    showTime = true
                }
                .animation(.spring())
            Text("2021-5-21")
                .font(.body)
                .foregroundColor(.white)
                .opacity(showTime ? 1 : 0)
                .animation(.spring())
        }
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*1, color: Color("Score_5")), showReocrd: true, showTime: false)
    }
}
