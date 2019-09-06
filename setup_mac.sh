# Install Homebrew
echo | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Create symbolic links
bash bin/ln.sh

# Install softwares with Homebrew
# TODO: Check homebrew before run
bash brew.sh

# Install gcloud SDK
# TODO: Automate keyboard inputs
curl https://sdk.cloud.google.com | bash
