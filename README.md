{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf830
{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\margl1440\margr1440\vieww19700\viewh14800\viewkind0
\deftab720
\pard\pardeftab720\sl280\partightenfactor0

\f0\fs24 \cf2 \expnd0\expndtw0\kerning0
# Pre-work - Tippy\
\
Tippy is a tip calculator application for iOS.\
\
Submitted by: Omid Sharghi\
\
Time spent: 3 hours spent in total\
\
## User Stories\
\
The following **required** functionality is complete:\
\
* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.\
* [X] Settings page to change the default tip percentage.\
\
The following **optional** features are implemented:\
* [X] UI animations\
* [X] Remembering the bill amount across app restarts (if <10mins)\
* [ ] Using locale-specific currency and currency thousands separators.\
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.\
\
The following **additional** features are implemented:\
\
* [X] Change background color\
* [X] Create Singleton to hold settings configuration\
\
## Video Walkthrough \
\
Here's a walkthrough of implemented user stories:\
\
<img src='http://i.imgur.com/ux4vHsf.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />\
\
GIF created with [LiceCap](http://www.cockos.com/licecap/).\
\
## Project Analysis\
\
As part of your pre-work submission, please reflect on the app and answer the following questions below:\
\
**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")\
\
**Answer:** The iOS app development platform is pretty impressive and its obvious Apple put a lot of working into it. To me, outlets are a way of connecting UI elements to sections of code. When we connect an outlet with an IBAction, we are telling what action the UI element should take when triggered; the IBOutlet acts like the link between the UI Element and the IBAction. The storybook source code appears to be an XML file. When examining the source code, there is a connections section where every outlet has a destination identifier and id identifier. I believe the destination identifier indicates the UI element and the ID identifier identifies the outlet.\
\
Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"\
\
**Answer:** Strong reference cycles for closures occur when you have a closure that is assigned to a property of a class instance and the body of the closure captures the instance by accessing a property of the instance. By accessing a instance property or method within the closure, a strong reference cycle is created. This occurs because closures are reference type. Therefore, when we assign a closure to a property and then inside the closure body we are accessing a class instance property, we create a situation where two strong references are referring to one another. To get around this, it is necessary to implement a capture list. Within the capture list, we can declare pair a reference with keywords \'91weak\'92 or \'91unowned\'92. We define a reference as \'92unowned\'92 when the reference and the closure body are expected to deallocate at the same time. We define a reference as \'91weak\'92, when the reference might become nil in the future.\
\
## License\
\
    Copyright 2017 Omid Sharghi\
\
    Licensed under the Apache License, Version 2.0 (the "License");\
    you may not use this file except in compliance with the License.\
    You may obtain a copy of the License at\
\
        http://www.apache.org/licenses/LICENSE-2.0\
\
    Unless required by applicable law or agreed to in writing, software\
    distributed under the License is distributed on an "AS IS" BASIS,\
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\
    See the License for the specific language governing permissions and\
    limitations under the License.\
}