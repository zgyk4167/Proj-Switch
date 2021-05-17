//
//  Rating.swift
//  Proj Switch
//  评分页面
//  Created by Mac on 2021/5/9.
//

import SwiftUI

struct Rating: View {
    @State var whetherTap1:Bool = false
    @State var whetherTap2:Bool = false
    @State var whetherTap3:Bool = false
    @State var whetherTap4:Bool = false
    @State var whetherTap5:Bool = false
    var body: some View {
        
        let whetherTap:Bool = whetherTap1 ||
            whetherTap2 ||
            whetherTap3 ||
            whetherTap4 ||
            whetherTap5
        
        ZStack{
            
            VStack {
                
                VStack(spacing: 0.0){
                    
                    Button(action: {whetherTap5 = true}, label: {
                        Color("Score_5")
                    })
                    Button(action: {whetherTap4 = true}, label: {
                        Color("Score_4")
                    })
                    Button(action: {whetherTap3 = true}, label: {
                        Color("Score_3")
                    })
                    Button(action: {whetherTap2 = true}, label: {
                        Color("Score_2")
                    })
                    Button(action: {whetherTap1 = true}, label: {
                        Color("Score_1")
                    })
                }
            }
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 180, height: 180, alignment: .center)
                    .foregroundColor(Color("Popcolor"))
                Text("Good!")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .scaleEffect(whetherTap ? 1.0 : 0)
            .opacity(0.9)
            .animation(.spring())
            .scaleEffect(whetherTap ? 0 : 1.0)
            .opacity(0.9)
            .animation(.spring().delay(0.6))
        }
        
    }
    
}

struct Rating_Previews: PreviewProvider {
    static var previews: some View {
        Rating()
    }
}
