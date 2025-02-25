Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1924C021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 11:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16XU88wAD+XphURLR0i0WLhnTgmgnb4ci4H9C5ic2GE=; b=csr+H98DKjs+WvQN5MLO36tXq+
	cH/e73CmyUiMA6YJSVsjlbzpZYnoLCLX+kcGbWzQ1bErJ+B9GxEJ2d+me6aWOSZ6etEkYz0V/5M+S
	cri0WEnrOu7SFwogNMJKsiTkog1yrPDVB3XJm6jNqPjTvYFYQ1OZJVP3t/c2dslhJpNhMwG1+wQkj
	pqqpst8MWlmEs1EpolMMainmR7zOn6Mmykmpj3L05KlZhQTX4baADDNDDAZaqur3uGl4yPjY3LRRS
	HJVgWfOyuWgoQiQyJ7aUVRtC9d81OMizG1E0TY7oZnJUDspPp3S3corEiK7k6kFNGO40VPiyhZyXy
	YQuVuVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsvf-0000000H00F-2XPC
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 11:16:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsOr-0000000GsAJ-1dio
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 10:42:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8RAXA012887;
	Tue, 25 Feb 2025 10:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	16XU88wAD+XphURLR0i0WLhnTgmgnb4ci4H9C5ic2GE=; b=WOINB3oynodIxR+1
	Tiy55TMVPqtf5Eya4G0C9EfOHY8nE/8i5P6VQyUpo+Hi8WAuACFTS6V11ekdyevn
	Msz/He9edUBaC/wyDfp3ZaTzbaWHCjyjvy3BThDremLlVFOwACqsOWDqzqcbMSLS
	xoDF0y8trv3rcHRxaOd4JHR1IRHW+RpiPc5qCWqv4ah87ISmOsSgkL3YPjxmrZaN
	wGrMhpZ2u9/EBd2w3wx7cZVInkb3FOkhyeHpfd469y53cUYMV91dQeUlDoOsIsue
	zEzNpc/xgp+1emmcCsXEf1V4ES/6EVxDqDQBuKbjBR4TrF3D9rZBOXHn/HsJxKqO
	wC5T8g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y65y0j1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 10:42:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51PAgmpi007418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 10:42:48 GMT
Received: from [10.216.5.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Feb
 2025 02:42:44 -0800
Message-ID: <57cd7335-3f13-46ea-bf93-7b5fb0f10973@quicinc.com>
Date: Tue, 25 Feb 2025 16:12:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/13] dt-bindings: net: wireless: describe the ath12k
 AHB module for IPQ5332
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <ath12k@lists.infradead.org>, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250225064834.2002499-1-quic_rajkbhag@quicinc.com>
 <20250225064834.2002499-2-quic_rajkbhag@quicinc.com>
 <20250225-abstract-arcane-chimpanzee-ca7e4f@krzk-bin>
 <4c3009e1-6cd8-4477-95f9-b0fb35b7dc4e@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <4c3009e1-6cd8-4477-95f9-b0fb35b7dc4e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SsZahpdsqZziBCZNNAPfFzIqLtbw8OlC
X-Proofpoint-ORIG-GUID: SsZahpdsqZziBCZNNAPfFzIqLtbw8OlC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_024253_583391_34AF90A8 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

On 2/25/2025 4:04 PM, Krzysztof Kozlowski wrote:
> On 25/02/2025 09:47, Krzysztof Kozlowski wrote:
>> On Tue, Feb 25, 2025 at 12:18:22PM +0530, Raj Kumar Bhagat wrote:
>>> +  memory-region:
>>> +    description:
>>> +      Memory regions used by the ath12k firmware.
>>> +    items:
>>> +      - description: Q6 memory region
>>> +      - description: m3 dump memory region
>>> +      - description: Q6 caldata memory region
>>> +      - description: Multi Link Operation (MLO) Global memory region
>>> +
>>> +  memory-region-names:
>>> +    items:
>>> +      - const: q6-region
>>> +      - const: m3-dump
>>> +      - const: q6-caldb
>>> +      - const: mlo-global-mem
>>> +
>>> +  qcom,ath12k-calibration-variant:
>>
>> qcom,calibration-variant
> 
> FYI:
> 
> https://lore.kernel.org/linux-devicetree/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org/
> 

Thanks, will update in next version.

