#!/bin/bash

echo "🚀 Dyslexia-Aid Setup Script"
echo "=============================="
echo ""

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "📝 Creating .env file from .env.example..."
    cp .env.example .env
    echo "⚠️  Please update .env file with your API keys before continuing!"
    echo ""
    read -p "Press Enter after updating .env file..."
fi

# Build and start services
echo "🏗️  Building Docker images..."
docker-compose build

echo "🚀 Starting services..."
docker-compose up -d

echo "✅ Setup complete!"
echo ""
echo "📍 Access the application:"
echo "   Frontend (via Nginx): http://localhost"
echo "   Frontend (direct): http://localhost:5173"
echo "   Backend API (via Nginx): http://localhost/api"
echo "   Backend API (direct): http://localhost:8080/api"
echo "   MariaDB: localhost:3306"
echo ""
echo "👤 Default credentials:"
echo "   Admin: admin@dyslexia-aid.com / Admin123!"
echo "   Student: student@dyslexia-aid.com / Student123!"
echo ""
echo "📊 View logs: docker-compose logs -f"
echo "🛑 Stop services: docker-compose down"
echo ""
