Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A077C83F25
	for <ath12k@archiver.kernel.org>; Wed, 23 Jul 2025 04:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrSbaN29GdT/vLbAs7S1kiitGLBjKqOnVWh7YJiKZGA=; b=OdLjUzQTDKOPjKMl0S6Zc3m7jc
	rV87mzZavBxdc+4HBi1WDCG2qaG91B5LcYMl5RQ99zJyleAe1DuPXiQ1DqqdhMzBQQvRsqhk2No2K
	0VNWtyvonCCvVXQmsfvHvZo/ZAjVYcb8Ra2Q6UxlmEhnIwwRKwC49tNUxF3TScpZKgrajCoy1yIOl
	vw4hxSh+fzYZf7R7lZY6WuhzTZP+FKN+YYy00u9utSkW0xC40lfJJx3en7MvSn90E36Eo+OYtcBIB
	L4jGMJU6kolD83nBgbbLA5AlaDexJoGgdBcbS0Pnzrw9OTBHwh0V+hvjSCkDZdGkpqGUEXoAt4hiM
	Pf6h05Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRC6-00000003zYn-2jyl;
	Wed, 23 Jul 2025 04:35:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRC3-00000003zYD-39Gr
	for ath12k@lists.infradead.org;
	Wed, 23 Jul 2025 04:35:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMNrvd032283
	for <ath12k@lists.infradead.org>; Wed, 23 Jul 2025 04:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KrSbaN29GdT/vLbAs7S1kiitGLBjKqOnVWh7YJiKZGA=; b=jCYX4uXqYI1rRScD
	5ZxnJibox8x68FVX2kMN/hXUHn87CDpI06bY18E55aswcKxM+dhJ1bgT1WGnsrlH
	t+Gy/mr9uJF29gIf65Tg0LMn2EJSqrvV4ciQbRomJq3RdecF5ZkH9q+lUDwEmTgH
	nAUOQOsrT+2D2edV4VjjqkKfTkXaSZWlrpPhBMNn0t6V2ZVhexEFMk4XOiHY6sgA
	BmR2OyJxyQyAMq6mXUz3Xx9xT9GSuN7WxUtOb0lsneLtROQ4ganMygzSVmYePBo4
	hXO6MdOqszPvF5Zyxl/S4n3LQst0g/JlU1nxuutH5tIHk5aHkvTp3aERj2KKwrf4
	Hz7zLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1b45m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 23 Jul 2025 04:35:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235f77f86f6so60854495ad.2
        for <ath12k@lists.infradead.org>; Tue, 22 Jul 2025 21:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753245300; x=1753850100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KrSbaN29GdT/vLbAs7S1kiitGLBjKqOnVWh7YJiKZGA=;
        b=LzDxqNDonLD1tnxwlSkvkbT9Q9huKsloc3ryMfUn8LNoy7mPLIzNfcGoaoRVtQkDLn
         5alcq72O7H1ieWOqcsVu43Bxy8vIyKNyCf+B1z7poHDEv2QbFyCtlvAaLluoqkglC6Ut
         k560hRgihwCY772HUUXRvDXINyGlqTqI7RozJ6Lm8+Ouxg3/yf9qIH1c5GMYmWUGqZA7
         /v0pbMzXBxDEeyka8KHeA4Jl91YU6pXiOZQogVX6PW3B54la04GPdfq0RuH/Atrdni2r
         oo7dETQU0MSSny2eqcjS7rQOZDJrvNojpTB80oCkwbDpfkHzY85SdmkYHnRdP98YcW0c
         V5oA==
X-Forwarded-Encrypted: i=1; AJvYcCX9Pp8sh3dnjGFZ1p5mZSnjn8NnHARpxHr/U9CoHPCo4gzhi1MnDhWmWdztYPFbKnufDa+DtwA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAROtZwH2sSKkPNimfZ8nL/shJITw3YSuKROm34JoIcIu3+li4
	4SAz9JEMkyJ48pVEZ4LPNU5CSEfdx9YBTh0VC2LuSB8aOBD2tJLZe20PHIWaDZ/1fFoMfu9YRfX
	GTXScynKL78kt/5ksDF0En4laAUR0a1TnKkkcQgdbOIoHENnNWaMAV1FgkLEqty6YAhIHaJaI
