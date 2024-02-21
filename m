Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB2AC48BC3
	for <ath12k@archiver.kernel.org>; Wed, 21 Feb 2024 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Up5OiSJPtByuUJ5N/MVp5+gGdCLOb4T2zv/QM0xeTIE=; b=BVWBqrI8oynKkrlfY/DyJfis9A
	nDrY3TslT6DDJ7D3bgxeS+tnbVchlWCVUcgaAvt7rneYSxN06Eqts6xHmzyVxoHpf8qM+31cgscd+
	K/xmHSYh7nyJQs9bb3qLUuhnXk0Q+qwrAO3DrqM6uoPc9sVe+qaGPy0vQSlRFqLEKlkGz8vTXcADm
	2omoEE1DtIQg+4GV1ZZOPbNvwT+O4KZBDv3SRSRHzN0MZCWmtXDfprmuQ4kmQshlA/xcP9IL/ta5x
	WYdCXH/N2VpmP8s2pFqjK+ikeetmsovDJ8raRse8AW9v+QObHFH0hbIDALZpvmw1W9RTAXdCkcF8m
	DBZjE68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcpHa-00000001g15-1gq5
	for ath12k@archiver.kernel.org;
	Wed, 21 Feb 2024 16:17:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcpHX-00000001g08-1tqW
	for ath12k@lists.infradead.org;
	Wed, 21 Feb 2024 16:17:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41LDD7Df019284;
	Wed, 21 Feb 2024 16:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Up5OiSJPtByuUJ5N/MVp5+gGdCLOb4T2zv/QM0xeTIE=; b=As
	oYCcrpz5Mevnzfbo1husL6FUHusaCAnmc0LAxsmm/9OzL9glKeDWXOMaPpN23nEO
	Q6NSg74tUMVfUP369Mv/Q5n4jXOaApBieRLzYvfS89i2UsSSuY4ao7HAdTiMpGqE
	sfoG/RqIRb/MnSE4M8jwBZZwBSPh4pCh7+wV0kCAefvOc7qwJG4J9T+6843xU8Qq
	7fIH1gn7tQYLepkUhZLFpQejN2legGDs2UWu2H//WfwYGwLG77xZL1UxHINOaElb
	4asIIaEVyYjt3wu/wMf3ub9Y/EiO1gQglMyMLQi7OtJ7DpT1/IywfmbSTBhK5Jtx
	4rKMA/T7HSQX9cscbLKw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdgge0nhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 16:17:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41LGH4fA001353
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 16:17:04 GMT
Received: from [10.110.34.22] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 08:17:04 -0800
Message-ID: <19bd12e3-e943-4d93-a8d3-ae8103d50e6c@quicinc.com>
Date: Wed, 21 Feb 2024 08:17:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath12k: report tx bitrate for iw dev xxx station
 dump
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240219095802.1147-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240219095802.1147-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dt3mMg-lpiOsp_8XjMaQ9UmkTHv1VJkx
X-Proofpoint-ORIG-GUID: dt3mMg-lpiOsp_8XjMaQ9UmkTHv1VJkx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-21_03,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxlogscore=978
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_081715_538294_CCF17EBC 
X-CRM114-Status: GOOD (  11.93  )
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

On 2/19/2024 1:58 AM, Lingbo Kong wrote:
> The tx bitrate of "iw dev xxx station dump" always show an invalid value
> "tx bitrate: 6.0MBit/s".
> 
> To address this issue, parse the tx complete report from firmware and
> indicate the tx rate to mac80211.
> 
> After that, "iw dev xxx station dump" show the correct tx bitrate such as:
> tx bitrate: 104.0 MBit/s MCS 13
> tx bitrate: 144.4 MBit/s MCS 15 short GI
> tx bitrate: 626.9 MBit/s 80MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0
> tx bitrate: 1921.5 MBit/s 160MHz HE-MCS 9 HE-NSS 2 HE-GI 0 HE-DCM 0
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

With one correction below which Kalle can make in the pending branch
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> diff --git a/drivers/net/wireless/ath/ath12k/hal_tx.h b/drivers/net/wireless/ath/ath12k/hal_tx.h
> index 7c837094a6f7..7cfc584649ad 100644
> --- a/drivers/net/wireless/ath/ath12k/hal_tx.h
> +++ b/drivers/net/wireless/ath/ath12k/hal_tx.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>  /*
>   * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.

since no changes were made in 2023 should be 2021-2022, 2024



