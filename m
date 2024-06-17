Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26AEC27C79
	for <ath12k@archiver.kernel.org>; Mon, 17 Jun 2024 21:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NbeHXEErNBY2VLi/FKG3KB3c3jw5WRugKv6LT1HXJw=; b=bjQmm9bVK2totprtaMUDYHA4ik
	Fl0I4b7eV/DWl1f3BIs2U7VZ7i//Yj4EQApjaNyPNkuh9lb0rbye2ZHZtnBvpMbH3lJK6K0TWwdVh
	cXt4xNxK+aEUP1e9o1ZKlU51f5m2xOBuhie6srwljAtHNhHJ0DiDiYZ2HOdIBHHT6H9mTUZPGaffq
	P3sA5OELBCCNncM2bmjfqB+daVe16SMnnQPhJePrFPvR5bZdEjrLMFC0XBmNfu0yk5AbksWKow0FA
	D8uWLa22cQUm/DDoAwoI0HxXeJfR3xJVVe0ggX1q+ojtde/PNeH2DCUrMcFd+Id516Y+Wms50rZi1
	M5iHB3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJK4S-0000000CiH0-139F
	for ath12k@archiver.kernel.org;
	Mon, 17 Jun 2024 21:39:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJK4O-0000000CiGV-3ZfJ
	for ath12k@lists.infradead.org;
	Mon, 17 Jun 2024 21:39:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HAjaR8002135;
	Mon, 17 Jun 2024 21:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NbeHXEErNBY2VLi/FKG3KB3c3jw5WRugKv6LT1HXJw=; b=QZurCP5pOGyAKs1C
	2xvypFrO2uD5OPwn11FvFJA9hQFhFQXNSS13kiyozGtaG1hOh1jcNLCnZSZnxmhh
	cC5hidIrIQQz2i3eBhbopZvnz9iKS0ZtVTOHZ4r2rxJTLuWKe++VomGsIp/vi/iW
	Vmq/4MSYQbayDkVeWbUomh/DPFYpuxIzkXuqAk/F0FRNUlNajAP1/6PxSwNjHaP6
	DINr64/VvyAsLwz3yhDsSST20E4uRAR4SoFw3zbAiVY5V+gSV6F+TL6zTCwJCFBm
	6NNTxtIFsaTlRZOe/hGRwrEXYZRdg8gSXk/sffvm4tH7shBmboTkd966dKs55DCx
	HBjkyg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys31u4vxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 21:39:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HLdHoX011931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 21:39:17 GMT
Received: from [10.48.243.231] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 14:39:17 -0700
Message-ID: <255df1aa-8d06-4d6e-82f0-577aff3ebe5f@quicinc.com>
Date: Mon, 17 Jun 2024 14:39:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] wifi: ath: create common testmode_i.h file for ath
 drivers
Content-Language: en-US
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240617052903.2720292-1-quic_aarasahu@quicinc.com>
 <20240617052903.2720292-2-quic_aarasahu@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240617052903.2720292-2-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lFHwbMqy6TMt06kkGXRH9CPfroouXNhi
X-Proofpoint-ORIG-GUID: lFHwbMqy6TMt06kkGXRH9CPfroouXNhi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=625 bulkscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406170167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_143921_502138_FAC5F4D3 
X-CRM114-Status: GOOD (  13.41  )
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

On 6/16/2024 10:29 PM, Aaradhana Sahu wrote:
> User space application requires that the testmode interface
> is exactly same between ath drivers. Move testmode_i.h file
> in ath directory to ensure that all ath driver uses same testmode
> interface instead of duplicating testmode_i.h for each ath drivers.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/testmode.c    | 78 +++++++++----------
>  .../wireless/ath/{ath11k => }/testmode_i.h    | 54 ++++++-------
>  2 files changed, 66 insertions(+), 66 deletions(-)
>  rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)
> 
...
> diff --git a/drivers/net/wireless/ath/ath11k/testmode_i.h b/drivers/net/wireless/ath/testmode_i.h
> similarity index 50%
> rename from drivers/net/wireless/ath/ath11k/testmode_i.h
> rename to drivers/net/wireless/ath/testmode_i.h
> index 91b83873d660..ac852642bde1 100644
> --- a/drivers/net/wireless/ath/ath11k/testmode_i.h
> +++ b/drivers/net/wireless/ath/testmode_i.h
> @@ -1,59 +1,59 @@
>  /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>  /*
>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.

this should be
 * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.

>   */