X-Gm-Gg: ASbGnctVe8UHUxcR0Gh3fWYPb1ERETqrmgkS23vAtkcDUCIdop+Oq4sKgI8yvXNAdHs
	/ZoSiDE7cIr7csWFqQT/BRRNUOoaljZgddsjMCTCSUHUxT12mp4gWBlibognJ6lb7c4C0cSzXrK
	XDtU1zpMv9Q70xaauL9uKkVLhwLuBQdAm3Pyuddpwbq/9Ot31gigAXa4uq3QOrB9xtv5iEUn61M
	u7dgV003QYPky1VgkwhOXiA2Wf+ktIGJ2N/ROlLviwXSPC926y+fiuSlERp0nAcFHhuBwXi8U5S
	jcbZlQ6IXl701zoMpHeQi57HSGvOUfUkDbg0dSJPre3hkV9jjPhGX0eDdeS1IytMaPBcRJfclAq
	xi9A=
X-Received: by 2002:a17:902:dac8:b0:235:eb71:a386 with SMTP id d9443c01a7336-23f981e6ceamr21602785ad.50.1753245299723;
        Tue, 22 Jul 2025 21:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBaUb5dKijoq3eiJkmmkk93Jyuz5zC9IV4x4rqdZ3/Sftt/K3CPGM+Po0qc8lK+xKsLtrUqw==
X-Received: by 2002:a17:902:dac8:b0:235:eb71:a386 with SMTP id d9443c01a7336-23f981e6ceamr21602445ad.50.1753245299035;
        Tue, 22 Jul 2025 21:34:59 -0700 (PDT)
Received: from [10.152.194.206] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e2d6fsm87135655ad.20.2025.07.22.21.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 21:34:58 -0700 (PDT)
Message-ID: <4a94fa66-8140-4cc8-996c-0ed097b4004a@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 10:04:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DESIGN RFC] Critical Update handling in the kernel
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Ping-Ke Shih <pkshih@realtek.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>
References: <20250717045540.27208-1-aditya.kumar.singh@oss.qualcomm.com>
 <1a77ca6a35ad03f839b7c997de3977b521d88edc.camel@sipsolutions.net>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <1a77ca6a35ad03f839b7c997de3977b521d88edc.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aoOkLgrVnrXCQAnEkC6S8L9rd69teGPq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAzNSBTYWx0ZWRfX1oabcpKLYowP
 W1BwTPd1Kml3LcYS/uNU2irzslbW1bikBZvSUMvLMfPo3Pm8+ISDsF9RQ2VArAPWUB149QYjs/1
 gWsPoVtxVmZnYAxa0BKt8hQPkW7cxz4MzsXYq9VjEXlIK5g+CANZNESr718if7D0SAG7xxXE6bq
 iWH7aLbSgFOwvFiAO2TWsMLIhuDayIjUmnfqKSuVVhU0VHDbJLrFartDUBihUaDk8g6cE+DUHlC
 IbWtq5XUvZ+OSfGn8SC6zyogufqgOSVx3vXpYRn8gTjTMNd2jkI6bEWDUWc9EYm8a50OIg1BykV
 mc49jLAwb3loLamRI+83I0mOBP8QZsiqItSTcqEIUcR12a3Rg9VEPMHKlri0nA6hpGDx5br5f1t
 Dg4EVdilBepek9hni2xNev55bgryG23VHgDGFvxY0vM2uy1mM5fFOf16ZUOuJRTIdcBqZKcL
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=68806675 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=WkxSdC04kqPbBLiDnJoA:9
 a=nM91SIqpUZvjnRJH:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: aoOkLgrVnrXCQAnEkC6S8L9rd69teGPq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_213503_940783_C84A2FED 
X-CRM114-Status: GOOD (  55.87  )
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

