# Entity Relationships (Phase 0)

## ASCII ERD (conceptual)
Reader ──< AccessToken >── Book
              │
              └─< ReadProof
Reader ──< Review >── Book
Reader ──< Loan >── AccessToken
Bundle ──< BundleItem >── Book
Book ──< Chapter

Legend:
A ──< B  means "A has many B" (one-to-many)

## Objects
- Reader: a person using the app.
- Book: a complete work.
- Chapter: ordered subdivision of a Book.
- Bundle: group of Books.
- BundleItem: join table mapping Bundle → Book.
- AccessToken: proof a Reader has access to a Book (direct) or via Bundle.
- ReadProof: evidence a Reader opened/finished (ties to AccessToken).
- Review: rating + comment by a Reader about a Book.
- Loan: temporary transfer of an AccessToken from lender to borrower.

## Access Inheritance Rules
1) Direct access:
   - If Reader holds AccessToken(book_id=X), they can read Book X and its Chapters.

2) Bundle-derived access:
   - If Reader holds AccessToken(bundle_id=Y), they gain access to all Books in Bundle Y.
   - Internally, derive "effective access" to each member Book at check time.

3) Chapter access:
   - Requires effective Book access (direct OR derived via Bundle).
   - No separate Chapter tokens; Chapters inherit Book access.

4) Lending scope:
   - Loans operate at the Book AccessToken level (not the Bundle level).
   - If an AccessToken(book_id=X) is loaned out, lender's effective access to Book X is paused until return/expiry.
   - Bundle AccessTokens are NOT loanable as a whole (avoid cross-book complexity).

5) Conflict precedence:
   - Active Loan takes precedence over lender's local access: lender cannot read Book X during an active loan.
   - Borrower gains temporary effective access only for the loaned Book.

6) Reviews & ReadProofs:
   - ReadProof must reference a valid (non-paused) AccessToken at event time.
   - Review allowed once per Reader per Book, only if at least one valid ReadProof exists for that Book.

