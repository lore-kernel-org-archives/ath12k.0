Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BCBCA0ED3
	for <ath12k@archiver.kernel.org>; Wed,  4 Sep 2024 07:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZPHPgFE2y2jIq87+7Pqn8sjg0KCVwLtQG7t58n9728=; b=EOYOCFM72QFZY6jtjnnK2vGU58
	wLkDiBLpvTMcYU/S5+hf8rwRagvRIqEJUHDzQ5M1tl7+FHZHnxCIws0TbOh5H5mryy9QkMoi/NAFD
	lsaLq6DVI+lojHdLBda+z8yn3XlPr8zH578WqqPDtzi1JoIzZ6CL/Bm0n0iQXn5DWvpWj/F5fFNYy
	YlzQcl6ttkqeC+3b3cQSOVtucuw8LLRrSlm2SNNxk2mS0aphXMmVoMftrr0s1SCMMPNhc4Qc/9gi0
	/ZZkQlgnTcDgDW8SNPoq6uj5EsAoM82TOA6NoVKit/689R14gV8cWDhJWnJeTaof9c6JNmsccFIO5
	J59laMSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slkRV-00000003Bba-3qJl
	for ath12k@archiver.kernel.org;
	Wed, 04 Sep 2024 07:28:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slkR0-00000003BUL-1NGf
	for ath12k@lists.infradead.org;
	Wed, 04 Sep 2024 07:28:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483LhY2n004948;
	Wed, 4 Sep 2024 07:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZPHPgFE2y2jIq87+7Pqn8sjg0KCVwLtQG7t58n9728=; b=p7Dp7xyiCvLD94pP
	nlNbtH4O7Qqf3D3BtpfPJQg8naO7lQ8nWBUxTi4MahasrTBhnY4j0m96CY3AE2xM
	BPSpgUDX/VGuhEUBq5VbfOjZDQ4Fg1DnOlzAu/UKs0sFQW0cVNPz6dJurO8vOlR5
	fvx30NNs369apZqPfKXTUFFYzpHNHLqsQedubbc2ia6dKAtJeDGAHZsF1XIrpAu2
	0DSxMKHr1idCTGhfbTCi47+zwwhGAY33Z+YHzWXQLcrYavBMB4IIdv87XWC1Wc6+
	3JzFhMX795JP/R+ylqZ/M8TtEjsc/XY4SRC35ME5S58iCUKUHU1Afo2kEr6jc2qY
	jsRzxA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41drqe45k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 07:28:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4847S0uj005917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 07:28:00 GMT
Received: from [10.216.28.224] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 00:27:58 -0700
Message-ID: <3555f0cc-2177-4afc-9879-6a78850d2bc2@quicinc.com>
Date: Wed, 4 Sep 2024 12:57:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/18] dt-bindings: net: wireless: describe the ath12k
 AHB module
To: Krzysztof Kozlowski <krzk@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240814094323.3927603-1-quic_rajkbhag@quicinc.com>
 <20240814094323.3927603-2-quic_rajkbhag@quicinc.com>
 <f8cd9c3d-47e1-4709-9334-78e4790acef0@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <f8cd9c3d-47e1-4709-9334-78e4790acef0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YN0bEnjcaZL8b0Mqdzn6-wlfk_A4mhrq
X-Proofpoint-ORIG-GUID: YN0bEnjcaZL8b0Mqdzn6-wlfk_A4mhrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_05,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=904 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409040056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_002810_524839_8F6B8771 
X-CRM114-Status: UNSURE (   9.01  )
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

On 8/16/2024 11:14 AM, Krzysztof Kozlowski wrote:
> On 14/08/2024 11:43, Raj Kumar Bhagat wrote:
>> +  qcom,bdf-addr:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      System RAM memory address reserved for board data.
> 
> Also drop. We do not store RAM offsets in DT.
> 

Sure, we will move this to driver hardware parameter.

> Best regards,
> Krzysztof
> 
> 


