echo "Enter three numbers:"
read a
read b
read c

# Define a function to perform the computations and store the results in a dictionary
perform_computations() {
  # Create an empty dictionary to store the results
  declare -A results

  # Perform computation 1 and store the result in the dictionary
  results["a+b*c"]=$((a + b * c))

  # Perform computation 2 and store the result in the dictionary
  results["a*b+c"]=$((a * b + c))

  # Perform computation 3 and store the result in the dictionary
  results["c+a/b"]=$(echo "scale=2; $c + $a / $b" | bc)

  # Perform computation 4 and store the result in the dictionary
  results["a%b+c"]=$((a % b + c))

  # Print the dictionary
  printf "Results:\n"
  printf '%s=%s\n' "${!results[@]}" "${results[@]}"

  # Read the values from the dictionary into an array
  values=("${results[@]}")

  # Sort the results to show the computation result in descending order
  printf "\nResults sorted by computation result (descending order):\n"
  for key in "${!results[@]}"; do
    printf '%s=%s\n' "$key" "${results[$key]}"
  done | sort -rn -k3

  # Sort the results to show the computation value in ascending order
  printf "\nResults sorted by computation value (ascending order):\n"
  for key in "${!results[@]}"; do
    printf '%s=%s\n' "$key" "${results[$key]}"
  done | sort -n -k2

  # Return the array of values
  return "${values[@]}"
}

# Call the function to perform the computations
perform_computations
