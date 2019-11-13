# Triangular Storage
This project provides a function `answer/2` that returns the id of an item in a triangular storage
structure (example shown below) at column x and row y. Columns start at the left and rows start at the bottom.

The `TriangularStorage.CLI` module exposes `answer/2` through a CLI that reads pairs of numbers 
from STDIN terminating on `0` and printing the resulting id for each pair of numbers.

###### Triangular storage example
```
|16
|11 17
|7  12  18
|4  8   13  19
|2  5   9   14  20
|1  3   6   10  15  21
```

## Getting Started

##### Requirements
- Project requires Elixir. For installation see [the docs](https://elixir-lang.org/install.html).

#### Running the CLI
Clone the project then run the following commands in the root directory.

1. Get project dependencies 
`$ mix deps.get`

2. Build escript for project 
`$ mix escript.build`

3. Run escript for CLI
`$ ./triangular_storage_exercise`

## Testing
#### Unit testing
Unit tests for the `answer/2` function and the underlying recursive `get_nth_triangular/3` functions
are found in the `TriangularStorageTest` module and uses the ExTest framework. 

To run the unit and doc tests run `$ mix test` in the project root directory.

#### End to end testing
End to end testing is done with a shell script test driver. The script automatically builds the escript for
the project and simulates STDIN.

To run the test driver run `$ ./test/test_driver.sh` in the project root directory.

## Documentation
Documentation is generated through ExDoc by running `$ mix docs` in the project root directory.

The html files generated by the above command are found in the `/doc` directory. To view the 
docs open `/doc/index.html` in a web browser.
