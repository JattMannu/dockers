export region=ap-southeast-1
export instanceType=t2.micro

docker-machine create --driver amazonec2 \
                        --amazonec2-region $region \
                        --amazonec2-instance-type $instanceType\
                        m1
docker-machine create --driver amazonec2 \
                        --amazonec2-region $region\
                        --amazonec2-instance-type $instanceType\
                        w1
docker-machine create --driver amazonec2 \
                        --amazonec2-region $region \
                        --amazonec2-instance-type $instanceType\
                        w2