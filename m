Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84468D2E018
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 06:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/xcJ+iRdj0rrmryaUY02+UfmDoPLuPn1s6lQnZEVL0=; b=LatsgRplciLaDUvWzEu8UMkwfk
	hvBkASScjFKvEiIP7XG6xb/yt+pzAyK28dONvLxFt1OGY9qfxZpggvPyV14baj5S9FMr5kTs6fmqK
	z3bzWIwU63CRzdtbdwK3C8dnaNS5yf89gayIexQg0jU9YgM8P0xWGBArV5Eilpi+REdm0a2WD+ao6
	pmpfX6vh5e3rs0Z3xbjCRKuD3sFY+dZPMYaN4rRJI4AU8D9ufpKAAfaJB95zWznSUHuEN5O7ppFv1
	PT0AIUwNq1r46cEZFU9ROK3Pay96TTBIJZr7O4wThemhzjSDrcJFmJoINskkhPJwKdpqABYwcMh3u
	ImrUkrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3VFY-0000000DHEe-11Fq
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 06:53:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3VFV-0000000DHED-174r
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 06:53:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLZuoV017391;
	Wed, 23 Oct 2024 06:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/xcJ+iRdj0rrmryaUY02+UfmDoPLuPn1s6lQnZEVL0=; b=A3ba63Y7IpxUpHdp
	m2pX4rZ/yDW9Ud6BFxYh37iyUymih3YluvYR3lupNYQfxOU812tEyqnngwfPXZA8
	xuuIb8SJnXnInx2Aox6XYsa4vnNpq2Ib3sio99FjgDy+ij0uNKQuHdaABDWm97ue
	2iXo1sH/QdUY93BhuRn+HpVUI6uYyCI5NbjCRj3EQnV+DFDBNeao5wE6n+/0B5mZ
	xT9pp9e9EqtxZw8N2HliRlXM3XYhmrCfr7AvNTsYSr5fm/Tx0zGmn9bY7/aJbb9S
	aJQLzIao5OONdeph+VHyB0ArL4FCx7XKQwT3XzVcTqH67XWjNa+nAgehUJ6xDvdw
	+uShXw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w94s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:53:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N6racb031862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:53:36 GMT
Received: from [10.151.40.160] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 23:53:32 -0700
Message-ID: <e7b27f57-efb2-45ea-bbe0-e5aeb90cbff9@quicinc.com>
Date: Wed, 23 Oct 2024 12:23:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] dt-bindings: net: wireless: update required
 properties for ath12k PCI module
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
 <20241023060352.605019-2-quic_rajkbhag@quicinc.com>
 <87db3d68-ab1a-4cc4-9857-416de39cea0f@kernel.org>
 <e2c1ce1a-89af-4feb-a21a-9ca2578430e7@quicinc.com>
 <b97b8350-3925-40b0-8f87-f89df429a52a@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <b97b8350-3925-40b0-8f87-f89df429a52a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DMGvM9A_59mrmXjV_SF-turbPRBobcxQ
X-Proofpoint-ORIG-GUID: DMGvM9A_59mrmXjV_SF-turbPRBobcxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=680 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410230040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_235341_457456_5C09B8FD 
X-CRM114-Status: GOOD (  13.13  )
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

On 10/23/2024 12:17 PM, Krzysztof Kozlowski wrote:
> On 23/10/2024 08:45, Raj Kumar Bhagat wrote:
>> On 10/23/2024 12:05 PM, Krzysztof Kozlowski wrote:
>>> On 23/10/2024 08:03, Raj Kumar Bhagat wrote:
>>>> The current device-tree bindings for the Ath12K module list many
>>>> WCN7850-specific properties as required. However, these properties are
>>>> not applicable to other Ath12K devices.
>>>>
>>>> Hence, remove WCN7850-specific properties from the required section,
>>>> retaining only generic properties valid across all Ath12K devices.
>>>> WCN7850-specific properties will remain required based on the device's
>>>> compatible enum.
>>> Just not true. These apply to all devices described in this binding.
>>>
>>> NAK.
>>>
>>> Don't send patches for your downstream stuff.
>> This is not for downstream. This series is the per-requisite for ath12k
>> MLO support in upstream.
>>
>> In the subsequent patch [2/6] we are adding new device (QCN9274) in this
>> binding that do not require the WCN7850 specific properties.
>>
>> This is a refactoring patch for the next patch [2/6].
> It's just wrong. Not true. At this point of patch there are no other
> devices. Don't refactor uselessly introducing incorrect hardware

Ok then, If we squash this patch with the next patch [2/6], that actually adding
the new device, then this patch changes are valid right?

