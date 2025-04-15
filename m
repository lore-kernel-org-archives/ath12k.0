Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA39C369AB
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 18:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmopbRSr1BMuUIsQ83eBA4mll4c1c++hcr0bvXHjetQ=; b=4zfdLshmjIpM+KiaCR5MbZfAmR
	mWp6Uw0v4D12ThyrY8gz3ALOBtG5KzpukfxR9Ub4eoEILdawBUwk5n7DYn+5FUKOVzW205f8/Tl3M
	Og84y3yfLmT2sYXwOuN/XAQoh6ktKDJ1hW2AAEW6lVyC0G893PNSFLRzm0N+UNT8kWXDLzaWAU4kf
	Snihad8ZDASbfGUgrH3uhsAn5zvAbDIlj5vIQ7ct0v0RNnGagosaUCRfApRrOso3AQE4xp1WUGk92
	M2KlMu8lQvZ5A2SvyZbXgOqBtNyghaESPSCC9dcnN8zBMrJN+Gh+nDFEAbAd0uiKNd7tYY0/Ksur4
	W18b3guA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4khd-00000006frQ-3CQF;
	Tue, 15 Apr 2025 18:08:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kMY-00000006cSa-1rHY
	for ath12k@lists.infradead.org;
	Tue, 15 Apr 2025 17:46:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tBrL019542
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 17:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WmopbRSr1BMuUIsQ83eBA4mll4c1c++hcr0bvXHjetQ=; b=jdDb9Nkf6fFC3J74
	NcIGVY7vNeCe+ybOpFp2aZMJQmQpPnjKpbFtmrbtK26kkDLzsvWuTSEuW74+hN5d
	fDGniTgCENRzWYwXuyVOHvcm5PuNfkXEgrhhxlPEzWJEm2SDHLxQDM/7XN+6cQmb
	+K8wZnCK7Md/H6bdkoI47/gQHnhzBEnRRKOXDFHZyLfS4+KFhQgSL46AxDdLJo8k
	zE44PdJoHqp9NKMK2TILh1oPas91z1q+2YOsmYs0rbDSxUDYz8nkpZ6mW4WfHHoc
	tXUEkV6zrWmGilP/kob/fs3Uiu4VrC0qh0r4l+MTFXkIJsVGTS4YYWoCuglzN0XT
	JRo1/Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfd0x0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 17:46:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22aa75e6653so44839945ad.0
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 10:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744739180; x=1745343980;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WmopbRSr1BMuUIsQ83eBA4mll4c1c++hcr0bvXHjetQ=;
        b=lYBDATI8afkxeNwRff7NBqC5MPbVmI4SFMnHkF6nfgt+SIU/WTjOfk5b+SmrINd3D0
         DFGXF4ueCsSWdL57MeAznUP+2DXBAOaA+sW7SyydH07js8E47ybJ1h79G4wqOkSu0DO+
         xSYtv7g2MwALcsWtWsYsgxLzye5l+xP6dLcVUNp1A02u23pzZVZWl/TMXuzioCDF0P53
         jrGEAWwkHzHRGA2L2JT83O0W4O80u4HI4sMK+M9tYNaAombSfbgoD6N8PrYTzdT0krc9
         Ns9J53/v4FoWRdK/1XOEry3uFzud5/qAgK8mEas+BDmQqyJsa2xUi0SPE5Z08TrT9ylW
         S7LA==
X-Forwarded-Encrypted: i=1; AJvYcCWu2J1SawMbMfEcSoOSuLbwL491UNV2FtDmklumPn4FHrdnIPbYvatrTA2LXvBzSteSE6A4eLY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQmAcOVWZwEK2nCsYhWb0yK7n9lTbWuFooPRTHAXntK8SId2af
	FKT8tdtKVmbnUSNVK5mxeHB1GtxaxqwGnUQby8BgpMxie//Ypb4B5yhv+BCNQD2dFsp1JTgu9PD
	D4/MUa7mWetaaOgPf4fKC3jYut8GYc+serC8IMpGTluGt/N/CUZXirBsveKZm
X-Gm-Gg: ASbGncvd3dkfXn83PFTgYv0l+Dp21iMu+7PvLUXBbqJVEFRad6N7GPhplZb+GfcGwzH
	oE1FKIA1TMBYoJGhd9k9/lqNPSo2XYjuv0S1lSm5oKNwWwkguKt7LasCXu/slfOOFqU8iwKM6pK
	9cVVGiiPqHfFpcR6He3Pf/UPQHcmIDZ0W64pd57tE90tnRl+W77sJ7o5WnaONRz6+GsyxpBswRV
	FYH58z4p4YnOudZKktxApTbDOcoc3pANwojA+TlRKeMvEO6FBkg0TCFzqbUY56NAAEteh1HUEST
	J1LwUwPBdKtmDk4otUznZZ0qbxBWtQ0FjPRjPNzi6tOvPhn7j5AIUtjEzwc3aV6U7V4=
X-Received: by 2002:a17:902:ce89:b0:223:44c5:4eb8 with SMTP id d9443c01a7336-22c31ace41amr122635ad.32.1744739180372;
        Tue, 15 Apr 2025 10:46:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpxgKBEeHRzhsR+/KI+ZeJc2xPeAIkHTjIeWtXWs3CpMsBYr+ieCwWVlDOHbfXlup3IoaA3A==