On 7/22/2025 8:12 PM, Johannes Berg wrote:
> Hi,
> 
> Thanks for writing this up! I really think Realtek and Mediatek should
> comment - CC'ing some folks.
> 
>> "What about vendors whose firmware does not support this functionality?"
>> "What about mac80211_hwsim? How this is supposed to work with
>>   mac80211_hwsim?"
> 
> I really like the hwsim part because we really can't even test the
> client side right now ...
> 
>> ===========================================================================
>>                              OPEN QUESTIONS
>> ===========================================================================
>> Before we move forward with implementation, we'd like to confirm whether
>> the proposed design looks sound. Are there any concerns or potential issues
>> we should be aware of?
>>
>> Out of curiosity, we're also interested in understanding how other vendors
>> are currently handling this feature in their downstream drivers. Is it
>> typically offloaded to firmware, or is the logic implemented in the kernel?
>> Just want to confirm whether all this will be used only by mac80211_hwsim
>> or will there be any actual users?
> 
> I think Ping-Ke previously indicated that they were planning to do
> things host side? I'm not super familiar with the timing constraints
> though, so I'm not sure what that might imply.
> 
>> Critical Update is a mechanism where, if a BSS parameter changes on one of
>> the links within a Multi-Link Device (MLD), that change is also signaled in
>> the beacons/probe response of its partner links. This allows the multi-link
>> client to be proactively informed of the update through any of the partner
>> links, rather than waiting to receive the updated beacon/probe responses
>> from the affected link itself.
> 
> FWIW we also have some client side code for it already. It's probably
> broken ;-)

Yes, I’ve seen that. I’m not entirely sure if it’s broken, but it does 
seem related to CSA parsing from the link—there is code handling that. 
If anything turns out to be broken, we can fix it.

> 
>> This ensures that multi-link clients monitoring Link B can be promptly
>> informed of the change on Link A, without needing to wait for Link A’s next
>> beacon.
> 
> Btw, you make this a lot about "without needing to wait" and the whole
> timing, but another, I'd maybe even argue more important, aspect of this
> is that they don't have to be receiving the beacon at all. For example
> for EMLSR clients, or clients that aren't even active at all on a given
> link, they might not/cannot see the beacons for all links at all, even
> if they're nominally connected on those links.

Yes, that's true as well! I just wanted to keep the context 
straightforward and avoid bringing in another feature that might cause 
confusion. But you're absolutely right.

> 
>> ===========================================================================
>>                              DESIGN PROPOSAL
>> ===========================================================================
>>
>> Assumptions:
>> ------------
>> The critical update procedure is highly timing-sensitive.
> 
> There are two aspects here that I feel maybe you're conflating a bit. On
> the one hand, yes, some of it needs to have the precise information for
> the counters. OTOH, some of it is really not _that_ timing critical,
> e.g. whether or not you actually get the information live at exactly the
> right time. Though of course a frame that's transmitted after a beacon
> that advertised CSA should not suddenly _not_ advertise it even cross-
> link.

Absolutely! We acknowledge that achieving the ideal case may not be 
possible. Keeping the logic in the kernel brings us closer to the 
expected behavior, whereas shifting it to hostapd would likely result in 
a much larger deviation.

> 
>> This design introduces additional computational overhead, which could
>> potentially delay beacon processing. Since not all mac80211 drivers may
>> prefer this behavior, introduce a new extended feature flag -
>> CRITICAL_UPDATE_SELF_MANAGED. mac80211 will NOT perform these extra
>> computations if the driver advertises this feature support.
> 
> Fair.
> 
>> Parsing the beacon update:
>> --------------------------
>> During the ieee80211_assign_beacon() call (where link->u.ap.beacon is
>> updated whenever the beacon content is initially set using
>> ieee80211_start_ap(), modified through ieee80211_change_beacon(), or
>> changed as a result of channel or color switch events) -
>>
>> 1. Store the new beacon data in a new pointer, following the usual flow.
>> 2. Parse the beacon (using the head and tail pointers) and record the
>>     starting offsets of each required Element (earlier referred to as IE i.e
>>     Information element) in an array, indexed by element id or extended
>>     element id. This is done per link object.
>> 3. If a previous beacon exists:
>>      3.1 For each element related to the critical update, perform a memcmp()
>>          to detect changes compared to the previous contents.
>>      3.2 If any such element has changed, set the critical update flag in
>>          some link-level object (e.g., link_conf). (this is for the affected
>>          link)
>>          3.2.1 At the same time, set the critical update flag for all
>>                partner links as well in the same object.
>>      3.3 Increment the BPCC[2] value (modulo 256 excluding 255) for the
> 
> (as an aside, I think this is really funny - it's obviously the same as
> "modulo 255", but I guess I can also see why they worded it that way...)
> 
> 
>>          current link.
> 
> Wouldn't it be far simpler to have hostapd indicate the critical update,
> and even the BPCC value? It also has to include BPCC in RNR and other
> fields, do we really want to _parse_ all of that and update all those
> values?! Seems iffy at best.

