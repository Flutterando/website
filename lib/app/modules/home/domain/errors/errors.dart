class FailureGetPartners implements Exception {}

class FailureGetCoOrganizers implements Exception {}

class FailureGetPackages implements Exception {}

class FailureGetMeetups implements Exception {}

class FailureGetBrazilianCases implements Exception {}

class FailureGetYoutube implements Exception {}

class FailureInstaFollowers implements Exception {}

class DatasourceError
    implements
        FailureGetPartners,
        FailureGetCoOrganizers,
        FailureGetPackages,
        FailureGetBrazilianCases,
        FailureGetYoutube,
        FailureInstaFollowers,
        FailureGetMeetups {}
