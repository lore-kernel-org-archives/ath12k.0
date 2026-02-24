Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E01E9B249
	for <ath12k@archiver.kernel.org>; Tue, 24 Feb 2026 11:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnUsHJSbAP+pZjOOAhK5dDeUbFNSuWJ7PmHwsoLuiNA=; b=r3O/mTRiTtD58On7Yd8uwMFb9P
	C4UGfyRNfbTEz2i/NZx+t8FlFBjS6Rfid0NmVqXWZquovhAYnaUIKn//zuWiQsTY+6iA5Y/vuNTD+
	aZWYqFDLOF6Aox6rn9O1rFh4IOVXLakG9wBoJ4EKGr+kYsishMU1coiPmTrEuYBWqhXUOGWJya0n3
	uj8KBp7p3U6HSwU7t8i0wQyjTK9AFBeM7kynrPlwZK8aXzjLD+9vsTtAjB2ckq+QISzOBb/Tnldd7
	Y3rLbq1yWmyE4sIlO5dCtbiQcRCaa9ImIsTnI9JTL9RP6iwtmm+hI4cXOytJhZe9EIUSKnKyo2Lbp
	/N7+urtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqAx-00000001vuE-2Mlt;
	Tue, 24 Feb 2026 11:01:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqAu-00000001vti-3V2w
	for ath12k@lists.infradead.org;
	Tue, 24 Feb 2026 11:01:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFVTR2560561
	for <ath12k@lists.infradead.org>; Tue, 24 Feb 2026 11:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RnUsHJSbAP+pZjOOAhK5dDeUbFNSuWJ7PmHwsoLuiNA=; b=RCAvJv6v4DoJuz8q
	2hz72yD/C+au1ZX+miO9PcYu6xDsG+Iqnrn7fFX0W+G8e5Seyg5QDqHJmxdfAr+r
	zHeepf0K6MUxKUZpVGFcvnbJqIoYfpyi6XEi04EI5CIwzLBSXoQ9N+AVJB8FACxu
	B+9YuQ3AazKcoY+Mn8gBvfW9sPlNXJB5avOqnjTK+52p6VHm33cchIzb8YnR6pdQ
	H6NFxZprNaYx22mbH9arIgSO2etpULSPLZmOMd0Npp9aGBJvtVPuijQbeX7iI7Kw
	ntyskiKY60kz8dU6K2HyRNKarQ2cSA2yF8h/uiXT5c7xE0c2Rx7TdC4iLgP7aBkp
	nUrW+g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e395cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Feb 2026 11:01:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35464d7c539so5260875a91.0
        for <ath12k@lists.infradead.org>; Tue, 24 Feb 2026 03:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771930914; x=1772535714; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RnUsHJSbAP+pZjOOAhK5dDeUbFNSuWJ7PmHwsoLuiNA=;
        b=XIX1Hqes0VdGqMmu7kDQ6ZAA4Vx1dtQEze9wcDyCDQNaR94dZ1+Dls/U+Dywf1DsVq
         X//DK0pPs5EWUyaoXnxSes37Q53v7uzP3njEsv7ftN4WnfoUbj6ztJKJo8GY5OBk/NyP
         YCy796b19ZoxcQ1ub3Go+NZmcc3eu7WdHO4the4TObs3YydQuvlJRthJzYeN5nIqqhtr
         81rmQ6JkqJpBr6uotCMUiEYHmdXl3LwhvNCX/RDXB1hY/BopgVLPRFcjPR3NxwtFKvnV
         WLJG625Vqb8DWGns+oXQkAq8KsUGDPC3ovypBsNHaEKuaIWz/WbsRPGgJi9tDmnDakXy
         DQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771930914; x=1772535714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnUsHJSbAP+pZjOOAhK5dDeUbFNSuWJ7PmHwsoLuiNA=;
        b=TDOsJI05+ZY5HvBzcbvJnXr62KDf8jg82A82gOsfdw9SP6l4w61+G97PQaoYVyba1t
         Zmcv/NCm5XycBDVvCVyAdFeqTqNgGzDNs4Kqvw8ErHuzniCDAo32yorqBxJtnaSHqlpm
         o1C6yB+0uQMUmsGHQXBPp/IzewoLyAh/55ggmSjBHb7GxXn91Ai5I1cLx6zJouPsTVzf
         fVA2dgseQqqd45S+6CqgU5UPYNTbyzCWK+5w6AlnnZ8AEV/0LmChGQgsmxuEMYyk43qW
         IV19T4HrbJKooYMmHdDsHe4RWGg8QfIQOpDp8FcxRMeG6qUTrzo0xc2K5Ut8Dq+3AN1L
         4ing==
