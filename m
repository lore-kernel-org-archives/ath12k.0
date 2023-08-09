Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8CFC001B0
	for <ath12k@archiver.kernel.org>; Wed,  9 Aug 2023 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJf+BgUmE0rowlyqayzHtMv4vc3mAgcAeXc8a2wtAwc=; b=TT1D95rliySg/z
	yIq3saxguBDy4P6KujhT9cBEzI2oR6pvIFDeUuHJxeWcXvv5U2RfRfBneYr6Y/0MrSxjwql+trwdw
	lIGKED0AYAgUIQYU0bPlSpByJGzDJVh8SQ0MAONjUtom7mblEJkhOS7DgGe37A63hRjZbSSqLKIVM
	f7BG7LbCWaDHAEpv9DIl5BpqExHxGEv5zY6hoPeAoqj4wcvzW5DVneqigynlwUE0NOy6TKPhW96/L
	69xg4jyRUuoF0Jee/zCalogtth6e06ni9hZ0BwnTlNIl8IN5o7F3IWlTi4UWG9Z5ZIsIT6WWIzSuF
	jBQETxYegLL5vojk3bfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTn22-005X49-1w
	for ath12k@archiver.kernel.org;
	Wed, 09 Aug 2023 17:31:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTn1y-005X3g-3C
	for ath12k@lists.infradead.org;
	Wed, 09 Aug 2023 17:31:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 379HMjLf019894;
	Wed, 9 Aug 2023 17:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=B0yBwOUuSXQzSPPiMIyBcgiGQgDm0bV4O9o5nFkFiUQ=;
 b=d8mW06+nSaev7qrrQX+yD4y4EBxL0HRPQZfOH+U1UM/lgPSS1q4pJpHGR+kGu9wnThW2
 HwAW5Su8zx2H1JdgZq+kwCTgesgFEt0HfQhXAzlSySZ2PSjlbEoM4twIDzQyL2RmTT9S
 l0HcjkIVJZoDMCI+8tyYc1os75HbYaSQZpliE5ciqhZ1PgYcCbLQR5feph3QVl9STZjx
 j2PVHoUZbkEvj/JhVqOWnlhwCyBGW2clR/jTO4iacE4fV6CFELX/8ARY3gHOroUgJK6E
 aprNgKZwuUFk22yx41zyvwUUBJIEqFe1/ppxsp6UG8rSBJF48ojDz+Uog3MAS1gARVSk 6A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sc28rsu13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 17:31:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 379HVOH4025531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Aug 2023 17:31:24 GMT
Received: from [10.111.180.219] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 9 Aug
 2023 10:31:24 -0700
Message-ID: <4e63a318-2aa0-2993-ae03-5544c6e41390@quicinc.com>
Date: Wed, 9 Aug 2023 10:31:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: Fix buffer overflow when scanning with
 extraie
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230809081241.32765-1-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230809081241.32765-1-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YhFb3irYmXhVE5YgC7LiB-uE-NvJ5vei
X-Proofpoint-GUID: YhFb3irYmXhVE5YgC7LiB-uE-NvJ5vei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_14,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_103135_167418_F125CE4D 
X-CRM114-Status: GOOD (  24.64  )
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

On 8/9/2023 1:12 AM, Wen Gong wrote:
> If cfg80211 is providing extraie's for a scanning process then ath12k will
> copy that over to the firmware. The extraie.len is a 32 bit value in struct
> element_info and describes the amount of bytes for the vendor information
> elements.
> 
> The problem is the allocation of the buffer. It has to align the TLV
> sections by 4 bytes. But the code was using an u8 to store the newly
> calculated length of this section (with alignment). And the new
> calculated length was then used to allocate the skbuff. But the actual
> code to copy in the data is using the extraie.len and not the calculated
> "aligned" length.
> 
> The length of extraie with IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS enabled
> was 264 bytes during tests with a wifi card. But it only allocated 8
> bytes (264 bytes % 256) for it. As consequence, the code to memcpy the
> extraie into the skb was then just overwriting data after skb->end. Things
> like shinfo were therefore corrupted. This could usually be seen by a crash
> in skb_zcopy_clear which tried to call a ubuf_info callback (using a bogus
> address).
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
> v2: seperate to another patch per johannes.
> 
>   drivers/net/wireless/ath/ath12k/wmi.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 9ed33e2d6da0..cc9a377c06fd 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -2221,8 +2221,7 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>   	struct wmi_tlv *tlv;
>   	void *ptr;
>   	int i, ret, len;
> -	u32 *tmp_ptr;
> -	u8 extraie_len_with_pad = 0;
> +	u32 *tmp_ptr, extraie_len_with_pad = 0;
>   	struct ath12k_wmi_hint_short_ssid_arg *s_ssid = NULL;
>   	struct ath12k_wmi_hint_bssid_arg *hint_bssid = NULL;
>   
> 
> base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
