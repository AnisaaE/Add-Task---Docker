# Linux Network Management with Docker

This project demonstrates how to set up and manage a Linux network environment using Docker Compose. It includes a Node.js backend connected to MongoDB, a React frontend, and utilizes `iptables` for network access control and user role management.

## Features

- **Frontend**: A React application serving as the user interface for task management.
- **Backend**: A Node.js server that manages tasks and connects to MongoDB for data storage.
- **User Roles**: Three user roles with distinct permissions:
  - **Super Admin**: Full control over the network, including starting/stopping containers.
  - **Admin**: Can add tasks and manage groups.
  - **User**: Read-only access to view tasks and interact with assigned items.
- **Access Control**: Network communication is restricted by `iptables` rules, allowing only specific IP addresses or containers to make requests to the backend.

## Technologies

- **Docker & Docker Compose**: To create isolated container environments for frontend, backend, and database.
- **Node.js, Express**: For the backend API and task management.
- **React**: For building the user-friendly frontend interface.
- **MongoDB**: For data storage.
- **`iptables`**: For network and access control based on IP addresses.

## Installation

To set up and run this project locally, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/AnisaaE/Add-Task---Docker.git
   cd Add-Task---Docker
   **docker-compose up --build**

