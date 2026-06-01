Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3E8CD5BD1
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 05:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nOHUqXMH21UAQ/wBMK8ailKQ1AtigkhDLTiNU0XgYg=; b=Vm6LhbME5LW4d+jzyOJGTRw9Tl
	2yepMeyDnKezgZwQv5cD30RznzwvfecD8eQFywY1JnU0U+IaWx7Zdcs+X7NyO778G9eI0YE78F1Nd
	dOliyh1yd4wsDdVgvfGyZxJ6TtXQ7iUI+vuBbX1UwWRzqPGVuYLUPtLeePS4gKzjXHK9PWIPvEyxt
	5Rph5xOtpD2lmPQjralY+RVHXd70TZqUmqqbLVHC/DuemZuGnj48ItAL57paByI6/QWhPR5TZRiPr
	iW1P3A6PN+t00M6Pzc0zKozDiMISZs6D/sbForwNOBZ5dduUZJjhM12UXu5A7VVWcsSd2D+AtQ2Sl
	p3kwRs7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvRj-0000000A9ur-3ELg;
	Mon, 01 Jun 2026 05:44:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvRh-0000000A9uT-2r9Y
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 05:44:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VLuxLn4055885
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 05:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+nOHUqXMH21UAQ/wBMK8ailKQ1AtigkhDLTiNU0XgYg=; b=V/LNay5oSCTnzIXT
	upTViG07kQbUtOlU6nfa0D50bzGqR3cqS+a+TMgX1gbZTwYC3jRZH3uySibHJb/T
	/PqDVMg9rasWQLfsMZwvxF/QLYgWube2KN6Uv8Y5Rz+nBROyflm93isOlpO/ZR9U
	sf2/6jeWoEm7+SGOITpDxbN39AI9Mkhcu+p5F8p6gr8WGawVD8X+jdFMdc/RjAV0
	4+xX+F1IkBji4xpquzm/ydkVSnRM9IWcHFL/LdCZgWsF2rCRzyf8d8XiGKMpF9hS
	NMwlBflXL3HQWNejKy3ak+nJ8Z9Ieii55/UP8/QepTf/IYkh4vlpDx9Vq1PtOoy1
	8E68JQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux55c18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 05:44:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c331eda3so12244135ad.2
        for <ath12k@lists.infradead.org>; Sun, 31 May 2026 22:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780292656; x=1780897456; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+nOHUqXMH21UAQ/wBMK8ailKQ1AtigkhDLTiNU0XgYg=;
        b=a9r4UfTeNkRIaOC/ptW795ueQCJlz4v545VrX3TXeUmyEoq553TAWq+lnaooz4ZWbP
         WTq2F3GhNFcjEl6BQ4/O6GjQYWo+2VjAkeaqjp1Xb2O9Dyy41h+mbJ7XFc2FAtQXhnd/
         9J5wpjGMl6UiyB0klQdx3h7nYvruyQ4U2+ZnV3eBzdORo8CCylwjVDp7KX4rG+HZZJvA
         ozUtbCya3rLFdjLlOFgfhExjQgJtAFc407xPAtLeHGP+NyYQ1HAyh9SPHPwWEbUwJ5zZ
         WPc+vccsR2/2YmViXssv0ClnnDJ4oYagzqpsF7yB7lrmvIhxa5sovDEPwjhw7kOFmKz8
         fifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780292656; x=1780897456;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nOHUqXMH21UAQ/wBMK8ailKQ1AtigkhDLTiNU0XgYg=;
        b=pBS2yOENeNcDyDzkU1cS2Bq8A5AgErHWnAUaJbff0TeZEsi/7XRH8/+LEmnC8tw//W
         R2ghXcHm7tnJXHXfCUVycgCRPFYoUeKWkPiEafizb8xKbHiu6kT4R0m7aI9NKcIuW8/g
         WndYlBWY7m0qaib8d3cyTvL3G1XT6eVVkT3uD+QYuHUxAcXThNzImgaCTqauACn66MIX
         TNu37kMPK3IcXskoOYPixmIFiKsbmc79U08mbPG4eTkflkNpX26R3frOgqnLBcAMkI55
         LhsPJz1Q9nJzBy/9jxjRZGu+DE+upuLCZPh/WlkIi75ZyXEdg6XZhewQbiT3DmHtmQ5s
         oXZA==
