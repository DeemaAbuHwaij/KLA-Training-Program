# Software Requirements Document (SRD) – SmartBooks: Personalized Reading Tracker

## 1. Introduction
- **Purpose**: Define requirements for a system that allows users to track their reading, review books, and receive personalized recommendations.
- **Audience**: Developers, Testers, Product Manager.
- **Scope**: Track books, manage reading status, write reviews, analytics, and smart suggestions.

## 2. Overall Description
### 2.1 Product Perspective
Standalone web-based system that can be extended as a mobile app.

### 2.2 Product Functions
- Add books to personal library  
- Update reading status: *To Read*, *Reading*, *Finished*  
- Write reviews and rate books  
- View reading statistics  
- Get book recommendations

### 2.3 User Classes and Characteristics
- **Reader**: Can track reading, write reviews, and get suggestions  
- **Admin**: Manages book data and reviews

## 3. Specific Requirements
### 3.1 Functional Requirements
- [FR1] Add/update book entries  
- [FR2] Track reading status  
- [FR3] Submit ratings and reviews  
- [FR4] View reading statistics  
- [FR5] Get recommendations

### 3.2 Non-Functional Requirements
- [NFR1] System should respond within 1 second  
- [NFR2] Should support at least 5000 users  
- [NFR3] Mobile responsive UI

## 4. System Boundaries
- **Inside scope**: Book tracking, review, analytics, and suggestions  
- **Outside scope**: Book purchases, e-book reader integration

## 5. Assumptions and Constraints
- Data stored in cloud database  
- Recommendations are rule-based (not AI-driven at this stage)