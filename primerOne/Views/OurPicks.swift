//
//  OurPicks.swift
//  primerOne
//
//  Created by Ahror Jabborov on 6/6/22.
//

import SwiftUI

struct OurPicks: View {
    @Binding var course : Course
    @Binding var hero : Bool
    @State var heart = "heart.fill"
    var body: some View {
        VStack {
            ZStack {
                Image(course.image!)
                    .resizable()
                    .frame(width: self.course.expand ? (UIScreen.main.bounds.width) : (UIScreen.main.bounds.width)*0.9 , height: self.course.expand ? (UIScreen.main.bounds.height)*0.3 : (UIScreen.main.bounds.height)*0.25 )
                    .cornerRadius(self.course.expand ? 5 : 20)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                if (self.course.expand) {
                    HStack{
                        Spacer()
                        Button(action: {
                            
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                
                                self.course.expand.toggle()
                                self.hero.toggle()
                            }
                            
                        }) {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.8))
                                .clipShape(Circle())
                            
                        }
                    }
                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
            }.edgesIgnoringSafeArea(.top)
            
            
            
            
            
            HStack {
                Text(course.title!)
                    .bold()
                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding(.leading, self.course.expand ? 10 : 20)
            
            HStack {
                Text(course.description!)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.leading, self.course.expand ? 20 : 30)
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
            .padding(.leading, self.course.expand ? 10 : 20)
            .padding(.trailing, self.course.expand ? 10 : 20)
            
            
            
            
            if self.course.expand {
                VStack{
                    HStack {
                        Text("Description")
                            .font(.title)
                            .bold()
                            .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.spring(dampingFraction: 0.5)) {
                                heart = "heart"
                            }
                        }, label: {
                            Image(systemName: heart)
                                .font(.title)
                                .foregroundColor(.red)
                            
                        })
                        .padding(.trailing, 30)
                    }
                    Text("Nine years earlier, Lorem ipsum dolor sit amet,Morbi sed purus nulla. Curabitur dapibus ultrices lorem vitae tincidunt. Pellentesque quis arcu sit amet urna commodo porttitor. Aenean sit ")
                        .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                
                
            }
            
            
            
        }
    }
}

