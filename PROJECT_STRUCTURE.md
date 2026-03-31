# Dyslexia-Aid Project Structure

## Overview
Full-stack production-ready web application for helping children with dyslexia improve reading, writing, and comprehension.

## Directory Structure

```
dyslexia-aid/
├── backend/                          # Java Spring Boot Backend
│   ├── src/main/java/com/dyslexiaaid/
│   │   ├── config/                   # Configuration classes
│   │   │   ├── SecurityConfig.java   # Spring Security + CORS
│   │   │   └── DataInitializer.java  # Seed data
│   │   ├── controller/               # REST Controllers
│   │   │   ├── AuthController.java
│   │   │   ├── AIController.java
│   │   │   ├── SpeechController.java
│   │   │   ├── LessonController.java
│   │   │   ├── ProgressController.java
│   │   │   └── BadgeController.java
│   │   ├── dto/                      # Data Transfer Objects
│   │   │   ├── AuthRequest.java
│   │   │   ├── RegisterRequest.java
│   │   │   ├── AuthResponse.java
│   │   │   ├── SimplifyRequest.java
│   │   │   └── SimplifyResponse.java
│   │   ├── model/                    # JPA Entities
│   │   │   ├── User.java
│   │   │   ├── Profile.java
│   │   │   ├── Lesson.java
│   │   │   ├── Progress.java
│   │   │   ├── Badge.java
│   │   │   └── UserBadge.java
│   │   ├── repository/               # JPA Repositories
│   │   │   ├── UserRepository.java
│   │   │   ├── ProfileRepository.java
│   │   │   ├── LessonRepository.java
│   │   │   ├── ProgressRepository.java
│   │   │   ├── BadgeRepository.java
│   │   │   └── UserBadgeRepository.java
│   │   ├── security/                 # JWT Security
│   │   │   ├── JwtUtil.java
│   │   │   └── JwtAuthenticationFilter.java
│   │   ├── service/                  # Business Logic
│   │   │   ├── AuthService.java
│   │   │   ├── AIService.java
│   │   │   ├── SpeechService.java
│   │   │   ├── LessonService.java
│   │   │   ├── ProgressService.java
│   │   │   └── BadgeService.java
│   │   └── DyslexiaAidApplication.java
│   ├── src/main/resources/
│   │   └── application.yml           # Application configuration
│   ├── Dockerfile                    # Backend Docker image
│   └── pom.xml                       # Maven dependencies
│
├── frontend/                         # React Frontend
│   ├── src/
│   │   ├── components/               # Reusable Components
│   │   │   ├── PrivateRoute.jsx
│   │   │   ├── Navbar.jsx
│   │   │   ├── TextReader.jsx        # Text-to-Speech with highlighting
│   │   │   ├── GazeTracker.jsx       # WebGazer.js integration
│   │   │   └── BadgeDisplay.jsx
│   │   ├── context/                  # React Context
│   │   │   └── AuthContext.jsx       # Authentication state
│   │   ├── pages/                    # Page Components
│   │   │   ├── Login.jsx
│   │   │   ├── Register.jsx
│   │   │   ├── Dashboard.jsx
│   │   │   ├── ReadingPage.jsx       # Main reading interface
│   │   │   ├── WritingPage.jsx       # Speech-to-text writing
│   │   │   ├── ProgressPage.jsx      # Analytics & badges
│   │   │   └── AdminDashboard.jsx
│   │   ├── services/                 # API Services
│   │   │   ├── api.js                # Axios instance
│   │   │   ├── lessonService.js
│   │   │   ├── aiService.js
│   │   │   ├── progressService.js
│   │   │   └── badgeService.js
│   │   ├── App.jsx                   # Main app component
│   │   ├── main.jsx                  # Entry point
│   │   └── index.css                 # Global styles
│   ├── Dockerfile                    # Frontend Docker image
│   ├── nginx.conf                    # Nginx configuration
│   ├── package.json                  # NPM dependencies
│   ├── vite.config.js                # Vite configuration
│   ├── tailwind.config.js            # TailwindCSS config
│   └── postcss.config.js
│
├── database/
│   └── init.sql                      # Database initialization
│
├── nginx/
│   └── nginx.conf                    # Reverse proxy configuration
│
├── docker-compose.yml                # Docker orchestration
├── .env.example                      # Environment variables template
├── .gitignore
├── setup.sh                          # Linux/Mac setup script
├── setup.bat                         # Windows setup script
├── README.md                         # Main documentation
└── PROJECT_STRUCTURE.md              # This file

```

## Technology Stack

