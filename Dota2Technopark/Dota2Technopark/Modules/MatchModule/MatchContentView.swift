//
//  MatchContentView.swift
//  Dota2Technopark
//
//  Created by Mike Ulanov on 22.02.2024.
//

import SwiftUI

struct MatchContentView: View {
    var body: some View {
        MatchHeaderView()
        //Тут должен быть вью выбора детальной инфы
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading){
                VStack(spacing: 1, content: {
                    TeamHeaderView(teamName: "Силы Света")
                    ForEach(0 ..< 5) { i in
                        MatchListCellView()
                    }
                })
                VStack(spacing: 1, content: {
                    TeamHeaderView(teamName: "Силы тьмы")
                    ForEach(0 ..< 5) { i in
                        MatchListCellView()
                    }
                })
            }
        }
        Spacer()
    }
}


struct TeamHeaderView: View{
    let teamName: String
    var body: some View {
        HStack {
            Text(teamName)
                .font(.title)
                .foregroundColor(.white)
        }
        .background(.blue)
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
                        Text("Силы света")
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
        .background(.blue, ignoresSafeAreaEdges: .all)
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
                .background(.blue)
            }
            .padding(4)
            .background(.gray)
        }
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
    }
}


#Preview{
    MatchContentView()
}
