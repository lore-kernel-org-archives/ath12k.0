Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD79EDF16E
	for <ath12k@archiver.kernel.org>; Fri, 13 Feb 2026 14:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pwnjdk/EpFtVilyv396Zg4GuaP+kgL1WguDKKzHZSNg=; b=xIDLLD2pNWLr6LDPDOcdH/fJCd
	yvHVxJUNiB9rlMTnzNSzdVu82mctTnLJZDnn3oGnzRnO5tIPf72yusCvze6hm9CkXLRWWS3auT/qy
	BQREmBkyd8w+kxpGoTbiM0LitwO98OsZGn3Az9DqVtZMtE5kDItrWTE1gIw9ahvcMl33oGccVex5I
	bRQK1Q5yHwFQ1ffuJeG+7EXQ6OUkXOkmIhEjAQ9tVu6IZ1jNCpuKOUMz5YAMkKKCB0yfqdL0oguC8
	XR6dibz8aiwVTPTln3MDwoqGcq/RHt3Kinw3p665GqRjB8I4hULt0B/cHUEZHbDct4wgW6RO4pnYK
	0rBGPuXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquHw-00000003Xfm-0Ipn;
	Fri, 13 Feb 2026 14:36:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquHs-00000003XfN-0ibh
	for ath12k@lists.infradead.org;
	Fri, 13 Feb 2026 14:36:53 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4806bf39419so22616215e9.1
        for <ath12k@lists.infradead.org>; Fri, 13 Feb 2026 06:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1770993409; x=1771598209; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pwnjdk/EpFtVilyv396Zg4GuaP+kgL1WguDKKzHZSNg=;
        b=aNLeN61S69ee2Qr+afDD6Y+og6DT7xs3247JR+iZ01tFY6ImpWADJzDpRbwCo9rxZ8
         QLNoy4D9bsdW6fWh0E7mNXpmR9++1St/xgGpmDi0xH9OUeXqTqh5b1lbHtIMmckUZJgt
         HRL6Oet/eAJSKKIEapCYFMmppKB2mRf++frgxOzIlDTzZD9hsEUR1eS6hQ3RIhaW14pu
         XIRZt2agu7anKVwKNb38RQKIqcR4H2615D0JPp8VyofY1w440sb45soo/DoRMG4GrsPW
         jz117ETOVPXXrHHyYNz5+6ltDBv1YkKG2x85dCvrEJ3TeqfSbfXibcPGjX6FcbFnBios
         8Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770993409; x=1771598209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pwnjdk/EpFtVilyv396Zg4GuaP+kgL1WguDKKzHZSNg=;
        b=npI3QRC14p4WLl2J5sqkmAEqQP1e2lPEgb6lCyKCvOZHEVybvMY7jHdORCtGtBkjiv
         zqhmI4Dh6LXuJGf0zJrll7AnLvNdQ4FyHCqCyl9W8rUoFFgAT0Pdfp4ElpkiCKWUfz7X
         GskpViLsL79CnhMt3MNNXXNPHME9UP3RcHfdWsKCA9hy7thuuEQUMVGvMUv9cEIgTkBP
         EgnFyxWLVvOHVhimihsABu4zJ/5oivVMIv4g6OrH1pZk73mVw/utXlpSmLQ9DLCGnP6/
         wll5DqjGStb/e3gAdHM9wk4AICZIC3d0fgOSWwpKVGMp9d35cFVZfolBmn8wuljfoWR+
         hJyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVesf6PBqTNt2fdmguIcSw8MFW7AcXptLdicJr7Zs6te/wr9WX40sdUbDX2rGxxXCXXfJd2BCM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTjX8iFaqTMEyg0WbSP3ljLa5DeVCjwvvMK7x1SsWG9u7EYv0a
	rC54mh3e8UwBAMpmNkYuJvf/412Bp7Bcowy4TH5bHELyWnYdu4lnyXMhwowWWD9/Mck=
X-Gm-Gg: AZuq6aKF/+ERPK1izVPbl8mihTSW93606hY2ns34halHdOqOL1af4TOAr7NW0DHBph2
	yj37UYWxmDdxMFT8SgOOeAw86Pf67uIW88muXhW9nPxfe3h1TrbwDTnWVPpLmy5CjbhhUj2e54q
	jV7dMuq+dSLpnsOFK3qfGze5IJBX/sofqjDkDpCUvuHF0hTVQ8xsT7loRwxo92XZoo8qgpbNPU0
	fgMsmveHpWq/l5fy0KmNm0ePCZxAvXNGhFraxzdcvBF1r7nB7ZjhbQFN3eiOl3pR1xcdndeVsRZ
	c4NDkObSynV/i/1oAMU/bq4iA6ms2ediQ2vWyfSJYnilgw1KdIDF56SM5yOzqwe0bW7nmbLxEIT
	rLEWjr1DQ1u9uZQ94uUXCIrK1ZmoZ3h2uUye9CjuwYqFOI535VHX+5hp4kwq478JLIaJ6G2m8ni
	VaGA5yjwI27KjLLSZbwV6QTue8o1GpGU7NWVY8IyOtEGt4To25asvoVQ==
X-Received: by 2002:a05:600c:5251:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-48378da3e01mr5240985e9.14.1770993409176;
        Fri, 13 Feb 2026 06:36:49 -0800 (PST)
Received: from [192.168.108.101] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4afsm482419145e9.11.2026.02.13.06.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 06:36:48 -0800 (PST)
Message-ID: <4dcf82f8-21c1-4704-8575-7f526ce1c77f@freebox.fr>
Date: Fri, 13 Feb 2026 15:36:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3 2/2] wifi: mac80211_hwsim: Add UHR
 capabilities to the driver
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>,
 johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260212180128.257565-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <20260212180128.257565-3-karthikeyan.kathirvel@oss.qualcomm.com>
