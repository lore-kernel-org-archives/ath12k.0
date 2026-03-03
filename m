Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F232EC1430
	for <ath12k@archiver.kernel.org>; Tue,  3 Mar 2026 11:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6ejIrhnkmBxeXgP4qlqYRb+DTKJ7qhF+lynUJ8Yzqc=; b=tcc5DpUsk7m/KmmaGtHVbp3/+X
	P370shVXsyOQUubLVhydfnm8F0Dnc1XLMOeftEgcx8syMkTQ7scxbCLT88o5nm0MLEfFaebP0vDjo
	Ngu5KQ+aBuWs0Bfx2bTHc305YU2XheLTykTdXaK5HXUABnwXa//zf37HsJQI9wzueYVeRavysv6w8
	UwxUEcK/XBZ+5qWe2FjQOPgrvc6ZkhzCFUaZB4ZmWDGqCDampWYR3jHdqLc1qYqyoY2rv9ZGmeZqq
	ylkniP6Qsy39oC3lOtJY5I/sqkcDcSqakPVk7VKlrr2ZEwSbD6xQl1BrUK8fLN+I7RbWHagVGu95Q
	W3ODG06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxO7r-0000000F5e1-0p3y;
	Tue, 03 Mar 2026 11:41:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxO7o-0000000F5dR-38dU
	for ath12k@lists.infradead.org;
	Tue, 03 Mar 2026 11:41:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mfC02727526
	for <ath12k@lists.infradead.org>; Tue, 3 Mar 2026 11:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z6ejIrhnkmBxeXgP4qlqYRb+DTKJ7qhF+lynUJ8Yzqc=; b=UoBs1ZIaCSEl4Fod
	hMoTwS8YqtXW3lPdKQxcphpSWz1MK03zvMZHMCV1wX4jRaymIfTdhB77RopVQhIS
	mHHjE0PjRoqvsVh2l55Rq72eqvBCU5BiwAlhocU6yngLP4rnfK11F3SqU51pMHW/
	Ffg/92frhbZts2MWRN3AJCt/Qux1yesy8i7a2dFX12sJLheQ0WbCM1b5UvcosKm1
	OAhhdmGydt3M8zm612RsKlV77KjRdujq1Jt77xkr2/mGnthTgjWdDnX3GrVIjppI
	+ZgzqbP5pB8/I76itWCQpc/6A9unyFKBwD4F43TwF32R3mFMMC5P7VBWuqlrdrQc
	Qhpw/w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe148b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Mar 2026 11:41:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4f27033cso21012685ad.3
        for <ath12k@lists.infradead.org>; Tue, 03 Mar 2026 03:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772538075; x=1773142875; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6ejIrhnkmBxeXgP4qlqYRb+DTKJ7qhF+lynUJ8Yzqc=;
        b=GnAGlNzAmFGSnebyMAOrElNt26eNJtkDcTrLpHSEr3w/80n+S+7qVbUo4Jk6NR2lkO
         pLvgFVXub+jwTVSPhj/0LDbNMAZdL1c8k2oOgTbICo84NiSunJ6OizOmoTAGP2Bz3bU5
         Gnp/RWG7FG+s3bCHlOjHyYjP4Rc9C0BLEV1UL19JNL6XzVNL6JvtUUoUubrc6AsRys45
         yV2co5sqUD7Hvcvv37cs6qJz/aLZnQqzd+sWs3AA8FPUZimZK+KZUjPnw0avIaEWyxni
         2hO54pvXz9y6He0xYS1aTOZH/0mCRluKaEwnLY/Po5/4D9RwDt3NNXT9WFcJdmEBLUbA
         wZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772538075; x=1773142875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z6ejIrhnkmBxeXgP4qlqYRb+DTKJ7qhF+lynUJ8Yzqc=;
        b=JOaChAZc0NF2Pbhsw7lz8xHLkc0giUWt7I5Nz0PFy4WJxJK/FZPb+t/ez12G0fRtXV
         FIrkIJTnjVYVUw9MaSVvJRuZyfmw8zM/e9hCXeUUC3E2EsF+QgUNTV+1U07CZoy/M4cB
         DgffX9BI2/Gm+3NIky8tp93DOBxUph1NFZ/nx0XYI+njyZf9Hh9ECaiy2+6sLBu1oODI
         0gQaYC16VpYBNaIbB59c54aXz8EZEDbuSQlnDV/w76LPFsgaE2TtVysAc4ewoPHoQPxs
         u5zvqrcL/M8d7kh007m8VC0OGqZE5ZkfSFqLLYMmFFDdB+TE47xKR50VVnIe7NCB5O0H
         fPzA==
