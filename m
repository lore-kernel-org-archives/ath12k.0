Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07A9CD6E79
	for <ath12k@archiver.kernel.org>; Mon,  8 Jun 2026 18:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWnb/0Le/7UQJwRxs5sDbMwc31U11Dyl6gRwsKyqgvs=; b=MHd/CcKP3ysWQy2lbWioniAFnt
	jSjKptwB7E9KqeOQRE+aRK4F7mOh/GpLyGixX5PkBmT1Zw+GsUlSC5ygnING73qzpRNAfTODgcEtB
	/cAReErlmZc50MTEpK2l0M+lhn0K7hCI1sUEXZPp5Bl/77in5QM5BO1jBUuEtngTG1tVpXzgGI+WH
	muda6WRDpWJsSpSMHRFI4Ai2Hbagm1OG9MaJRDxCNwv2ZeD3yqpjYTDt4gL8+vJ8+Eny5yZ8efMwl
	tr0nEOYCJ+62IUBRfYtd0i7G9tS+IQNAGoMl9PZ7Ykr/Tn4CpbujozZny8Y7zdi6HRw/lT/xRd1h8
	NgViKeUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWeJJ-00000004Ez6-2fA4;
	Mon, 08 Jun 2026 18:02:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWeJG-00000004Eyl-272Q
	for ath12k@lists.infradead.org;
	Mon, 08 Jun 2026 18:02:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFTkS3934233
	for <ath12k@lists.infradead.org>; Mon, 8 Jun 2026 18:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWnb/0Le/7UQJwRxs5sDbMwc31U11Dyl6gRwsKyqgvs=; b=B4kA5RQ/aTWP4zgJ
	anexe/w6spY3XVu4ZuhiEq9vX9o/p75mWg7BBFXncfn5rCgJEO1Jws6UZith/f6t
	ggn7MrfkSqdkvxz58vQPv4auwIgHfYjB8VWVumD0o3sJBlqGWQAGA0QxICkSXI84
	AyhMEaCqrkuxmsyEYBE185kk6sZcQR6f/78elAz3f1YOMz+1TNQAFnRW5L36iLY+
	kAu1apJ93Gx5Cgkxco/NhYKdcdU+T0fghuqeKfpgKl2LqhHlsVLI4wTtQs1c5VxX
	Odcqn2Rg9nMo+VGHJXymPzG6tXqeNf88XuwXIbTCbwCYc61JQBBYEeaYoVdS0w4W
	+Iz8tA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rsknb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 18:02:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85edbb10dfso2475543a12.0
        for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 11:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780941767; x=1781546567; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWnb/0Le/7UQJwRxs5sDbMwc31U11Dyl6gRwsKyqgvs=;
        b=HCzhEquIhRvDiUe2HNmgCx2U5wnPLH2WmbxSr1hIGGUjJF45nYZVEkEdVZiHZYRXPq
         2J6/fl+fZvlsSxBI+twwhm6or4N8TOsDMTcDRx8spLmTGP8jwefzvSPJ5cTNBxcPHnnB
         QNH86qnzi298ikB63Vv4IE8J9ehd4v8x7BkQgIOG3YvA9TEl9mTbR0l2aZI2zZ2nDb23
         juQrR81BcAl2C7mHClBLAQ80dXeHdRlbWbpMN7n185jdZ030KdY2XkPn/RsJm+YOA5em
         jPII8V0ItV+TLeJwV8nARZG3OTAJgQoR/rmtVNwJ0lTSlyUU2V/rRPpXH3EigiurNZcT
         ZK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941767; x=1781546567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWnb/0Le/7UQJwRxs5sDbMwc31U11Dyl6gRwsKyqgvs=;
        b=QtICZF6eoa1+reN2tevRi+hohR+aTZzn216eW/PsPGKsnYo/ytoCisW0nCPRPQW7SS
         F+4qyyq3aIsndYBUMgpR36pAPm+Qslv1TKWDSXwukM3vTGQShccUX+i5GqHORjKjTB7k
         Dq+2UfBezv5PZElxZKCFSOmyrqG9LDtTJ2eSoZ6vo4nqJxKMg7YrYrSRyTXFWNURnTC6
         kJ7wFjx3Ux4IFOJnxYJR6sKob9tiOYEHyq7/xKTDwG0UAvDH2DGiiLwWUyVzQuxk3ia2
         k1Awr06frq3i/rlbhlQ42EujbVpSifpB3tC3D5EoUv2qEZLg7rgcBnktSHA3kZBpJQP5
         G75w==
X-Forwarded-Encrypted: i=1; AFNElJ/PfHutNef1wFn4IdKh7ij6aP1u0hjmWoyDsRcfD4LpFXECTtuUd4Z0okiEawAdaPpMo0GsMp8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOdi9VM5LrKvT4ntTKKlzjiEHio0deaxzr1VdFynTrzzLwXK5J
	iX5Y8f9cuHJkeqlNsZZuhHr/Z6MuHJiXlq/EleXYh4p4ZoV96LBbS8mt2xy1dZ0Fs2C6MTo0OFp
	A7oHY7BV8MHbwaa9r0zq0OyV8Y5RRuNzh52yLBKdL5oROM1I5X0hM+yzXtGr78DdW
