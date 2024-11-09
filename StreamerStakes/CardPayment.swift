import SwiftUI

struct CardPaymentView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Text("Add Payment Method")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                
                // Dummy form for card info, customize as needed
                Form {
                    TextField("Card Number", text: .constant(""))
                    TextField("Expiration Date", text: .constant(""))
                    TextField("CVC", text: .constant(""))
                    TextField("ZIP Code", text: .constant(""))
                }
                .background(Color.white)
                .cornerRadius(10)
                .padding()
                
                Button(action: {
                    // Add save action here
                    
                    // Dismiss the view and return to HomeView
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save Card")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    CardPaymentView()
}
