# Test Plan – Book Management System

## 1. Test Objectives
- Ensure system meets functional requirements
- Validate core workflows: login, book search, borrow/return

## 2. Test Scope
- Included: All CRUD operations, login, book borrowing
- Excluded: External APIs or payment gateways

## 3. Test Types
- Unit Tests
- Integration Tests
- UI Tests
- Boundary Testing
- Negative Testing

## 4. Test Cases (Examples)

### 4.1 Positive Tests
- ✅ Add a new book with valid data
- ✅ Search for a book by full title
- ✅ Borrow a book when user has < 5 books borrowed

### 4.2 Negative Tests
- ❌ Add a book with empty title → error
- ❌ Borrow a book when already borrowed → block

### 4.3 Boundary Conditions
- Max 5 books borrowed
- Title character limit (e.g., 100 chars)
- Search field max length

## 5. Test Data
| Username | Password | Role   |
|----------|----------|--------|
| alice    | test123  | Admin  |
| bob      | bobpass  | Member |

## 6. Tools
- Postman (API testing)
- Selenium (UI testing)
- pytest/unittest (backend)

## 7. Schedule
| Phase             | Dates        |
|------------------|--------------|
| Unit Testing      | Aug 1–2      |
| Integration Test  | Aug 3–4      |
| Final Validation  | Aug 5        |

## 8. Resources
- 1 QA engineer
- 1 Developer for support

## 9. Deliverables
- Test Report
- Bug Tracker Sheet
