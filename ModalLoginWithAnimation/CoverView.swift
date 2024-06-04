//
//  CoverView.swift
//  ModalLoginWithAnimation
//
//  Created by KARMANI Aziza on 11/09/2023.
//

import SwiftUI

struct CoverView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var viewState = CGSize.zero
    @State var isDragging = false
    
    var body: some View {
        VStack {
            GeometryReader{ geometry in
                Text("Se connecter")
                    .font(.system(size: geometry.size.width/10, weight: .bold))
                    .frame(maxWidth: .infinity , alignment: .center)
                    .foregroundColor(.black.opacity(0.6))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                // Button Back :::
                Button {
                    presentationMode.wrappedValue.dismiss()
                }
            label: {
                Image(systemName: "xmark")
                    .font(.body)
                    .bold()
                    .foregroundColor(.black.opacity(0.5))
                    .frame(width: 35, height: 35)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(25)
                    .frame(maxWidth: .infinity, alignment: .topTrailing)
            }
            }
            .frame(maxWidth: 370, maxHeight: 100)
            .padding(.horizontal, 15)
            .padding(.top, 30)
            .offset(x: viewState.width/15, y: viewState.height/15)
            
            Spacer()
            
        }
        .frame(height: 430)
        .frame(maxWidth: .infinity)
        .background(Image(uiImage: UIImage(imageLiteralResourceName: "10")).resizable().frame(width: 300, height: 340), alignment: .bottom)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .rotation3DEffect(Angle(degrees: 8), axis: (x: viewState.width, y: viewState.height, z: 0))
        .scaleEffect(isDragging ? 0.9 : 1)
        .gesture(DragGesture()
            .onChanged{ value in
                self.viewState = value.translation
                self.isDragging = true
                
            }.onEnded{ value in
                self.viewState = .zero
                self.isDragging = false
            })
    }
}

struct CoverView_Previews: PreviewProvider {
    static var previews: some View {
        CoverView()
    }
}
