file = File.open('grades.csv','r')
grades = file.readlines
grades = grades.map(&:chomp)
grades = grades.map { |line| line.split(/\W+/) }
file.close()

menu = 0

while menu != 4

  print "\n__________________________\n*****|MENÚ PRINCIPAL|*****\n\nElige tu opción:\n1. Generar archivo de notas\n2. Inasistencias totales\n3. Alumnos aprobados\n4. Salir\n__________________________\n"
  menu = gets.chomp.to_i
  puts "\n"
  sleep(0.5)

  if menu == 1
  end

  if menu == 2
  end

  if menu == 3
  end
  
  if menu<1 || menu>4
    puts "\nOpción inválida. Elige una opción nuevamente.\n"
    sleep 1
  end

  if menu == 4
    puts "Cerrando programa"
    sleep(1)
  end

end
