#!/bin/bash

# 1. Install screen
echo "Installing screen..."
sudo apt update && sudo apt install -y screen

# Create a new screen session
echo "Creating new screen session named 'teneo'..."
screen -S teneo -d -m

# 2. Clone the TENEO_CLI repository
echo "Cloning TENEO_CLI repository..."
git clone https://github.com/winsnip/TENEO_CLI.git

# 3. Navigate to the TENEO_CLI folder
cd TENEO_CLI || exit

# 4. Update and install Node.js
echo "Updating system and installing Node.js..."
sudo apt update && sudo apt upgrade -y
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Confirm Node.js installation
echo "Node.js version installed:"
node -v

# Create the .env file
echo "Creating .env file..."
cat <<EOF > .env
SUPABASE_URL=https://ikknngrgxuxgjhplbpey.supabase.co
SUPABASE_KEY=
SUPABASE_USER_EMAIL=
SUPABASE_USER_PASSWORD=
EOF

echo "Please fill in the SUPABASE_KEY, SUPABASE_USER_EMAIL, and SUPABASE_USER_PASSWORD in the .env file."
nano .env

# 5. Run the application
echo "Running teneo.js..."
screen -S teneo -X stuff 'node teneo.js\n'

# Screen instructions
echo "Use CTRL+A+D to detach the screen."
echo "To reattach, use: screen -r teneo"
