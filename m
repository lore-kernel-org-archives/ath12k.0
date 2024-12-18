Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8978FE77187
	for <ath12k@archiver.kernel.org>; Wed, 18 Dec 2024 17:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuuW3tVcMOJmBdlb+um6PeoMAYru60GAvWKIRwLajbc=; b=Lv9fzYN6fSHgMeZ2B/V6Wj2Zmy
	ZObOXFCaRQ08vBNFgu36Ep/9wzFpfDksuMp1TAjGGtozV8kCo80mXMJ17AWAtQ09MI8uQVNmn9lv3
	2ep80NrQipcDcE6yjE9ulaPeB1e02LLtoOdM4tGZa+y7iqpRZL2gH/UakbxHzaGb3euvSMf08uYeS
	tmH+xrFoWrRHyFiak2kSMmWBES25JPBQAYVY4i0JYpDrfdu7znMAQgiUh8sZo0oZNi3nyE41S/0r6
	XMnxZBxeGovVpb5mjKhC1xtnFdcEzxXCerMDkJ413eIizbhwbks+18M+ccWwmd9S7lKJkmLDRZwnv
	jQRH1Mrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNxWZ-0000000HH1u-1Bll
	for ath12k@archiver.kernel.org;
	Wed, 18 Dec 2024 17:07:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNxVu-0000000HGtf-0kIh
	for ath12k@lists.infradead.org;
	Wed, 18 Dec 2024 17:07:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIGR0mN001514;
	Wed, 18 Dec 2024 17:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SuuW3tVcMOJmBdlb+um6PeoMAYru60GAvWKIRwLajbc=; b=jC6yJCHvlrrLKbIY
	zqP8CG9D94abIWcmN4U6L7G8Xcqemod1AOgVB6ZFhNEP3TG21ZOJ4VQxQpZwxTZh
	ZyFi2ctr2xA6QGCJfPGohLFr7pIbc7TWKZdC+DHoqPMjVB4tYWw7axx9z+FXJJme
	4JKGulsJWI+Ecth9qZBjIpnivYFZu+FG6P4Y6tDtGPDDOnytoyNF+edr95j0iQ+B
	TOsUzKm/Ebc4izxin9XTHiaA3YhbQo+1pnP68jfDhzObanyu3eK3PSUSw+3Kw+D6
	UPpcTNF7554HjuZ1ZlfE0+Qrz+kwBHlbz0rHBuGJ7PGvEiyQeXegNjnDH+wk/jNI
	xhe4gQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kr1xstyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 17:07:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIH73ep010589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 17:07:03 GMT
Received: from [10.50.9.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 09:07:02 -0800
Message-ID: <f141f19a-0106-4eaa-ab08-ed92bd965c42@quicinc.com>
Date: Wed, 18 Dec 2024 22:36:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Add support for parsing 64-bit TLVs
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241204071238.948885-1-quic_ppranees@quicinc.com>
 <87o71bmwoe.fsf@kernel.org>
 <fda72aba-f878-426f-b410-a4cecf77d1c3@quicinc.com>
 <87ldweksqt.fsf@kernel.org>
Content-Language: en-US
From: Praneesh P <quic_ppranees@quicinc.com>
In-Reply-To: <87ldweksqt.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KkQpuwXxWrJ1nNBwzoxmxC3PXKvQdLcK
X-Proofpoint-ORIG-GUID: KkQpuwXxWrJ1nNBwzoxmxC3PXKvQdLcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=702
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_090710_332468_334C9E3A 
X-CRM114-Status: UNSURE (   7.98  )
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


On 12/18/2024 1:05 AM, Kalle Valo wrote:
> I am not exactly looking for a Tested-on tag. What I'm asking is that
> people take into account WCN7850 when designing and writing patches
> ath12k. For example, is the firmware interface same and similar
> functional differences between supported hardware families.
I'll make sure to keep this in mind for future patches.