X-Forwarded-Encrypted: i=1; AFNElJ92aUVx7DHMg7alBHRofIWNewF8nC+tnXeZg7+g+FdnP1LWsuhB2H74k2pUOUt0p7HyQz7SUIM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDCsZgOBHHVoivNLSFBFOG5DJlExJZS3mTAQqlBgfT1ygEaroq
	Ln0etIAIyOOF4tvAg3g5Sbyj1rm33ALXe+o082300qe9nCDEQS1vsdrxgPyFNAYSRdQnwZ53rKe
	uYj419NbL8uIUWf9ElclKv3+VSJBRDZZpXEvi/bj72Pr7ZXggcufkAXA73ubx4zPEEpbUbwsBtS
	Q=
X-Gm-Gg: Acq92OEIdaYZOH4u2z562iSTrSsbHZOz4QZGo/aWqMYgwzdDhoUZaTV9rO50LILcYXC
	g647epyNNtcLkl38dEsiHbvwcUQRvmL55JbzzpgUIlKxo82LtFzOMYTwbc56IblSdd7YQIvjphu
	CabeGlykk1mfsapAZ32TrlU2XyD3imrmIUszzAGeW07bXJHo8uDOB0Gylf9vMHu6jdr5YaoZrXW
	4ckrRiH1dCJjD9FQ6g1YIfBTNwR5ExabnJqe2O8fVRTeHRQppjxIDJxG/eIm4awqHt+X1KtYJUr
	2YWMTZsv/9kBbqh4+WutX9+38DI37ez5kx3rMyrjZnGhtVAWaCA4M3reum0fnnhxjoQwQCm7yae
	3+VEDO/SJBmGtT3VhtX1lil92s8AxB1z5xFoZYCTn0/d7JVGfO/5+xvevJoR9bmG49uH3wAnxp5
	clnF5S5/9hnprv15OBmVRKvpFDB0c2
X-Received: by 2002:a17:903:986:b0:2bf:1e59:d99 with SMTP id d9443c01a7336-2bf367950ffmr100346075ad.8.1780292656273;
        Sun, 31 May 2026 22:44:16 -0700 (PDT)
X-Received: by 2002:a17:903:986:b0:2bf:1e59:d99 with SMTP id d9443c01a7336-2bf367950ffmr100345845ad.8.1780292655764;
        Sun, 31 May 2026 22:44:15 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3a8afsm115481975ad.73.2026.05.31.22.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:44:15 -0700 (PDT)
Message-ID: <35f9b62e-cbe5-4b3b-b68d-2f4ddfd9ac23@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:44:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS
 reporting in monitor mode
To: kwan1996 <laicheehou9@gmail.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <20260507015336.14636-1-laicheehou9@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260507015336.14636-1-laicheehou9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: R2NsDFYuTPwzR77tUwUsb4jNG3oORFI8
X-Proofpoint-ORIG-GUID: R2NsDFYuTPwzR77tUwUsb4jNG3oORFI8
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1d1c31 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=7u1uBgKiGmSZLVGxGAYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA1NSBTYWx0ZWRfX4PoKhol/DSa9
 /JUthvP7w9jhXlVdVwiIC45wWfKnfWohTpO3tSiKCAKqy7Ymsm1uqJ9+90wOe3Fncpy3bBlm2qm
 VBMEIRjRmo8XAVPXEmzRb7FC++cuKtEDVEgzDfE3n4O5aNEL7qC8Yy4oEjUO9S/AL6NGVTFRPyf
 oKjDq2U4FGT9HnWZSoj4uMb1ZYCYCLIxgaTDqNPhz4waonu7Qk9TNXB1O4fwVM0xTKwqTrCJUPJ
 lhQggqxCr3EWMkpIrWDr54FRiskztgtfrlKc/6SJFxhovB0Y6NrQiUNHBgmTdv/85fcwJfI71me
 E20jVqi39+lPmVNnjBCa2kzGwaVZbpJJ9TE+rkN4vNBCj/jAsq0AuIVuzzGSGHfp2PKL3a110hv
 EcbxvewnEBMm4OD8vYbNFmjf5v9b6pABKM3HpYi9WhG//cpAHQIC1IMSBWi8a60t9Qfxra22jSw
 IGoBNcUVSZmIZh0u3IA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_224417_752400_48BB5E07 
