TrueAbility API
===============
# Base URL: https://app.trueability.com/api/v1
# Reset password: https://app.trueability.com/password_resets/new
# API access token: https://app.trueability.com/settings
# API Docs https://app.trueability.com/api/docs/v1

# Definitions
- *AbilityScreen* — Performance based test of a user’s skills, using software and a live environment. The AbilityScreen defines the assessment requirements and the user instructions.

- *Assessment* — An instance of an AbilityScreen. This consists of 0 or more scenarios, tasks the user must complete, 1 or more nodes (e.g. cloud servers) that comprise the environment.

- *Assessment Reservation* — Assessment build times vary greatly depending on the complexity of the AbilityScreen. In order to guarantee delivery, an assessment is requested via a reservation process.

## Reservations must be scheduled a minimum of 24 hours in advance.
- *Node* — A server or resource in the cloud.

- *Results* — Assessments are imaged and graded automatically following completion of the assessment. Imaging can take 15-30 minutes, grading typically takes 1-2 minutes. Scores will be available 30-35 minutes after the completion of the assessment.
