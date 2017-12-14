class SebElink::Response
  def initialize(body)
    @body = body
  end

  def valid?
    # looks at IB_VERSION to be 001 to pefrom documented decrypt
    # can decrypt message0003
    # can decrypt message0004
  end

  def to_h

  end

  # # 4.2 Message 0003 - Payment order acceptance for processing (P.MU.3 and P.MU.4 parameters):
  # Sequence Parameter title Max length Example of value Description
  # 1. IB_SND_ID 10 B1 Request sender (Banks ID)
  # 2. IB_SERVICE 4 0003 Code of the Internet bank request type
  # 3. IB_VERSION 3 001 ID of used digital signature algorithm
  # 4. IB_PAYMENT_ID 20 UB0000000000015 Payment order reference number
  # 5. IB_AMOUNT 17 1234.56 Payment amount
  # 6. IB_CURR 3 EUR Payment currency (EUR)
  # 7. IB_REC_ID 10 AAA Beneficiary’s identifier (in this case: AAA)
  # 8. IB_REC_ACC 21 Beneficiary’s account (IBAN).
  # 9. IB_REC_NAME 30 Company Beneficiary’s name (in this case: Company)
  # 10. IB_PAYER_ACC 21 Payer’s account (IBAN)
  # 11. IB_PAYER_NAME 110 Jānis Ozols Payer’s name
  # 12. IB_PAYMENT_DESC 100 Your invoice No.1234 is paid Payment order description
  # 13. IB_PAYMENT_DATE 10 12.12.2005 Payment confirmation date (DD.MM.YYYY)
  # 14. IB_PAYMENT_TIME 8 21:12:34 Payment confirmation time (HH:MM:SS)
  # 15. IB_CRC 500 Request digital signature
  # 16. IB_LANG 3 LAT Language (possible values: LAT, ENG, RUS)
  # 17. IB_FROM_SERVER 1 Y / N In case of P.MU.2: Y, P.MU.3: N

  # # 4.3 Message 0004 - Payment order execution or cancellation (P.MU.2 and P.MU.5 parameters):
  # Sequence, Parameter title, Max length, Example of value, Description
  # 1. IB_SND_ID 10 B1 Request sender (Banks ID)
  # 2. IB_SERVICE 4 0004 Code of the Internet bank request type
  # 3. IB_VERSION 3 001 ID of used digital signature algorithm
  # 4. IB_REC_ID 10 AAA Beneficiary’s identifier (in this case: “AAA”)
  # 5. IB_PAYMENT_ID 20 UB0000000000015 Payment order reference number
  # 6. IB_PAYMENT_DESC 100 Your invoice No. 1234 is paid Payment order description
  # 7. IB_FROM_SERVER 1 Y/ N In case of P.MU.4: “Y”, P.MU.5: “N”
  # 8. IB_STATUS 12 ACCOMPLISHED Payment order status
  # 9. IB_CRC 300 Message digital signature
  # 10. IB_LANG 3 LAT Language (possible values: “LAT”, “ENG”, “RUS”)
end
