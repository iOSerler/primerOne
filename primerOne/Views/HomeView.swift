//
//  HomeView.swift
//  primerOne
//
//  Created by Ahror Jabborov on 6/1/22.
//

import SwiftUI

struct HomeView: View {
    @State var coursesData = courses
    var body: some View {
        NavigationView {
            CourseList(courses: $coursesData)
            .navigationBarTitle("Courses")
                .foregroundColor(Color.black)
        }
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
