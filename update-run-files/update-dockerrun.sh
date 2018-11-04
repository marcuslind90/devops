cat "Dockerrun.aws.json" \
    | sed -E '6s/(.*\"image\": ).*/\1\"new_image:new_tag\",/g' \
    > "outputs/Dockerrun.aws.json"