X-Forwarded-Encrypted: i=1; AJvYcCUcSoKPfDmP/RXD4A9snz+tYvFIujlMdSQCfMJt73RfyUytruyqBEA+tH/AR6Lt4bLh+5l+ZdE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxudkUNQf0evVkAoDvsyluKJnVjJufeW/db+6nNBtk5w+p7mp1U
	RlBHPaTkFb7kDZcJU2qgOxzQOmWcOWWfa0M2Bda4x1ukQEj2aW2Cby6j35A/ca/QYdusC1zkWgj
	fwxu4+aG5QIZbuQUro/L8iNswv7+JBEl3cGnvyFOyjSDrgTUWmusltOrk36v+Abor
X-Gm-Gg: ATEYQzypvW1LpMTyKAsob02etQsZXvbxnlnIYt+mP0P0IdKGSlCjzlZC3VF5RcRIy3q
	+rJkHSKodnL0vbdUHXKn6B6lc5u2c53vN5jvv/dOK1rQsplOh8e7HQB4YbELeDfOuGNK5XJtltP
	4tiEIUwkQSN9Tyahd/SaWCp3XsV0h0wQOJ1cWcS0ovS5mnr/BItAHxZoigtddkdJDq+Esmcuv2o
	a23G6u4+I+CoSRch6YskLt/ZWqpqa1rQJwwZ2AKIcbyodaH2S7SPtvs3w/lCb4En63q4BNih2t2
	0gNqTU05qmgyxvXjtgIj7B/PVRtK4ssqnH7A++lsAdcU7SLwlwQYOl1B0k+DlmQ2zAFta45lzny
	POSvyfPVpXqqWTaZ83gPuXMKxE3sfy7cN4xops6+zq9SXsVOQ5+icDA==
X-Received: by 2002:a17:90b:2b8c:b0:356:2c7b:c010 with SMTP id 98e67ed59e1d1-358ae812409mr12203046a91.11.1771930913708;
        Tue, 24 Feb 2026 03:01:53 -0800 (PST)
X-Received: by 2002:a17:90b:2b8c:b0:356:2c7b:c010 with SMTP id 98e67ed59e1d1-358ae812409mr12202967a91.11.1771930912509;
        Tue, 24 Feb 2026 03:01:52 -0800 (PST)
Received: from [10.152.201.41] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358d79e47d9sm906963a91.3.2026.02.24.03.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 03:01:52 -0800 (PST)
Message-ID: <f3282007-a11a-4f68-86d8-0945e4979d65@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 16:31:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v8 2/3] wifi: cfg80211: add initial UHR
 support
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        Lorenzo Bianconi <lorenzo@kernel.org>, ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Ping-Ke Shih <pkshih@realtek.com>,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
References: <20260130154259.265130-5-johannes@sipsolutions.net>
 <20260130164259.54cc12fbb307.I26126bebd83c7ab17e99827489f946ceabb3521f@changeid>
 <f96125eeda23451c19067359eb9d10b4047bcdd3.camel@sipsolutions.net>
 <5d54feea-d0cd-4bd7-b0d2-02e42f0fe5e1@oss.qualcomm.com>
 <be9ab3c7f05b0f56f19aee0ffc7c2f96138b9a05.camel@sipsolutions.net>
 <156d6d48-d135-4acf-a5d7-c9ae80523864@oss.qualcomm.com>
 <0f4b34f0b529fd93fc608d8bbac0e98516b7a3d2.camel@sipsolutions.net>
