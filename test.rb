################################ METHODS #####################################

# Shows the init message
def init_text
  puts 'Iniciando programa'
  print '.'
  sleep(0.3)
  print '.'
  sleep(0.3)
  print '.'
  print "\n"
end

# Shows the close message
def close_text
  puts 'Cerrando programa'
  print '.'
  sleep(0.3)
  print '.'
  sleep(0.3)
  print '.'
  print "\n"
end

# Read the file and create an array of hashes.
def read_and_hash
  $students = []
  file = File.open('grades.csv', 'r')
  files = file.readlines
  files = files.map(&:chomp)
  files = files.map { |line| line.split(/\W+/) }
  file.close()
  files.each do |array|
    $students.push(name: array.shift, grades: array)
  end
end

# Gets the average grade from each student
def get_avggrades(hash)
  sumgrades = 0
  hash[:grades].each do |grade|
    if grade.to_s != 'A'
      sumgrades += grade.to_f
    else
      sumgrades +=1
    end
  end
  sumgrades / hash[:grades].length
end

# Count the unattendeces of each student, return the quantity
def get_unattendence(hash)
  noattendence = 0
  hash[:grades].each do |grade|
    if grade.to_s == 'A'
      noattendence += 1
    end
  end
  noattendence
end

# Compares the average grade with grade, prints if approved
def approved?(grade = 5)
  $students.each do |student|
    if get_avggrades(student) >= grade
      print "#{student[:name]} ha aprobado con un #{get_avggrades(student)}\n"
    end
  end
end

# Creates the file with the final grades.
def create_finals_file
  file = File.open('final.csv', 'w')
  $students.each do |student|
    name = student[:name]
    avg = get_avggrades(student)
    file.puts "#{name} #{avg}"
  end
  file.close
end

####################### PROGRAM ###############################

read_and_hash
init_text

menu = 0
while menu != 4

  puts "\n____________________________\n"
  puts '|*****|MENÚ PRINCIPAL|*****|'
  puts 'Elige tu opción:'
  puts '1. Generar archivo de notas'
  puts '2. Inasistencias totales'
  puts '3. Alumnos aprobados'
  puts '4. Salir'
  puts '|__________________________|'
  menu = gets.chomp.to_i
  puts "\n"
  sleep(0.5)

  if menu == 1
    create_finals_file
    print "\nSe ha creado el archivo final.csv que contiene los promedios de cada alumno.\n"
    sleep 2
  end

  if menu == 2
    noattendence = 0
    $students.each do |student|
      noattendence += get_unattendence(student)
    end
    print "\nHay un total de #{noattendence} inasistencias.\n"
    sleep 2
  end

  if menu == 3

    puts 'Ingrese la nota con la que se aprobará el curso.'
    puts 'Debe ser un número entre 1 y 10.'
    mingrade = gets.chomp.to_i
    sleep 1
    if mingrade > 0 && mingrade <= 10
      approved?(mingrade)
    else
      puts 'La nota ingresada es inválida.'
      puts "Se usará la nota de aprobación por defecto (5).\n\n"
      sleep 1
      approved?
    end
    sleep 2
  end

  if menu < 1 || menu > 4
    puts "\nOpción inválida. Elige una opción nuevamente.\n"
    sleep 2
  end

  close_text if menu == 4

end
