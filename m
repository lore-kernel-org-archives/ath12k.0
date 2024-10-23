Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1B0CF5365
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTht4jf6MVYNx9CnrbRM5YEqmjgvAAa/perOIHWuwqI=; b=HVOGvml+2W7QIsdZDn/YEb0Hej
	Tm4mUYXr+0UF0tySl5br3wUw9aYM9Ep08h8Q/6nHB5qvjOntC5SCClQNPx3ILJc21ixxa9c6HZRRY
	Gjvn3YlWETtGNcO5qv7wGpLyF9qw1zRe0Tz6w7v8204kHE969TKp+UXl9Bkly2WmTXgkaKB8wHONa
	yiQ1d5le73XXFMimJGmlGT1wwecpof9cCTKHSNr8PcdsVqhsRfUJ9iDYE39zeAXQiwr1FixBKwMf4
	84IahsE4B7pkzS1Vb4xt4f5uj4t/XbeQrB8HgU10Nh7sHfj0jlWgZiE3qULrjLHxsDNZzQX5/2WzK
	94KD24LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aNe-0000000EJpP-0CRr
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 12:22:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aNb-0000000EJov-0fkc
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 12:22:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9ijY1030354;
	Wed, 23 Oct 2024 12:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iTht4jf6MVYNx9CnrbRM5YEqmjgvAAa/perOIHWuwqI=; b=KjVNMZmx5W6T/hx9
	qFM5Ssj5c7Ibw53lWnXBtjvQE7kikPtZJN3J/0cNQ7uf1P+iu1OSASbEfV6SLS9b
	jAexoHHg46KkFBQ3TU6qrIAAfVsYlMAl8oHGvEgFVqFZTzzP4PAEU6RM5TlRkEU+
	dygswS8TFpWOAjgZ8mhyblYGzeEdo1URz1AOY09sIvAlJIj1xKHLuoYCa9fmsWb/
	cUlBa9im7A+D1SEPn4hrRHvDwRTIMG3WhdCBR3yOlaDxHW6NopjV1v5qXIZqT7bR
	MkpHAKCSua1eJ//QXZSONhIJ4w8yAJzizWugPgBfTJtX6ADenFoixi8HVvN+Hdm9
	8v2i5Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w25y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 12:22:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NCMH7Q014294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 12:22:17 GMT
Received: from [10.152.207.135] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 05:22:12 -0700
Message-ID: <9c06fdac-df4f-449c-8d58-b57c375c1751@quicinc.com>
Date: Wed, 23 Oct 2024 17:52:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] dt-bindings: net: wireless: ath12k: describe WSI
 property for QCN9274
To: Krzysztof Kozlowski <krzk@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20241023060352.605019-1-quic_rajkbhag@quicinc.com>
 <20241023060352.605019-3-quic_rajkbhag@quicinc.com>
 <b42da7f0-2034-467b-ab17-fb13ef7800c4@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <b42da7f0-2034-467b-ab17-fb13ef7800c4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s3FSzHXtIQ2CGqrun3lATKRRWpRaFwCS
