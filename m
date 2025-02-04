Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F908C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 05:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEHyUVvDWy5Ero2/csVx2ZNWJ1I1N67ham97sJ6bR1I=; b=pGt/cOHH1eM9Vb4WLremj1wu6z
	RZIoGABEC4jzW7GbsvAh/nmIOmRR7HJeAkA4bbuJ2Gxs10tc7PM7QvhAdlQNCsp+xY7bho8mGgE0s
	7wlXiHibamg9YfH20WFaDpgLc6vU03V04sI6oZglqaRGeiOElnNpITYut8Dj/jJ4p76pwV59GoyKx
	HzJUWh60OrID1SrlNBWMid1x1uWqtapAjdWHBt77ZNwecM84+FNmrPMQxcOckfGg4YcoTXcZz8kEX
	CSObiuZK+p+op7TZ8d1dxDPfjpW+gW93N3ed6uNPYnGr924RvduGvkwpiVNays6Zq7LhPTedH/xTE
	P6FY0IxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfBwT-0000000HJTG-1GnC
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 05:57:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfBwQ-0000000HJSR-30Y9
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 05:57:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513JlrHr029157;
	Tue, 4 Feb 2025 05:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iEHyUVvDWy5Ero2/csVx2ZNWJ1I1N67ham97sJ6bR1I=; b=foSWOD45sNVZ4YC3
	e7DOc4Dpi/Q24vXNDhB8BObFbnS9scG5+shPnAdUmgDPVvEAPHNdeuT8VncYpLVY
	GUkjOvTJzH6wM63YzVnU8PATj2E9nQcJUiVQEKGNterYlAMw2OAWHEUKB5A1yN+y
	J3dfP3Jvwzgnses4tdCJ4BgqcOGlraNd7fc2kn8riUL+NPJ9Xox4kGverjpsWeLO
	Z9otY0Q8mhKfFeEJjo8W4ceU9p1pS9/T3vU2kraZtDmfcbnz0Cf7bI5WhwR2kBER
	JLwGusj6MtkELXBattqJ5SvM+Cr/IgXj/NhOSAxtJQVBLu8EGWr0Q5OAIp8786pC
	zo00fg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k492h2kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 05:57:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5145vgrH007585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 05:57:42 GMT
Received: from [10.216.42.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 21:57:38 -0800
Message-ID: <345519bb-ba1c-4bcc-a03c-5557f8f40035@quicinc.com>
Date: Tue, 4 Feb 2025 11:27:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] dt-bindings: net: wireless: describe the ath12k
 AHB module
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Kalle Valo
	<kvalo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeff Johnson
	<jjohnson@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250130043508.1885026-1-quic_rajkbhag@quicinc.com>
 <20250130043508.1885026-2-quic_rajkbhag@quicinc.com>
 <20250130-cunning-quail-of-opportunity-76d0ad@krzk-bin>
 <724a4822-469a-45bb-bfb1-c02b54e971a3@quicinc.com>
 <aaabcc7a-8234-4753-a8d1-ab36afdafa2e@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <aaabcc7a-8234-4753-a8d1-ab36afdafa2e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p9D-a9lWuHf6ggdTz0eID7ur7bmOJ6Pc
X-Proofpoint-ORIG-GUID: p9D-a9lWuHf6ggdTz0eID7ur7bmOJ6Pc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_215746_771620_1C47FF4B 
X-CRM114-Status: GOOD (  19.58  )
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

On 2/3/2025 3:39 PM, Krzysztof Kozlowski wrote:
> On 03/02/2025 10:05, Raj Kumar Bhagat wrote:
>>
>>>> +    items:
>>>> +      - const: q6-region
>>>> +      - const: m3-dump
>>>> +      - const: q6-caldb
>>>> +      - const: mlo-global-mem
>>>> +
>>>> +  qcom,ath12k-calibration-variant:
>>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> Why this is named after ath12k? Why this is just not
>>> "qcom,calibration-variant"? None of the other properties have ath12k in
>>> their names, so why this one in the WSI schema was named like that?
>>>
>>
>> This property is added after the below comment.
>> https://lore.kernel.org/all/qzjgpwemwaknwbs3dwils6kaa5c3inabfvkaryvc32kblzfhy3@6yduooj4dk63/
>>
>> This `ath12k` in the name of this property is inherited from the 'qcom,ath10k.yaml' and
>> 'qcom,ath11k.yaml'. Same was followed for WSI schema as well.
> 
> They do not have ath12k prefix in the name, so I don't understand.
> 

I meant that, 'qcom,ath10k.yaml' has qcom,ath10k-calibration-variant and
'qcom,ath11k.yaml' has qcom,ath11k-calibration-variant. The same name pattern
has been inherited.

> People, start re-using properties, not creating one per each binding.
> 
>>
>>>> +    description:
>>>> +      String to uniquely identify variant of the calibration data for designs
>>>> +      with colliding bus and device ids
>>> I don't think this property is here possible. How could you have on the
>>> same SoC different devices?
>>
>> The WiFi controller in the SoC includes an internal or external Front-End Module (FEM).
>> These FEMs can vary and require different calibration data. This property uniquely
> 
> 1. So exactly the same SoC package has different FEMs?
> 

Yes, the WiFi component of the same SoC package can have different FEMs.

> 2. How does it exactly work? Different bins? Different revisions?
> 

The calibration board data for different variant are packed into firmware binary 'board-2.bin'.
Thus, board-2.bin can contain multiple board data for various variants. Ath12k driver selects
the correct board data based on the variant. The "qcom,ath12k-calibration-variant" is used
as one of the parameter to select the correct board data from board-2.bin.

> 3. How is it supposed to work in practice - you have one board, but
> might have different SoCs inside? Which calibration data would you use
> in such case?
> 

The SoC in the following statement 'you have one board, but might have different SoCs inside'
, I am assuming SoC to be WiFi controller/component.

Consider, if we have two WiFi (qcom,ipq5332-wifi) controller with different FEM in IPQ5332 board.
Then in the DTS we have two wifi node. Each wifi node in DTS will have different value for
'qcom,ath12k-calibration-variant'. With the help of this property driver will be able to
download the correct calibration board data from board-2.bin.

