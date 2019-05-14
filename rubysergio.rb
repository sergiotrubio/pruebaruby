def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    alum
    end

# LOS PROMEDIOS DE LOS ALUMNOS
def promedios
    aux_arr = {}
    alum = read_alum('alumnos.csv')
    alum.each do |i|
      suma = 0
      i.each_with_index do |unid, index|
       suma += unid.to_i if index != 0
      end
      puts "#{i[0]} tiene un promedio: #{suma / 5.0}"
      aux_arr[i[0]] = suma
    end
end


# INASISTENCIAS 
def faltas
    segundo_a = []
    alum = read_alum('alumnos.csv')
    alum.each do |i|
      i.each_with_index do |unid, index|
        segundo_a << i[0] if unid.to_i == 0 && index != 0
    end  
    end  
    puts  segundo_a
    puts "faltaron: 1 dia(s)"
end


# NOTA PARA APROBAR (DEBERÍA SER SI EL PROMEDIO >= 5)




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
    max_stock
when 4
    puts "HA SALIDO DEL PROGRAMA. ADIOS"
else
    puts "ERROR, INGRESE UNA OPCIÓN DEL 1 AL 4"
end
end

# def alum_promedio
# alum = read_alum('alumnos.csv')
# alum
# end



# def list_stock
# products = read_products('inventario.csv')
# products.each do |item_line|
#     puts "El producto #{item_line[0]} tiene :"
#     item_line.each_with_index do |elem, index|
#     puts  "En la tienda #{index} : #{elem} unidades" if index != 0
#     end
# end
# end

# def sum_stock
# aux_arr = {}
# products = read_products('inventario.csv')
# products.each do |item_line|
#     acc = 0
#     item_line.each_with_index do |elem, index|
#     acc += elem.to_i if index != 0
#     end
#     puts "El producto #{item_line[0]} tiene : #{acc} unidades"
#     aux_arr[item_line[0]] = acc
# end
# return aux_arr
# end

# def max_stock
# aux_hash = {}
# products = read_products('inventario.csv')
# products.each do |item_line|
#     acc = 0
#     item_line.each_with_index do |elem, index|
#     acc += elem.to_i if index != 0
#     end
#     aux_hash[item_line[0]] = acc
# end
# puts "El artículo con más stock es #{aux_hash.key(aux_hash.values.max)} \
#         con #{aux_hash.values.max} unidades"
# end

# def min_stock
# aux_hash = {}
# products = read_products('inventario.csv')
# products.each do |item_line|
#     acc = 0
#     item_line.each_with_index do |elem, index|
#     acc += elem.to_i if index != 0
#     end
#     aux_hash[item_line[0]] = acc
# end
# puts "El artículo con menos stock es #{aux_hash.key(aux_hash.values.min)} \
#         con #{aux_hash.values.min} unidades"
# end

# def cero_stock
# aux_arr = []
# products = read_products('inventario.csv')
# products.each do |item_line|
#     item_line.each_with_index do |elem, index|
#     aux_arr <<  item_line[0] if elem.to_i == 0 && index != 0
#     end
# end
# puts aux_arr
# end

# def product_exists?(product)
# aux_hash = {}
# products = read_products('inventario.csv')
# products.each do |item_line|
#     name = item_line.shift
#     aux_hash[name] = item_line
#     end
#     print aux_hash
# puts aux_hash[product] ? 'Si' : 'No'
# end

# condition = 0
# while condition != 7
# puts "Elije una opción entre 1 y 6. 7 para salir"
# condition = gets.chomp.to_i
# case condition
# when 1
#     list_stock
# when 2
#     sum_stock
# when 3
#     max_stock
# when 4
#     min_stock
# when 5
#     cero_stock
# when 6
#     puts "Ingrese el nombre del producto ej: 'Desktop'"
#     product_name = gets.chomp
#     product_exists?(product_name)
# when 7
#     puts "Chao pescao"
# else
#     puts "Opción no válida"
# end
# end



