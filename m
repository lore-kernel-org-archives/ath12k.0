Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1F2C4167B
	for <ath12k@archiver.kernel.org>; Mon, 30 Oct 2023 15:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvAsZKQIdtiPkB8CUyWBggsMW1GSdwRRtAuM1sRRSVQ=; b=Znf1IGuc5QrpT0
	+HDlH+eB1hoT8K20PF981o6o+KeoYk7u5ae6mpQYeBlGLm+cRZ/J2UG2+2IPONgGhA0o1jfvyJMv7
	YK86i91hsnj0uPS3Mx0YSsqYUXYrgzn1F73yb718y4wkY++u2zcMN5DDybGoUxUI2XN5XB35J4Ytx
	1gVl/w6taym+cAzuatknIccW35W78Q9/wnGwigOWL34LnqmL4NP2w01VnBa0TM9Hav7XcRI0G1xu8
	aLHeRX2Ifw+fuFoFkMKm82KnXV4OKV5UV+2I3lQxKNiA9he/1Ls69ROXjxaLlTymJ4X0efkYgrEPg
	4insqGzBZx7lRAt04uWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxU4u-003YFe-1G
	for ath12k@archiver.kernel.org;
	Mon, 30 Oct 2023 15:21:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxU4r-003YEs-0R
	for ath12k@lists.infradead.org;
	Mon, 30 Oct 2023 15:21:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39UETcKd029305;
	Mon, 30 Oct 2023 15:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=H3eZE4DZn65NWeuqSCuidbpplsFRTL7jQx5TLve6sd0=;
 b=bUDEvItxVr4kVZiqmdKHCK5A8sf6B4rcrpdScQNenrJsoS9hkJJaKG+HLzDAUzatLcC4
 gp45p8i4sVAp8DFpk5bbQ1Y8oHhhEq6Tpi39tC7mLnn3OtlhbwHgIb9o1A6/HoIDpMXj
 m4ibq2uuQIyxZXsn3j5SsSAI9p5zN6wLi0ShNXnqkSG25aiRlgvEibUyP9B7pC0vaJbs
 px3NlHn2VSBlrB+6pZjohSmTf+SzgaBTHj38d0lyc+yK7j5eot323/iMgmo58hxBhC7h
 ZxtucN54TN9uJ6xgER6dpG8lkMc/atjm7xYAOUceiVSM9zj7TnIUw24Y09rX+334+WR0 tg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u0smrm8vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 15:21:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UFKscb005844
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 15:20:54 GMT
Received: from [10.48.245.206] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 08:20:54 -0700
Message-ID: <ed73e278-82cc-4805-b096-ed358657e5ec@quicinc.com>
Date: Mon, 30 Oct 2023 08:20:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] wifi: ath: create common testmode_i.h file for ath
 drivers
Content-Language: en-US
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231030082749.17855-1-quic_aarasahu@quicinc.com>
 <20231030082749.17855-2-quic_aarasahu@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231030082749.17855-2-quic_aarasahu@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LYpGdui-RLEqT4_8lC7F0433IrI3i6Ma
X-Proofpoint-GUID: LYpGdui-RLEqT4_8lC7F0433IrI3i6Ma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_10,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 mlxlogscore=984 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310300118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_082117_290099_47FE8ABB 
X-CRM114-Status: GOOD (  15.79  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 10/30/2023 1:27 AM, Aaradhana Sahu wrote:
> User space application requires that the testmode interface
> is exactly same between ath drivers. Move testmode_i.h file
> in ath directory to ensure that all ath driver uses same testmode
> interface instead of duplicating testmode_i.h for each ath drivers.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/testmode.c    | 78 +++++++++----------
>   .../wireless/ath/{ath11k => }/testmode_i.h    | 52 ++++++-------
>   2 files changed, 65 insertions(+), 65 deletions(-)
>   rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (53%)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
> index 43bb23265d34..5da5e53f3eac 100644
> --- a/drivers/net/wireless/ath/ath11k/testmode.c
> +++ b/drivers/net/wireless/ath/ath11k/testmode.c
> @@ -10,18 +10,18 @@
>   #include "wmi.h"
>   #include "hw.h"
>   #include "core.h"
> -#include "testmode_i.h"
> +#include "../testmode_i.h"
>   
>   #define ATH11K_FTM_SEGHDR_CURRENT_SEQ		GENMASK(3, 0)
>   #define ATH11K_FTM_SEGHDR_TOTAL_SEGMENTS	GENMASK(7, 4)
>   
> -static const struct nla_policy ath11k_tm_policy[ATH11K_TM_ATTR_MAX + 1] = {
> -	[ATH11K_TM_ATTR_CMD]		= { .type = NLA_U32 },
> -	[ATH11K_TM_ATTR_DATA]		= { .type = NLA_BINARY,
> -					    .len = ATH11K_TM_DATA_MAX_LEN },
> -	[ATH11K_TM_ATTR_WMI_CMDID]	= { .type = NLA_U32 },
> -	[ATH11K_TM_ATTR_VERSION_MAJOR]	= { .type = NLA_U32 },
> -	[ATH11K_TM_ATTR_VERSION_MINOR]	= { .type = NLA_U32 },
> +static const struct nla_policy ath11k_tm_policy[ATH_TM_ATTR_MAX + 1] = {
> +	[ATH_TM_ATTR_CMD]		= { .type = NLA_U32 },
> +	[ATH_TM_ATTR_DATA]		= { .type = NLA_BINARY,
> +					    .len = ATH_TM_DATA_MAX_LEN },
> +	[ATH_TM_ATTR_WMI_CMDID]	= { .type = NLA_U32 },

maintain vertical alignment of "="

> +	[ATH_TM_ATTR_VERSION_MAJOR]	= { .type = NLA_U32 },
> +	[ATH_TM_ATTR_VERSION_MINOR]	= { .type = NLA_U32 },
>   };


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
