# iOS_Objective-C_Study
ios開発勉強

# Tutorial
<a href="https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html">About Objective-C</a>

<a href="https://developer.apple.com/library/ios/referencelibrary/GettingStarted/RoadMapiOS/FirstTutorial.html#//apple_ref/doc/uid/TP40011343-CH3-SW1">Start Developing iOS Apps Today</a>

# What are XCode, Objective-C and Cocoa
Xcode is an Integrated Development Environments like Visual Studio or Eclipse. You can download it from AppStore.

Objective-C is a  programming language like C or Java.

Cocoa is a framework providing a set of libraries, like MFC、.NET、Swing. It is helpful to develop apps.

# Basic understanding of Objective-C
At first glance, Objective-C seems strange and you may think it's a <a href="http://en.wikipedia.org/wiki/Martian_language">Martian language</a>. But actually it is based on C just with some different syntax.

### "-" and "+"
They are the beginning of a method (function). For example, a method of Java is like:

    private void hello(bool ishello)
    {
      //do something
    }

In Objective-C, it is like:

    -(void) hello:(BOOL)ishello
    {
      //do something
    }

There is no public or private in Objective-C. You can regard all public.

The method beginning with "+" means static. You can call this method without creating the object.

### Parentheses [ ]
The syntax to call a method.

Java:

    this.hello(true);

Objective-C:

    [self hello:YES];

More complex:

    [[[MyClass alloc] init:[foo bar]] autorelease];

### NS***
It represents NextStep, a company's name. The company develops a set of libraries, and uses the NS prefix naturally. For example,

    NSLog
    NSString
    NSInteger
    NSURL
    NSImage

You will also see some classes with other prefix.

    CF: Core Foundation
    CA: Core Animation
    CG: Core Graphics
    UI: User Interface

### @interface
Write a Rectangle class in Java:

    public class Rectangle extends Object{
        private int width;
        private int height;
        public Rectangle(int width, int height) {
          this.width = width;
          this.height = height;
        }
        public void getWidth() {
          return width;
        }
        public void getHeight() {
          return height;
        }
    }

If you write Objective-C, you must firstly define the class in Rectangle.h

    @interface Rectangle: NSObject{
      int width;
      int height;
    }
    -(Rectangle*) initWithWidth: (int) w height: (int) h;
    -(int) getWidth;
    -(int) getHeight;
    @end

Then implement the class in Rectangle.m

    @implementation Rectangle
    -(Rectangle*) initWithWidth: (int) w height: (int) h {
      self = [super init];
      width = w;
      height = h;
    }
    -(int) getWidth {
      return width;
    }
    -(int) getHeight {
      return height;
    }
    @end


### Method with multiple parameters
Each parameter should have the function name, data type, parameter name. For example,

    -(void) setWidth: (int) w height: (int) h;

And the implementation will be:

    -(void) setWidth: (int) w height: (int) h{
      width = w;
      height = h;
    }

Call the method:

    Rectangle *rec = [[Rectangle alloc] initWithWidth: 10 height: 20];
    [rec getWithd];
    [rec setWidth: 15 height: 25];
  
Java code may be:

    Rectangle rec = new Rectangle(10, 20);
    rec.getWidth();
    rec.setWidthAndHeight(15, 25);

### id
id is a pointer to a random Objective-C object of unknown class.

<a href="http://stackoverflow.com/questions/1304176/objective-c-difference-between-id-and-void">Objective-C: difference between id and void *</a>

### BOOL, YES, NO
YES represents true, while NO represents false. In actual, YES is 1, and NO is 0. BOOL is a char.

### nil
Generally, nil = null

### @"string"
It is shorthand to convert a c string to NSString.

