end=$((SECONDS+2880))

while [ $SECONDS -lt $end ]
do
    echo "Time Now: `date +%H:%M:%S`"
    
    
    
    
        rm -rf $HOME/.config/rclone
        rm -rf ~/"$folder"
        rm -rf $HOME/oof
        rm -f  ~/.git-credentials
        rm -f "$config"
        sudo apt update -y
        sudo apt install git python3-pip wget curl unzip -y 
        mkdir -p $HOME/.config/rclone
        git config --global user.email ${ghmail}
        git config --global user.name ${user}
         git config --global credential.helper store
         echo "https://"$user":"$token"@github.com" > ~/.git-credentials
         curl https://rclone.org/install.sh | sudo bash
         mkdir -p ~/"$folder"/"$sub1"
         mkdir -p ~/"$folder"/"$sub2"
          wget "$url"
          mv rclone.conf $HOME/.config/rclone/rclone.conf
          rclone listremotes
          rclone mount --daemon "tv:" ~/"$folder"/"$sub1" &
          sleep 80
          rclone mount --daemon "movie:" ~/"$folder"/"$sub2" &
          sleep 80
 
           python3 -m pip install linuxdir2html
           linuxdir2html ~/"$folder" index
           git clone https://"$user":"$token"@github.com/"$user"/"repo".git $HOME/oof
           rm -f $HOME/oof/index.html
           mv index.html $HOME/oof
           cd $HOME/oof
           git add .
           git commit -m "Index Update at $(date "+%H:%M:%S   %d/%m/%y")"
           git push origin main
           fusermount -uz ~/"$folder"/"$sub1"
           fusermount -uz ~/"$folder"/"$sub2"

done

cd
git clone "$gurl" gurl
cd gurl
rm -f run.txt
echo $(( RANDOM - ( RANDOM % RANDOM ) )) > run.txt
git add run.txt
git commit -m "Start ci : Run at $(date -u +%D-%T%P)"
git push -q https://"$token"@github.com/"$crepo" HEAD:main