X-Forwarded-Encrypted: i=1; AJvYcCWzDUhku1j+MNKw8SbJLgcvz3DKWHqun68fvOdOtxHiwra0jlgzkhC4V6p7GBmPa4eAAx3VNkc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbLMzFwWFdXbSrKgr0ueFjXH1Uzd/1Aff/eG6HKK7Af1ZzmeTW
	+Tv6Uu6VsaKk1dDS+r9UZUdGSO9OvpgxZ3tSpLg2qcKK6NuujNRSUkPTZ80vBCQDYknAzXolGHn
	1J5pzUkXDmM7EzoqsH0/Ukah+90vic4ep7tVs2pmbplPjR43eolxqGLT0yIDf7n76LR3oQiUa
X-Gm-Gg: ATEYQzzZAkWfc/ljn/pERIZUSVmu5JJf0YMySnW4+Y77H1UFtqeIbAG54NkuL+vKOp0
	ntj60Aix9EwkJ0Esu1Aa/3t0bdvRdx5G7/d5Ho2yPfflKg9LyVQlP1pEcKj2BlHrGpkW89rYzWw
	0D+bOSXi9uvZH/VKEFgkI6vCRWRaj+e4AD1fvjKZr5JvnoKGQ6NsFqk4GzBm2t7H7tpWHzxBDy9
	cvrQVSbfuA8QC/TtGVpJlDeFllJZpQDknhZbSRt8IgbgjMwEOkKnjIZ2awvC/o0OfnuFiZI7518
	lzTJ1BjhjA6lHfpllZ2kPrnzhQmcHR+58jDY1Q6VAneg2PKXKPjb/e/GNV1m6esdEZfOwVmuCzJ
	2GuY0mWPIIkwCDMzfR9oTbsmu6JFu9d/PcXjPB7XlyZhUm0XhO4mVNbDobppd/y0=
X-Received: by 2002:a17:902:da8f:b0:2a1:388d:8ef3 with SMTP id d9443c01a7336-2ae2e401d21mr164027505ad.18.1772538075088;
        Tue, 03 Mar 2026 03:41:15 -0800 (PST)
X-Received: by 2002:a17:902:da8f:b0:2a1:388d:8ef3 with SMTP id d9443c01a7336-2ae2e401d21mr164027365ad.18.1772538074573;
        Tue, 03 Mar 2026 03:41:14 -0800 (PST)
Received: from [10.152.199.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f996sm162429675ad.50.2026.03.03.03.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 03:41:13 -0800 (PST)
Message-ID: <a882918a-0d6f-4eac-ada9-5d4bd748b33c@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 17:11:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v4 2/2] wifi: mac80211_hwsim: Add UHR
 capabilities to the driver
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260217054731.3667600-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <20260217054731.3667600-3-karthikeyan.kathirvel@oss.qualcomm.com>
 <d52fdbe5d9a483b5746b7253b512958d1460a9a1.camel@sipsolutions.net>
Content-Language: en-US
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
In-Reply-To: <d52fdbe5d9a483b5746b7253b512958d1460a9a1.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ciedp-x7--98rXPtYOHzRoyu5DVHwKoy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5MCBTYWx0ZWRfXxOD6aiYMfV3L
 6tihaApfylZBlOo+PCiegl2hP+FK9k0KrgEgKMZ/qHd5lc0FfjN/rgir7PaNUCNqB+G5OjjgCmB
 YPk6t+aiTwRpqpcqbq1Cu8Z6bZqsdfh0QdVEy4jJE2AsRJuz0e/V+cVKTt85wg6cUXGpbmZQJ6l
 yuCZFS6Yb0mB7ovPMuB0mEJk/PnWOQrbIWnspYKkWhGf62CIec774WQDT50kUfrGtR4+w/+Cja5
 8Gs6wujUBEeg0CURjPz1a2OOUHV2ZHlnp9QI+9SdN/Q5Gl2NyVlAkSZvCdGvlz7gslIw1o4QDR3
 41VaR+pb+bV7RxvaI4O9tmeF/5GvQkIxdQa6seq/zkL+6rNd9Yt/sPXi6Wemgnt2EcZkj+oUUUL
 yyOtWvY5eAc8SnjIdxrkxwpGoVfedKQy40lPj0N4kc48eka1xOEa+jdTmMpWqpxYK34wFwtv3vZ
 y31+nbx4CJjsbGodUug==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a6c8dc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=oJrowrCMtk5DI0Br3tgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ciedp-x7--98rXPtYOHzRoyu5DVHwKoy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_034116_812524_C7D6EF6A 
