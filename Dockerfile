FROM fedora:latest
RUN yum install -y rclone mariadb postgresql screen htop screen tree nano && yum clean all