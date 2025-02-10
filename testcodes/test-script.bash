#!/bin/bash

output_file="bucket_lifecycles.txt"

# Clear the output file if it exists
> "$output_file"

buckets=($(gsutil ls))

for bucket in "${buckets[@]}"; do
    echo "Getting lifecycle configuration for bucket: $bucket" >> "$output_file"
    gsutil lifecycle get "$bucket" >> "$output_file"
    echo "----------------------------------------" >> "$output_file"
done

echo "Lifecycle configurations have been saved to $output_file"