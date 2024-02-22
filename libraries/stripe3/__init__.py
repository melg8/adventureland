# Stripe Python bindings
# API docs at http://stripe.com/docs/api
# Authors:
# Patrick Collison <patrick@stripe.com>
# Greg Brockman <gdb@stripe.com>
# Andrew Metcalf <andrew@stripe.com>

# Configuration variables

api_key = None
api_base = 'https://api.stripe.com'
upload_api_base = 'https://uploads.stripe.com'
api_version = None
verify_ssl_certs = True
default_http_client = None

# Resource
from libraries.stripe3.resource import (  # noqa
    Account,
    AlipayAccount,
    ApplicationFee,
    Balance,
    BalanceTransaction,
    BankAccount,
    BitcoinReceiver,
    BitcoinTransaction,
    Card,
    Charge,
    CountrySpec,
    Coupon,
    Customer,
    Dispute,
    Event,
    FileUpload,
    Invoice,
    InvoiceItem,
    Order,
    OrderReturn,
    Plan,
    Product,
    Recipient,
    Refund,
    SKU,
    Subscription,
    ThreeDSecure,
    Token,
    Transfer)

# Error imports.  Note that we may want to move these out of the root
# namespace in the future and you should prefer to access them via
# the fully qualified `stripe.error` module.

from libraries.stripe3.error import (  # noqa
    APIConnectionError,
    APIError,
    AuthenticationError,
    RateLimitError,
    CardError,
    InvalidRequestError,
    StripeError)

# DEPRECATED: These imports will be moved out of the root stripe namespace
# in version 2.0

from libraries.stripe3.version import VERSION  # noqa
from libraries.stripe3.api_requestor import APIRequestor  # noqa
from libraries.stripe3.resource import (  # noqa
    APIResource,
    CreateableAPIResource,
    DeletableAPIResource,
    ListObject,
    ListableAPIResource,
    SingletonAPIResource,
    StripeObject,
    StripeObjectEncoder,
    UpdateableAPIResource,
    convert_to_stripe_object)
from libraries.stripe3.util import json, logger  # noqa
