module Listas
    
   Node = Struct.new(:value,:next,:prev)
   
   class Listas
      attr_reader :head , :longitud , :tail
      include Enumerable
       
      def initialize
        @head = nil
        @tail = nil
        @longitud = 0
      end
     
     
      def each
            temp = @head
            counter = 0
            while counter < longitud do
                yield temp.value
                temp = temp.next
                counter += 1
            end
      end
     
      def push(item)
         node = Node.new(item,nil,nil)
         if @head.nil?
            @head = node
            @tail = node
         else
            node = Node.new(item,nil,@tail)
            @tail.next = node
            @tail = node
         end
         @longitud += 1
      end
      
      def borrado (indice)
         if indice == 0
                @head = @head.next
                @head.prev = nil
         else
            temp = @head
            counter = 0
            while counter < indice do                 
               temp = temp.next
               counter += 1
            end
            anterioralborrado = temp.prev
            temp.next = anterioralborrado.next
         end
         @longitud -= 1
      end
      
      def getelem(indice)
         temp = @head
         count = 0
         while count < indice-1  do
            temp = temp.next
            count +=1
         end
         temp.value
      end
      
      def getAnt(indice)
         temp = @head
         count = 0
         while count < indice-1 do
            temp  = temp.next
            count +=1
         end
         @tail = temp.prev
         @tail.value

      end
      
      def setelem(indice,valor)
         temp = @head
         count = 0
         while count < indice-1  do
            temp = temp.next
            count +=1
         end
         temp.value = valor
      end
      
   end  
      
   
   
   class Bibliography
      attr_reader :author, :title, :editorial, :date
      include Comparable 
        
      def initialize(author, title, editorial, date)
         
         if author == nil || author == 0
            raise ArgumentError, 'Tiene que tener como minimo un autor'
         end
         @author = author
         
          
         if title == nil
            raise ArgumentError, 'Tiene que tener un titulo'
         end
         @title = title
         
         if editorial == nil
            raise ArgumentError, 'Tiene que tener una editorial'
         end
         @editorial = editorial
    
         if date == nil 
            raise ArgumentError, 'Tiene que tener una fecha'
         end
         @date = date 
          
      end
      
      def <=> (b)
         [self.author, self.title, self.editorial , self.date] <=> [b.author, b.title, b.editorial,b.date]
      end
      
      
      def to_s
         authors = ""
         counter = @author.count - 1
         @author.each_with_index  do |author, index|
            if index < counter
               authors += author + ", "
            else
               authors += author
            end
         end
         "#{authors}\n#{@title}\n#{@editorial};(#{@date})"
      end
   
   end
   
   class Enciclopedia < Bibliography
    attr_reader :serial, :volumen, :isbn
        include Comparable
         def initialize(author, title, editorial, volumen, date, isbn) 
            
            super(author, title, editorial, date)
            
            if volumen == nil
                raise ArgumentError, 'Tiene que tener un numero de tomos'
            end
            @volumen = volumen
         
            if isbn == nil
                raise ArgumentError, 'Tiene que tener un ISBN'
            end
            @isbn = isbn
            
         end
         
         def addSerial(serial)
            @serial = serial
         end
        
         
       
   end
   

   
   
end