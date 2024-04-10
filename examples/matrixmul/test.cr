require "time";
require "../../src/crystal-omp";

@[Link(ldflags: "#{__DIR__}/matrixmul.o")]
lib MatrixMulLib
  fun multiply_matrices(LibC::Int**, LibC::Int**, LibC::Int**, LibC::Int);
end

def read_matrix(filename, size)
  matrix = Array.new(size) { Array.new size, 0; };

  File.open filename do |file|
    size.times do |i|
      line = file.gets.not_nil!;
      row = line.split.map &.to_i;
      matrix[i] = row;
    end
  end

  matrix;
end

def write_matrix(filename, matrix)
  File.write filename, matrix.map { |item| item.join " " }.join "\n";
end

def multiply_and_write(a_file, b_file, c_file, size)
  a = read_matrix a_file, size;
  b = read_matrix b_file, size;
  c = Array.new(size) { Array.new size, 0; };

  # Convert 2D arrays to a format compatible with C bindings
  a_ptr = a.map { |row| row.to_unsafe; }.to_unsafe;
  b_ptr = b.map { |row| row.to_unsafe; }.to_unsafe;
  c_ptr = c.map { |row| row.to_unsafe; }.to_unsafe;

  t1 = LibOmp.omp_get_wtime();
  MatrixMulLib.multiply_matrices(a_ptr, b_ptr, c_ptr, size);
  t2 = LibOmp.omp_get_wtime();

  puts "Matrix multiplication took: #{t2 - t1} sec";

  # Convert C array back to Crystal 2D array
  c.size.times do |i|
    c.size.times do |j|
      c[i][j] = c_ptr[i][j];
    end
  end

  write_matrix c_file, c;
end

SIZE = 2048;
multiply_and_write "Amat#{SIZE}", "Bmat#{SIZE}", "Cmat#{SIZE}", SIZE;
