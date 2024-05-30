const apiEndpoint =
    // 'https://us-central1-trade-floor.cloudfunctions.net/getAllFromCollection';

    'https://us-central1-trade-floor.cloudfunctions.net/api/getAllFromCollection?collectionName=$apiSubUserCollection';

const apiUpdatePlanEndpoint =
    'https://us-central1-trade-floor.cloudfunctions.net/api/updateplan';

const apiPaymentHistoryEndpoint =
    'https://us-central1-trade-floor.cloudfunctions.net/api/payment_history';

const apiSubUserCollection = 'subscriptions';
const apiAuthPartnerCollection = "authorized_partnership";

const apiAuthPartnerEndPoint =
    'https://us-central1-trade-floor.cloudfunctions.net/api/getAllFromCollection?collectionName=$apiAuthPartnerCollection';