X-CRM114-Status: GOOD (  19.68  )
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



On 5/7/2026 9:53 AM, kwan1996 wrote:
> From: Kwan Lai Chee Hou <laicheehou9@gmail.com>
> 
> In monitor mode, the driver incorrectly assigns the legacy rate
> to the rate_idx field of the radiotap header for HT/VHT/HE/EHT
> frames, ignoring the actual MCS value parsed from the hardware.
> 
> This causes packet analyzers (like Wireshark) to display incorrect
> MCS values (e.g., legacy base rates instead of the true MCS).
> 
> Fix this by assigning ppdu_info->mcs as the default rate_mcs
> in ath12k_dp_mon_fill_rx_rate(), and remove rate_idx assignments in 
> ath12k_dp_mon_update_radiotap() to preserve
> the previously calculated MCS values (including the HT NSS offset).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220864
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ
> 

Fixes: 5393dcb45209 ("wifi: ath12k: change the status update in the monitor Rx") ?

> Signed-off-by: Kwan Lai Chee Hou <laicheehou9@gmail.com>
> 
> ---
> v3: 
>  - Simplify rate_mcs assignment logic in ath12k_dp_mon_fill_rx_rate.
>  - remove rate_idx assignments in ath12k_dp_mon_update_radiotap to avoid overwriting the HT (802.11n) MCS calculated earlier.
>  
> v2: Fix indentation and formatting issues in v1.
> ---
>  drivers/net/wireless/ath/ath12k/dp_mon.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
> index 39d1967..79347c3 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_mon.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
> @@ -1910,13 +1910,14 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
>  	bool is_cck;
>  
>  	pkt_type = ppdu_info->preamble_type;
> -	rate_mcs = ppdu_info->rate;
> +	rate_mcs = ppdu_info->mcs;
>  	nss = ppdu_info->nss;
>  	sgi = ppdu_info->gi;
>  
>  	switch (pkt_type) {
>  	case RX_MSDU_START_PKT_TYPE_11A:
>  	case RX_MSDU_START_PKT_TYPE_11B:
> +		rate_mcs = ppdu_info->rate;
>  		is_cck = (pkt_type == RX_MSDU_START_PKT_TYPE_11B);
>  		if (rx_status->band < NUM_NL80211_BANDS) {
>  			sband = &ar->mac.sbands[rx_status->band];
> @@ -2259,13 +2260,10 @@ static void ath12k_dp_mon_update_radiotap(struct ath12k *ar,
>  		rxs->encoding = RX_ENC_HE;
>  		ptr = skb_push(mon_skb, sizeof(struct ieee80211_radiotap_he));
>  		ath12k_dp_mon_rx_update_radiotap_he(ppduinfo, ptr);
> -		rxs->rate_idx = ppduinfo->rate;
>  	} else if (ppduinfo->vht_flags) {
>  		rxs->encoding = RX_ENC_VHT;
> -		rxs->rate_idx = ppduinfo->rate;
>  	} else if (ppduinfo->ht_flags) {
>  		rxs->encoding = RX_ENC_HT;
> -		rxs->rate_idx = ppduinfo->rate;
>  	} else {
>  		rxs->encoding = RX_ENC_LEGACY;
>  		sband = &ar->mac.sbands[rxs->band];

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