X-Received: by 2002:a17:902:ce89:b0:223:44c5:4eb8 with SMTP id d9443c01a7336-22c31ace41amr122115ad.32.1744739179859;
        Tue, 15 Apr 2025 10:46:19 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb6825sm120476665ad.193.2025.04.15.10.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 10:46:19 -0700 (PDT)
Message-ID: <c8236051-4341-4d49-a6d8-283320aff2f6@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 10:46:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 0/9] wifi: ath12k: add MU-MIMO and 160 MHz bandwidth
 support
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250408010132.3699967-1-quic_pradeepc@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250408010132.3699967-1-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe9b6d cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=fskyjysVZrdRFQ4nWXgA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: CmU3Av1m3DMz3mHAOC52IQ365dOuCLQ0
X-Proofpoint-ORIG-GUID: CmU3Av1m3DMz3mHAOC52IQ365dOuCLQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_104622_492051_02F1CD9D 
X-CRM114-Status: GOOD (  19.69  )
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

On 4/7/2025 6:01 PM, Pradeep Kumar Chitrapu wrote:
> Add support for
> 1. enabling MU-MIMO in HE and EHT modes from hardware
> 2. setting fixed HE rate/GI/LTF
> 3. 160 MHz bandwidth in HE mode
> 4. extended NSS bandwidth support
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> changes in v12:
>  - rebase
> 
> changes in v11:
>  patch 1/9:
>   - fix return values in ath12k_mac_set_he_txbf_conf() and
>     ath12k_mac_vif_recalc_sta_he_txbf()
>  patch 6/9:
>   - fix missing he_mcs initialization in ath12k_mac_init_arvif()
> 
> changes in v10:
>  patch 6/9:
>   - use ath12k_ahsta_to_sta()
>   - fix rcu_dereference warning in ath12k_mac_set_bitrate_mask_iter()
>   - change return type for ath12k_mac_validate_fixed_rate_settings()
>   - improve readability by adhering to nl80211 definitions of GI
>     NL80211_TXRATE_DEFAULT_GI. Introduce ath12k_mac_nlgi_to_wmigi()
>     for conversion.
>  patch 7/9:
>   - do not change default MODE_11AC_VHT160 in
>     ath12k_mac_get_phymode_vht() as it breaks clients which do not
>     set VHT_CAP_SUPP_CHAN_WIDTH_160MHZ.
>  patch 8/9:
>   - Use IEEE80211_VHT_CAP_EXT_NSS_BW_MASK along with
>     IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ for determining VHT160
>     phymode.
> 
> changes in v9: rebase on top of master branch with mlo changes
>  patch 1/9 and 2/9:
>   - fetch link_conf using ath12k_mac_get_link_bss_conf()
>     instead of arvif->vif->bss_conf before mlo
>  patch 6/9
>   - fetch mcs/nss values from sta->link[] instead of sta->deflink
>   - fix spelling of 'incompatibility'
>  patch 8/9
>   - replace sta->deflink.addr with arsta->addr in
>     ath12k_peer_assoc_h_vht
>  patch 9/9
>   - replace sta->deflink.rx_nss with link_sta->rx_nss
> 
> changes in v8:
>  - rebase and resolve KASAN warnings reported by Jeff in v7, in patch 6/9.
> 
> Pradeep Kumar Chitrapu (9):
>   wifi: ath12k: push HE MU-MIMO params to hardware
>   wifi: ath12k: push EHT MU-MIMO params to hardware
>   wifi: ath12k: move HE MCS mapper to a separate function
>   wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
>   wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
>   wifi: ath12k: add support for setting fixed HE rate/GI/LTF
>   wifi: ath12k: clean up 80P80 support
>   wifi: ath12k: add support for 160 MHz bandwidth
>   wifi: ath12k: add extended NSS bandwidth support for 160 MHz
> 
>  drivers/net/wireless/ath/ath12k/core.h |    2 +
>  drivers/net/wireless/ath/ath12k/mac.c  | 1141 ++++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/mac.h  |   17 +
>  drivers/net/wireless/ath/ath12k/wmi.c  |   13 +-
>  drivers/net/wireless/ath/ath12k/wmi.h  |  107 ++-
>  5 files changed, 1058 insertions(+), 222 deletions(-)
> 
> 
> base-commit: ac17b1211841c98a9b4c2900ba2a7f457c80cf90

Sorry, this needs to be rebased again:

Applying: wifi: ath12k: push HE MU-MIMO params to hardware
Applying: wifi: ath12k: push EHT MU-MIMO params to hardware
Applying: wifi: ath12k: move HE MCS mapper to a separate function
Applying: wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
Applying: wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
Applying: wifi: ath12k: add support for setting fixed HE rate/GI/LTF
Applying: wifi: ath12k: clean up 80P80 support
Applying: wifi: ath12k: add support for 160 MHz bandwidth
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/core.h
M       drivers/net/wireless/ath/ath12k/mac.c
M       drivers/net/wireless/ath/ath12k/wmi.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wmi.c
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mac.c
Auto-merging drivers/net/wireless/ath/ath12k/core.h
Recorded preimage for 'drivers/net/wireless/ath/ath12k/mac.c'
error: Failed to merge in the changes.
Patch failed at 0008 wifi: ath12k: add support for 160 MHz bandwidth


