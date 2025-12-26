#!/bin/bash

# Script to comment out specific lines in the files

echo "Commenting line 164 in app/server/server.py..."
sed -i '164s/^/#/' /home/inspiredoff/application/tetrika/app/server/server.py

echo "Commenting lines 142-145 in tests/conftest.py..."
sed -i '142s/^/#/' /home/inspiredoff/application/tetrika/tests/conftest.py
sed -i '143s/^/#/' /home/inspiredoff/application/tetrika/tests/conftest.py
sed -i '144s/^/#/' /home/inspiredoff/application/tetrika/tests/conftest.py
sed -i '145s/^/#/' /home/inspiredoff/application/tetrika/tests/conftest.py

echo "Lines commented successfully!"

