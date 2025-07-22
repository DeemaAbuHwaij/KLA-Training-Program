# Software Requirements Document (SRD)

## 1. Introduction
**Product Name**: Book Management System  
**Purpose**: Manage books, authors, and user interactions such as borrowing, returning, and searching.

## 2. Functional Requirements
- Add, edit, delete books
- Search books by title, author, or category
- Register and log in users
- Borrow and return books
- Admin panel to manage inventory

## 3. Non-Functional Requirements
- Responsive UI (mobile and desktop)
- System uptime 99.9%
- Data backed up daily

## 4. System Description
**Actors**: 
- Admin
- Registered User
- Guest

**Components**:
- Frontend (React/HTML)
- Backend (Python/Node.js)
- Database (PostgreSQL/MySQL)

## 5. System Boundaries
- No payment integration
- Only internal users (no public catalog)
- User cannot borrow more than 5 books at a time

## 6. Assumptions
- All users have internet access
- Admin has basic technical knowledge

## 7. Constraints
- Must run on Linux server
- Must comply with GDPR
