//
//  MatchContentView.swift
//  Dota2Technopark
//
//  Created by Mike Ulanov on 22.02.2024.
//


import SwiftUI

struct MatchContentView: View {
    @Binding var type2 : Bool
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, spacing: 16){
                    VStack(spacing: 0, content: {
                        TeamHeaderView(teamName: "Силы Света")
                            .padding(.top, 16)
                        ForEach(0 ..< 5) { i in
                            MatchListCellView()
                                .onTapGesture {
                                    type2 = false
                                }
                        }
                    })
                    VStack(spacing: 0, content: {
                        TeamHeaderView(teamName: "Силы тьмы")
                        ForEach(0 ..< 5) { i in
                            MatchListCellView()
                                .onTapGesture {
                                    type2 = true
                                }
                        }
                    })
                }
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
    }
}


struct TeamHeaderView: View{
    let teamName: String
    var body: some View {
        HStack {
            Text(teamName)
                .font(.title)
                .foregroundColor(.white)
                .shadow(color: Color.black, radius: 6, x: 1, y: 1)
        }
    }
}


struct MatchHeaderView: View{
    var body: some View {
        VStack {
            Text("40 : 31")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            HStack(){
                Spacer()
                VStack(alignment: .leading, content: {
                        Text("Силы света")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                        Text("Победа")
                            .font(.system(size: 24))
                            .foregroundColor(.green)
                })
                Spacer()
                VStack(alignment: .leading, content: {
                        Text("Силы тьмы")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                        Text("Поражение")
                            .font(.system(size: 24))
                            .foregroundColor(.red)
                })
                Spacer()
            }
            VStack {
                Text("Рейтинговый матч")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                Text("All pick")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
            }
            .padding(16)
        }
        .background(.ultraThinMaterial)
    }
}


struct MatchListCellView: View{
    var body: some View {
        VStack {
            HStack {
                Image("heroIcon")
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading, content:
                    {
                        Text("Oleg_nagibator")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                    HStack {
                        Text("14 / 0 / 0")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .padding(.trailing,16)
                        Image("moneyPig")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                        Text("95678")
                            .font(.system(size: 16))
                            .foregroundColor(.yellow)
                        
                    }
                })
                Spacer()
                VStack(alignment: .trailing, content: {
                    ItemsCellView()
                })
            }
            .padding(10)
            .background(Color.black.gradient)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: Color.gray, radius: 10, x: 0, y: 5)
        }
        .frame(height: 100)
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }
}

struct ItemsCellView: View {
    var imageLenght:CGFloat = 20
    var body: some View{
        HStack(spacing: 12, content: {
            VStack {
                Image("photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageLenght, height: imageLenght)
                
                Image("photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageLenght, height: imageLenght)
            }
            
            VStack {
                Image("photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageLenght, height: imageLenght)
                
                Image("photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageLenght, height: imageLenght)
            }
            VStack{
                Image("photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageLenght, height: imageLenght)
                
                Image("photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageLenght, height: imageLenght)
            }
        })
        .padding(6)
        .padding(.trailing, 16)
    }
}


#Preview{
    MatchContentView(type2: .constant(false))
}