X-Gm-Gg: Acq92OGxsmcvwuoDwD0JEvh6YSCpytP9t4kT1yGkKUJYMyxKhXdlFFD/pqP/Fnc5gdk
	4f7KYSv1NtRnkq5fYZxX18nW7AulH2UpEqwfDK3N10y5YW2w9Jhw7CuFL3REo8EKkDbCaIM+hFZ
	JKpFqi1cOaLDYojJxzgP6IACCiwPfIhIh5YW0+DXRyxYrg4+xSC/qY7Tt7ss4rfNkEw1FOC9H2v
	/A1A0u6yuGzaJ3fHQos9BML6xodE4sqpm0ihlkw4uKnmgwO10uL4jsm+8hv9/TajBvfp4to02WK
	C0nFVvc5z+zGTdOPWBk6B9NBU5zsHq2EmxfvKN8Y1H2i5FAM8fimwxHpdWAbjG8LlEqACYoPXcP
	eK/uXPSf/823fUERRKBMqOjSu5W4hEF3TXk1+2qaRgbeivqnXD7EXP8pkFVQ=
X-Received: by 2002:a05:6a20:2d09:b0:39b:bc11:9ec5 with SMTP id adf61e73a8af0-3b4d3a529ecmr13266384637.13.1780941766837;
        Mon, 08 Jun 2026 11:02:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d09:b0:39b:bc11:9ec5 with SMTP id adf61e73a8af0-3b4d3a529ecmr13266354637.13.1780941766351;
        Mon, 08 Jun 2026 11:02:46 -0700 (PDT)
Received: from [192.168.1.8] ([116.73.159.142])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03498csm18439621a12.1.2026.06.08.11.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 11:02:45 -0700 (PDT)
Message-ID: <298f2f3d-d363-49ef-9503-bead5b35e24e@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 23:32:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next 3/5] wifi: cfg80211: Refactor
 nl80211_dump_station() to prepare for per-link stats
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
 <20260607175912.2266215-4-praneesh.p@oss.qualcomm.com>
 <39d12d9ae3b18495ed634715c93ede2f68c5bbf0.camel@sipsolutions.net>
Content-Language: en-US
From: Praneesh P <praneesh.p@oss.qualcomm.com>
In-Reply-To: <39d12d9ae3b18495ed634715c93ede2f68c5bbf0.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IYr2rBHfmyjzji1BdsSD-NgL_2ZPKsOb
X-Proofpoint-ORIG-GUID: IYr2rBHfmyjzji1BdsSD-NgL_2ZPKsOb
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a2703c8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=0XKIscjZuezYqwSxLmfFhQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8RXYgg6yP7Gg3BFkkKoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2OSBTYWx0ZWRfX0ZtPdNCe2NOy
 mnq7KQDaxbe+YJ3KiYV8gnGJ2RJ9zFUz7EIDyqkC3jds7c216eCzPO/I7TggUIKl8qih2vEoFfr
 /6MfHoIuXbPCOGZOiP7MOjOG4UEHiSb6qE0Xwi2gThWmfBxPeHapnPFL3OUEVw448Ynhz8H44z9
 JwdTxEmdjlAnsqCrBQKnTXWHlGh2tDShKJW3We2BTb37WjYG0JGZwRF27S0gqImyuU2MAItTFAJ
 I4c7SuDmV9kl9JYwwzokXmDzOuQ/WQVbPnOZIm7K8e1AsrJuDh0MvVWHLI1B9EzZxGKr1AaR9Fy
 NXA2gOXSRRLnlEUQq+xJ8TJdiB7RSgdt77PLP3BHr+4t5jRX2/kCjRm95Zn09zTpLfsQh2Abwon
 FUtbnvpeNpKyg+fECoO/nbytXRyKtytivzowCo78IdReB+mdonKTPV+RfbF2sl6+wfR7Bz+NRry
 eKW6UpfrQ+2Tf5v3etw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_110250_802843_1187C530 
X-CRM114-Status: GOOD (  32.56  )
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


