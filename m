Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3F7C4345F
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 21:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EBsWja9zhDx/KBvBicZy9awn7EbNNURM87xXV6BPFo=; b=nKdJDiB5HCXzAZf4rAsSGBBkLx
	sBPCATfhIBXaj+8KXbv7kQeS6owZUnERbVLtWMTEW8UnJxNpozy5Uu3VJ0EmyUMj+Ijciddo+lUwY
	XRqqVb1TSe18QwLykBU0U4jraXFa6lX8Qy9FCf1w6t1vFg4w8dNwpb4Qq2DDmLIjxQZ7OhJ8pttCG
	TYDCS5SPjkVBEK5W+nevVBVu9PJmj0s+mJ6F1mRaZJyvVCJjbxE5O39kVtKZJRsiMPZE4DkabRRrG
	FgDqSQ8xvvLzN81w4XD9HuOXhWoiFR8hMDo+HWyfPsJhDRDNIHSbt6TUiz4mqrtKkcQlp63ynJ+i5
	l4vv8T9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv2Kz-0000000EFK9-3ngT
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 21:52:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv2Kx-0000000EFJC-0xt9
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 21:52:04 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BLh5IS006971;
	Thu, 11 Apr 2024 21:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+EBsWja9zhDx/KBvBicZy9awn7EbNNURM87xXV6BPFo=; b=ks
	13s0VwTcm4RWeEFtEk3rxvGYVm940vrhHSKfaQSkySvjGsQw1o75TzzTMoteRyqX
	rpWcdQ/hDlUbji8wEIqfDUwLxolwdiFn83ae6wCdt1eKv/IMWdWBhtJVTr+Ia0lK
	SYgJKBOrtGvNyWbasWbepTMSWobiaa37ik2bU5HL6x1HmikSS5szBuxCF/GxFBGg
	PomvIjcj2Vr+JpLYrzGeZRvT7GYr9YZUx+ydguO+f4crBnDwkv8VXXTOy0TxJgpa
	Tu5F7c8Caie1B1IBjyysfucDDuJhLbs7Jb/fUxrC/dZ5cHIvbrzAZon78Zlw2Ye0
	OiyOJf6NSc1FjsqHBIvA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xebq1tcsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 21:52:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BLq1Zk031192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 21:52:01 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 14:52:01 -0700
Message-ID: <b2a14919-6478-4a6a-bdca-e018393eac34@quicinc.com>
Date: Thu, 11 Apr 2024 14:51:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath12k: report station mode signal strength
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240411025322.33888-1-quic_lingbok@quicinc.com>
 <20240411025322.33888-4-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240411025322.33888-4-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KsP22C6maQQGW54agyQyxtEsoHGo96gi
X-Proofpoint-GUID: KsP22C6maQQGW54agyQyxtEsoHGo96gi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404110157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_145203_599475_46AB251B 
X-CRM114-Status: GOOD (  19.76  )
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

On 4/10/2024 7:53 PM, Lingbo Kong wrote:
> Currently, the signal strength of "iw dev xxx station dump" always show an
> invalid value.
> 
> This is because signal strength is only set in ath12k_mgmt_rx_event()
> function, and not set for received data packet. So, change to get signal
> from firmware and report to mac80211.
> 
> After that, "iw dev xxx station dump" show the correct signal strength.
> Such as:
> 
> Station 00:03:7f:12:03:03 (on wlo1)
>         inactive time:  36 ms
>         rx bytes:       61571
>         rx packets:     336
>         tx bytes:       28204
>         tx packets:     205
>         tx retries:     49
>         tx failed:      0
>         beacon loss:    0
>         beacon rx:      83
>         rx drop misc:   66
>         signal:         -24 dBm
>         beacon signal avg:      -22 dBm
> 
> For WCN7850, the firmware supports db2dbm, so not need to add noise floor.
> For QCN9274, the firmware not support db2dbm, so need to add noise floor.
> 
> This patch affects the station mode of WCN7850 and QCN9274.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.h |   2 +
>  drivers/net/wireless/ath/ath12k/mac.c  |  56 ++++++++++-
>  drivers/net/wireless/ath/ath12k/wmi.c  | 130 +++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.h  |  48 +++++++++
>  4 files changed, 234 insertions(+), 2 deletions(-)
[...]
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 78afc94a815d..9016eda03d57 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -4811,6 +4811,52 @@ struct wmi_twt_disable_event {
>  	__le32 status;
>  } __packed;
>  
> +struct wmi_stats_event {
> +	__le32 stats_id;
> +	__le32 num_pdev_stats;
> +	__le32 num_vdev_stats;
> +	__le32 num_peer_stats;
> +	__le32 num_bcnflt_stats;
> +	__le32 num_chan_stats;
> +	__le32 num_mib_stats;
> +	__le32 pdev_id;
> +	__le32 num_bcn_stats;
> +	__le32 num_peer_extd_stats;
> +	__le32 num_peer_extd2_stats;
> +} __packed;
> +
> +enum wmi_stats_id {
> +	WMI_REQUEST_VDEV_STAT	= BIT(3),
> +};
> +
> +struct wmi_request_stats_cmd {
> +	__le32 tlv_header;
> +	__le32 stats_id;
> +	__le32 vdev_id;
> +	struct ath12k_wmi_mac_addr_params peer_macaddr;
> +	__le32 pdev_id;
> +} __packed;
> +
> +#define WLAN_MAX_AC 4
> +#define MAX_TX_RATE_VALUES 10
> +
> +struct ath12k_wmi_vdev_stats {

this name does not conform to the "Naming conventions for structures" outlined
at the beginning of the file:
 * _params is a structure which is embedded either into _cmd or _event (or
 * both), it is not sent individually.

> +	__le32 vdev_id;
> +	__le32 beacon_snr;
> +	__le32 data_snr;
> +	__le32 num_tx_frames[WLAN_MAX_AC];
> +	__le32 num_rx_frames;
> +	__le32 num_tx_frames_retries[WLAN_MAX_AC];
> +	__le32 num_tx_frames_failures[WLAN_MAX_AC];
> +	__le32 num_rts_fail;
> +	__le32 num_rts_success;
> +	__le32 num_rx_err;
> +	__le32 num_rx_discard;
> +	__le32 num_tx_not_acked;
> +	__le32 tx_rate_history[MAX_TX_RATE_VALUES];
> +	__le32 beacon_rssi_history[MAX_TX_RATE_VALUES];
> +} __packed;