X-CRM114-Status: GOOD (  16.92  )
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



On 2/24/2026 9:50 PM, Johannes Berg wrote:
> On Tue, 2026-02-17 at 11:17 +0530, Karthikeyan Kathirvel wrote:
>>
>> +		.uhr_cap = {
>> +			.has_uhr = true,
>> +			.mac = {
>> +				.mac_cap[0] =
>> +					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
>> +					IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
> 
> I'm really not sure we should claim all of this, e.g. DPS assist, right
> now.
> 
> Also, I think you really mixed this up - a regular AP shouldn't claim
> DPS below (only mobile AP), but this here station should probably not
> normally claim DPS assist?
> 
> Just as examples! There are other issues like this such as:
> 
>> +					IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
> 
> I don't think the station should claim AP PUO support.
> 
> Certainly not an exhaustive list, ELR also seems wrong, etc.
> 
> johannes

Got it. It looks like this requires a deeper feature-level understanding 
or a review of the full spec document for each feature. Instead, I used 
AI to simplify this. Below, I’ve pasted the AI output, categorized by 
AP/non-AP STA and by bands. Is this approach fine? Shall I go ahead and 
make the changes based on this?

   ### UHR MAC capabilities

   |              Macro              |         Role tag      | Band tag |
   |---------------------------------|-----------------------|----------|
   | IEEE80211_UHR_MAC_CAP0_DPS_SUPP | Both (AP + non‑AP STA) | All |
   | IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP | Both | All |
   | IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP | Mobile AP only 
(reserved for non‑AP STA) | All |
   | IEEE80211_UHR_MAC_CAP0_NPCA_SUPP | Both | All |
   | IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP | Both (requires +HTC-HE=1) | All |
   | IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP | Both (conditional; EHT 
SCS Traffic Description Support) | All |
   | IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP | Both | All |
   | IEEE80211_UHR_MAC_CAP1_DSO_SUPP | Both | All |
   | IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP | Both | All |
   | IEEE80211_UHR_MAC_CAP1_DBE_SUPP | Both | All |
   | IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP | Both | All |
   | IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP | Both | All |
   | IEEE80211_UHR_MAC_CAP1_PUO_SUPP | Both (different meaning AP vs 
STA) | All |
   | IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP | Both (different meaning AP vs 
STA) | All |
   | IEEE80211_UHR_MAC_CAP1_DUO_SUPP | Both (different meaning AP vs 
STA) | All |
   | IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP | AP-only (reserved 
for non‑AP STA) | All |
   | IEEE80211_UHR_MAC_CAP2_AOM_SUPP | Both | All |
   | IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP | Both | All |
   | IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP | non‑AP STA only (reserved for 
AP; requires +HTC-HE=1) | All |
   | IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP | Both | All |
   | IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG | Both | All |
   | IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW | Both | All |
   | IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH | Both | All |
   | IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV | AP-only (reserved 
for non‑AP STA) | All |
   | IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW | AP-only (reserved for 
non‑AP STA) | All |
   | IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH | AP-only (reserved 
for non‑AP STA) | All |
   | IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS | AP-only | All |
   | IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE | AP-only | All |
   | IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP | Both | All |

   ### UHR PHY capabilities

   |              Macro              |         Role tag      | Band tag |
   |---------------------------------|-----------------------|----------|
   | IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_LE80 | Both | All (≤80) |
   | IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_LE80 | non‑AP STA only 
(reserved for AP) | All (≤80) |
   | IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_160 | Both | 5/6 (160) |
   | IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_160 | non‑AP STA only 
(reserved for AP) | 5/6 (160) |
   | IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_320 | Both | 6 (320) |
   | IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_320 | non‑AP STA only 
(reserved for AP) | 6 (320) |
   | IEEE80211_UHR_PHY_CAP_ELR_RX | Both | All |
   | IEEE80211_UHR_PHY_CAP_ELR_TX | Both | All |


/KK

