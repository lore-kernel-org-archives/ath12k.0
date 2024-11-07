Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A645BD5AE61
	for <ath12k@archiver.kernel.org>; Thu,  7 Nov 2024 04:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=674JsR+74WDU+DeXRuClw9K98WoQD8yNovT8Da/Kxp8=; b=GAlXbQuZ8x8xmRW/KrEU2nA0GW
	i+uEWWg5O5wj6dnud6y3hycL7BcR8bC+LVK4kwe1/hiGAwzfLSKlRoUTIaCqygp/J6uTkAPuPN3V3
	oYUuh/BKyHIe0yuIvJZtIyIlALnBNPUizxSFjKdioJEaHoBnYnhUU/RS+gLPtnhf+P9FyNRifxhbU
	YSP8194TvuMW7qFA6ApBUyrKCZuWwI6WxK8QVN394QsT1MH4SE8m1JD4HlN6gHpYaQZ5q72TpgUEg
	Qh7kPMAW2xnWsxYhD3URSvLPCaOnAGiRsRh28FizCsKoIT5hJa7BLjMxYCx2I/mS/cpxjsuWerzNV
	kheqML8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8uLB-00000005eAo-15h8
	for ath12k@archiver.kernel.org;
	Thu, 07 Nov 2024 04:41:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8uJt-00000005e3K-2WXR
	for ath12k@lists.infradead.org;
	Thu, 07 Nov 2024 04:40:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A710DtG003824;
	Thu, 7 Nov 2024 04:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	674JsR+74WDU+DeXRuClw9K98WoQD8yNovT8Da/Kxp8=; b=L1aNA8+6v1viAXH5
	4cD5JzR7l+Cv067BQpwtpTgytTsOH2bfCX4EpKkGFwcZyMZ8P259ym/XwdOaRsZK
	OLIG0ITwILNU+s3eLP2ZNFIkNpSt68zXCXhfn4zjB4nZjn8YWVo/9YaaUBqwyZxA
	fSl1oXZ2Rjyf120DVWpdmDtJ/af3ylE7hVqaWpxjPpPqT0E7//NDykRU5OLGSEjv
	A0rDE3/GsTd0+FYOGtkFuDh8jGu/MoTUWjr7MUSNZgeg9aRDtbvn3iaDd+lTB1YL
	Dcup9+W3lfKjNXcV4mIFHUCsXdeXQGZpl2AHxDRqXQGMjcIDi0mYucmU+KrOCwyu
	05m9eA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qhbue19r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 04:40:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A74eVZa006627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 04:40:31 GMT
Received: from [10.48.242.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 20:40:30 -0800
Message-ID: <70aa1ba8-b648-4be0-af6a-db424010d743@quicinc.com>
Date: Wed, 6 Nov 2024 20:40:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] wifi: ath12k: Support Pager, Counter, SoC,
 Transmit Rate Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241106044548.3530128-1-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241106044548.3530128-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Nww6r40upfz6OdkFIWYm_lXfNydtk2yA
X-Proofpoint-GUID: Nww6r40upfz6OdkFIWYm_lXfNydtk2yA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_204033_814617_C9687C4A 
X-CRM114-Status: UNSURE (   9.54  )
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

On 11/5/2024 8:45 PM, Roopni Devanathan wrote:
> Add support to request HTT stats type 36, 37, 38 and 40 from firmware.
> These stat types give downlink pager stats, counter and TPC stats, SoC
> common stats and Transmit PER rate stats, respectively.
> 
> v4:
>  - Addressed Jeff's comments pertaining to data type conversions.
> v3:
>  - Added macros to fix compilation issues.
> v2:
>  - Removed dependencies. No change in code.
> 
> Dinesh Karthikeyan (4):
>   wifi: ath12k: Support Downlink Pager Stats
>   wifi: ath12k: Support phy counter and TPC stats
>   wifi: ath12k: Support SoC Common Stats
>   wifi: ath12k: Support Transmit PER Rate Stats
> 
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 630 +++++++++++++++++-
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 204 +++++-
>  2 files changed, 831 insertions(+), 3 deletions(-)
> 
> 
> base-commit: d63fbff74ab1af1573c1dca20cfe1e876f8ffa62

when I build this series with W=1

drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c: In function 'ath12k_htt_print_dlpager_entry':
drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2582:13: warning: variable 'ts_hi' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2581:13: warning: variable 'ts_lo' set but not used [-Wunused-but-set-variable]

I can remove these locally in 'pending' if there are no other issues.

/jeff

