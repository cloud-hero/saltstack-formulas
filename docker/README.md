# docker cluster deployment

This formula will install docker-engine, consul and swarm in order to create a docker cluster
Since the creation of a cluster greatly depends on service descovery it is most important to setup consul properly.
After consul works fine swarm would work out of the box with the consul pillar data.
