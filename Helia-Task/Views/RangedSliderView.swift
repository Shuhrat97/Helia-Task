//
//  RangedSliderView.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import SwiftUI

struct RangedSliderView: View {
    let currentValue: Binding<ClosedRange<Int>>
    let sliderBounds: ClosedRange<Int>
    
    public init(value: Binding<ClosedRange<Int>>, bounds: ClosedRange<Int>) {
        self.currentValue = value
        self.sliderBounds = bounds
    }
    
    var body: some View {
        GeometryReader { geomentry in
            sliderView(sliderSize: geomentry.size)
        }
    }
    
        
    @ViewBuilder private func sliderView(sliderSize: CGSize) -> some View {
        let sliderViewYCenter = sliderSize.height / 2
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(Color(UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)))
                .frame(height: 6)
                .cornerRadius(3)
            ZStack {
                let sliderBoundDifference = sliderBounds.count
                let stepWidthInPixel = CGFloat(sliderSize.width) / CGFloat(sliderBoundDifference)
                
                // Calculate Left Thumb initial position
                let leftThumbLocation: CGFloat = currentValue.wrappedValue.lowerBound == Int(Float(sliderBounds.lowerBound))
                    ? 0
                : CGFloat(Float(currentValue.wrappedValue.lowerBound) - Float(sliderBounds.lowerBound)) * stepWidthInPixel
                
                // Calculate right thumb initial position
                let rightThumbLocation = CGFloat(currentValue.wrappedValue.upperBound) * stepWidthInPixel
                
                // Path between both handles
                lineBetweenThumbs(from: .init(x: leftThumbLocation, y: sliderViewYCenter), to: .init(x: rightThumbLocation, y: sliderViewYCenter))
                
                // Left Thumb Handle
                let leftThumbPoint = CGPoint(x: leftThumbLocation, y: sliderViewYCenter)
                thumbView(position: leftThumbPoint, value: Float(currentValue.wrappedValue.lowerBound))
                    .highPriorityGesture(DragGesture().onChanged { dragValue in
                        
                        let dragLocation = dragValue.location
                        let xThumbOffset = min(max(0, dragLocation.x), sliderSize.width)
                        
                        let newValue = Int(sliderBounds.lowerBound) + Int(xThumbOffset / stepWidthInPixel)
                        
                        // Stop the range thumbs from colliding each other
                        if newValue < currentValue.wrappedValue.upperBound {
                            currentValue.wrappedValue = newValue...currentValue.wrappedValue.upperBound
                        }
                    })
                
                // Right Thumb Handle
                thumbView(position: CGPoint(x: rightThumbLocation, y: sliderViewYCenter), value: Float(currentValue.wrappedValue.upperBound))
                    .highPriorityGesture(DragGesture().onChanged { dragValue in
                        let dragLocation = dragValue.location
                        let xThumbOffset = min(max(CGFloat(leftThumbLocation), dragLocation.x), sliderSize.width)
                        
                        var newValue = Int(xThumbOffset / stepWidthInPixel) // convert back the value bound
                        newValue = min(newValue, Int(Float(sliderBounds.upperBound)))
                        
                        // Stop the range thumbs from colliding each other
                        if newValue > currentValue.wrappedValue.lowerBound {
                            currentValue.wrappedValue = currentValue.wrappedValue.lowerBound...newValue
                        }
                    })
            }
        }
    }
    
    @ViewBuilder func lineBetweenThumbs(from: CGPoint, to: CGPoint) -> some View {
        Path { path in
            path.move(to: from)
            path.addLine(to: to)
        }.stroke(Color.appGreen, lineWidth: 6)
    }
    
    @ViewBuilder func thumbView(position: CGPoint, value: Float) -> some View {
        ZStack {
            ZStack(alignment: .center) {
                Image("vector")
                    .resizable()
                    .frame(width: 39, height: 26)
                
                Text("$" + String(Int(value)))
                    .foregroundColor(.white)
                    .font(.appFontSemiBold(size: 14))
            }
            .offset(y: -25)
            
            Image("ellipse")
                .resizable()
                .frame(width: 20, height: 20)
        }
        .frame(width: 36, height: 24)
        .position(x: position.x, y: position.y)
    }
}


struct RangedSliderView_Previews: PreviewProvider {
    static var previews: some View {
        RangedSliderView(value: .constant(14...60), bounds: 0...100)
    }
}
