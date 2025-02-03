Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AE4C02192
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 10:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IFJybb1pcE7296a9/K0sJwN2gUdU48QFivEoX0a/tA=; b=Ry6YaUSqSE1NYvRTcHP0nSOWQP
	N3LirnRwON+mPPAJrzgCrDBS0Y4zsoxwB3bXhs3VogkCRcmOKJRh4JqtM3zDEeC8NCgSULC8lMNKx
	EpJBlaV0wcaQtp/T/hea6cCHGEX4O7ShUjS1mDz7/KG5yXZh/NFzoa84d03MTSL5njfRhBGYL+tRG
	xGShX5vb5WA1HKbuU5G8AesOY+sJ9VN/0MwCxJNQnazPgD6XGe3UU7OGa3uYrqaRzJb2s2CVmlEO+
	XONVApdsJ/G+7thyfIuJs57NV4XOjX1v5BWo9t48Jin1dAPnEFT1Zq76ZETCXTvs999CbBKJGywzn
	C7xUXTVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetUZ-0000000F5mL-42sO
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 10:15:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesQf-0000000Ewe8-2hg2
	for ath12k@bombadil.infradead.org;
	Mon, 03 Feb 2025 09:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5IFJybb1pcE7296a9/K0sJwN2gUdU48QFivEoX0a/tA=; b=EnmSoJjbjPziewi03NmqRdxK10
	o4GucOyrTyfAUIzUK2Mncy1TW/CU56BkfycIHP5ZlQXvj+eFHQl26eMsQS3jGPIVrYIcLeaG7pWcs
	UdvYWzGXaDlHG4NLSYfGwRjgz271MHgivo0KOUssVFWkPNEeCjylfn/NcHT1MTZ3t8/aI5ZS3/Z4o
	d7eNWK0Fac/0MIOCsbeQzrIf2sPCCNZ0HgGz7UKfa6yhOJHkO4KAPHqmHOmvAVqdHtcJNSaALEKGe
	2cLelppBRyTB3/EeNP2egN4InTZraYrUJ3HKfLLi/xPmJOTRZS5mKu8R3wmbz2zOVC4+PNiMO2n7e
	TpVWZhGw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesQc-0000000G1fo-0uK6
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 09:07:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 512LjB2r002355;
	Mon, 3 Feb 2025 09:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5IFJybb1pcE7296a9/K0sJwN2gUdU48QFivEoX0a/tA=; b=CwOv10Rz0A8i3B2d
	eDMBndMgXdyaiBCA2LYnmFNjBYqpDf5BOa6iHHk6RFb81eTMEN01BOswJzfrYnHZ
	Lfs7jVgYKAaosoumrx9MjCgNKOyVea255LAIo2mbs6yYjaPoxYdOsrscpNc76bj0
	054frG6ObWkqA9OIz+WXFAkPpwZQIDS9kX7XOUHdcFa3EOhQPH1zGAWfOsndfRYk
	tjJQGOR5S6QQgiZDbuY+vmDTyuP4dpuCPxvFKfiuHc5Zu+mdgU68vMzjN04tt9Ji
	dOSiFNBVZiGBVWUFWaWMPtdADQEk1iY24ojvzszVYdIeGqxhyryRag9RZvwyhVYu
	G/jHZA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jc0t18tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 09:07:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51397UwK005999
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 09:07:30 GMT
Received: from [10.216.42.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 01:07:26 -0800
Message-ID: <2f0b8022-c04d-4375-af47-b3f7d4cb9ba2@quicinc.com>
Date: Mon, 3 Feb 2025 14:37:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] dt-bindings: net: wireless: describe the ath12k
 AHB module
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250130043508.1885026-1-quic_rajkbhag@quicinc.com>
 <20250130043508.1885026-2-quic_rajkbhag@quicinc.com>
 <b3637222-d79a-4019-8155-d14abbadd6f7@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <b3637222-d79a-4019-8155-d14abbadd6f7@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JdTKmWgd7-duw_WL0P8Do8ZpM87UROdj
X-Proofpoint-GUID: JdTKmWgd7-duw_WL0P8Do8ZpM87UROdj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=884 bulkscore=0 mlxscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_090738_708584_85598C68 
X-CRM114-Status: GOOD (  11.11  )
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

On 1/31/2025 12:37 AM, Jeff Johnson wrote:
> On 1/29/2025 8:34 PM, Raj Kumar Bhagat wrote:
>> Add device-tree bindings for the ATH12K module found in the IPQ5332
>> device.
>>
>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>> ---
>>  .../net/wireless/qcom,ath12k-ahb.yaml         | 319 ++++++++++++++++++
>>  1 file changed, 319 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
>> new file mode 100644
>> index 000000000000..bd953a028dc3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
>> @@ -0,0 +1,319 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/wireless/qcom,ath12k-ahb.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies ath12k wireless devices (AHB)
>> +
>> +maintainers:
>> +  - Kalle Valo <kvalo@kernel.org>
> 
> sadly, you should remove Kalle since he resigned as a maintainer this week
> 

Will update.

