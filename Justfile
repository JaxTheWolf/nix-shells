update:
    #!/usr/bin/env bash
    echo "Starting update scan..."
    for dir in */; do
        dirname=${dir%/}
        if [ -f "$dir/flake.nix" ]; then
            echo "-------------------------------------------"
            echo "Updating flake in: $dirname"
            (cd "$dir" && nix flake update)
        else
            echo "Skipping $dirname (no flake.nix found)"
        fi
    done
    echo "-------------------------------------------"
    echo "Update complete."

update-lang lang:
    cd {{lang}} && nix flake update

format:
    treefmt .