The challenge is that if hostapd takes on this task, it would need to 
send updates for all partner links. Theoretically, this could result in 
up to 15 beacon NLs being transmitted. Processing these NLs and updating 
the beacons would already be time-consuming. On top of that, managing 
the additional offsets required to update the counters adds another 
layer of complexity.

OTOH, the proposed design just takes 1 NL update and rest it does 
automatically what is needed which will be less time consuming than 
multiple NL commands flow.

> 
>> 4. If critical update flag got set in previous step for partner links, call
>>     link_info_changed() with CHANGED_BEACON to notify lower layer that
>>     beacon has changed. This applies only in case when beacon is offloaded
>>     to firmware. In case beacon is given to driver at every TBTT, there is
>>     no need to notify since at next TBTT, driver will fetch the latest
>>     beacon anyways.
> 
> Sure.
> 
> 
>> Forming the new beacon:
>> -----------------------
>> In the __ieee80211_beacon_get() function, where the beacon SKBs are
>> constructed:
>>
>> 1. Allow the existing logic to generate all beacon SKBs (including multiple
>>     SKBs in the case of MBSSID-EMA).
>> 2. For each beacon SKB:
>>      2.1 Parse the RNR (Reduced Neighbor Report) element.
>>          2.1.1 For each TBTT Info entry:
>>              2.1.1.1 Extract the BSSID
>>              2.1.1.2 Retrieve the corresponding link sdata from BSSID
>>              2.1.1.3 fetch the latest BPCC value.
>>              2.1.1.4 Update the frame with this latest BPCC value.
> 
> Yeah, I really don't like that... Do you really do that in firmware
> today? That sounds all really painful.

Not exactly this way, but yeah firmware does all this in offloaded case.

> 
>>      2.2 Parse the MBSSID profile element.
>>          2.2.1 For each non-Tx profile:
>>              2.2.1.1 Extract the BSSID
>>              2.2.1.2 Retrieve the corresponding link sdata from BSSID
>>              2.2.1.3 If the critical update flag is set in link object, set
>>                      the CU (Critical Update) bit in the capability element.
>>              2.2.1.4 Set non_tx_update = true.
>>      2.3 Parse the multi-link element.
>>          2.3.1 For the self link (already known), fetch the latest BPCC
>>                value.
>>          2.3.2 Update the frame with this BPCC value.
>>      2.4 Update the capability element in the SKB:
>>          2.4.1 If the critical update flag is set, set the CU bit.
>>          2.4.2 If non_tx_update == true, also set the non-Tx CU bit.
> 
> How much of that can we let hostapd do?

hostapd forms beacon so it can do all of this. The only bottleneck is 
communicating all link's beacon update sequentially via NL. And if 
another update happens in the meantime - for example link A started CSA 
and then link B also started CSA, these will pile up the NL socket queue 
with beacon updates.

> 
>> This mechanism sufficiently handles critical updates due to modifications
>> of existing elements (elements related to the critical update which are
>> already present in the beacon and just one or more field is/are changing
>> its value). However, in the case of new element inclusion (elements related
>> to the critical update which are not alread present in the beacon, but is
>> getting added from next beacon), additional handling is required.
>> Specifically, the newly included elements related to the critical update
>> must be added to the per-STA profile within the Basic Multi-Link Element
>> (BMLE) [3].
> 
> That seems almost like an over-optimisation? If I'm reading this
> correctly, this is basically describing a situation like this
> 
> (x indicates a beacon TX)
>   
> link 1    x        x        x        x        x        x        x
> link 2         x        x        x        x        x        x        x
> 
>                       ^ link 1 starts channel switching
>                         (after its own bcn, before the next link 2 bcn)
> 
> and saying that really the next link 2 beacon will already indicate the
> link 1 beacon will be switching channel.
> 
> But is that really actually a case worth worrying about? You can always
> consider it as if this had happened:
> 
> link 1    x        x        x        x        x        x        x
> link 2         x        x        x        x        x        x        x
> 
>                           ^ link 1 starts channel switching
> 
> i.e. as if link 1 had decided to do channel switch just _after_ link 2's
> beacon instead.
> 
> Does that really significantly change anything? I'm not so sure?

