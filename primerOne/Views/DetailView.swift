//
//  DetailView.swift
//  primerOne
//
//  Created by Ahror Jabborov on 6/1/22.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var modalShown = false
    
    
    var course: Course
    var body: some View {
        GeometryReader { geometry in
            NavigationView() {
                Image(self.course.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    }
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: { Image("back").foregroundColor(Color.white) } ))
            
            ModalView(isOpen: self.$modalShown, maxHeight: geometry.size.height * 0.7) {
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(self.course.title!)
                            .font(.headline).bold()
                       
                    }.padding(.bottom)
                    Text(self.course.description!)
                    .multilineTextAlignment(.leading)
                }
                .padding()
                
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(course: courses[0])
    }
}
