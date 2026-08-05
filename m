Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA34C55ABA
	for <ath12k@archiver.kernel.org>; Wed,  5 Aug 2026 18:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qidgGtEGnfNFaIkMmYU9lKnfIZdIzRyOH1QZsIQZlo=; b=m8Ai27c4V1JKC0v1MS5IWcX8zY
	ktyJ0kfRnlJ3sL4Tyb3Vo/N1+or/xybhilsHk4R0NWh5deV6/4Ke7imsfhI4BVlGlzeuN4I5v/7U8
	CWoN1JVzoMQd8qrEvMX3qV7NqdMzC+HFSB5Xvtq2ZzVgiNti4w3HR9EL6pTaE9teof8VN0Zpc1/cC
	T01iKGyH7VWDbMs7kNxCtlPYqHI/5uRWDFAbak9SQbMJY8DHkDxFq8uA0u3afVGZM4S5FECM0h9tL
	cxslTTt1XVnI0ODi6tHwEYu1b8XogLKEyK9iyLOCB2C7GiN1uV3XLCDHlu1xypB2LF+5ypyDXwi/R
	dyrphVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgCc-00000004Nc1-25c2;
	Wed, 05 Aug 2026 18:18:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgCZ-00000004Nbf-2XtF
	for ath12k@lists.infradead.org;
	Wed, 05 Aug 2026 18:18:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HRtal3672897
	for <ath12k@lists.infradead.org>; Wed, 5 Aug 2026 18:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qidgGtEGnfNFaIkMmYU9lKnfIZdIzRyOH1QZsIQZlo=; b=SG+yj9N6JKJAmz1v
	WJ4g43EoO9PbvdFmtplU4TXqlq1Qb4fjX+l0hHF3J4GG5K7m8n+waxOuV86biLlY
	CfknEbOKgQFLfEw8XDECmZcYBuK6MszuXqJleqSvQf5/620QcOPbRNHszsnVGmy1
	GifcVXsyIGOkPWXfcEQ2SGjG9mgnoIsHBYrQgxwbwnMqy3kN0Vb43+amzpdhEjbo
	2VeBoSz57iZVucVkkwRk06geZLIX/638tisGJpHK/67cV5kxBIl19u2ZvoIwhs4w
	h7i4PmjLv7MXGMuQBhyNMHCKq+SP6y8K5ExpY74vx7fQ0x0V9cp5b87EfC0so0y4
	/TGMug==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv3w6a1ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 05 Aug 2026 18:18:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so2132101a12.0
        for <ath12k@lists.infradead.org>; Wed, 05 Aug 2026 11:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785953930; x=1786558730; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0qidgGtEGnfNFaIkMmYU9lKnfIZdIzRyOH1QZsIQZlo=;
        b=B/idFX4YzZvg8AZre1tjYdwnH2ztTwkn80lLoMX9tUAV1xkHN1iLURS9SQU6k2SpcY
         oByZ5npMWeJeUZd98B2otDhSZS1CFemPMLRgT6nxIbXQSPq/FyYm7cDp3bGBm00MSnW0
         hoUfMpZPJsMXHjoGfl1MqMW5810gwxtF5UCAc7Lc5VZowokHq7NV3YXotolxBZzvqmxx
         TvHC2D9EaQ1OW/+sWJCLKgtppu1lLwaZkdLl96Q1GIGhbnM9NRuGwtRqjGMOoPCzILtK
         cgp4lnZCRsODcgQb8zYrxl340oOtxzNSmitf5w6Icsicd2RU9jlxQL+uECTfdJDJoWyA
         2E7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785953930; x=1786558730;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qidgGtEGnfNFaIkMmYU9lKnfIZdIzRyOH1QZsIQZlo=;
        b=KYqM1usxSSG/AJjxqn4YDh/B9bb7wz0ZjojCUhItgrEYlrijINxwp5xaY+VltTigzz
         gvEyz8Vmke9UIGdWmLuFHsQBQ479P3q9+QTP9p5P5tfhaZRGA/Nd2s8hROX9p5KUObqX
         UBblIoLPAGgEn+WQDdXnlx0BNuV5V8UPn2GoZum/o7W/chaJD4NHi/CZZ41iPkKCvw3Q
         7gK6Hmave5+h4LpaGdACRDbiHVirkIKl+hVbcsAhvv6pM/sCZVpxdSAg9rsLkzLB7wjf
         pVVsZc2yQfylxp8gDKObJ+ynSyaxEHY/xjzIBSXKDIec8kRABB1oeHc+dPQbspmXwfpc
         iEbw==