You're right, but that's not quite what the original text is trying to 
convey.

There are generally two types of critical updates:
   1. Adding a new element, such as CSA or CCA.
   2. Modifying an existing element, like VHT/HE/EHT Operation IE, TWT, etc.

In the second case, forming the beacon is relatively 
straightforward—only the BPCC and the critical update flag need to be 
set. However, in the first case, it's more complex. You need to insert 
the new elements (e.g., CSA IE) into the per-STA profile of the affected 
link within the reporting link, as shown in the earlier diagram.

-----

Link A started CSA and during CSA, the beaconing would look like -

┌──────────────────────────────┐ ┌──────────────────────────────┐
│       Link A's beacon        │ │       Link B's beacon        │
│                              │ │                              │
│┌────────────────────────────┐│ │┌────────────────────────────┐│
││Capabilities Info:          ││ ││Capabilities Info:          ││
││   BIT 6: CU Bit: True      ││ ││   BIT 6: CU Bit: True      ││
│└────────────────────────────┘│ │└────────────────────────────┘│
│┌────────────────────────────┐│ │ ......                       │
││CSA:                        ││ │┌────────────────────────────┐│
││  CS Count: 5               ││ ││RNR Element:                ││
│└────────────────────────────┘│ ││  TBTT INFO:                ││
│......                        │ ││    MLD INFO:               ││
│┌────────────────────────────┐│ ││       LINK ID: A           ││
││RNR Element:                ││ ││       BPCC: 2              ││
││  TBTT INFO:                ││ │└────────────────────────────┘│
││    MLD INFO:               ││ │......                        │
││       LINK ID: B           ││ │┌────────────────────────────┐│
││       BPCC: 1              ││ ││MULTI LINK Element:         ││
│└────────────────────────────┘│ ││  COMMON INFO:              ││
│......                        │ ││     LINK ID: B             ││
│┌────────────────────────────┐│ ││     BPCC: 1                ││
││MULTI LINK Element:         ││ ││                            ││
││  COMMON INFO:              ││ ││  Basic STA profile count: 1││
││     LINK ID: A             ││ ││  Per STA Profile:          ││
││     BPCC: 2                ││ ││     Link ID: A             ││
││                            ││ ││     ┌─────────────────────┐││
││  Basic STA profile count: 0││ ││     │CSA:  *THIS ONE*     │││
│└────────────────────────────┘│ ││     │  CS Count: 5        │││
└──────────────────────────────┘ ││     └─────────────────────┘││
                                  │└────────────────────────────┘│
                                  │......                        │
                                  └──────────────────────────────┘

(See the CSA element (marked with *THIS ONE* ) in link B's beacon due to 
link A doing CSA).
-------

So to handle this case (additional of new element), the below steps are 
additionally required on top of what was already explained above.

Does this make sense now?


>> To achieve this:
>>
>> 3. Allow the existing logic to form the beacon SKB as previously defined
>>     (this already handles modification updates).
>> 4. Maintain an extra_len variable to track any additional space required
>>     for including additional elements.
>> 5. While parsing:
>>      5.1 If critical update is going on in partner link due to inclusion of
>>          elements, increment extra_len accordingly.
>>      5.2 The required length is determined using the eid/ext eid based
>>          offset  maintained in each beacon data structure.
>>      5.3 Since the element offset is known, and the next byte is the tag
>>          length, the total length is tag_len + 2 (for EID and length
>>          fields).
>>      5.4 Account for any additional fields that may be needed (e.g.,
>>          sub-element ID and length in the Multi-Link IE).
>> 6. Compute the new beacon size:
>>       new_size = current_size + extra_len
>> 7. Allocate a new SKB with the updated size.
>> 8. Copy the existing contents and insert the new or updated elements at the
>>     appropriate offsets.
>> 9. Since IE offsets are cached in the beacon data structure, the entire IE
>>     can be copied directly without re-parsing the full beacon from other
>>     links.
>> 10. Free the original beacon SKB.
>> 11. Return the newly constructed beacon SKB.
> 
> That kind of also seems like hostapd could just update the beacons?

Yes it can. Only thing is multiple NL beacon updates.

