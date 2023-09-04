abstract class Shape {
  int getArea();
  int getPerimeter();
}

class Circle implements Shape {
  int radius;

  Circle(this.radius);

  //luas
  @override
  int getArea() {
    return (3.14 * radius * radius).toInt();
  }

  //keliling
  @override
  int getPerimeter() {
    return (2 * 3.14 * radius).toInt();
  }
}


class Square implements Shape {
  int side;

  Square(this.side);

  //luas
  @override
  int getArea() {
    return (side * side);
  }

  //keliling
  @override
  int getPerimeter() {
    return (4 * side);
  }
}

class Rectangle implements Shape {
  int width;
  int height;

  Rectangle(this.width, this.height);

  //luas
  @override
  int getArea() {
    return (width * height);
  }

  //keliling
  @override
  int getPerimeter() {
    return (2 * (width + height));
  }
}

void main() {
  Circle circle = Circle(10);
  Square square = Square(14);
  Rectangle rectangle = Rectangle(9, 7);

  print("Luas dan Keliling Lingkaran:");
  print("Luas: ${circle.getArea()}, Keliling: ${circle.getPerimeter()}");

  print("Luas dan Keliling Persegi:");
  print("Luas: ${square.getArea()}, Keliling: ${square.getPerimeter()}");

  print("Luas dan Keliling Persegi Panjang:");
  print("Luas: ${rectangle.getArea()}, Keliling: ${rectangle.getPerimeter()}");
}
