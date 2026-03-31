# Dyslexia-Aid – AI Learning Assistant for Neurodiverse Children

A full-stack production-ready web application helping children with dyslexia improve reading, writing, and comprehension using adaptive AI, speech technologies, and gaze-based confusion detection.

## Tech Stack

### Frontend
- React.js (Vite)
- TailwindCSS
- Axios
- Web Speech API (Text-to-Speech)
- WebGazer.js (Eye Tracking)
- Framer Motion

### Backend
- Java 17
- Spring Boot
- Spring Security with JWT Authentication
- REST APIs
- JPA / Hibernate
- OpenAI API (Text Simplification)
- Google Speech-to-Text API

### Database
- MariaDB
- Managed using HeidiSQL

### Deployment
- Docker + Docker Compose
- Nginx reverse proxy

## Prerequisites

- Docker & Docker Compose
- Node.js 18+ (for local frontend development)
- Java 17+ (for local backend development)
- HeidiSQL (for database management)
- OpenAI API Key
- Google Cloud Speech-to-Text API credentials

## Quick Start

1. Clone the repository
2. Copy environment files:
```bash
cp .env.example .env
```

3. Update `.env` with your API keys:
   - `OPENAI_API_KEY`
   - `GOOGLE_APPLICATION_CREDENTIALS_JSON`

4. Start all services:
```bash
docker-compose up -d
```

5. Access the application:
   - Frontend (via Nginx): http://localhost
   - Frontend (direct): http://localhost:5174
   - Backend API (via Nginx): http://localhost/api
   - Backend API (direct): http://localhost:8080/api
   - MariaDB: localhost:3307

## Database Setup

1. Open HeidiSQL
2. Connect to MariaDB:
   - Host: localhost
   - Port: 3306
   - User: dyslexia_user
   - Password: dyslexia_pass
   - Database: dyslexia_aid

3. The schema will be auto-created by Hibernate on first run
4. Seed data is automatically loaded

## Development

### Backend Development
```bash
cd backend
./mvnw spring-boot:run
```

### Frontend Development
```bash
cd frontend
npm install
npm run dev
```

## Features

- JWT-based authentication with role-based access (ADMIN, STUDENT)
- Personalized reading dashboard
- AI text simplification using OpenAI API
- Smart gaze tracking using WebGazer.js
- Automatic font zoom and highlight on gaze fixation
- Speech-to-Text writing assistant
- Text-to-Speech reader with word highlighting
- Progress tracking analytics
- Gamification (stars, badges, streaks)
- Admin dashboard for monitoring student progress

## API Documentation

### Authentication
- POST `/api/auth/register` - Register new user
- POST `/api/auth/login` - Login and get JWT token

### Lessons
- GET `/api/lessons` - Get all lessons
- GET `/api/lessons/{id}` - Get lesson by ID
- POST `/api/lessons` - Create lesson (ADMIN only)

### AI Services
- POST `/api/ai/simplify` - Simplify text for dyslexic learners
- POST `/api/speech/transcribe` - Convert speech to text

### Progress
- GET `/api/progress/user/{userId}` - Get user progress
- POST `/api/progress` - Save progress data

### Badges
- GET `/api/badges/user/{userId}` - Get user badges
- GET `/api/badges` - Get all available badges

## Default Users

### Admin
- Email: admin@dyslexia-aid.com
- Password: Admin123!

### Student
- Email: student@dyslexia-aid.com
- Password: Student123!

## License

MIT License
