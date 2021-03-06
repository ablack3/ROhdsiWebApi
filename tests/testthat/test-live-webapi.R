test_that("Auth with real URL works", {
  skip_if(!authSet)
  authorizeWebApi(testBaseUrl, authType, testOhdsiUser, testOhdsiPassword)

  # Won't know what this token is but we expect there to be one and for it to be long
  expect_true(substr(ROhdsiWebApi:::ROWebApiEnv[[testBaseUrl]]$authHeader, 1, 6) == "Bearer")
  expect_true(nchar(ROhdsiWebApi:::ROWebApiEnv[[testBaseUrl]]$authHeader) > 50)
})

test_that("get configuration information on WebApi", {
  skip_if(!authSet)
  cdmSources <- getCdmSources(baseUrl = testBaseUrl)
  expect_is(cdmSources, "data.frame")
  webApiVersion <- getWebApiVersion(baseUrl = testBaseUrl)
  expect_is(webApiVersion, "character")
  priorityVocabulary <- getPriorityVocabularyKey(baseUrl = testBaseUrl)
  expect_is(priorityVocabulary, "character")
  definitionsMetadata <- getDefinitionsMetadata(baseUrl = testBaseUrl, category = "cohort")
  expect_is(definitionsMetadata, "data.frame")

})