Content-Language: en-US
From: Harshitha Prem <harshitha.prem@oss.qualcomm.com>
In-Reply-To: <0f4b34f0b529fd93fc608d8bbac0e98516b7a3d2.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UtFu9uwB c=1 sm=1 tr=0 ts=699d8522 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=yvEocR2s0TKtyDQkXLUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: JjjawlaRMprcIUyszdbFseDcYArQi7al
X-Proofpoint-ORIG-GUID: JjjawlaRMprcIUyszdbFseDcYArQi7al
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4OSBTYWx0ZWRfX2xJ/wvGujdy2
 zANQc6FXf+Fr7g1eDwqOE4R9LJUIRL3KmobxMgoNQ6qn1wcWu80i91/dXEVxyGgVkxviRFD0qnw
 xO0+0ThssWPu10+7jOZ/b9Bos2ge7si4U/MM+tTMPXDx8ES0QmUEfzcMaNjpWWd/W4dCczLgrMg
 t6aRmg8QO3FlFQA3/Sv/HtsMQbutls7tel/LNwDykIlSB7gG7JgXOeebNw+Am/oXTrCQ+2Qh2Dq
 fciFsBzdWZjILt1TvgFywyYY71KJLnr1KUmwlyBTLKqkMq0AZeojf4SwbjvCePzJWitu4m/yqs5
 yis7g4IyQ1P9zxzfEGMK7B5V4xsxFZm2ywV5y3bLrgeJOFOgtXPRlFARx5fr13zxsiBKJyeC7uJ
 28N2nOK4TpFPMBSzQmLcAg7oWO95EKbr+hgnLbQhKA6RyiQZGQi0EJE2PuOvVyU8inECOTBLAFs
 64rbVhjsZ8/y+fcLJGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_030156_999815_EB31CB75 
X-CRM114-Status: GOOD (  38.81  )
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



On 2/17/2026 3:35 PM, Johannes Berg wrote:

Hi Johannes,

Thank you very much for your patience, and apologies for the delayed
response. We spent some time discussing this internally and wanted to
follow up thoughtfully.

> Hi,
> 
>> This approach looks well suited to handling overlapping update scenarios.
>>
>> To make sure I understand it correctly, I’d like to walk through a
>> concise example where a UHR critical update and a CSA overlap on link 0
>> of a 3‑link AP MLD.
> 
> Well, so honestly, you should probably treat what I write as equivalent
> to a paper napkin sketch during a night of drinking ;-)
> 
> I surely didn't think it totally through. I was just trying to
> illustrate that I feel like we need to have some kind of new design for
> all these overlapping updates (CSA, BSS color change, EHT and UHR
> critical updates?) than the piecemeal design we have now.
> 
> And, importantly, that perhaps I think that this means we need to have
> "post-update UHR operation" more than the individual UHR operation
> updates broken out - which after all is where we started from.
> 
> 
>> t1: A UHR critical update is triggered. hostapd sends
>> NL80211_CMD_START_MLD_BSS_UPDATE with an advanced notification (5
>> TBTTs), post‑interval (5 TBTTs), and the beacon template with UHR
>> parameters update element for link 0. Timers start in mac80211, and
>> hostapd receives cookie X.
> 
> Don't know if timers would be really in mac80211 - I guess if the driver
> pulls each individual beacon then mac80211 could handle the countdown,
> but otherwise this might just be given to firmware.

Yes, agreed.

> 
> Also I guess the counter would have offset(s) from the start, i.e. the
> beacon template would be in this operation already. Or maybe even beacon
> updates for multiple links? Don't know if that really matters much
> either way.
> 
>> t2: hostapd sends NL80211_CMD_UPDATE_AP with cookie X and offset where
>> the counter is updated for link 1 (and then link 2).
>>
>> the countdown values would be handled in mac80211 with the offset
>> mentioned similar to ieee80211_set_beacon_cntdwn().
> 
> Sort of, yeah. I imagined that the CMD_UPDATE_AP would come with a list
> of "cookie X: { offset X_1, offset X_2 }, cookie Y: { offset Y_1 }" or
> something like that.
> 
>> t3: Before the UHR advanced interval completes, a CSA is triggered (due
>> to radar or user‑initiated). Another NL80211_CMD_START_MLD_BSS_UPDATE is
>> issued with CSA countdown 5, including CSA and after beacon templates.
>> The after template carries cookie X and the offset. Since UHR CU is
>> already in progress, hostapd could also include an updated parameters
>> update element. 
> 
> Would have to, I think? I think in your example it's unlikely the _after
> CSA_ template still has cookie X / offset(s) X_n, since you only had 10
> beacon intervals overall for the UHR critical update and CSA might be
> longer, but we could also imagine the UHR critical update was advertised
> for a longer time.
> 
>> Also, an updated UHR operation element which can be
>> modified in after beacon template if CSA finishes after the UHR CU
>> advance interval. (why to provide the UHR operation element separately
>> is because the advance notification can be before or after the CSA
>> finalize).
>> hostapd then receives cookie Y for the CSA.
> 
> This could get trickier than I imagined - you now have three periods of
> time:
> 
>  - now
>  - after CSA but before UHR update
>  - after UHR update
> 
> and actually all three might need different UHR operation, since the CSA
> can change the bandwidth and therefore e.g. DBE/NPCA. The intermediate
> period ("after CSA but before UHR update") can be captured by the CSA
> operation (given a template/UHR operation for after) easily.
> 
> But I was imagining we capture all this in the operations already, so I
> guess to do that we would need a "NL80211_CMD_MODIFY_MLD_BSS_UPDATE"
> command that takes the cookie and updates the post-operation values, so
> that the changes due to the CSA could be taken into account in the
> previously started UHR update.