### Backend
- **Java 17** - Programming language
- **Spring Boot 3.2.0** - Application framework
- **Spring Security** - Authentication & authorization
- **JWT (jjwt 0.12.3)** - Token-based authentication
- **JPA/Hibernate** - ORM
- **MariaDB** - Database
- **OpenAI API** - Text simplification
- **Google Speech-to-Text** - Audio transcription
- **BCrypt** - Password hashing

### Frontend
- **React 18** - UI framework
- **Vite** - Build tool
- **TailwindCSS** - Styling
- **Axios** - HTTP client
- **React Router** - Navigation
- **Framer Motion** - Animations
- **WebGazer.js** - Eye tracking
- **Web Speech API** - Text-to-speech & speech-to-text
- **Recharts** - Data visualization

### Infrastructure
- **Docker & Docker Compose** - Containerization
- **Nginx** - Reverse proxy & static file serving
- **MariaDB 11.2** - Database server

## Database Schema

### Tables
1. **users** - User accounts (id, name, email, password, role, created_at)
2. **profiles** - User preferences (id, user_id, reading_level, preferred_font_size, preferred_speed, theme)
3. **lessons** - Learning content (id, title, original_text, simplified_text, difficulty_level)
4. **progress** - Learning analytics (id, user_id, lesson_id, reading_speed, accuracy_score, completed, completed_at)
5. **badges** - Achievement definitions (id, badge_name, description, icon)
6. **user_badges** - Earned achievements (id, user_id, badge_id, earned_at)

## Key Features

### Authentication & Authorization
- JWT-based authentication
- Role-based access control (ADMIN, STUDENT)
- BCrypt password hashing
- Secure token validation

### Reading Features
- AI text simplification (OpenAI)
- Text-to-speech with word highlighting
- Adjustable font size (14-32px)
- Adjustable reading speed (0.5x-2x)
- Gaze tracking with WebGazer.js
- Automatic font zoom on fixation
- Toggle between original and simplified text

### Writing Features
- Speech-to-text input
- Real-time transcription
- Word count tracking
- Large, dyslexia-friendly text area

### Progress Tracking
- Reading speed analytics
- Accuracy scoring
- Completion tracking
- Visual charts (Recharts)
- Badge system with animations

### Admin Features
- Create new lessons
- Auto-generate simplified text
- Manage content difficulty levels
- View all lessons

### Accessibility
- OpenDyslexic font
- High contrast colors
- Adjustable spacing
- Large, clear buttons
- Dyslexia-friendly UI design

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login and get JWT

### Lessons
- `GET /api/lessons` - Get all lessons
- `GET /api/lessons/{id}` - Get lesson by ID
- `POST /api/lessons` - Create lesson (ADMIN)
- `GET /api/lessons/difficulty/{level}` - Get lessons by difficulty

### AI Services
- `POST /api/ai/simplify` - Simplify text
- `POST /api/speech/transcribe` - Transcribe audio

### Progress
- `GET /api/progress/user/{userId}` - Get user progress
- `POST /api/progress` - Save progress
- `GET /api/progress/user/{userId}/completed` - Get completed lessons

### Badges
- `GET /api/badges` - Get all badges
- `GET /api/badges/user/{userId}` - Get user badges
- `POST /api/badges/award` - Award badge

## Environment Variables

Required in `.env` file:
- `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`
- `JWT_SECRET`, `JWT_EXPIRATION`
- `OPENAI_API_KEY`
- `GOOGLE_APPLICATION_CREDENTIALS_JSON`
- `VITE_API_URL`

## Deployment

### Docker Compose Services
1. **mariadb** - Database (port 3306)
2. **backend** - Spring Boot API (port 8080)
3. **frontend** - React app (served by Nginx)
4. **nginx** - Reverse proxy (port 80)

### Health Checks
- MariaDB: Connection check
- Backend: `/actuator/health`
- Nginx: `/health`

## Development Workflow

1. Clone repository
2. Copy `.env.example` to `.env`
3. Update API keys in `.env`
4. Run `setup.bat` (Windows) or `setup.sh` (Linux/Mac)
5. Access at http://localhost

## Default Users

- **Admin**: admin@dyslexia-aid.com / Admin123!
- **Student**: student@dyslexia-aid.com / Student123!

## Production Considerations

- Change JWT secret in production
- Use strong database passwords
- Enable HTTPS with SSL certificates
- Configure proper CORS origins
- Set up database backups
- Monitor application logs
- Scale services as needed
- Implement rate limiting
- Add comprehensive error handling
- Set up monitoring and alerting
