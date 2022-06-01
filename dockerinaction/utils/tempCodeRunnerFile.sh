if [ -n "$list" ]; then
    docker rm -vf $list &>> containerCleaner_log_file.txt
fi