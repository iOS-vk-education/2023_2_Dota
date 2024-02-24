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
        Spacer()
    }
}

struct MatchListCellView: View{
    var body: some View {
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
                    Text("95678")
                        .font(.system(size: 16))
                        .foregroundColor(.yellow)
                    Image("money")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.yellow)
                }
                })
        }
        .padding(8)
        .background(.gray)
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

#Preview{
    MatchListCellView()
}
