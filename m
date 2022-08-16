Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8336C25B0E
	for <ath12k@archiver.kernel.org>; Tue, 16 Aug 2022 20:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyqdBaXtAvOUQf8TUR4COBkMhMILmek1gzErmOy2epk=; b=VIvuOqXLbjAkdQ
	xIi7Cy2IaFZxkVskqAiJQ5Ke7T+hp+AVCKawZ8GObdNLg1dA43yOWatKnZ7oyEWkcQpoLW/IbK6Pj
	CtO+h+65n/hN+xbjJyN609du68uw+HOmvnAg5buzLD+1Jit2WNQEadL/TMknvjoDS2+410KKWz80P
	OjUBVLg+yA5G9/3m525B8YgtJfvAhUXjfiHu2VTvrnrajawkWys/2sW+pK+fH5234hdjIYJ+z3FK9
	dR5TQswUAbGbav0iVdPqtd39EdkfZixF2WHVII7xFaYS3cymDTAClt7YzAKtxsRqQHRTCuiKfFn1e
	6hC4hn8oFDd7EXyfwylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO2ws-006ggt-TW
	for ath12k@archiver.kernel.org; Tue, 16 Aug 2022 20:14:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO2wp-006gc1-5N
	for ath12k@lists.infradead.org; Tue, 16 Aug 2022 20:14:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27GH7cb7028902;
	Tue, 16 Aug 2022 20:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8P0soDbJ1oOjlkfNXwBRd7XDxxptQKqyFMf5Zy4fKTA=;
 b=LRCG5HPV77uZt2DE3VEEmUWI5cCcFpmFmknPF9WascW8souOhoOYaIJ+hPFkt/LMUKQD
 WcrBchcznxa/qMQd/qNgW7OlkQCBLDwj+tyN8fbM3zIOQRiRp9QRGKVXNHwCEmeO2Ocv
 qOFY45zpViAL54907i53rB2WESoPQmi7aaWIFBtgbyLPK3f6gSSyIPbSvG7WBaeyK3ou
 +tHiLjvyVywRXG8Zw5a/ILgbjGGxMUGxnNs5c0+zkhsB7nj+xULMcoFR6qCmt8vUHXhw
 BSnEO0D0vnvKfShTgemCzsvWduDXwisT9yLK3Wv7RAPLIkzv5zkIm6vSdQ6ISsIggt6+ Bw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j08un22kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Aug 2022 20:13:48 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.47.97.222])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27GKDl9b012804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Aug 2022 20:13:47 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 16 Aug 2022 13:13:47 -0700
Received: from [10.110.78.115] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 16 Aug
 2022 13:13:47 -0700
Message-ID: <e4c2c436-82e2-bf15-a635-e8f4e566d8d2@quicinc.com>
Date: Tue, 16 Aug 2022 13:13:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 13/50] wifi: ath12k: add dp_mon.c
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-14-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220812161003.27279-14-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: csbTEcF5SYzLZQP7OcvtV-9CuiPgyHbN
X-Proofpoint-GUID: csbTEcF5SYzLZQP7OcvtV-9CuiPgyHbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxlogscore=990 mlxscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208160075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_131359_374960_3F996EA0 
X-CRM114-Status: GOOD (  18.66  )
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

On 8/12/2022 9:09 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> (Patches split into one patch per file for easier review, but the final
> commit will be one big patch. See the cover letter for more info.)
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/dp_mon.c | 2598 ++++++++++++++++++++++++++++++
>   1 file changed, 2598 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
> new file mode 100644
> index 000000000000..479be0e441d8
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
> @@ -0,0 +1,2598 @@
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
> +/*
> + * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "dp_mon.h"
> +#include "debug.h"
> +#include "dp_rx.h"
> +#include "dp_tx.h"
> +#include "peer.h"
> +
> +static void ath12k_dp_mon_rx_handle_ofdma_info(void *rx_tlv,
> +					       struct hal_rx_user_status *rx_user_status)
> +{
> +	struct hal_rx_ppdu_end_user_stats *ppdu_end_user =
> +				(struct hal_rx_ppdu_end_user_stats *)rx_tlv;
> +
> +	rx_user_status->ul_ofdma_user_v0_word0 = __le32_to_cpu(ppdu_end_user->info6);
> +	rx_user_status->ul_ofdma_user_v0_word1 = __le32_to_cpu(ppdu_end_user->rsvd2[10]);

this violates the convention that info* is used for fields that are 
accessed while rsvd* is used for fields that are not accessed. in 
addition, use of magic number offsets is also not nice.

imo what would improve this code is to have accessor macros/inline 
functions defined co-resident with the struct so that all the magic 
numbers and magic fields are contained within the acessors, and the 
actual code here looks really readable.

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
