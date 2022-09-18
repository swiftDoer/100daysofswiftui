import SwiftUI

struct NavigationViewBootcamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                
                NavigationLink(destination: {
                    MyOtherScreen()
                }, label: {
                    Text("I will lead you to places")
                })
            }
            .navigationTitle("All Inboxes")
            //            .navigationBarTitleDisplayMode(.inline)   changes nav title style
            //            .navigationBarHidden(true)                hides navigation bar
            
            
            
            //some good shit!!!!
//            .toolbar(content: {                                   add toolbar
//                ToolbarItem(placement: .bottomBar, content: {
//                    Button(action: {
//                        //do the thing
//                    }, label: {
//                        Text("Bottom Bar")
//                    })
//                })
//            })
            
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarLeading, content: {
                    Button(action: {
                        //nothing
                    }, label: {
                        Text("Sign Out")
                    }) .tint(.red)
                    
                    Button(action: {
                        //nothing
                    }, label: {
                        Text("2nd")
                    }) .tint(.yellow)
                    
                    NavigationLink(destination: {
                        Text("Epic Link")
                    }, label: {
                        Image(systemName: "square.and.arrow.up.fill")
                    }) .tint(.green)
                })
                
                
                ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        //nothing
                    }, label: {
                        Text("first")
                    })
                    
                    Button(action: {
                        //nothing
                    }, label: {
                        Text("Search")
                    })
                })
                
                
                ToolbarItemGroup(placement: .bottomBar, content: {
                    Button(action: {
                        //nothing
                    }, label: {
                        Text("Bank Account")
                    })
                    
                    Button(action: {
                        //nothing
                    }, label: {
                        Text("Account")
                    })
                })
            })
        }
    }
}

struct MyOtherScreen: View {
    
//    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var byeView
    
    var body: some View {
        ZStack {
            Rectangle().fill(.yellow.gradient)
                .ignoresSafeArea()
//                .navigationTitle("Blue screen!")
//                .navigationBarBackButtonHidden(true)
    
            
            VStack {
                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
                    byeView.callAsFunction() // really cool
                }, label: {Text("Back button")})
                .tint(.primary)
                
                Spacer()
                
                NavigationLink(destination: {
                    VStack {
                        Text("Placeholder")
                            .navigationTitle("Third Page")
                        
                        Button(action: {
                            print("hi")
                        }, label: {
                            Text("Press to go back")
                        })
                    }
                }, label: {Text("3rd Page")})
                    .navigationTitle("Yellow Page")
            }
        }
    }
}

struct NavigationViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewBootcamp()
    }
}
