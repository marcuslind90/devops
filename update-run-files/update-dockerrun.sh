cat "Dockerrun.aws.json" \
    | sed -E 's/(.*\"image\": \"my.repo.com\/my_image:).*/\1my_commit\",/' \
    > "outputs/Dockerrun.aws.json"