Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765FDC00140
	for <ath12k@archiver.kernel.org>; Thu, 18 Aug 2022 21:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8P9K7I2tT6MVorayDK+YnoNV6/ukrXUMbKlKJoaegpA=; b=pa58gxsyfjWaHS
	oupuzZn99qsR2Cp/9HlhuZ8MhT+90LtKwZ679uLDFEKtOWA2JGfzmt4YKqwT1/eTF0i6Q6iV+7ORo
	JUWAV3kXz0OyY/rZYQnJqjeyBmdKAgSd1bUBExg9reHrvJ8vmSwbpAnqHbYwoqzMS3UwQwWsFXEZe
	TxMtvRs/vsoHBNGeM7TAO6L7j6bCrjEcwc55zSXyxNYZ1pW18rsP3/+7JBNlcWnal44eiiPMOjewv
	967rh8N5M4aUUqNOsaK8TJ4PT8p9Ewsk/muD/3j69w6Xn4jNmQ1WYP12+Q1a8p/74+CEfB/XRn/7j
	agAWIt+qXY34NYp/s5Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOn6p-009rqh-UI
	for ath12k@archiver.kernel.org; Thu, 18 Aug 2022 21:31:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOn6m-009rnz-Ls
	for ath12k@lists.infradead.org; Thu, 18 Aug 2022 21:31:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IIYlPR029930;
	Thu, 18 Aug 2022 21:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UtpiCFcIG1LuHFj6d8UH6ONFJENGvTVbFYkQtu8I7V8=;
 b=Gpx+YozSMV+FXKuFWW9WNMtAVClRQjGqKdATEp8+R5T1bjMDCaUWd7cjj1nqa/XCo1do
 S2BF0gN9TZw+pRVWILViDLUaQ1R6at8Nku+d7JTJJsUSUUuY6uUBOrVoUlWS43pCiz5r
 YQOp6VEBoC0noD+DyB0jHtrVqTvkex3tnI9IEFcohomIiIWI5M1AqZ5OaT/9Zbih+mcw
 Es513b1SC4hwh2DnEhGSrQX8Zat4CYj1aiRfpoLwULxLNwqYJGC3DgC/w740o3TjiDuA
 HQA/LLhtqEacJhY5V0NeevtxrYG2TpSLgx9ONr3DBvS0uBGWdcR5KqTojE8sRu6bb5ug UA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j1ttq8e6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 21:31:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27ILVHSc026966
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 21:31:17 GMT
Received: from [10.110.11.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 18 Aug
 2022 14:31:16 -0700
Message-ID: <5babeb15-801d-b280-b8fc-c87ba980c9ff@quicinc.com>
Date: Thu, 18 Aug 2022 14:31:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 29/50] wifi: ath12k: add hw.c
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-30-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220812161003.27279-30-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9gGJIOCWoERf7AQbVQPAhRvxuiwYYul_
X-Proofpoint-ORIG-GUID: 9gGJIOCWoERf7AQbVQPAhRvxuiwYYul_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_16,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_143120_765200_614D32A9 
X-CRM114-Status: GOOD (  14.29  )
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
>   drivers/net/wireless/ath/ath12k/hw.c | 961 +++++++++++++++++++++++++++++++++++
>   1 file changed, 961 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c

snip

> +static const struct ath12k_hw_ring_mask ath12k_hw_ring_mask_qcn9274 = {
> +	.tx  = {
> +		ATH12K_TX_RING_MASK_0,
> +		ATH12K_TX_RING_MASK_1,
> +		ATH12K_TX_RING_MASK_2,
> +		ATH12K_TX_RING_MASK_3,
> +	},
> +	.rx_mon_dest = {
> +		0, 0, 0,
> +		ATH12K_RX_MON_RING_MASK_0,
> +		ATH12K_RX_MON_RING_MASK_1,
> +		ATH12K_RX_MON_RING_MASK_2,
> +	},
> +	.rx = {
> +		0, 0, 0, 0,
> +		ATH12K_RX_RING_MASK_0,
> +		ATH12K_RX_RING_MASK_1,
> +		ATH12K_RX_RING_MASK_2,
> +		ATH12K_RX_RING_MASK_3,
> +	},
> +	.rx_err = {
> +		0, 0, 0,
> +		ATH12K_RX_ERR_RING_MASK_0,
> +	},
> +	.rx_wbm_rel = {
> +		0, 0, 0,
> +		ATH12K_RX_WBM_REL_RING_MASK_0,
> +	},
> +	.reo_status = {
> +		0, 0, 0,
> +		ATH12K_REO_STATUS_RING_MASK_0,
> +	},
> +	.host2rxdma = {
> +		0, 0, 0,
> +		ATH12K_HOST2RXDMA_RING_MASK_0,
> +	},
> +	.tx_mon_dest = {
> +		ATH12K_TX_MON_RING_MASK_0,
> +		ATH12K_TX_MON_RING_MASK_1,
> +		0, 0, 0, 0, 0, 0

nit: trailing 0s do not need to be specified
(none of the other initializers have them)


> +	},
> +};
> +
> +static const struct ath12k_hw_ring_mask ath12k_hw_ring_mask_wcn7850 = {
> +	.tx  = {
> +		ATH12K_TX_RING_MASK_0,
> +		ATH12K_TX_RING_MASK_2,
> +		ATH12K_TX_RING_MASK_4,
> +	},
> +
> +	.rx = {
> +		0, 0, 0,
> +		ATH12K_RX_RING_MASK_0,
> +		ATH12K_RX_RING_MASK_1,
> +		ATH12K_RX_RING_MASK_2,
> +		ATH12K_RX_RING_MASK_3,
> +	},
> +	.rx_err = {
> +		ATH12K_RX_ERR_RING_MASK_0,
> +	},
> +	.rx_wbm_rel = {
> +		ATH12K_RX_WBM_REL_RING_MASK_0,
> +	},
> +	.reo_status = {
> +		ATH12K_REO_STATUS_RING_MASK_0,
> +	},
> +
> +	.host2rxdma = {
> +	},

nit: add empty .rx_mon_dest & .tx_mon_dest initializers?

> +};
> +

snip

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
