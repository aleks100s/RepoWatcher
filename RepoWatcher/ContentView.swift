//
//  ContentView.swift
//  RepoWatcher
//
//  Created by Alexander on 29.10.2023.
//

import SwiftUI

struct ContentView: View {
	          let rows = [
	              GridItem(.fixed(30), spacing: 1),
	              GridItem(.fixed(60), spacing: 10),
	              GridItem(.fixed(90), spacing: 20),
	              GridItem(.fixed(10), spacing: 50)
	          ]
	 
	          var body: some View {
	              ScrollView(.horizontal) {
	                  LazyHGrid(rows: rows, spacing: 5) {
	                      ForEach(0...300, id: \.self) { _ in
	                          Color.red.frame(width: 30)
	                          Color.green.frame(width: 10)
	                          Color.blue.frame(width: 30)
	                          Color.yellow.frame(width: 20)
	                      }
	                  }
	              }
	          }
}

#Preview {
    ContentView()
}
