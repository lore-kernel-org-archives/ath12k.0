Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E944C02193
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 09:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cV5qVf3KEl2mKoV6KdKVtnjnoxdRcDLKf/ZGrf//YiE=; b=LE8vdKtTqv5gBUKhsyPufwXq3o
	pAXE/RMm+pmHKuPP4PkbZvSy6vRdH2f3UbyM2gjuYg2w/jhVKWsGKKH7fBpgXnm/yB1ZoakNW0Zw8
	X92jYDGHQubo7lOAWksMYTdNIN2ICs/hrTH9F9S36laSKBZVv6934G2DU+2L14sip3Iqgl4BlGgpl
	Z6OWGkTYK1DQgS69jBdlzWqeofrspEeTgZ0x0MIAfPmuTDAQ+xw0Aqla0uWxprugZVTBHE2p1T7/s
	iixQjq+DBbLeAwW/7Ngp5yOkvr5gU56Ti7CHKeXQpPvWD/In6nZvlMk8qigP7O9o/i/GUj8HcTixI
	QxO8cdUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesOx-0000000EwIs-01HW
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 09:05:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesOu-0000000EwHa-20iU
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 09:05:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135OiAi000874;
	Mon, 3 Feb 2025 09:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cV5qVf3KEl2mKoV6KdKVtnjnoxdRcDLKf/ZGrf//YiE=; b=QgEtN3pRRXyiHuM0
	67MPQxFj9e0NFoGssmje7xW1tX6zAUuNqMoBsZiQMjnMrVZylVUxvgY4wkeswSkC
	bz/WpD10ijntB4lTvdo9Ki4dhR5K/qytjc+0j33ktrz/V0EhuUf2rUrFsI4X8+E7
	u6Dmbg5coGxbWPm6WIRwxtRlO2Gl5oc1md+iCAp3dlgYUpvVK12/+pCCLMvAP74w
	Uq06bFgOXqnk+ur6onX5N1bscmNtF9VVsST/gYTFhbHVh5WjJ/s2r2bPr3Z3spCa
	8iwSwBKMzUYT6dDqZQ0BhKBbaI496V/I53/kB9YQMEgcRgfEafTHOjmNGjGj4DwR
	g3laxQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqm40ex0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 09:05:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51395ll8026043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 09:05:47 GMT
Received: from [10.216.42.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 01:05:44 -0800
Message-ID: <724a4822-469a-45bb-bfb1-c02b54e971a3@quicinc.com>
Date: Mon, 3 Feb 2025 14:35:41 +0530
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
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <20250130-cunning-quail-of-opportunity-76d0ad@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VPpC0vgZfiIO8bQBVN4TbmeZz2zgh_7x
X-Proofpoint-ORIG-GUID: VPpC0vgZfiIO8bQBVN4TbmeZz2zgh_7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=822 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_010552_530447_74190575 
X-CRM114-Status: GOOD (  16.09  )
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

On 1/30/2025 1:58 PM, Krzysztof Kozlowski wrote:
>> +  memory-region:
>> +    description:
>> +      phandle to a node describing reserved memory (System RAM memory)
>> +      used by ath12k firmware (see bindings/reserved-memory/reserved-memory.txt)
> Do not say what DT syntax is, so "phandle to a node" is redundant,
> reserved-memory.txt is redundant. The only useful part here is "used by
> ath12k firmware", so based on this none of below are used by the driver
> and driver just passes them to the firmware?
> 

Sure, will rephrase the description.

These reserved memory-regions are utilized by the ath12k firmware. The ath12k driver
stores these memory addresses solely for the purpose of collecting crash dumps
(RAM dumps) when the firmware encounters a crash.

>> +    items:
>> +      - description: Q6 memory region
>> +      - description: m3 dump memory region
>> +      - description: Q6 caldata memory region
>> +      - description: Multi Link Operation (MLO) Global memory region
>> +
>> +  memory-region-names:
>> +    description:
>> +      Name of the reserved memory region used by ath12k firmware
> Drop description.
> 

Sure.

>> +    items:
>> +      - const: q6-region
>> +      - const: m3-dump
>> +      - const: q6-caldb
>> +      - const: mlo-global-mem
>> +
>> +  qcom,ath12k-calibration-variant:
>> +    $ref: /schemas/types.yaml#/definitions/string
> Why this is named after ath12k? Why this is just not
> "qcom,calibration-variant"? None of the other properties have ath12k in
> their names, so why this one in the WSI schema was named like that?
> 

This property is added after the below comment.
https://lore.kernel.org/all/qzjgpwemwaknwbs3dwils6kaa5c3inabfvkaryvc32kblzfhy3@6yduooj4dk63/

This `ath12k` in the name of this property is inherited from the 'qcom,ath10k.yaml' and
'qcom,ath11k.yaml'. Same was followed for WSI schema as well.

>> +    description:
>> +      String to uniquely identify variant of the calibration data for designs
>> +      with colliding bus and device ids
> I don't think this property is here possible. How could you have on the
> same SoC different devices?

The WiFi controller in the SoC includes an internal or external Front-End Module (FEM).
These FEMs can vary and require different calibration data. This property uniquely
identify the variant of calibration data required by a FEM.


