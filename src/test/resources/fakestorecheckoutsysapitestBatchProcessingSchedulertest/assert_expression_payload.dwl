%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "creationTime": |2022-03-16T15:10:36|,
  "recordCount": 40,
  "result": {
    "onCompletePhaseException": null,
    "loadingPhaseException": null,
    "totalRecords": 40,
    "elapsedTimeInMillis": 0,
    "failedOnCompletePhase": false,
    "loadedRecords": 40,
    "failedRecords": 0,
    "failedOnInputPhase": false,
    "successfulRecords": 0,
    "inputPhaseException": null,
    "processedRecords": 0,
    "failedOnLoadingPhase": false,
    "batchJobInstanceId": "2d99c6a0-a4f8-11ec-8f2f-64bc58dfb7c1"
  },
  "id": "2d99c6a0-a4f8-11ec-8f2f-64bc58dfb7c1",
  "ownerJobName": "fakestore-checkout-sys-api-implBatch_Job",
  "status": "EXECUTING"
})