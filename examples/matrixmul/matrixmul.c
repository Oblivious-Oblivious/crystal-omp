void multiply_matrices(int **a, int **b, int **result, int size) {
  int i, j, k, sum;

#pragma omp parallel for collapse(2) private(j, k, sum)
  for (i = 0; i < size; i++) {
    for (j = 0; j < size; j++) {
      for (k = sum = 0; k < size; k++) {
        sum += a[i][k] * b[k][j];
      }
      result[i][j] = sum;
    }
  }
}
