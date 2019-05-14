def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    alum
    end

# LOS PROMEDIOS DE LOS ALUMNOS
def promedios
    alum = read_alum('alumnos.csv')
    alum.each do |i|
      suma = 0
      i.each_with_index do |unid, index|
       suma += unid.to_i if index != 0
      end
      puts "#{i[0]} tiene un promedio: #{suma / 5.0}"
      
    end
end


# INASISTENCIAS 
def faltas
    segundo_a = []
    contador = 0
    alum = read_alum('alumnos.csv')
    alum.each do |i|
      i.each_with_index do |unid, index|
        segundo_a << i[0] if unid.to_i == 0 && index != 0
    end  
    end  
    puts  segundo_a
end

# NOTA ÀRA APROBAR
def aprobados
    alum = read_alum('alumnos.csv')
    alum.each do |i|
      suma = 0
      i.each_with_index do |unid, index|
       suma += unid.to_i if index != 0
      end
      puts "#{i[0]} Aprobó" if (suma / 5) > 5.0
      
    end
end


condicion = 0
while condicion != 4
    puts "\n"
    puts "PROGRAMA DE NOTAS: Escoja una opción escribiendo un numero entre 1 al 4, LUEGO PRESIONE ENTER"
    puts "1) PROMEDIO DE NOTAS"
    puts "2) CANTIDAD DE INASISTENCIAS"
    puts "3) ALUMNOS APROBADOS"
    puts "4) SALIR"
condicion = gets.chomp.to_i
case condicion

    when 1
    promedios
    when 2
    faltas
    when 3
    aprobados
    when 4
    puts "HA SALIDO DEL PROGRAMA. ADIOS"
    else
    puts "ERROR, INGRESE UNA OPCIÓN DEL 1 AL 4"
    end
end