X-Forwarded-Encrypted: i=1; AHgh+RqfhJEff/8FuprmYqcgk0kD4mqFYztBomPy3ifpCtHfHqyVgKS2PFMpkPsXmBYSbzdIaodQMp4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQlpV8P5wlyA38bQ/b2p2DZKjoOEuhFfYTSuS2qGkuONuBu86a
	vrthM7x5J4638UTLXvOlGAdQFtiAsCjs/8j8yVdLEgM1QI0KIIS1cistEug5daFR/HXO4Wb4rXg
	XBsGs5W9Xd2EA5J+ouJgatZKDUzLot6yq1UEfD2ZqS56UISwNgnIgwo7iz1NZI8qq
X-Gm-Gg: AR+sD12d4nhrHSVvD61X61ARgjmU765LUIEcaOUb5iV8lrprkQh+d/TTsFLLBD4Gwit
	dKU19lTyP1poNOC26TP34SN5qXGdwV1uZe7DEyhYygyEoU3JNXplAW/0lMLzQFnyMTCT8WgSTFf
	eLuXpNdRR1faiCmKHx/h1BYt3u3f0Cxuu2QN0QhidxXfpjnhIgLd/itvqafnwHg1nJ7c7hZY0hO
	2jYkAKFHpfDShr37Gm6ZV47lPD9PqECxsq8WmDioil5bOBbphovMK0YJqkxpfN81TyT73fWAGpK
	XvfGjfqw9xBJUyYqb4AoOp48h3W8LaNKyMvonvyFz6YFpWFtfaba4VTVHSdBEoY+U6HXwF+EHfz
	Hc7JRi8sDK9XBffHhPbSYu5uIri6gYVWnhoM2BC86GDUM
X-Received: by 2002:a05:6a20:6a08:b0:3c3:859b:9178 with SMTP id adf61e73a8af0-3cb85f508cemr10192559637.34.1785953930348;
        Wed, 05 Aug 2026 11:18:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a08:b0:3c3:859b:9178 with SMTP id adf61e73a8af0-3cb85f508cemr10192488637.34.1785953929676;
        Wed, 05 Aug 2026 11:18:49 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867c6a29sm18478135eec.29.2026.08.05.11.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 11:18:48 -0700 (PDT)
Message-ID: <88d5042e-21e2-497c-b86d-3cdf8c0642dc@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 23:48:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: advertise AP_VLAN interface mode for
 IPQ5332
To: Kamil Bienkiewicz <perceivalpercy@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260801004243.489010-1-perceivalpercy@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260801004243.489010-1-perceivalpercy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SQDbJnRtZmMXNcZ58xrKPZvvRDAVR78A
X-Proofpoint-ORIG-GUID: SQDbJnRtZmMXNcZ58xrKPZvvRDAVR78A
X-Authority-Analysis: v=2.4 cv=a48AM0SF c=1 sm=1 tr=0 ts=6a737e8b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=qQ61QLhWeJcE6JJgFHMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE1MCBTYWx0ZWRfXzvXWm9305Jhz
 ud2vm2wnx32YJFxRfuoAhHPlbEP0tB+R6WnnhkEoI9AXNmA0MxfsgfPIf8NITloIP7a5lsmazcn
 YJqScRmXkDhFITPvmBKbnXfRLphaA3s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE1MCBTYWx0ZWRfX9xjM9r2sH6aJ
 3pHPPkbygMtpDVlBcuk6ifW5DuSNoWZvKot4OubMHDeHMPsZEdKCtVB8UThgOWO08et+JWf19Md
 upLDHBJADhD43QQOoLzZzlm432wAe+JajwXaM6az3lkr26HjNze+/L4kLbuyWH2rHGTvt6TmJDo
 zJud2IWcgwHBOSIrDVcb6Rm6ftqDPVOE97AsR28NAd4s/12R5zVl+827OuXLHNcwoLugTh4b+l8
 Jeg2jd8hRLlu5wb8WrNvmuRXQsO4LJg55731A8mBkaKSemnkpuFERDklmioVfHd4R2fx1nc1kiD
 Ir6Si5sjq4pH84seoQF3sJ5oUTllNAGxKfGUQQ8G381l3sGGibGGGRL35XQ7Sr/TeQr3oXQ0MGj
 NZm/VVYANZSBWRf+CtuR2FV7jcjms9GaUJLQ2Ig+wzKppGLB01ooX+6HulBalQCKvzvlDm0p9bi
 pBLNactCbdlOjGsSKKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_111851_694179_F34D3469 
