# Test Plan – Book Management System

## 1. Introduction
- Purpose: Define the testing strategy for BMS

## 2. Test Items
- Add Book
- Edit Book
- Delete Book
- View Books
- Search Books

## 3. Features to be Tested
- All core CRUD features

## 4. Features Not to be Tested
- Authentication (not in scope)
- UI styling (visual QA is out of scope)

## 5. Test Strategy
- Manual functional testing using defined test cases

## 6. Test Cases

### Positive Tests
| ID | Description | Steps | Expected Result |
|----|-------------|-------|------------------|
| TC1 | Add a valid book | Go to Add → Fill form → Submit | Book is saved |
| TC2 | Search existing book by title | Search for "Harry Potter" | Correct result shown |

### Negative Tests
| ID | Description | Steps | Expected Result |
|----|-------------|-------|------------------|
| TC3 | Add book with missing title | Leave title empty → Submit | Error message shown |
| TC4 | Delete book that doesn't exist | Try to delete non-existent ID | Error or no-op |

### Boundary Tests
| ID | Description | Steps | Expected Result |
|----|-------------|-------|------------------|
| TC5 | Add book with max-length title | Use 255-character title | Book is saved |
| TC6 | Add book with invalid year | Year = "abcd" | Validation error |