The idea of introducing an NL80211_CMD_MODIFY_MLD_BSS_UPDATE command
makes a lot of sense to us. In cases where
NL80211_CMD_START_MLD_BSS_UPDATE is already in progress, having a modify
path to update the current beacon seems easier to reason about and
manage. From that perspective, a pairing such as
NL80211_CMD_START_MLD_BSS_UPDATE together with
NL80211_CMD_MODIFY_MLD_BSS_UPDATE feels quite natural.

> 
> FWIW, I was also kind of imagining that we'd design this combined update
> command in a way that it replaces the CSA and color change commands,
> handles the proposed link removal thing from Lorenzo, and then we don't
> need to handle overlapping operations of all kinds, just of this new
> kind that can do many different things. Not a huge difference though
> since CSA/CCA would map to a subset of the new "thing".
> 

[...]

Please find below the envisioned design flow for the UHR CU and CSA
intersection.

Hostapd (User)          mac80211 (Kernel)           Air / Station
   |                           |                           |
 1 | CMD_START_AP [Adv Notif,  |                           |
   |  Post Notif, Upd Int]     |                           |
   |-------------------------->|                           |
   |                           |                           |
 2 | CMD_START_MLD_BSS_UPDATE  |                           |
   | [Link:0, CurTmpl+Offset   |                           |
   |  (All), Timer, PostTmpl   |                           |
   |  (All), Type:UHR_CU,      |                           |
   |  Post UHR Op element]     |                           |
   |-------------------------->|                           |
   |                           |                           |
 3 |                           | [Set Tmpl, Timer: Adv=10, |
   |                           |  Post=10, TIM Update]     |
   |                           |                           |
 4 |         Cookie X          |                           |
   |<--------------------------|                           |
   |                           |                           |
 5 | EVENT_UHR_CU (CU_START)   |                           |
   |<--------------------------|                           |
   |                           |                           |
 6 |                           | Beacons: 10, 9, 8...      |
   |                           |-------------------------->|
   |                           |                           |
 7 | [CSA Triggered: Link0,    |                           |
   |  Count 10. Sees Cookie X] |                           |
   |                           |                           |
 8 | CMD_START_MLD_BSS_UPDATE  |                           |
   | [Type:CSA, Link:0, Tmpls, |                           |
   |  Cookie X + Offset,       |                           |
   |  Post Tmpl (No UHR ele)]  |                           |
   |-------------------------->|                           |
   |                           |                           |
 9 |         Cookie Y          |                           |
   |<--------------------------|                           |
   |                           |                           |
10 | CMD_CH_SWITCH_STARTED_    |                           |
   | NOTIFY                    |                           |
   |<--------------------------|                           |
   |                           |                           |
11 |                           | Beacons: X=7, Y=10        |
   |                           |-------------------------->|
   |                           |                           |
12 | CMD_MODIFY_MLD_BSS_UPDATE |                           |
   | (Cookie X Post Tmpl w/    |                           |
   |  Chan Info, 3 Links)      |                           |
   |-------------------------->|                           |
   |                           |                           |
13 |                           | Beacons: X=1, Y=4         |
   |                           |-------------------------->|
   |                           |                           |
14 |                           | [X=0: Modify Cur Tmpl     |
   |                           |  w/ Post UHR Op element]  |
   |                           |                           |
15 | EVENT_UHR_CU              |                           |
   | (CU_ADVANCE_COMPLETE)     |                           |
   |<--------------------------|                           |
   |                           |                           |
