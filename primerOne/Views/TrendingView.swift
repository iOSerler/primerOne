//
//  TrendingView.swift
//  primerOne
//
//  Created by Ahror Jabborov on 6/6/22.
//

import SwiftUI

struct TrendingView: View {
    @State var trendingCourse: Course
    var body: some View {
        VStack {
            Image(trendingCourse.image!)
                .resizable()
                .frame(width: 270, height: 150)
            
            HStack {
                Text(trendingCourse.title!)
                    .bold()
                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            
            HStack {
                Text(trendingCourse.description!)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            
            HStack {
                ForEach(0 ..< 5) { item in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.subheadline)
                }
                Spacer()
                
                Text("$500")
                    .font(.subheadline)
                    .bold()
            }
            .padding(.bottom, 30)
            .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
        }
        .frame(width: 250, height: 250)
        .cornerRadius(10)
        
    }
}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView(trendingCourse: courses[0])
    }
}