> 
>> DTIM beacon handling:
>> ---------------------
>> As per requirement [4], the Critical Update (CU) bit in the capability
>> field must be cleared in the DTIM beacon.
>>
>> For Non-Offloaded Beacon Handling:
>>      1. The function __ieee80211_beacon_add_tim() is responsible for
>>         updating the DTIM count.
>>      2. When the DTIM count reaches 1 (indicating that the next beacon will
>>         be a DTIM beacon), the critical update flag in the corresponding
>>         link object should be reset.
>>
>> For Offloaded Beacon Handling:
>>      1. If precise control is required:
>>           1.1 Since DTIM updates are managed by the lower layer (typically
>>               the firmware or driver), an API will be provided to explicitly
>>               reset the critical update flag.
>>           1.2 The driver, upon detecting that a DTIM beacon is about to be
>>               transmitted, can invoke this API to perform the reset.
>>      2. If some timing inaccuracy is acceptable:
>>           2.1 mac80211 can maintain a timer to reset the critical update
>>               flag after a DTIM interval.
>>           2.2 However, this approach may lead to synchronization issues, as
>>               mac80211 cannot guarantee the exact timing of beacon
>>               transmission handled by the hardware.
> 
> I guess I can see where this is needed, yeah. I think I'd probably go
> for 1, it's simpler for mac80211 and worst case drivers can have a
> counter or something themselves and do that after pulling the DTIM
> beacon from mac80211.

sure.

> 
>> Update BPCC back to NL:
>> -----------------------
>> After the kernel increments the BPCC value, it can emit a netlink event
>> containing the updated BPCC value. This allows hostapd to receive the
>> latest BPCC and include it in probe/association response frames, as
>> required by the specification.
>>
>> This coordination ensures that all - beacon, probe response, and
>> association response frames reflect consistent BPCC values, maintaining
>> compliance with spec-defined behavior for multi-link and critical update
>> handling.
> 
> Yeah not liking this too much I guess... Why can't hostapd maintain
> BPCC?

It can only when everything is fully handled by hostapd. Otherwise 
kernel should be owner of having the latest value. It can report the 
latest value to hostap upon any change.

> 
>> Counter offset handling of partner links:
>> -----------------------------------------
>> Note: This applies only in case of offloaded beacon case.
>>
>> Since not all links operate with the same beacon interval, the firmware
>> cannot simply decrement the counter on every self-beacon transmission.
>>
>> To handle this correctly:
>> Each BPCC counter will be associated with:
>>      * An offset (location in the frame where the counter resides), and
>>      * A periodicity value, indicating how often the counter should be
>>        decremented.
>>
>> The firmware is expected to:
>>     * Track the number of self-beacon transmissions per link.
>>     * Decrement the counter only after the specified number of
>>       transmissions, as defined by the periodicity value.
>>     * This ensures that counter updates are aligned with each link’s
>>       individual beacon schedule, maintaining spec compliance in multi-link
>>       scenarios.
> 
> True. Although I expect some devices might simply prevent different
> beacon intervals.

True, but in case if not, still it can be handled I guess.

> 
>> Complexities:
>> -------------
>> When adding elements in per STA profile, the element length might exceed
>> hence fragmentation needs to be handled properly.
> 
> We have fragmentation but all this parsing means also we need
> _defragmentation_ first, which is awkward?

I think de-fragmentation is already supported ? If not, we will have to 
add it to support it.

> 
>> memcmp vs hashing
>> =================
>> In the section where memcmp() is used to detect changes in beacon elements
>> (to determine if a critical update is needed), this logic could
>> alternatively be handled at the hostapd level.
> 
> Yeah sounds better to me :P

Okay so only the link which is undergoing a change, hostapd will signal 
to kernel about critical update? Rest kernel will handled parsing and 
updating the partner links as per the need?

> 
>> Since hostapd does not retain the previous beacon frame, it cannot perform
>> a direct memory comparison. However, it can compute and store hashes of the
>> required elements during beacon formation. On subsequent updates, it can
>> compare the new hashes with the previously stored ones to detect changes.
> 
> It doesn't necessarily even have to do that - it could also track
> internally when it made changes. Like when something actually starts a
> channel switch. Or color switch maybe, or something.

True when adding, it can do easily. But when modifying, it has to have 
some older value to compare with.


-- 
Aditya

