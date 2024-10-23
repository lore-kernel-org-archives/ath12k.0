Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE17ACFA44E
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 16:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfJQocG0Byys8cb+0L39TCoP1dAqS2s+pZumt6sigz8=; b=xWgi6A7Ux8wAaJ56xsSLo8ocgm
	wzieVsaPaoVCvQPW/TBYWYYtDgZkVGVdA7EzTgTd4DgAw5gRNewFLbMVm/Ek2FiKNKBdCPwvX36vZ
	OXmZb6W7LCk/4dAVyzX7rSZNNOxBI9GNg/iq/bGku3wkqRbTkZPYhiv+5+1At4ZigbehL3jZh/SU4
	UhYjfZXBw/wkl/JV/1aQQjM3kNbDWziqOa4XLxZGMfB4omVLbCgXrdG8RXiZCKVBGDCCHlOYVRlro
	6yVfLlmV7QtFWGII0Fjaaf6NEadSspUQjVsxlFf8s6eUVXDa5WGvCasuKH98EgjGmHhWchizBnduW
	Y8O2LHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eGe-0000000FB7A-2qO0
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 16:31:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dhJ-0000000F37n-2YUu
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 15:54:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9cj3t018075;
	Wed, 23 Oct 2024 15:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JfJQocG0Byys8cb+0L39TCoP1dAqS2s+pZumt6sigz8=; b=h/b93Qun27CyMiSJ
	HDrPAunufArZ5sfFy5BsvxLXp5VLrGkF2sv3n9GNmrD9WeSf0SPUNw7EkrbjDwqz
	nepCpB6u4Zh+KZJ0EtHawwF6a2kc+DnnJvkHtQ6xFkybCCT7v2tCxZZt5O74i49X
	6KsmXB0M1mh0hxK5SpozeZ2caLEXlglchgf9+1BYp+o+sq/UgcTAKsgdcNd9RiSE
	CUt8KrOmrE6x81teva6CPB5HISdYb5Q30yXbk+MQkLPT7hWNLFsnvvSXrWv5us9Y
	9QwvaQskpPGhAzHB84lr8U5nYwAfY4ZqpOrURcfETJCSIPMlsHZy6bc2b+5v3GYa
	cNmKGw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3waqr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 15:54:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NFsqnF023332
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 15:54:52 GMT
Received: from [10.48.242.6] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 08:54:52 -0700
Message-ID: <f8049c99-c7ac-410c-84fd-ac844041f34c@quicinc.com>
Date: Wed, 23 Oct 2024 08:54:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] wifi: ath12k: add multi-link flag in peer create
 command
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241023133004.2253830-1-kvalo@kernel.org>
 <20241023133004.2253830-7-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241023133004.2253830-7-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _Phe56Oq1D5uJTsAemkN1iWiVRudo5Gq
X-Proofpoint-ORIG-GUID: _Phe56Oq1D5uJTsAemkN1iWiVRudo5Gq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410230098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_085457_806805_884CED8C 
X-CRM114-Status: GOOD (  18.56  )
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

On 10/23/2024 6:30 AM, Kalle Valo wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Driver should indicate to firmware whether a peer is multi-link or not in peer
> create command using multi-link flag. Add changes to support
> WMI_TAG_MLO_PEER_CREATE_PARAMS in WMI_PEER_CREATE_CMDID.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c |  5 +++--
>  drivers/net/wireless/ath/ath12k/wmi.c | 27 +++++++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/wmi.h |  6 ++++++
>  3 files changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 019a1a6c6777..b628bc2fd0f5 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -4981,8 +4981,9 @@ static int ath12k_mac_station_add(struct ath12k *ar,
>  	}
>  
>  	peer_param.vdev_id = arvif->vdev_id;
> -	peer_param.peer_addr = sta->addr;
> +	peer_param.peer_addr = arsta->addr;
>  	peer_param.peer_type = WMI_PEER_TYPE_DEFAULT;
> +	peer_param.ml_enabled = sta->mlo;
>  
>  	ret = ath12k_peer_create(ar, arvif, sta, &peer_param);
>  	if (ret) {
> @@ -7016,7 +7017,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
>  	struct ath12k_vif *ahvif = arvif->ahvif;
>  	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
>  	struct ath12k_wmi_vdev_create_arg vdev_arg = {0};
> -	struct ath12k_wmi_peer_create_arg peer_param;
> +	struct ath12k_wmi_peer_create_arg peer_param = {0};
>  	struct ieee80211_bss_conf *link_conf;
>  	u32 param_id, param_value;
>  	u16 nss;
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index e089b58bbea1..0583d832fac7 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -1230,9 +1230,14 @@ int ath12k_wmi_send_peer_create_cmd(struct ath12k *ar,
>  	struct ath12k_wmi_pdev *wmi = ar->wmi;
>  	struct wmi_peer_create_cmd *cmd;
>  	struct sk_buff *skb;
> -	int ret;
> +	int ret, len;
> +	struct wmi_peer_create_mlo_params *ml_param;
> +	void *ptr;
> +	struct wmi_tlv *tlv;
>  
> -	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, sizeof(*cmd));
> +	len = sizeof(*cmd) + TLV_HDR_SIZE + sizeof(*ml_param);
> +
> +	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
>  	if (!skb)
>  		return -ENOMEM;
>  
> @@ -1244,9 +1249,23 @@ int ath12k_wmi_send_peer_create_cmd(struct ath12k *ar,
>  	cmd->peer_type = cpu_to_le32(arg->peer_type);
>  	cmd->vdev_id = cpu_to_le32(arg->vdev_id);
>  
> +	ptr = skb->data + sizeof(*cmd);
> +	tlv = ptr;
> +	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT,
> +					 sizeof(*ml_param));

using the same TLV size both here and for the TLV that follows doesn't seem
logical. is this missing + TLV_HDR_SIZE to account for its own TLV header?


> +	ptr += TLV_HDR_SIZE;
> +	ml_param = ptr;
> +	ml_param->tlv_header =
> +			ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_PEER_CREATE_PARAMS,
> +					       sizeof(*ml_param));
> +	if (arg->ml_enabled)
> +		ml_param->flags = cpu_to_le32(ATH12K_WMI_FLAG_MLO_ENABLED);
> +
> +	ptr += sizeof(*ml_param);
> +
>  	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
> -		   "WMI peer create vdev_id %d peer_addr %pM\n",
> -		   arg->vdev_id, arg->peer_addr);
> +		   "WMI peer create vdev_id %d peer_addr %pM ml_flags 0x%x\n",
> +		   arg->vdev_id, arg->peer_addr, ml_param->flags);
>  
>  	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_PEER_CREATE_CMDID);
>  	if (ret) {
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 33b9643644c6..07bd275608bf 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -3026,6 +3026,12 @@ struct ath12k_wmi_peer_create_arg {
>  	const u8 *peer_addr;
>  	u32 peer_type;
>  	u32 vdev_id;
> +	bool ml_enabled;
> +};
> +
> +struct wmi_peer_create_mlo_params {
> +	__le32 tlv_header;
> +	__le32 flags;
>  };
>  
>  struct ath12k_wmi_pdev_set_regdomain_arg {


