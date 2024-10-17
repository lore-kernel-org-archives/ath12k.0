Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45465D3C526
	for <ath12k@archiver.kernel.org>; Thu, 17 Oct 2024 17:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtMxFyOIEur0gAF95CJFZTm6Ybi4WncQfJDpQVB042A=; b=iEtApXGznwmHGn2GQx4mtpSWH4
	5CM1VIWIn99nXGTHGqrMb34sow9FP6tb9/XqIhjd5aUo4XIiSm/+ClUZ87+EwPbMzOWSsEXTop2Dk
	Z+/VjSWvx925FR+unN1N2HE258FBvd94cuCP6dFr0vZDJJFyADMdztyWBk9zvRbZwwEKDH+x7tqFs
	XF1ALUlS9qNRPIFG0PQlmtw81DH6tHdGfKsbzEQALrdCFDd/2zdRJ+Nb+NcCYBqCxB94xGpSTxZP4
	mEukUjJwQ4ecjRdQZ4O13JdKpCaRwlAoGP/OQ2lAmUPP4C/QMdO7+pKV2u+Dlz0YckGYI7jBOl6f8
	7ri1E9cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1UMA-0000000Fj0w-44EQ
	for ath12k@archiver.kernel.org;
	Thu, 17 Oct 2024 17:32:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ULl-0000000FiuM-3bqf
	for ath12k@lists.infradead.org;
	Thu, 17 Oct 2024 17:31:56 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HB4Po4010253;
	Thu, 17 Oct 2024 17:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TtMxFyOIEur0gAF95CJFZTm6Ybi4WncQfJDpQVB042A=; b=SI1rLSwGAcNBmwT7
	aGpMiXlIyAHn2OR0sQ98g1oMkrPSMW7VamMwXySfE8l5d+/Ebw0pHwt0nY9qY2/p
	MQ20glE7TdOkHsoukpnlLX2qdy9atwWEwe1qtP0ssUniLRdY4TWBbl9T7imLM5pK
	khNVs6hkdwBHiWtCPo/eSpzcgIJoxFidUHd3Wolb1yJ2BWAWC8Uwa2h8a1tVmBBP
	uE7M8z/R1qUGh29Se+KMc5GgvEh1GKOK3DE5x+Gp4CDjACWgxRMIPHKnxXzZvZDU
	OTU4LzLIXr2IUj36CqTcl6ss/1gQKs9gBqRkJ2P4R4Nc8YTapD14dVW5Tx6kFvDF
	aQZ1CA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ar052n8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 17:31:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HHVmKV018322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 17:31:48 GMT
Received: from [10.48.241.64] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 10:31:48 -0700
Message-ID: <62c834b6-37b9-49d7-b153-cf4f306a376b@quicinc.com>
Date: Thu, 17 Oct 2024 10:31:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] wifi: ath12k: Support Pager, Counter, SoC, Transmit
 Rate Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241016062617.2726252-1-quic_rdevanat@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20241016062617.2726252-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XO41KqwyWHlQbgUGiK1NgCjAq1v7u-is
X-Proofpoint-ORIG-GUID: XO41KqwyWHlQbgUGiK1NgCjAq1v7u-is
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=976
 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_103149_953255_82CA9116 
X-CRM114-Status: UNSURE (   8.01  )
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

On 10/15/2024 11:26 PM, Roopni Devanathan wrote:
> Add support to request HTT stats type 36, 37, 38 and 40 from firmware.
> These stat types give downlink pager stats, counter and TPC stats, SoC
> common stats and Transmit PER rate stats, respectively.
> 
> Depends-on:
> Depends-on:
> [PATCH v3] wifi: ath12k: Support DMAC Reset Stats
> Link: https://lore.kernel.org/ath12k/20241014065259.3968727-1-quic_rdevanat@quicinc.com/
> 
> [PATCH v3 0/2] wifi: ath12k: Support pdev Rate, Scheduled Algorithm Stats
> Link: https://lore.kernel.org/ath12k/20241014070610.3982173-1-quic_rdevanat@quicinc.com/
> 
> [PATCH v3 0/2] wifi: ath12k: Support AST and Puncture Stats
> Link: https://lore.kernel.org/ath12k/20241014071720.3991199-1-quic_rdevanat@quicinc.com/

This dependency is being deferred since it conflicts with the MLO branch, and
hence this series is also being deferred.

> 
> [PATCH] wifi: ath12k: Support MBSSID Control Frame Stats
> Link: https://lore.kernel.org/ath12k/20241005112651.3379404-1-quic_rdevanat@quicinc.com/
> 
> Dinesh Karthikeyan (4):
>   wifi: ath12k: Support Downlink Pager Stats
>   wifi: ath12k: Support phy counter and TPC stats
>   wifi: ath12k: Support SoC Common Stats
>   wifi: ath12k: Support Transmit PER Rate Stats
> 
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 625 ++++++++++++++++++
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 201 ++++++
>  2 files changed, 826 insertions(+)
> 
> 
> base-commit: 69eabe24843f238e79a6dbbd2b3fcc8eef39d6b8
> prerequisite-patch-id: d2dd6093ab264e75918406abce52bb9ee8199b7e
> prerequisite-patch-id: fcd0ce1adcc63e80c95e4636bd4614bd5b732ffa
> prerequisite-patch-id: a6303524834f6e01b2ae1469ee437d586dd5d522
> prerequisite-patch-id: 1b0f9e702388d0121427f42e7b6a2bc090b62c80
> prerequisite-patch-id: 00097b59822c40089419d22b97f109c26b7f0a10
> prerequisite-patch-id: d3c55f51a5dbb58d547fe1c6b8a3ce10313bae36


