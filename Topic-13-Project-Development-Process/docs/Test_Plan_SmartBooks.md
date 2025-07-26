# Test Plan – SmartBooks: Personalized Reading Tracker

## 1. Introduction
**Purpose**: Define the testing strategy for the SmartBooks application.

## 2. Test Items
- Add books
- Update reading status
- Submit reviews
- View stats
- Get recommendations

## 3. Features to be Tested
All core user features

## 4. Features Not to be Tested
- UI appearance  
- Authentication module (not in scope)

## 5. Test Strategy
Manual functional testing using defined test cases.

## 6. Test Cases

### Positive Tests
**TC1**: Add a book with complete info  
Steps: Go to Add Book → Fill form → Submit  
Expected: Book is saved

**TC2**: Update status to 'Reading'  
Steps: Select book → Update status  
Expected: Status updated

### Negative Tests
**TC3**: Submit review with no rating  
Steps: Leave rating empty → Submit  
Expected: Error message

**TC4**: Add book with missing title  
Steps: Leave title blank → Submit  
Expected: Validation error

### Boundary Tests
**TC5**: Add book with 255-char title  
Expected: Book saved

**TC6**: Submit 1000-character review  
Expected: Review accepted