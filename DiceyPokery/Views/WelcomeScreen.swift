/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Dinh Dang Nguyen
  ID: s3759957
  Created  date: 01/8/2022
  Last modified: 29/8/2022
  Acknowledgement: None
*/

import SwiftUI

struct WelcomeScreen: View {
    @State private var playerName: String = ""
    @State private var user = User(namePlayer: "DEFAULT")
    
    var body: some View {
        GeometryReader {screen in
            NavigationView {
                ZStack {
                    Glassmorphism1()
                    VStack(alignment: .leading, spacing: 0) {
                        VStack{
                            TextField("Player Name", text: $playerName)
                                .disableAutocorrection(true)
                                .font(.system(.title, design: .rounded))
                                .foregroundColor(Color.pink)
                                .padding()
                                .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                                .background(LinearGradient(colors: [Color.purple.opacity(0.6), Color.mint.opacity(0.5)], startPoint: .top, endPoint: .leading))
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                            
                            Spacer()
                            
                            VStack {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: 150)
                                Text("Welcome to Dicey Pokery!\nEnter your name and Start!")
                                    .font(.system(.body, design: .rounded))
                                    .foregroundColor(.pink)
                                    .multilineTextAlignment(.center)
                                
                                Button(action: {}) {
                                    NavigationLink(destination: MenuView(user: User(namePlayer: $playerName.wrappedValue.uppercased()))) {
                                        Text("Start".uppercased())
                                    }
                                    
                                }
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundStyle(Color.pink)
                                .padding(.vertical,10)
                                .padding(.horizontal, 20)
                                .background(
                                    Capsule()
                                        .strokeBorder(lineWidth: 2)
                                        .foregroundStyle(Color.pink)
                                )
                                .disabled($playerName.wrappedValue.isEmpty)
                                
                                //                                }
                            }
                            Spacer()
                        }
                        
                    }
                    .padding()
                    .frame(width: screen.size.width/1.23, height: screen.size.height/2)
                    .foregroundColor(Color.black.opacity(0.8))
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .onAppear(perform: {playSound(sound: "soundtrack", type: "mp3")}
                    )
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(false)
            .accentColor(.pink)
        }

    }
}



struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen().preferredColorScheme(.light)
    }
}



