#!bin/bash
echo "====This is a sample test to create a bucket===="
sleep 0.5
echo "===Enter your first name==="
read first_name
sleep 0.5
echo "====Enter your last===="
read last_name
sleep 0.5
echo "====Enter your year of birth===="
read yyyy
sleep 0.5
echo "====Enter your region===="
read region
sleep 0.5
check_bucket=$(aws s3api head-bucket --bucket "${first_name-$last_name-$yyyy}" 2>&1 || true)
if [[ -z $check_bucket ]]; then
    echo "The bucket exists"
else
    echo "Your bucket will be created with the name of $first_name-$last_name-$yyyy"
    echo "processing......"
    sleep 5
    aws s3api create-bucket --bucket $first_name-$last_name-$yyyy --create-bucket-configuration LocationConstraint=$region
    aws s3 ls 
fi
