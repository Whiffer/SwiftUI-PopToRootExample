# SwiftUI-PopToRootExample

This sample program demonstrates how to programatically pop to a previous view and
also pop to the root view of a NavigationView's stack.

During the iOS 13 Beta's, Apple showed us how to programatically pop one level:
https://stackoverflow.com/questions/56513568/ios-swiftui-pop-or-dismiss-view-programmatically/57279591#57279591

However, Apple did not explicitly define how to "Pop to Root". So I asked this question on StackOverflow in August 2019:
https://stackoverflow.com/questions/57334455/swiftui-how-to-pop-to-root-view

The best answer to that question (from @malhal) pointed out the key point was that the NavigationLink's 
used in the stack must use .isDetailLink(false).  This answer works, but instead of passing the bindings 
via view parameters, this can be simplified by using the environment (as pointed out by @Imthath).

This project is an attempt to simplify a working solution to make it better.

This project currently compiles and runs on Xcode Version 11.4.1 (11E503a)
This project runs on iPhone, iPad and macOS.

In addition to Apple's existing presentationMode @Environment key,
the key component of this sample is the addition of the RootPresentationMode.swift file 
which defines a rootPresentationMode @Environment key and a RootPresentationMode type for it
that use syntax and semantics similar to Apple's presentationMode.

=======================

USAGE:

1.  Add an .environment View Modifier to the root NavigationView to set the value of 
the \.rootPresentationMode key to a Binding of the Bool used to present the
first child View.

e.g.        .environment(\.rootPresentationMode, self.$isActive)

2. Add an @Environment property wrapper to any view that will want to pop back to the 
root view.

e.g.       @Environment(\.rootPresentationMode) private var rootPresentationMode: Binding<RootPresentationMode>

3. Finally, invoking the dismiss() method on the wrapped value of the @Environment var
will pop to the root View.

e.g.        self.rootPresentationMode.wrappedValue.dismiss()