Content-Language: en-US
From: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>
In-Reply-To: <20260212180128.257565-3-karthikeyan.kathirvel@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063652_370886_635C8EC0 
X-CRM114-Status: GOOD (  13.76  )
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

Hello,
On 12/02/2026 19:01, Karthikeyan Kathirvel wrote:
> Add UHR capabilities for bringing up the interface in UHR mode.
> This is required to validate UHR test cases.
>
> Signed-off-by: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
> ---
>   drivers/net/wireless/virtual/mac80211_hwsim.c | 285 ++++++++++++++++++
>   1 file changed, 285 insertions(+)
>
> diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.c b/drivers/net/wireless/virtual/mac80211_hwsim.c
> index 4d9f5f87e814..5a576bbb7688 100644
> --- a/drivers/net/wireless/virtual/mac80211_hwsim.c
> +++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
> @@ -4478,6 +4478,49 @@ static const struct ieee80211_sband_iftype_data sband_capa_2ghz[] = {
>   			},
>   			/* PPE threshold information is not supported */
>   		},
> +		.uhr_cap = {
> +			.has_uhr = true,
> +			.mac = {
> +				.mac_cap[0] =
> +					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP,
> +				.mac_cap[1] =
> +					IEEE80211_UHR_MAC_CAP1_DSO_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_PUO_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
> +				.mac_cap[2] =
> +					IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
> +					IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
> +				.mac_cap[3] =
> +					IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH |
> +					IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV |
> +					IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW,
> +				.mac_cap[4] =
> +					IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH |
> +					IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS |
> +					IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE |
> +					IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
> +			},
> +			.phy = {
> +				.cap =
> +					IEEE80211_UHR_PHY_CAP_ELR_RX |
> +					IEEE80211_UHR_PHY_CAP_ELR_TX,

`IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_LE80` and `IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_LE80` are for 80MHz and lower, it should include 20/40 MHz of 2.4 GHz, no?

> +			},
> +		},
>   	},
>   	{
>   		.types_mask = BIT(NL80211_IFTYPE_AP) |
> @@ -4586,6 +4629,50 @@ static const struct ieee80211_sband_iftype_data sband_capa_2ghz[] = {
>   			},
>   			/* PPE threshold information is not supported */
>   		},
> +		.uhr_cap = {
> +			.has_uhr = true,
> +			.mac = {
> +				.mac_cap[0] =
> +					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP,
> +				.mac_cap[1] =
> +					IEEE80211_UHR_MAC_CAP1_DSO_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_DBE_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_PUO_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
> +				.mac_cap[2] =
> +					IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
> +					IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
> +				.mac_cap[3] =
> +					IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH |
> +					IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV |
> +					IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW,
> +				.mac_cap[4] =
> +					IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH |
> +					IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS |
> +					IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE |
> +					IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
> +			},
> +			.phy = {
> +				.cap =
> +					IEEE80211_UHR_PHY_CAP_ELR_RX |
> +					IEEE80211_UHR_PHY_CAP_ELR_TX,
Same
> +			},
> +		},
>   	},
>   #ifdef CONFIG_MAC80211_MESH
>   	{
> @@ -4755,6 +4842,55 @@ static const struct ieee80211_sband_iftype_data sband_capa_5ghz[] = {
>   			},
>   			/* PPE threshold information is not supported */
>   		},
> +		.uhr_cap = {
> +			.has_uhr = true,
> +			.mac = {
> +				.mac_cap[0] =
> +					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP,
> +				.mac_cap[1] =
> +					IEEE80211_UHR_MAC_CAP1_DSO_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_PUO_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
> +				.mac_cap[2] =
> +					IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
> +					IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
> +				.mac_cap[3] =
> +					IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH |
> +					IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV |
> +					IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW,
> +				.mac_cap[4] =
> +					IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH |
> +					IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS |
> +					IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE |
> +					IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
> +			},
> +			.phy = {
> +				.cap =
> +					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_LE80 |
> +					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_LE80 |
> +					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_160 |
> +					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_160 |
> +					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_320 |
> +					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_320 |
I'm not aware of an operating class that allows 320 MHz on 5 GHz (or 
even a non standard use of it), 
`IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_320` and 
`IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_320` should be dropped
> +					IEEE80211_UHR_PHY_CAP_ELR_RX |
> +					IEEE80211_UHR_PHY_CAP_ELR_TX,
> +			},
> +		},
>   	},
>   	{
>   		.types_mask = BIT(NL80211_IFTYPE_AP) |
> @@ -4880,6 +5016,56 @@ static const struct ieee80211_sband_iftype_data sband_capa_5ghz[] = {
>   			},
>   			/* PPE threshold information is not supported */
>   		},
> +		.uhr_cap = {
> +			.has_uhr = true,
> +			.mac = {
> +				.mac_cap[0] =
> +					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP,
> +				.mac_cap[1] =
> +					IEEE80211_UHR_MAC_CAP1_DSO_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_DBE_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_PUO_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
> +					IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
> +				.mac_cap[2] =
> +					IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
> +					IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
> +					IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
> +				.mac_cap[3] =
> +					IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH |
> +					IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV |
> +					IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW,
> +				.mac_cap[4] =
> +					IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH |
> +					IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS |
> +					IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE |
> +					IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
> +			},
> +			.phy = {
> +				.cap =
> +					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_LE80 |
> +					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_LE80 |
> +					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_160 |
> +					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_160 |
> +					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_320 |
> +					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_320 |

Same

[...]

Best regards,

Pablo MG