X-Proofpoint-GUID: s3FSzHXtIQ2CGqrun3lATKRRWpRaFwCS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_052223_233085_A1B231CF 
X-CRM114-Status: GOOD (  28.17  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 10/23/2024 12:08 PM, Krzysztof Kozlowski wrote:
> On 23/10/2024 08:03, Raj Kumar Bhagat wrote:
>> QCN9274 device has WSI support. WSI stands for WLAN Serial Interface.
>> It is used for the exchange of specific control information across
>> radios based on the doorbell mechanism. This WSI connection is
>> essential to exchange control information among these devices
>>
>> Hence, describe WSI interface supported in QCN9274 with the following
>> properties:
>>
>>  - qcom,wsi-group-id: It represents the identifier assigned to the WSI
>>    connection. All the ath12k devices connected to same WSI connection
>>    have the same wsi-group-id.
>>
>>  - qcom,wsi-index: It represents the identifier assigned to ath12k
>>    device in the order of the WSI connection.
>>
>>  - qcom,wsi-num-devices: Number of devices connected through WSI in
>>    the same group ID.
> 
> You should have separate binding.
> 

Based on the discussion in previous patch [1/6]. If required we will have
separate binding.

>>
>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>> ---
>>  .../bindings/net/wireless/qcom,ath12k.yaml    | 61 +++++++++++++++++++
>>  1 file changed, 61 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
>> index ecf38af747f7..6c8f97865075 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
>> @@ -19,6 +19,7 @@ properties:
>>    compatible:
>>      enum:
>>        - pci17cb,1107  # WCN7850
>> +      - pci17cb,1109  # QCN9274
>>  
>>    reg:
>>      maxItems: 1
>> @@ -50,6 +51,41 @@ properties:
>>    vddpcie1p8-supply:
>>      description: VDD_PCIE_1P8 supply regulator handle
>>  
>> +  wsi:
>> +    type: object
>> +    description:
>> +      The ath12k devices (QCN9274) feature WSI support. WSI stands for
>> +      WLAN Serial Interface. It is used for the exchange of specific
>> +      control information across radios based on the doorbell mechanism.
>> +      This WSI connection is essential to exchange control information
>> +      among these devices.
>> +
>> +    properties:
>> +      qcom,wsi-group-id:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          It represents the identifier assigned to the WSI connection. All
>> +          the ath12k devices connected to same WSI connection have the
>> +          same wsi-group-id.
> 
> Why it cannot be implied by compatible?
> 
>> +
>> +      qcom,wsi-index:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          It represents the identifier assigned to ath12k device in the
>> +          order of the WSI connection.
> 
> No, we do not have indices in DTS.
> 
>> +
>> +      qcom,wsi-num-devices:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          Number of devices connected through WSI in the same group ID.
> 
> Wait, why? Number of devices is visible from DTS. You are missing some
> diagram showing this but it looks like you stuff multiple nodes into one
> node.
> 
> 

To discuss the above comments, let me provide a diagram that is part of the
commit log of DTS patch [6/6].

The WSI connection in RDP433 is represented below:

          +-------+        +-------+        +-------+
          | pcie2 |        | pcie3 |        | pcie1 |
          |       |        |       |        |       |
   +----->|  wsi  |------->|  wsi  |------->|  wsi  |-----+
   |      | idx 0 |        | idx 1 |        | idx 2 |     |
   |      +-------+        +-------+        +-------+     |
   +------------------------------------------------------+

The above three blocks represent the QCN9274 WiFi devices connected to their
respective PCI slots. The dotted line represents the WSI connection that connects
these three devices together. Hence, the WSI interface is part of the QCN9274 device.

To describe this WSI hardware connection in the device tree, we are adding three
properties inside the WSI object:

1. qcom,wsi-group-id:
   In the above diagram, we have one WSI connection connecting all three devices.
   Hence, “qcom,wsi-group-id” for all three devices can be 0.

   This cannot be implied by the compatible property, as explained below:
   Let’s take the case of a platform that can have four QCN9274 WiFi devices. Below
   is one possibility of a WSI connection:

         +-------+       +-------+          +-------+      +-------+
         | pcie2 |       | pcie3 |          | pcie1 |      | pcie0 |
         |       |       |       |          |       |      |       |
   +---->|  wsi  |------>|  wsi  |--+   +-->|  wsi  |----->|  wsi  |----+
   |     | idx 0 |       | idx 1 |  |   |   | idx 0 |      | idx 1 |    |
   |     +-------+       +-------+  |   |   +-------+      +-------+    |
   +--------------------------------+   +-------------------------------+

   In this case, QCN9274 devices connected in PCIe2 and PCIe3 will have the same
   “qcom,wsi-group-id”. This group-id will be different from the “qcom,wsi-group-id”
   of QCN9274 devices connected at PCIe1 and PCIe0.

2. qcom,wsi-index:
   This is a unique identifier of the device within the same group. The value of
   wsi-idx is represented in both the above cases (RDP433 and the 4 WiFi device
   platform) in the diagram itself.

3. qcom,wsi-num-devices:
   Represents the number of devices connected through WSI within the same WSI group to
   which the device belongs.
   
   In the case of RDP433, all devices will have this number as 3.
   For the second example with four WiFi devices but with two WSI connections, the
   value of “qcom,wsi-num-devices” for each device will be 2.

> 
>> +
>> +    required:
>> +      - qcom,wsi-group-id
>> +      - qcom,wsi-index
>> +      - qcom,wsi-num-devices
>> +
>> +    additionalProperties: false
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -108,3 +144,28 @@ examples:
>>              };
>>          };
>>      };
>> +
>> +  - |
>> +    pcie {
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +
>> +        pcie@0 {
>> +            device_type = "pci";
>> +            reg = <0x0 0x0 0x0 0x0 0x0>;
>> +            #address-cells = <3>;
>> +            #size-cells = <2>;
>> +            ranges;
>> +
>> +            wifi@0 {
>> +                compatible = "pci17cb,1109";
>> +                reg = <0x0 0x0 0x0 0x0 0x0>;
>> +
>> +                wsi {
>> +                    qcom,wsi-group-id = <0>;
>> +                    qcom,wsi-index = <0>;
>> +                    qcom,wsi-num-devices = <3>;
> 
> So what are the other 2 devices? Where are they documented?
> 

In the example, we have represented only one WiFi node. Although it indicates
that there are a total of three devices in the same WSI connection with group-id
0, we can add all three WiFi nodes in the next version if required.


