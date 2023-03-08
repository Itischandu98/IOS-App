//
//  ContentView.swift
//  test
//
//  Created by Sai Chandu Sunkara on 12/31/22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    func openlink(ext: String = "") {
        let url = URL(string: "http://192.168.0.95/\(ext)")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let image = UIImage(data: data)
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }

        task.resume()
    }
    var body: some View {
        VStack {
            Spacer()
            Text("Led Matrix")
            Spacer()
            Button("Time") {
                openlink(ext: "showtime")
            }.padding(.bottom)
            Button("Check") {
                openlink(ext: "choosecolor/Red")
                sleep(1)
                openlink(ext: "choosecolor/Green")
                sleep(1)
                openlink(ext: "choosecolor/Blue")
                sleep(1)
                openlink()
            }.padding(.bottom)
            Button("Home") {
                openlink()
            }.padding(.bottom)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