On 6/8/2026 1:00 PM, Johannes Berg wrote:
> On Sun, 2026-06-07 at 23:29 +0530, P Praneesh wrote:
>> +++ b/net/wireless/nl80211.c
>> @@ -39,6 +39,39 @@ static int nl80211_crypto_settings(struct cfg80211_registered_device *rdev,
>>   
>>   /* the netlink family */
>>   static struct genl_family nl80211_fam;
>> +/**
>> + * enum nl80211_dump_station_phase - station dump fragmentation phases
>> + * @NL80211_DUMP_STA_PHASE_AGGREGATED: send aggregated (MLO-combined) station
>> + *	statistics for the station entry
>> + * @NL80211_DUMP_STA_PHASE_PER_LINK: send per-link statistics for each active
>> + *	MLO link of the station; only used when dump_link_stats is set
>> + */
>> +enum nl80211_dump_station_phase {
>> +	NL80211_DUMP_STA_PHASE_AGGREGATED = 0,
>> +	NL80211_DUMP_STA_PHASE_PER_LINK   = 1,
>> +};
> [snip]
>
> probably nicer to move this stuff to closer to the dump code that needs
> it; at the very least it's missing a blank line.
>
> Also I think the whole 'phase' introduction etc. seems to more belong to
> patch 4 instead of this one? We can still do the structure allocation
> etc. here.
Will add the missing blank line and move both the enum and struct
definitions to sit just above nl80211_dump_station(). Patch 3 will
only introduce the context struct (sta_idx, mac_addr, sinfo) and
the stateful allocation/free mechanism. The phase field and its
enum will move to patch 4 where they are actually used.
>> +struct nl80211_dump_station_ctx {
>> +	int sta_idx;
>> +	enum nl80211_dump_station_phase phase;
>> +	u8 mac_addr[ETH_ALEN];
>> +	struct station_info sinfo;
>> +};
>> +
>> +/**
>> + * struct nl80211_dump_station_cb - state stored in netlink_callback::ctx
>> + * @wiphy_idx: args[0] - wiphy index from nl80211_prepare_wdev_dump
>> + * @wdev_id: args[1] - wdev identifier from nl80211_prepare_wdev_dump
>> + * @ctx: args[2] - dump station context pointer
>> + *
>> + * args[0] and args[1] are reserved by nl80211_prepare_wdev_dump().
>> + * The ctx pointer must live at args[2] to avoid corrupting those fields.
>> + */
>> +struct nl80211_dump_station_cb {
>> +	long wiphy_idx;
>> +	long wdev_id;
>> +	struct nl80211_dump_station_ctx *ctx;
>> +};
> I'm not sure I'm happy with this - better to just use args[2] directly
> for a pointer to struct nl80211_dump_station_ctx?
>
>>   static int nl80211_dump_station(struct sk_buff *skb,
>>   				struct netlink_callback *cb)
>>   {
>> -	struct station_info sinfo;
>>   	struct cfg80211_registered_device *rdev;
>>   	struct wireless_dev *wdev;
>> -	u8 mac_addr[ETH_ALEN];
>> -	int sta_idx = cb->args[2];
>> -	bool sinfo_alloc = false;
>> -	int err, i;
>> +	struct nl80211_dump_station_cb *cb_data = (void *)cb->ctx;
>> +	struct nl80211_dump_station_ctx *ctx = cb_data->ctx;
> This doesn't really seem better than just doing
>
> 	struct nl80211_dump_station_ctx *ctx = cb->args[2];
>
> given the overlay with generic code.
>
> Alternatively we could change the _whole_ nl80211 code (as a separate
> commit, perhaps even converting other things later) to have
>
> struct nl80211_dump_cb {
> 	long wiphy_idx;
> 	long wdev_id;
> 	union {
> 		long wiphy_filter;
> 		int mpath_idx;
> 		int reg_idx;
> 		int bss_idx;
> 		int survey_idx;
> 		//...
>
> 		// and later add
> 		struct nl80211_dump_station_ctx *sta_ctx;
> 	};
> };
>
> or so, and then we don't have the args[0]/... problem at all.
>
> But I'm not convinced mixing the structs with "must have this type at
> this offset" etc. is a good idea if it's going to stay this way.
Ok, I'll drop nl80211_dump_station_cb entirely and use:

struct nl80211_dump_station_ctx *ctx = (void *)cb->args[2];

directly, mirroring nl80211_dump_wiphy's pattern of casting
cb->args[0] to its state pointer. The cb->args[0]/[1] contract
is already established by nl80211_prepare_wdev_dump(), no
overlay struct is needed to document it.
>> +	/* Phase 0: dump aggregated station info */
>> +	if (ctx->phase == NL80211_DUMP_STA_PHASE_AGGREGATED) {
>> +		while (true) {
>> +			memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
>>
> if you have this memset, why do you need this one:
>
>> +out_err_release:
>> +	cfg80211_sinfo_release_content(&ctx->sinfo);
>> +	memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
> Seems a bit odd?
>
> johannes
The two memsets serve different purposes.

The first one (Phase 0 loop top) is a clean-slate reset before allocating
the per-station sinfo.links[] entries for each iteration.

The second one at out_err_release is a double-free guard. The ctx is
persistent across netlink dump callbacks (stored in cb->ctx), so when the
function returns early via out_err_release, nl80211_dump_station_done()
will eventually be called and it unconditionally invokes
cfg80211_sinfo_release_content() again:

if (ctx) {
   cfg80211_sinfo_release_content(&ctx->sinfo);
   kfree(ctx);
}

Without the memset at out_err_release, sinfo.links[] would still hold the
already-freed pointers when _done() runs, resulting in a double-free.
The memset nullifies those pointers so the second
cfg80211_sinfo_release_content() call in _done() hits
kfree(NULL), which is harmless.

