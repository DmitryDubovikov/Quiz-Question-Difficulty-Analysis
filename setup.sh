#!/bin/bash

# Configuration
VENV=".venv"
KERNEL_DIR=".ipynb_kernels"
KERNEL_NAME=".venv"

# Function to create environment
create() {
    echo "Creating virtual environment..."
    python3 -m venv "$VENV"

    echo "Upgrading pip..."
    "$VENV/bin/pip" install --upgrade pip

    echo "Installing dependencies from requirements.txt..."
    "$VENV/bin/pip" install -r requirements.txt

    echo "Installing Jupyter and IPykernel..."
    "$VENV/bin/pip" install jupyter ipykernel

    echo "Setting up Jupyter kernel..."
    "$VENV/bin/python" -m ipykernel install --prefix="$KERNEL_DIR" --name="$KERNEL_NAME" --display-name "Python ($KERNEL_NAME)"

    echo "Setup complete!"
}

# Function to start Jupyter
start() {
    echo "Starting Jupyter notebook..."
    JUPYTER_PATH="$KERNEL_DIR/share/jupyter" "$VENV/bin/jupyter" notebook
}

# Function to clean up
clean() {
    echo "Cleaning up virtual environment and kernel..."
    rm -rf "$VENV" "$KERNEL_DIR"
    echo "Cleanup complete!"
}

# Main script logic
case "$1" in
    create)
        create
        ;;
    start)
        start
        ;;
    clean)
        clean
        ;;
    *)
        echo "Usage: $0 {create|start|clean}"
        echo ""
        echo "Commands:"
        echo "  create  - Create virtual environment and install dependencies"
        echo "  start   - Start Jupyter notebook"
        echo "  clean   - Remove virtual environment and kernel"
        exit 1
        ;;
esac
