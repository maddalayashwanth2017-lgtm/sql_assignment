class Father:

    def height(self):
        self.height_=5.11
        print("father height is 5.11")
    
    def colour(self):
        self.colour= "white"
         
class Son(Father):
    def run(self):
        print("son runs faster ")

class Daughter(Father):
    def cook(self):
        print("cookes better: ")

