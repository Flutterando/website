class FailureGetPartners implements Exception {}

class FailureGetFounders implements Exception {}

class FailureGetCoOrganizers implements Exception {}

class FailureGetPackages implements Exception {}

class FailureGetMeetups implements Exception {}

class FailureGetBrazilianCases implements Exception {}

class FailureGetYoutube implements Exception {}

class FailureInstaFollowers implements Exception {}

class FailureGetPartnersCommunities implements Exception {}

class DatasourceError
    implements
        FailureGetPartners,
        FailureGetFounders,
        FailureGetCoOrganizers,
        FailureGetPackages,
        FailureGetBrazilianCases,
        FailureGetYoutube,
        FailureInstaFollowers,
        FailureGetPartnersCommunities,
        FailureGetMeetups {}
