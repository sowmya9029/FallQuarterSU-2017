#include <iostream> 
using namespace std;
 
class Shape {
   protected:
      int width, height;
      
   public:
      Shape( int a = 0, int b = 0){
         width = a;
         height = b;
      }
      int area() {
         cout << "Parent class area :" <<endl;
         return 0;
      }
};
class Rectangle: public Shape {
   public:
      Rectangle( int a = 0, int b = 0):Shape(a, b) { }
      
      int area () { 
         return (width * height); 
      }
};

class Triangle: public Shape {
   public:
      Triangle( int a = 0, int b = 0):Shape(a, b) { }
      
      int area () { 
         return (width * height / 2); 
      }
};

// Main function for the program
int main() {
   Rectangle rec(10,7);
   Triangle  tri(10,5);

   // call rectangle area.
   cout << "Triangle class area : " << rec.area() << endl;

   // call triangle area.
   cout << "Rectangle class area : " << tri.area() << endl;
   
   return 0;
}