X-CRM114-Status: GOOD (  26.04  )
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

On 8/1/2026 6:12 AM, Kamil Bienkiewicz wrote:
> Only the two QCN9274 hw_params advertise NL80211_IFTYPE_AP_VLAN; the
> IPQ5332 entry does not. As ath12k sets SW_CRYPTO_CONTROL, mac80211 does
> not add the mode on the driver's behalf, so AP/VLAN is absent from the
> wiphy and hostapd cannot create WDS station interfaces:

Small clarification: for WDS station interfaces, hostapd creates the
AP_VLAN interface with NL80211_ATTR_4ADDR set. That path is allowed by
cfg80211_iftype_allowed() via WIPHY_FLAG_4ADDR_AP even when
NL80211_IFTYPE_AP_VLAN is not set in wiphy->interface_modes.

So the missing interface_modes bit seems to affect the non-4addr
AP_VLAN case instead, e.g. dynamic/per-station VLAN interfaces created
via hostapd_vlan_if_add(). Is that the failure path you hit?

> 
>    nl80211: Failed to create interface <name>: -95 (Operation not supported)
> 
> The 4-address datapath itself (sta_set_4addr, per-station TCL metadata,
> WMI_PEER_USE_4ADDR/WMI_VDEV_PARAM_WDS, 4-address frame and NULL/EAPOL
> handling) is shared Wi-Fi 7 code with no per-chip or per-bus gating, so
> IPQ5332 can already deliver it. AP_VLAN is a software interface type, so
> no interface combination changes are needed.
> 
> On a mixed-bus single-wiphy group the effect is wider still, since
> ath12k_mac_get_ifmodes() intersects interface_modes across all radios:
> one IPQ5332 masks AP_VLAN for the QCN9274 radios too.
> 
> Advertise AP_VLAN on IPQ5332 as QCN9274 does. Tested with 4-address WDS
> stations on IPQ5332 + 2x QCN9274; RADIUS dynamic VLAN was not tested.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01270-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kamil Bienkiewicz <perceivalpercy@gmail.com>
> ---
> v2: rebased onto ath/main (8150c22bc). No functional change; v1 was
> generated against a backports tree and its trailing context no longer
> matched after .supports_cong_ctrl_max_msdus was added to the IPQ5332
> hw_params entry.
> 
> IPQ5424 (line ~845, and possibly QCC2072/WCN7850) appears to need the
> same change, but I have no such hardware, so I have limited this to
> IPQ5332 which I could test.
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index 7b86f324b..a20c21807 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -664,7 +664,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   
>   		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
>   				   BIT(NL80211_IFTYPE_AP) |
> -				   BIT(NL80211_IFTYPE_MESH_POINT),
> +				   BIT(NL80211_IFTYPE_MESH_POINT) |
> +				   BIT(NL80211_IFTYPE_AP_VLAN),
>   		.supports_monitor = true,
>   		.supports_cong_ctrl_max_msdus = true,
>   

Actual change looks good to me so,

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

