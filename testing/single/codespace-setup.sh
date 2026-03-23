#!/bin/bash
# =============================================================================
# Pylance Test Plan - Codespace Setup Script
# =============================================================================
# Run this script inside the Codespace terminal after:
#   1. Creating a codespace on your fork (Devdiv-VR/pylance-release)
#   2. Opening folder: /workspaces/pylance-release/testing/single
# =============================================================================

set -e

echo "=========================================="
echo " Pylance Test Plan - Environment Setup"
echo "=========================================="

# Step 1: Create virtual environment
echo ""
echo "[1/5] Creating virtual environment..."
python3 -m venv /workspaces/pylance-release/testing/single/.venv
source /workspaces/pylance-release/testing/single/.venv/bin/activate

# Step 2: Install requirements for testing/single
echo ""
echo "[2/5] Installing single-folder test requirements..."
pip install -r /workspaces/pylance-release/testing/single/requirements.txt

# Step 3: Install additional packages referenced by test files
echo ""
echo "[3/5] Installing additional packages used by test files..."
pip install requests

# Step 4: Install scikit-learn test requirements (for P2 tests)
echo ""
echo "[4/5] Installing scikit-learn test requirements (P2)..."
pip install -r /workspaces/pylance-release/testing/scikitlearn/requirements.txt

# Step 5: Verify installation
echo ""
echo "[5/5] Verifying installation..."
python3 -c "
import pytest; print(f'  pytest {pytest.__version__}')
import numpy; print(f'  numpy {numpy.__version__}')
import zope.event; print(f'  zope.event OK')
import sklearn; print(f'  scikit-learn {sklearn.__version__}')
import requests; print(f'  requests {requests.__version__}')
"

echo ""
echo "=========================================="
echo " Setup complete!"
echo "=========================================="
echo ""
echo "NEXT STEPS (manual in VS Code):"
echo "  1. Install pre-release Python extension (ms-python.python)"
echo "  2. Install pre-release Pylance extension (ms-python.vscode-pylance)"
echo "  3. Install Jupyter extension (ms-toolsai.jupyter)"
echo "  4. Cmd+Shift+P -> 'Python: Select Interpreter' -> pick .venv"
echo "  5. Open test files in src/ and follow inline instructions"
echo ""
