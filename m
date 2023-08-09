Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8038AC001B0
	for <ath12k@archiver.kernel.org>; Wed,  9 Aug 2023 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBEA0j+gOhDsQXph+ktBkblpF7nMZB035Mqupj7SQwI=; b=43jsqcQ/VEIZ0z
	K+GxSTZ9l5gS8/TOniOeZ57ObhMH6ICU+O+7VdBV7EVKKjWIZLzeeRf53QDWn1dX3OpGpepcNbln3
	YA7qmmdxhrNJ0RIfbT4ExqdN7g4UqGvUhx8cW3wFOOFNyjC299ehHJTdeDtusuAiG+SK2+/KaGjgn
	BZIpf3rFcDr/Euy2LEwKzcNtU/uEtqVj8oAqdjxTI/v8NI4A/gH97fQ/cE5c/WuYKVdzCRffFYFuj
	vpNhxG0Af+D6JPCw0gikAd6pWeEwdBaJy9HbzysmDW3tLXPhe22TJwlBk5TAbgcfBTPVej4R45gIg
	MAN8xJ2mZYcHb6ni5Vlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTn35-005X8C-01
	for ath12k@archiver.kernel.org;
	Wed, 09 Aug 2023 17:32:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTn32-005X7l-0C
	for ath12k@lists.infradead.org;
	Wed, 09 Aug 2023 17:32:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 379H0Xmi022716;
	Wed, 9 Aug 2023 17:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6AHvfRviNYYMLqCQhBtcOKnIbQvezgBEt2zxX8gATyA=;
 b=SyM+Ve0Y3FFSniJO3YNIQjgF6Zh4AIDeaVGJko45sQ55lBVoAU1JLd4U9beIRH/0Cd7n
 IsIFDZqJXbtbx3vgsXX1nxcbm9O031DhVWVup9mXZv0wgGOOjW6Z/xClEqjimW1Pvu5/
 HM7HhdHAzGtAdZYLUkYCUrF1J60SExnfSqxC4r/HYnQtdAZ0iKFXsbMZJeCVEQPcCJIt
 kysKWg4Sng4mKEGlcieJolqttek7DZFBzCI1M1ecKcBI+g9WAsNPXRfcDjEwCbfnYTlR
 tefS6eMFDg2APbxEJs9xFcCkUzeZ7B3J4+ROQ01imx88Nvx24zGD1CtGKJZlqXFOjuE8 Gw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sc00522sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 17:32:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 379HWaZM026475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Aug 2023 17:32:36 GMT
Received: from [10.111.180.219] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 9 Aug
 2023 10:32:35 -0700
Message-ID: <3d022dad-99b2-0b4e-adab-4ac5147c989c@quicinc.com>
Date: Wed, 9 Aug 2023 10:32:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: add check max message length while
 scanning with extraie
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230809081657.13858-1-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230809081657.13858-1-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fEucNUWo4bI6GhE1lbm15JeNeJ6YWFsp
X-Proofpoint-GUID: fEucNUWo4bI6GhE1lbm15JeNeJ6YWFsp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_14,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_103240_109121_4D8DC168 
X-CRM114-Status: GOOD (  18.81  )
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

On 8/9/2023 1:16 AM, Wen Gong wrote:
> Currently the extraie length is directly used to allocate skb buffer. When
> the length of skb is greater than the max message length which firmware
> supports, error will happen in firmware side.
> 
> Hence add check for the skb length and drop extraie when overflow and
> print a message.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
> v2: seperate to another patch per johannes.
> 
>   drivers/net/wireless/ath/ath12k/wmi.c | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 9ed33e2d6da0..e964d6003ea9 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -2240,12 +2240,6 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>   	if (arg->num_bssid)
>   		len += sizeof(*bssid) * arg->num_bssid;
>   
> -	len += TLV_HDR_SIZE;
> -	if (arg->extraie.len)
> -		extraie_len_with_pad =
> -			roundup(arg->extraie.len, sizeof(u32));
> -	len += extraie_len_with_pad;
> -
>   	if (arg->num_hint_bssid)
>   		len += TLV_HDR_SIZE +
>   		       arg->num_hint_bssid * sizeof(*hint_bssid);
> @@ -2254,6 +2248,18 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>   		len += TLV_HDR_SIZE +
>   		       arg->num_hint_s_ssid * sizeof(*s_ssid);
>   
> +	len += TLV_HDR_SIZE;
> +	if (arg->extraie.len)
> +		extraie_len_with_pad =
> +			roundup(arg->extraie.len, sizeof(u32));
> +	if (extraie_len_with_pad <= (wmi->wmi_ab->max_msg_len[ar->pdev_idx] - len)) {
> +		len += extraie_len_with_pad;
> +	} else {
> +		ath12k_warn(ar->ab, "discard large size %d bytes extraie for scan start\n",
> +			    arg->extraie.len);
> +		extraie_len_with_pad = 0;
> +	}
> +
>   	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
>   	if (!skb)
>   		return -ENOMEM;
> @@ -2343,7 +2349,7 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>   	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_BYTE, len);
>   	ptr += TLV_HDR_SIZE;
>   
> -	if (arg->extraie.len)
> +	if (extraie_len_with_pad)
>   		memcpy(ptr, arg->extraie.ptr,
>   		       arg->extraie.len);
>   
> 
> base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
