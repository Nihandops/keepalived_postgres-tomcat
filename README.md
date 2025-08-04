High Availability with Keepalived, Tomcat, and PostgreSQL
This project demonstrates how to set up high availability for Tomcat and PostgreSQL services using Keepalived. We have configured Keepalived on two servers, where one server acts as the primary and the other as the secondary. Keepalived monitors the health of the services, and in case the primary server goes down, it promotes the secondary server to the primary, ensuring high availability.

Key Features:
Primary and Secondary Servers: The primary server runs the services, while the secondary server takes over if the primary fails.

Health Check: A custom Bash script is used to check the health of Tomcat and PostgreSQL. Keepalived uses this script to determine the status of the services.

Automatic Failover: When the primary server fails, the secondary server is automatically promoted to primary to maintain service availability.

Prerequisites
Two servers (Server 1 and Server 2)

Keepalived installed on both servers

Tomcat and PostgreSQL running on both servers

SSH access to both servers

Installation
Step 1: Install Keepalived
First, install Keepalived on both Server 1 and Server 2:
sudo apt update
sudo apt install keepalived

On Server 1 (Primary):
Create or modify the Keepalived configuration file /etc/keepalived/keepalived.conf 
On Server 2 (Secondary):
Create or modify the Keepalived configuration file /etc/keepalived/keepalived.conf

Step 3: Create the Health Check Script
Create a script that checks the health of the Tomcat and PostgreSQL services. This script will be used by Keepalived to determine the status of the services and decide whether to promote the secondary server.

Ensure the script is executable:
sudo chmod +x /etc/keepalived/health_check.sh

Step 4: Start Keepalived
Now that everything is set up, start Keepalived on both servers:
sudo systemctl start keepalived
sudo systemctl enable keepalived


Step 5: Verify the Configuration
To verify that Keepalived is working correctly, you can check the status of the Keepalived service on both servers:
sudo systemctl status keepalived

On Server 1 (Primary), it should show MASTER, and on Server 2 (Secondary), it should show BACKUP.

You can also verify the virtual IP address (VIP) by running:

ip addr show

The VIP (e.g., 192.168.*.8) should be assigned to the active server.

If the health check script detects that the service is down, Keepalived will automatically switch the primary role to Server 2, and the VIP will move to Server 2.

