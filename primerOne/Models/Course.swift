//
//  Course.swift
//  primerOne
//
//  Created by Ahror Jabborov on 6/1/22.
//

import Foundation

struct Course: Identifiable {
    var id: Int?
    var title: String?
    var image: String?
    var description: String?
    var expand = false
}

let courses = [
    Course(id: 1, title: "Machine Learning", image: "default", description: "Very cool course"),
    Course(id: 2, title: "Data Structures", image: "default", description: "Another cool course"),
    Course(id: 3, title: "iOS App Development", image: "default", description: "The best course")
]
var courseTypes = ["Software development","Architecture","UI/UX","Medical","Cooking","Soft skills"]
