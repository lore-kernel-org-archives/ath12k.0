Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89404C369DC
	for <ath12k@archiver.kernel.org>; Thu,  1 May 2025 15:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGqvCUAFD+WLLdsu08RS5wFaPdJIHfoKd4lSbUUZOeA=; b=ipgOiNKkmrLh4UhlP71SZFKzx4
	qtpMcmelqATglFUMtpwfI4B5rX9jOb8J/r6z3RUdUlGfuOCgkH5kMbhZe8vLLuUACiVlxVjwdOXlS
	ZSp74dxSC7CjdpblAD7JhTnu3lsiSoOd/8p2wxwaKCRu3akGhryvO1uRxjRSJnsJ834UxsrP3Zzoh
	ShP2spAw1nBFpcm45ilWJuYBSdmFX8zAxboNJwnGN6QiaOy8RiJ6fRrtWpWhH8APb8vjbhnqA1ihx
	l8dDgu79RNkV+aN3xrjZJ09MdlpKhVqAffjHkWwerQrd2fR4CXJLCJUCkvUHW5YMxN4XUbnkBetr8
	sQ0za3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVxg-0000000G5zK-0pFf;
	Thu, 01 May 2025 15:36:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVvX-0000000G5ly-3SnF
	for ath12k@lists.infradead.org;
	Thu, 01 May 2025 15:34:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D27HI022161;
	Thu, 1 May 2025 15:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGqvCUAFD+WLLdsu08RS5wFaPdJIHfoKd4lSbUUZOeA=; b=GuEA2rtjuQE6/z4S
	N66WaVIWxA27pWcO0T5MAvu7w8WkHzDtKfmy8/95St3+1Tumq4EZkCRRqKOaNRIe
	c7IYDdzPuD/QODtBwwahpds7CsmqpqNUR2hwud7XkSh/VMDPBC9qAQomzxXdpIbv
	uAsM2wHhGzMqYT8o9QFOf71q2aRb8dUKf29+HGQ1Scg+je28PxcJnCTrhJHRyV72
	A/8gQRjqIZcNOma8cTy66rd30W/9DdRm8C92CvbkOTNUXyL++ONaoWx4fyb2N884
	1udOs7NCx/IrfwxW+lgPEC6tG2CiXb4RjpciOEdQgOzLxUbMcJYc9eG3NnUXmtRD
	SNMkvw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u7wpjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 15:34:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541FYHi6001181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 15:34:17 GMT
Received: from [10.216.13.149] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 May 2025
 08:34:15 -0700
Message-ID: <9f7dcede-caa3-970e-6d37-9f18344665e8@quicinc.com>
Date: Thu, 1 May 2025 21:04:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 3/3] wifi: ath12k: delete mon reap timer
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250107025621.1907-1-quic_kangyang@quicinc.com>
 <20250107025621.1907-4-quic_kangyang@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250107025621.1907-4-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=6813947a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=6qiIiLbJHikK5UX0UKkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: t8qK0ZGOXeyNRck40O29oMjo7eTPt0B2
X-Proofpoint-ORIG-GUID: t8qK0ZGOXeyNRck40O29oMjo7eTPt0B2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDExOCBTYWx0ZWRfX7RP3q9XTFesO 2O5Zzl0TVunXAao0Q9lqo61wkiOjN6jGgk36FDCGh2MJcXkruBAqqsXUc6QxvKXgvofmaO8GjIf AjGDaSqkrfP5V+wn3E0Trb7b4/5OXISJKMLfyKUHpSFEPtKZOd8BhTGv4OMiU3hWHDR4LG645Uq
 VGHWpvUFHP8+ZGHJyaQMQvV15EGimmQqcVs/eOW8WUcb5SVCVv5YfDs7uqi48bQvJ0NhQUhj2nN TIc6B8I2lXsGXgKU6fTeYLSEX3jGWsi8EvwGiKZEyB80GNKWduzlnHGCJAQear0mLj2ovlKFBfk 00bSz2TSuEFqbto88umQNa63BO1UrUXDBQwGTzEds7ch3WwOXK9+MIgKVPJOI6x6C1KMzBKB3h3
 XgIl05bgcLDFvlNO+8uC8IpS0RcoenwkH5218+uKbXA/siKIP9PVt6DHKF72ZswaMYyzgjft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=837 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_083419_872588_B55F8743 
X-CRM114-Status: GOOD (  16.04  )
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



On 1/7/2025 8:26 AM, Kang Yang wrote:
> Currently mon reap timer is not used, and it is not needed anymore.
> 
> So remove related code.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.h |  2 --
>   drivers/net/wireless/ath/ath12k/dp.c   | 30 +-------------------------
>   2 files changed, 1 insertion(+), 31 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 41a51c7bad6c..ad2451fd7ce9 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -992,8 +992,6 @@ struct ath12k_base {
>   	struct ath12k_dbring_cap *db_caps;
>   	u32 num_db_cap;
>   
> -	struct timer_list mon_reap_timer;
> -
>   	struct completion htc_suspend;
>   
>   	u64 fw_soc_drop_count;
> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
> index 9e5a4e75f2f6..f162f98e7b79 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/dp.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #include <crypto/hash.h>
> @@ -982,11 +982,6 @@ void ath12k_dp_pdev_free(struct ath12k_base *ab)
>   {
>   	int i;
>   
> -	if (!ab->mon_reap_timer.function)
> -		return;

This dead code removal change also fixes a memory leak in rxdma_mon_dst_ring with QCN
chipset. Bailing out based on the timer setup will leave the memory allocated
for rxdma_mon_dst_ring unfreed as rxdma_mon_dst_ring is allocated when the mon_reap_timer
is not setup.

Vasanth

