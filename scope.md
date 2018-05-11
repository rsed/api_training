# Scope

Source: email
```
From: Brian Turner <bturner@chef.io>
Date: Friday, 9 March 2018 at 18:28
To: John Fitzpatrick <fitzpatrick@chef.io>
Subject: Fwd: Exam-Results-Processor CLI Utility (to get TrueAbility Results -> Learndot)

Update from WireStone on the work to automate the cert results and email process.


---------- Forwarded message ----------
From: Sexton, S. <s.sexton@wire-stone.com>
Date: Thu, Mar 8, 2018 at 6:24 PM
Subject: Exam-Results-Processor CLI Utility (to get TrueAbility Results -> Learndot)
To: Brian Turner <bturner@chef.io>
Cc: "Willis, Timothy P." <timothy.p.willis@wire-stone.com>
...
```

## Discovery Findings

### TrueAbility API
- Able to get setup with an API key from TrueAbility
  - Their staging environment is a copy of production (but is just sync’d on a regular basis).

- Verified that we can (via the API) query results coming in by graded date range and get the information we need (i.e. score, result, email address and ability screen)


### Learndot API
- Able to get setup with an API key for Learndot staging environment (self generated via admin account)
- Verified that we can (via the API) find contacts by email address
- Verified that we can (via the API) find all enrollments for a specific contact
- Verified that we can (via the API) update an enrollment including
  - changing the status

  - updating custom enrollment fields

  - adding comments

- Verified that changing the status to PASSED generates a certificate within Learndot
- Also, it appears that Learndot can be used to send the certification email…. and likely can be used to send the email for a FAILED exam also.  Potential to use custom fields for trueAbility data points (but we need to discuss/verify)

## Proposed Approach / Requirements outline

- We need a command line interface (i.e. CLI) tool that is easy to get setup and can be run locally by someone familiar with git (by following a README). This will likely be in the form of a rubygem.
- The tool should have the ability to run with a DRYRUN option (so that no writes will happen)
- The tool should include standard logger functionality (so that all activity is logged to a local file).
- The tool will have the following functionality:
  - Read results from TrueAbility API
    - from a specified date range (or last 30 days)
  - For each result that is completed, the tool would
    - lookup the learndot user by email address
    - find an enrolment record for the corresponding exam
    - if exam in the confirmed status and NOT DRYRUN, then update the following fields
      - CustomField01 – TrueAbilityScore
      - CustomField02 – TrueAbilityScoreThreshold
      - CustomField03 – TrueAbilityResultsUrl
      - Status – PASSED or FAILED
    - Log the results of each step (and respect verbosity setting)
  - IF NOT DRYRUN and NO ERRORS, update the lastRunDateTime so next run will not read previous results


- Configuration of the tool should be easily done via ENV variable or file
  - API keys for both Learndot and TrueAbility can be easily added
  - Results Date Range easily configurable for testing (with sensible default – e.g. last 30 days?)
- The tool should be capable of being setup to run on a regular basis via a scheduler (but hosting & deployment & operations remaining a Chef responsibility)
- Chef will be responsible for production hosting, deployment, monitoring or alerting included
- Email templates to be configured by Chef (in Learndot) but the template can use Status and the CustomFields above– and we may need Learndot help to configure the trigger points. (alternatively we can send the emails & manage the templates another way)


## Issues/Questions to discuss

- We do need a way to map ability_screen_ids (in TrueAbility) to exam_component (in Learndot).  Options here include:
  - Use a CustomField for the exam in Learndot that will specify the TrueAbilityScreenId associated with the exam (preferred/easier option)
  - Include a Map of all ExamIds -> AbilityScreens in the CLI tool
- Email Templates in Learndot
  - Need to discuss setup in Learndot and whether staging is representative (the custom fields approach should help here)
  - Need to discuss how Failed Email message is triggered
  - Can also discuss other options to send the email / manage the template outside of Learndot (e.g. marketo?)
