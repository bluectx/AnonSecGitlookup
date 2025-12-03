#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Checking system dependencies..."

if ! command -v python3 &> /dev/null; then
    echo "Error: python3 is not installed"
    exit 1
fi

if ! command -v pip3 &> /dev/null; then
    echo "Error: pip3 is not installed"
    exit 1
fi

if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

echo "Activating virtual environment..."
source venv/bin/activate

if [ -z "$VIRTUAL_ENV" ]; then
    echo "Error: Failed to activate virtual environment"
    exit 1
fi

echo "Installing dependencies..."
"$VIRTUAL_ENV/bin/pip" install -q --upgrade pip
"$VIRTUAL_ENV/bin/pip" install -q -r requirements.txt

echo "Launching ASLGIT..."
"$VIRTUAL_ENV/bin/python" aslgit.py "$@"

echo "Opening https://anonseclab.org..."
xdg-open "https://anonseclab.org" 2>/dev/null &
