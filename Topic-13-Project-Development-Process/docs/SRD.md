# Software Requirements Document (SRD) – Book Management System

## 1. Introduction
- **Purpose**: Define requirements for a system that manages a collection of books.
- **Audience**: Developers, Testers, Product Manager.
- **Scope**: CRUD operations for books + search functionality.

## 2. Overall Description
### 2.1 Product Perspective
- Standalone system or part of a larger library management system.

### 2.2 Product Functions
- Add a new book
- View all books
- Edit book details
- Delete a book
- Search by title/author/ISBN

### 2.3 User Classes and Characteristics
- Admin: Full access
- User: Read-only access

## 3. Specific Requirements
### 3.1 Functional Requirements
- [FR1] Add book (title, author, ISBN, year)
- [FR2] Edit book
- [FR3] Delete book
- [FR4] View list of books
- [FR5] Search books

### 3.2 Non-Functional Requirements
- [NFR1] System must respond within 1 second
- [NFR2] Should support up to 1000 books
- [NFR3] User interface must be simple and responsive

## 4. System Boundaries
- **Inside scope**: Book management
- **Outside scope**: User authentication, digital lending

## 5. Assumptions and Constraints
- Data stored in local database
- Only one admin user assumed