16 | CMD_MODIFY_MLD_BSS_UPDATE |                           |
   | (Cookie Y Post Tmpl w/    |                           |
   |  UHR Op + Param elements) |                           |
   |-------------------------->|                           |
   |                           |                           |
17 |                           | Beacons: X=127, Y=3       |
   |                           |-------------------------->|
   |                           |                           |
18 |                           | Beacons: X=128/129,       |
   |                           |          Y=2/1 (CSA done) |
   |                           |-------------------------->|
   |                           |                           |
19 |                           | [Y=0: Set Post Tmpl       |
   |                           |  cookie Y, UHR Param      |
   |                           |  Off, X=130]              |
   |                           |                           |
20 | CMD_CH_SWITCH_NOTIFY      |                           |
   |<--------------------------|                           |
   |                           |                           |
21 | CMD_MLD_BSS_UPDATE_NOTIFY |                           |
   | (Complete Cookie Y)       |                           |
   |<--------------------------|                           |
   |                           |                           |
22 | CMD_MODIFY_MLD_BSS_UPDATE |                           |
   | (Cookie X Post Tmpl w/    |                           |
   |  UpdatedChan Info)        |                           |
   |-------------------------->|                           |
   |                           |                           |
23 |                           | Beacons Continue...       |
   |                           |-------------------------->|
   |                           |                           |
24 |                           | Probe Request             |
   |                           |<--------------------------|
   |                           | [Fetch TBTT]              |
   |     send_mgmt (TBTT)      |                           |
   |<--------------------------|                           |
   |                           |                           |
25 | send_mgmt (Probe Resp     |                           |
   |  w/ TBTT in UHR Param)    |                           |
   |-------------------------->|                           |
   |                           |                           |
26 |                           | [Post Notif Complete:     |
   |                           |  Set Post Tmpl Cookie X]  |
   |                           |                           |
27 | EVENT_UHR_CU              |                           |
   | (CU_POST_NOTIF_COMPLETE)  |                           |
   |<--------------------------|                           |
   |                           |                           |
28 |                           | [Continue w/ Updated TIM] |
   |                           |                           |
29 | EVENT_UHR_CU              |                           |
   | (CU_SESSION_END)          |                           |
   |<--------------------------|                           |
   |                           |                           |


The diagram uses a number of abbreviations, so an explanation is
provided below for clarity.

Step 2 – NL80211_CMD_START_MLD_BSS_UPDATE
	This would include:
		1. The affected link ID
		2. Current beacon templates for all links, along with the offsets
where counters need to be updated.
		3. Post‑beacon templates for all links
		4. The post‑UHR operation element
		5. Countdown values
		6. Type: UHR CU


Step 8 – NL80211_CMD_START_MLD_BSS_UPDATE
	This would include:
		1. The affected link ID
		2. Current beacon templates for all links, along with
the offsets where counters need to be updated
		3. Cookie X – { offset_A }
		4. Post‑beacon templates for all links
		5. Countdown values
		6. Type: CSA


Step 14
	The driver/firmware can update the current beacon template with
the post‑UHR operation element. Until the advance notification interval
completes, the UHR operation element would not yet be updated.

Step 12 & Step 22
	These steps are somewhat duplicate, but keeping the latest modified
state once hostapd receives NL80211_CMD_MLD_BSS_UPDATE_NOTIFY_COMPLETE
seems reasonable.

Step 24
	Reporting the TBTT count back to hostapd for attribute types such as
UHR_CU, LINK_REMOVE, etc.

Cookies act as identifiers for both the post‑beacon template and the
associated countdown values.


A few potential concerns to consider:

1. Carrying both the current and post‑beacon templates for all
affiliated links of an MLD might make the NL message fairly large. we
are not sure how well that fits with existing practice, since multipart
handling seems to be used mostly for dump commands. As an alternate, can
we have multiple commands with message id and reassemble it?

2. There may be a small sequencing aspect worth thinking through. For
example, if a UHR_CU operation is close to completion and we are about
to apply its post‑beacon template, but before hostapd processes
EVENT_UHR_CU with CU_POST_NOTIF_COMPLETE it issues a
START_MLD_BSS_UPDATE for CSA, we could potentially end up using an
unexpected version of the current beacon template. This may already be
handled by the existing flow, but it seemed worth calling out for
completeness.


Thanks,
Harshitha

> 
> Thanks,
> johannes


