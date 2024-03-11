import SwiftUI


//Понять как скрывать хедер

struct ContentViewTest: View {
    @State private var isHidden = false

    var body: some View {
        VStack{
            MatchHeaderView()
            ScrollView {
                VStack(spacing: 20) {
                    
                    
                    ForEach(1...100, id: \.self) { index in
                        Text("Row \(index)")
                            .frame(height: 50)
                    }
                }
                .padding()
            }
            .animation(.easeInOut)
            .overlay(
                GeometryReader { proxy in
                    Color.clear.onAppear {
                        withAnimation {
                            isHidden = true
                        }
                    }
                    .onDisappear {
                        withAnimation {
                            isHidden = false
                        }
                    }
                }
            )
            .offset(y: isHidden ? -100 : 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTest()
    }
}
