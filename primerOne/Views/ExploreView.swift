//
//  ExploreView.swift
//  primerOne
//
//  Created by Ahror Jabborov on 6/1/22.
//

import SwiftUI

struct ExploreView: View {
    @State var coursesData = courses
    var body: some View {
        NavigationView {
            FeaturedList(courses: $coursesData)
            .navigationBarTitle("Featured")
                .foregroundColor(Color.black)
            FeaturedList(courses: $coursesData)
            
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}



struct FeaturedList: View {
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
