//
//  RecordListView.swift
//  Proj Switch
//
//  Created by Mac on 2021/5/15.
//

import SwiftUI

struct RecordListView: View {
    var recordRectangle1:RecordView
    var recordRectangle2:RecordView
    var recordRectangle3:RecordView
    var recordRectangle4:RecordView
    var recordRectangle5:RecordView
    var recordRectangle6:RecordView
    var recordRectangle7:RecordView
    
    
    var body: some View {
        ZStack{
            Color("Color").ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 0.0){
                    recordRectangle1
                    recordRectangle2
                    recordRectangle3
                    recordRectangle4
                    recordRectangle5
                    recordRectangle6
                }
            }
            
        }
    }
}

struct RecordListView_Previews: PreviewProvider {
    static var previews: some View {
        RecordListView(recordRectangle1: RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*1, color: Color("Score_5")), showReocrd: true, showTime: false), recordRectangle2: RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*0.2, color: Color("Score_1")), showReocrd: true, showTime: false),
                       recordRectangle3: RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*0.8, color: Color("Score_4")), showReocrd: true, showTime: false),
                       recordRectangle4: RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*0.2, color: Color("Score_1")), showReocrd: true, showTime: false),
                       recordRectangle5: RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*0.4, color: Color("Score_2")), showReocrd: true, showTime: false),
                       recordRectangle6: RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*0.6, color: Color("Score_3")), showReocrd: true, showTime: false),
                       recordRectangle7: RecordView(record: recordModel.init(score: UIScreen.main.bounds.width*1, color: Color("Score_5")), showReocrd: true, showTime: false))
    }
}
