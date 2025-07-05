import SwiftUI

struct Shapes: View {
  @State private var wideShapes = true
    var body: some View {
      
      VStack {
        if !wideShapes {
          Circle()
            .strokeBorder(Color.blue, lineWidth: 20)
            .frame(width: 200.0,height: 100.0)
            .background(Color.green)
            .transition(.scale)
}
        RoundedRectangle(cornerRadius: 20)
          .fill(Color.blue)
          .frame(width: wideShapes ? 200 : 100,height: 100.0)
        Capsule()
          .fill(Color.blue)
          .frame(width: wideShapes ? 200 : 100,height: 100.0)
        Ellipse()
          .fill(Color.blue)
          .frame(width: wideShapes ? 200 : 100,height: 100.0)
        Button("Animate!") {
          withAnimation{
            wideShapes.toggle()
        }
      }
    }
  }
}
#Preview {
    Shapes()
}
