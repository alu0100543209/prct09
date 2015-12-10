require "spec_helper"
require "Listas/Listas"

describe " Contendor Listas: " do
   
    describe "Nodo Test" do
        
        before :each do
            @n = Listas::Node.new(1,nil,nil)
        
        end
        
        it "Existe valor en nodo"do
            expect(@n.value).to eq(1)
        end
       
        it "Siguiente apunta nil" do
            expect(@n.next).to eq(nil)
        end
        
        it "El valor previo apunta a nil" do
            expect(@n.prev).to eq(nil)
        end
        
    end
    
    describe "Listas enlazadas: " do
        
      
        it "Existe una lista" do
            l = Listas::Listas.new
            expect(l).not_to be(nil)
        end
        
            
        it "Intrdoducir un elemento en la lista" do
            l = Listas::Listas.new
            l.push(1)
            expect(l.longitud).to eq(1)
        end
        
        it"Introducir varios elementos en la lista" do
            l = Listas::Listas.new
            l.push(0)
            l.push(1)
            l.push(2)
            expect(l.longitud).to eq(3)
        end
        
       
    
        it "Obtener la cabeza de la lista" do
            l= Listas::Listas.new
            expect(l.head).to eq(nil)
        end
        
        it"Obtener la cola de la lista" do
            l=Listas::Listas.new
            expect(l.tail).to eq(nil)
        end
        
        it "Debemos poder eliminar un valor" do
            l=Listas::Listas.new
            l.push(0)
            l.push(1)
            l.borrado(0)
            expect(l.longitud).to eq(1)
        end
        
        it "Obtener un elemento" do
            l = Listas::Listas.new
            l.push(1)
            l.push('dog')
            l.push(3)
            expect(l.getelem(2)).to eq('dog')
        end
        
        it "Setear un elemento" do 
            l = Listas::Listas.new
            l.push(1)
            l.push('cat')
            l.push(3)
            l.setelem(2,'dog')
            expect(l.getelem(2)).to eq('dog')
            
        end
        
        it "Obtener elemento anterior" do
            l = Listas::Listas.new
            l.push('primero')
            l.push('segundo')
            l.push('tercero')
            expect(l.getAnt(2)).to eq('primero')
        end
        
        it "Acepta una bibliografia" do
            authors=['Dave Thomas', 'Andy Hunt', 'Chad Fowler']
            title="Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide"
            editorial="Pragamatic Book"
            date="July 7, 2013"
            @bib = Listas::Bibliography.new(title, authors, editorial, date)
            l = Listas::Listas.new
            l.push(@bib)
            expect(l.getelem(0)).to eq(@bib)
        end
        
        
        it "Comprobar que devuelve el maximo" do
            
            authors=['Dave Thomas']
            title="Programming JavaScript"
            editorial="W3School"
            date="July 20, 2015"
            bib = Listas::Bibliography.new(title, authors, editorial, date)
         

            authors=['Dave Thomas']
            title="Programming JavaScript"
            editorial="W3School"
            date="July 20, 2016"
            bib2 = Listas::Bibliography.new(title, authors, editorial, date)
            
            authors=['Dave Thomas']
            title="Programming JavaScript"
            editorial="W3School"
            date="July 20, 2017"
            bib3 = Listas::Bibliography.new(title, authors, editorial, date)
            
            listaCheck = Listas::Listas.new
            listaCheck.push(bib2)
            listaCheck.push(bib)
            listaCheck.push(bib3)
            expect(listaCheck.min).to eq(bib)
        end
        
        
        it "Comprobar que devuelve el minimo" do
            
            authors=['Dave Thomas']
            title="Programming JavaScript"
            editorial="W3School"
            date="July 20, 2015"
            bib = Listas::Bibliography.new(title, authors, editorial, date)
         

            authors=['Dave Thomas']
            title="Programming JavaScript"
            editorial="W3School"
            date="July 20, 2016"
            bib2 = Listas::Bibliography.new(title, authors, editorial, date)
            
            authors=['Dave Thomas']
            title="Programming JavaScript"
            editorial="W3School"
            date="July 20, 2017"
            bib3 = Listas::Bibliography.new(title, authors, editorial, date)
            
            listaCheck = Listas::Listas.new
            listaCheck.push(bib2)
            listaCheck.push(bib)
            listaCheck.push(bib3)
            expect(listaCheck.min).to eq(bib3)
        end
        
        it "Comprobar que devuelve el maximo" do
            
            authors=['Dave Thomas']
            title="Programming JavaScript"
            editorial="W3School"
            date="July 20, 2015"
            bib = Listas::Bibliography.new(title, authors, editorial, date)
         

            authors=['Dave Thomas']
            title="Programming JavaScript"
            editorial="W3School"
            date="July 20, 2016"
            bib2 = Listas::Bibliography.new(title, authors, editorial, date)
            
            authors=['Dave Thomas']
            title="Programming JavaScript"
            editorial="W3School"
            date="July 20, 2017"
            bib3 = Listas::Bibliography.new(title, authors, editorial, date)
            
            listaCheck = Listas::Listas.new
            listaCheck.push(bib2)
            listaCheck.push(bib)
            listaCheck.push(bib3)
            expect(listaCheck.max).to eq(bib3)
        end

        
    end 
    
    
    describe "Bibliografia" do
       
      before :each do
        @author=['Dave Thomas', 'Andy Hunt', 'Chad Fowler']
        @title="Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide"
        @editorial="Pragamatic Book"
        @date="July 7, 2013"
        @bib = Listas::Bibliography.new(@author, @title, @editorial,@date)
        @bib2 = Listas::Bibliography.new(@author, @title, @editorial,@date)
       
        end    
        
        it "La bibliografia estandar debe tener autores" do
            expect(@bib.author).to eq(@author)
        end
    
    
        it "La bibliografia estandar debe tener titulo" do
            expect(@bib.title).to eq(@title)
        end
        
         it "La bibliografia estandar debe tener un editorial" do
            expect(@bib.editorial).to eq(@editorial)
        end
        
        it "La bibliografia estandar debe tener una fecha" do
            expect(@bib.date).to eq(@date)
        end
        
        it "Bibliografia a cadena de texto" do
            expect(@bib.to_s).to eq("Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide\nPragamatic Book;(July 7, 2013)")
        end
        
        it "Bibliografia  comparable equal 0 " do
            expect(@bib <=> @bib2).to eq(0)
        end
        
        it "Bibliografia comparable min 1" do
            author=['Dave Thomas', 'Andy Hunt', 'Chad Fowler']
            title="Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide"
            editorial="Menor"
            date="July 7, 2013"
            bib3 = Listas::Bibliography.new(author, title, editorial,date)
            expect(@bib <=> bib3).to eq(1)
        end
        
        it "Bibliografia max -1" do
            author=['Dave Thomas', 'Andy Hunt', 'Chad Fowler']
            title="Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide"
            editorial="Pragamatic Book Mayor"
            date="July 7, 2013"
            bib4 = Listas::Bibliography.new(author, title, editorial,date)
            expect(@bib <=> bib4).to eq(-1)
        end
        
        
    end
    
    
    describe "Enciclopedia" do
  
        before :each do
            @author=['Dave Thomas', 'Andy Hunt', 'Chad Fowler']
            @title="Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide"
            @editorial="Pragamatic Book"
            @volumen="Volumen 4"
            @date="July 7, 2013"
            @isbn=['123789','456789']
            @enciclopedia = Listas::Enciclopedia.new(@title, @author, @editorial, @volumen, @date, @isbn)
            @enciclopedia2 = Listas::Enciclopedia.new(@title, @author, @editorial, @volumen, @date, @isbn)
        end
        
        it "La enciclopedia ha un numero de tomo" do
            expect(@enciclopedia.volumen).to eq(@volumen)
        end
        
        
        it "El libro ha de tener isbn" do
            expect(@enciclopedia.isbn).to eq(@isbn)
        end
        
        it "El libro puede tener o no un serial" do
            serial="(The Facets of Ruby)"
            @enciclopedia.addSerial(serial)
            expect(@enciclopedia.serial).to eq(serial)
        end
  
        
        
    end
    
        
end

