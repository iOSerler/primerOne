//
//  HomeView.swift
//  primerOne
//
//  Created by Ahror Jabborov on 6/1/22.
//

import SwiftUI

struct HomeView: View {
    @State var coursesData = courses
    @State var hero = false
    var body: some View {
        
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    SearchBar()
                    
                    HStack {
                        Text("Trending this week")
                            .bold()
                            .multilineTextAlignment(.trailing)
                            .padding(.leading, 20)
                        
                        Spacer()
                        Text("View all >")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                            .padding(.trailing, 20)
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(coursesData) { course in
                                NavigationLink(
                                    destination: DetailView(course: course),
                                    label: {
                                        TrendingView(trendingCourse: course)
                                            .background(Color.white)
                                            .cornerRadius(15)
                                            .shadow(radius: 1)
                                    })
                                    .buttonStyle(PlainButtonStyle())
                            }
                            .padding(.bottom, 10)
                            .padding(.leading, 30)
                            
                        }
                    }
                    
                }.padding(.top, -50)
                    .opacity(self.hero ? 0 : 1)
                
                VStack{
                    HStack {
                        Text("Categories")
                            .bold()
                            .multilineTextAlignment(.trailing)
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                    // Categories View
                    HStack(spacing: 10) {
                        ForEach(1 ..< 5) { i in
                            VStack {
                                Image("default")
                                Text(courseTypes[Int(i)-1])
                                    .font(.subheadline)
                                    .bold()
                            }
                            .frame(width: 80, height: 100, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(15)
                        }
                    }
                    
                    HStack(spacing: 10) {
                        ForEach(3 ..< 7) { i in
                            VStack {
                                Image("default")
                                Text(courseTypes[Int(i)-1])
                                    .font(.subheadline)
                                    .bold()
                            }
                            .frame(width: 80, height: 100, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(15)
                        }
                    }
                    
                }.shadow(radius: 1)
                    .opacity(self.hero ? 0 : 1)
                
                VStack{
                    HStack {
                        Text("Our picks")
                            .bold()
                            .multilineTextAlignment(.trailing)
                            .padding(.leading, 20)
                        
                        Spacer()
                        Text("View all >")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                            .padding(.trailing, 20)
                    }
                    .opacity(self.hero ? 0 : 1)
                    
                    
                    // Card View
                    VStack(spacing: 100) {
                        ForEach(0..<self.coursesData.count){i in
                            GeometryReader{g in
                                OurPicks(course: self.$coursesData[i], hero: self.$hero)
                                    
                                    .offset(y: self.coursesData[i].expand ? -g.frame(in: .global).minY : 0)
                                    .opacity(self.hero ? (self.coursesData[i].expand ? 1 : 0) : 1)
                                    .onTapGesture {
                                        
                                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                            if !self.coursesData[i].expand{
                                                self.hero.toggle()
                                                self.coursesData[i].expand.toggle()
                                            }
                                        }
                                        
                                    }
                                
                            }
                            // going to increase height based on expand...
                            .frame(height: self.coursesData[i].expand ? UIScreen.main.bounds.height : 250)
                            .simultaneousGesture(DragGesture(minimumDistance: self.coursesData[i].expand ? 0 : 800).onChanged({ (_) in
                                
                                print("dragging")
                            }))
                        }
                        
                        
                    }
                    
                }.padding(.top, 50)
                .padding(.bottom, 150)
                
                Spacer()
                
            }
        }
//        NavigationView {
//            CourseList(courses: $coursesData)
//            .navigationBarTitle("Courses")
//                .foregroundColor(Color.black)
//        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct CourseList: View {
    @Binding var courses: [Course]
    
    var body: some View {
        List(courses) { course in
            NavigationLink(destination: DetailView(course: course)) {
                VStack(alignment: .leading) {
                    Image(course.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    Text(course.title!)
                        .font(.system(size: 16))
                }
            }
        }
    }
}


struct SearchBar: View  {
    @State var search = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)), Color(#colorLiteral(red: 0.9843164086, green: 0.9843164086, blue: 0.9843164086, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .frame(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height)*0.25, alignment: .center)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                HStack {
                    Text("Browse")
                        .bold()
                        .font(.title)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                        .padding(.top, -40)
                    Spacer()
                    Text("Filter")
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                        .padding(.top, -30)
                }
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .font(.title)
                    TextField("Search...", text: $search)
                        
                        .font(.title3)
                }
                .frame(width:  ( UIScreen.main.bounds.width)*0.85, height: 40, alignment: .leading)
                .padding(.leading, 20)
                .background(Color.white)
                .cornerRadius(10)
                
            }
        }
    }
}

