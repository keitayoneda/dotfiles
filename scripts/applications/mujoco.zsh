#!/usr/bin/env zsh

# Get os & architecture info
os=$(uname)
binary_name=""
if [[ $os == "Darwin" ]]; then
    # macは一旦無視
    echo "this script is for linux. abort."
    exit 1
elif [[ $os == "Linux" ]]; then
    arch=$(uname -m)
    if [[ $arch == "x86_64" ]]; then
        binary_name+="linux-x86_64.tar.gz"
    elif [[ $arch == "aarch64" ]]; then
        binary_name+="linux-aarch64.tar.gz"
    else
        echo "Unsupported architecture: $arch"
        exit 1
    fi
else
    # 一応windowsにもmujocoは対応しているらしいが一旦無視
    echo "Unsupported OS: $os"
    exit 1
fi


# Download latest mujoco
latest_version=$(curl --head --silent https://github.com/google-deepmind/mujoco/releases/latest | grep location | sed -e "s/location: https:\/\/github.com\/google-deepmind\/mujoco\/releases\/tag\///" | sed -e "s/\r//") 
binary_name="mujoco-$latest_version-$binary_name"
download_url="https://github.com/google-deepmind/mujoco/releases/download/$latest_version/$binary_name"
echo "[OS] : $os"
echo "[ARCH] : $arch"
echo "[Download: $download_url"
wget $download_url

# Extract mujoco
tar -xzvf $binary_name

# Move mujoco to ~/.mujoco
mkdir -p ~/.mujoco
mv mujoco-$latest_version $HOME/.mujoco/$latest_version

# Create symbolic link
ln -sfn $HOME/.mujoco/$latest_version $HOME/.mujoco/latest

# Clean up
rm $binary_name

# check shell kind
shell_kind=""

if [[ "$SHELL" == *"zsh"* ]]; then
    shell_kind="zsh"
elif [[ "$SHELL" == *"bash"* ]]; then
    shell_kind="bash"
else
    echo "Unsupported shell"
    exit 1
fi

function add_environment_variable_if_not_exist() {
    local env_name=$1
    local env_value=$2
    local shell_kind=$3
    if [ $shell_kind = "zsh" ]; then
        local rc_file=$HOME/.zshrc
        # もし$env_nameの中に$env_valueが含まれていなかったら
        if ! grep -q "export $env_name=$env_value" $rc_file; then
            echo "export $env_name=$env_value" >> $rc_file
            echo "added $env_name to $rc_file"
        fi
    elif [ $shell_kind = "bash" ]; then
        local rc_file=$HOME/.bashrc
        if ! grep -q "export $env_name=$env_value" $rc_file; then
            echo "export $env_name=$env_value" >> $rc_file
            echo "added $env_name to $rc_file"
        fi
    else
        echo "Unsupported shell"
        exit 1
    fi
}


# export PATH, LD_LIBRARY_PATH
add_environment_variable_if_not_exist "PATH" '$PATH:$HOME/.mujoco/latest/bin' $shell_kind
add_environment_variable_if_not_exist "LD_LIBRARY_PATH" '$LD_LIBRARY_PATH:$HOME/.mujoco/latest/lib' $shell_kind

