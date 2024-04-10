# crystal-omp

OpenMP integration for Crystal.  Supported up to latest version.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     crystal-omp:
       github: Oblivious-Oblivious/crystal-omp
   ```

2. Run `shards install`

## Usage

```crystal
require "crystal-omp"
```

Try [examples](https://github.com/Oblivious-Oblivious/crystal-omp/tree/master/examples) for more.

*`cat function.c`*
```c
int run_in_c(char *value) {
  #pragma omp parallel
  for(;;);
  printf("%s\n", value);
  return 42;
}
```

*`cat test.cr`*
```cr
@[Link(ldflags: "#{__DIR__}/function.o")]
lib LibTest
  fun run_in_c(LibC::Char*) : LibC::Int;
end

res = LibTest.run_in_c "somestring";
pp res;
```

```bash
clang -fopenmp -o function.o function.c
crystal test.cr
```

## Development

1. Tests for binded functionality
2. Wrapper objects for converting safe values to unsafe ones

## Contributing

1. Fork it (<https://github.com/Oblivious-Oblivious/crystal-omp/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Oblivious](https://github.com/Oblivious-Oblivious) - creator and maintainer
