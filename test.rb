puts "Iniciando programa"
print '.'
sleep(0.3)
print '.'
sleep(0.3)
print '.'
print "\n"

file = File.open('grades.csv','r')
files = file.readlines
files = files.map(&:chomp)
files = files.map { |line| line.split(/\W+/) }
file.close()
$students = []
files.each do |array|
  $students.push(name: array[0].to_s, grade_1: array[1], grade_2: array[2], grade_3: array[3], grade_4: array[4], grade_5: array[5])
end

menu = 0

while menu != 4

  print "\n____________________________\n|*****|MENÚ PRINCIPAL|*****|\n\nElige tu opción:\n1. Generar archivo de notas\n2. Inasistencias totales\n3. Alumnos aprobados\n4. Salir\n|__________________________|\n"
  menu = gets.chomp.to_i
  puts "\n"
  sleep(0.5)

  if menu == 1
    file = File.open("final.csv",'w')
    $students.each do |student|
      name = student[:name]
      sumgrades = 0
      countgrades = 0
      if student[:grade_1].to_s != "A"
       sumgrades += student[:grade_1].to_i
       countgrades += 1
      end

      if student[:grade_2].to_s != "A"
        sumgrades += student[:grade_2].to_i
        countgrades += 1
      end

      if student[:grade_3].to_s != "A"
        sumgrades += student[:grade_3].to_i
        countgrades += 1
      end

      if student[:grade_4].to_s != "A"
        sumgrades += student[:grade_4].to_i
        countgrades += 1
      end

      if student[:grade_5].to_s != "A"
        sumgrades += student[:grade_5].to_i
        countgrades += 1
      end
      avg =sumgrades/countgrades
      file.puts "#{name} #{avg}"
      end
    file.close
    print "\nSe ha creado el archivo final.csv que contiene los promedios de cada alumno.\n"
    sleep 2
  end

  if menu == 2
    noattendence = 0
    $students.each do |student|
      noattendence += 1 if student[:grade_1].to_s == 'A'
      noattendence += 1 if student[:grade_2].to_s == 'A'
      noattendence += 1 if student[:grade_3].to_s == 'A'
      noattendence += 1 if student[:grade_4].to_s == 'A'
      noattendence += 1 if student[:grade_5].to_s == 'A'
    end
    print "\nHay un total de #{noattendence} inasistencias.\n"
    sleep 2
  end

  if menu == 3

    puts "Ingrese la nota con la que se aprobará el curso.\nDebe ser un número entre 1 y 10.\n"
    mingrade = gets.chomp.to_i
    sleep 1
    def approved?(grade=5)
      $students.each do |student|

        countgrades = 0
        sumgrades = 0

        if student[:grade_1].to_s != "A"
         sumgrades += student[:grade_1].to_i
         countgrades += 1
        end

        if student[:grade_2].to_s != "A"
          sumgrades += student[:grade_2].to_i
          countgrades += 1
        end

        if student[:grade_3].to_s != "A"
          sumgrades += student[:grade_3].to_i
          countgrades += 1
        end

        if student[:grade_4].to_s != "A"
          sumgrades += student[:grade_4].to_i
          countgrades += 1
        end

        if student[:grade_5].to_s != "A"
          sumgrades += student[:grade_5].to_i
          countgrades += 1
        end

        if sumgrades/countgrades >= grade
          print "#{student[:name]} ha aprobado.\n"
        end
      end
    end

    if mingrade>0 && mingrade<=10
      approved?(mingrade)
      sleep 2
    else
      puts "\nLa nota ingresada es inválida.\nSe usará la nota de aprobación por defecto (5).\n\n"
      sleep 1
      approved?
      sleep 2
    end

  end

  if menu<1 || menu>4
    puts "\nOpción inválida. Elige una opción nuevamente.\n"
    sleep 2
  end

  if menu == 4
    puts "Cerrando programa"
    print '.'
    sleep(0.3)
    print '.'
    sleep(0.3)
    print '.'
    print "\n"
  end

end
