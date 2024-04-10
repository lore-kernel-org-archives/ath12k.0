Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D86EC67861
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 00:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EY/V0UTpIc4eSRTb7M2ZDFuG/iwU+cKnFHTgb17wgXE=; b=5CT6bPyOjCL5zKe7Qj4xhUzp35
	jD+d5IZ7SQIrLYw7B+6ylyScKBJRHf6Iiz7vsaGB8Un1q+UbVJvEA47YXSnnrffL1GtEdaRBg2uJA
	HjqNuZtx0VAX7/LGnwvfK+l1gCQ42JJh+iFXAmtue1DyotZJuQdqNsucHDZtPnCo8LXtBUeaXb0+x
	9jRlw4tHWgrFLSrKhrz1AibU5TPIkDNwM59+S2Jrr6sxkwNM58u4NDNWwRa1f7tQV5YLja+FSWb6o
	p6AyghiDKfp01AfRSM/1qVafX9kXGXvMvADVGsNBBxnbUsf/CxhIA7BW9dMvDcNumgRxB2Wruss61
	jYvw97GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruLUx-00000004MMp-0beW
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 00:07:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruLUu-00000004MLo-0SWV
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 00:07:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43A00OGT015941;
	Wed, 10 Apr 2024 00:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EY/V0UTpIc4eSRTb7M2ZDFuG/iwU+cKnFHTgb17wgXE=; b=Fu
	YJVUh7MGRuXBZQzjIRuwdj3anltoWEbAjY2oUdf6ivtROkOa7Pp+SHHQgsAZPKn1
	e6xyzbbikb48GowlY9LdubIRLRYfBTU9z7azNavdcJlt823/btQaYaJYE5B69Smm
	0S9Gi4mRletr08HDuDIOW3XOcRXBPHXDSKhfMjVS99bnO54bOggqwsygub0OpI+Y
	7IB1YSmSzJFtQP3eHtF+LP5fF/fH5NKv5DG7cRqwK/OikezmYvtA94nU9TESm1fW
	ExnYvWdTYhlk/olvFAQnw8gkAWDFAlxecVOvAKO0X/VvKMYCzHBdRa9fFq3aICbc
	G75hJA58t7oko4mfZzzA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdaw1ryej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 00:07:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43A07MiQ008931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 00:07:22 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 9 Apr 2024
 17:07:21 -0700
Message-ID: <1e515bbc-0119-4114-b44e-d7a449b031f7@quicinc.com>
Date: Tue, 9 Apr 2024 17:07:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: enable service flag for survey dump stats
Content-Language: en-US
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Thiraviyam Mariyappan
	<quic_tmariyap@quicinc.com>
References: <20240409175604.3299752-1-quic_kathirve@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240409175604.3299752-1-quic_kathirve@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rgHn3VHK1CzBjWvPj87zvwcd70yboJ7H
X-Proofpoint-GUID: rgHn3VHK1CzBjWvPj87zvwcd70yboJ7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404090166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_170728_313416_BB193FFE 
X-CRM114-Status: GOOD (  17.93  )
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

On 4/9/2024 10:56 AM, Karthikeyan Kathirvel wrote:
> From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
> 
> The survey dump statistics does not display channel RX and TX time
> properly because the survey flag is not enabled in the firmware service
> flag.
> 
> If firmware supports enable the service flag "bss_chan_info" in
> wmi_resource_config to fetch and print the stats for specific pdev.
> 
> Enabling WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 does not have any impact
> on WCN7850 since this bit is not utilized by the WCN7850 firmware.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 3 ++-
>  drivers/net/wireless/ath/ath12k/wmi.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index a5575ce9eed4..16504786735a 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -3324,7 +3324,8 @@ ath12k_wmi_copy_resource_config(struct ath12k_wmi_resource_config_params *wmi_cf
>  	wmi_cfg->bpf_instruction_size = cpu_to_le32(tg_cfg->bpf_instruction_size);
>  	wmi_cfg->max_bssid_rx_filters = cpu_to_le32(tg_cfg->max_bssid_rx_filters);
>  	wmi_cfg->use_pdev_id = cpu_to_le32(tg_cfg->use_pdev_id);
> -	wmi_cfg->flag1 = cpu_to_le32(tg_cfg->atf_config);
> +	wmi_cfg->flag1 = cpu_to_le32(tg_cfg->atf_config) |
> +				     WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64;

shouldn't that | operation be inside the ) ?

>  	wmi_cfg->peer_map_unmap_version = cpu_to_le32(tg_cfg->peer_map_unmap_version);
>  	wmi_cfg->sched_params = cpu_to_le32(tg_cfg->sched_params);
>  	wmi_cfg->twt_ap_pdev_count = cpu_to_le32(tg_cfg->twt_ap_pdev_count);
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 78afc94a815d..1283d25b5cc4 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -2400,6 +2400,7 @@ struct wmi_init_cmd {
>  
>  #define WMI_RSRC_CFG_HOST_SVC_FLAG_REG_CC_EXT_SUPPORT_BIT 4
>  #define WMI_RSRC_CFG_FLAGS2_RX_PEER_METADATA_VERSION		GENMASK(5, 4)
> +#define WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64	BIT(5)
>  
>  struct ath12k_wmi_resource_config_params {
>  	__le32 tlv_header;
> 
> base-commit: b36766befd306a606f287b0c0f0e53d994516acb


