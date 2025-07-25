Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2B9C87FCA
	for <ath12k@archiver.kernel.org>; Fri, 25 Jul 2025 11:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vQkJgiIMYZgzOzUtmwKaHPTs2b6RaTTBTyY+MQlH4c=; b=Jb4a3G8YrbHQY+SsccesSFDuOq
	+IrQrCDQjjXs351WCaCyUIu2xnkSpKqdDHmNYObQcwhxIHN8Nia4ZFkScNsP5kjDziWkKH6y58kbk
	5Zl0M1R1ptqmyCxR8cGBF351xqwBoiwlVzUK2bHRq3n1uN9oACNnFPonNx4+ap1qc0Xa+c/IkKZlV
	KxSnZ1lcSezy3wFLX5uXMLGCp3pRbhC5p8cSSjVwyY7dHcBzycI3s7Zyyn9xgzhA2F+oRXYDWvSUX
	rAtrDbc0YeVQYTzDJMy4fNJBo5BZAKL9aj8dFZWjKVGGfZeB40sn/HoDAOb2WUp0XOVvw9JgNgYFK
	5nwEfV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGQv-00000009h4h-1EJ2;
	Fri, 25 Jul 2025 11:17:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFeu-00000009abE-2AAr
	for ath12k@lists.infradead.org;
	Fri, 25 Jul 2025 10:28:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9F1WO019512
	for <ath12k@lists.infradead.org>; Fri, 25 Jul 2025 10:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5vQkJgiIMYZgzOzUtmwKaHPTs2b6RaTTBTyY+MQlH4c=; b=CBNy2sq2+5HUStBj
	h9b7WIVOE2//bgIOIppFJ0022vqh0cIv644Z3e9sDiTAY3k0kpBBxOMsN0kwpyK/
	KhCUCJu5BEcesvRcQUnOkDv1LBZUWvWTG+LexJWY//C5XXUvscL7dLpE3X9SO9Pj
	c8n0XqzXkkfiF/qQKX1JKkCYwdHZquLNfh0vv6vPJSPZx4pP08uplPyoZZ7PDtsO
	D1AaCpIdoV+qz4nD4o260ewv0o3aQHel80e1uy8n3EqQkLgNfGwADrf/R83YQF5X
	kZOwzqq4oxLOuN/bYml5pYQUk6Wa7gBNRdw2KHfCvASIpTgMX/G0887shNDYHvZH
	qgWseQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2whrg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Jul 2025 10:28:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748f13ef248so2004803b3a.3
        for <ath12k@lists.infradead.org>; Fri, 25 Jul 2025 03:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753439290; x=1754044090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vQkJgiIMYZgzOzUtmwKaHPTs2b6RaTTBTyY+MQlH4c=;
        b=EdygWEguJGaitTir4UvTuyDdE4l53qoyFlIWsy8Y+OjzYGTBXdb5V6fFSOcA+CV9ht
         lAs/Nvu8SIIRTtS1kep6E+xj/qV6WYKHXiyqDhxlyF4CvZSmU9URWB2dT1wE54V+f4WI
         TYNjKGtMnQetDzuLuNtP1B6hHCJemKYD8yb1UG6AcwgtznhRSfQGSXwGkR9tkuNgn29x
         HachnglGPZWplZs3chvk1zUEcG9jpchSdXGE4qX3ciqpGmtAt2Hb8EcDrDls9dWc3KVu
         11h7PuA9PQny41v/wYlDAFWYghxESz7urqZP9JrRQOAcJwkX8Dr8gB7nb8gqtFV7pn44
         xjwA==
X-Forwarded-Encrypted: i=1; AJvYcCXaFA+n+E9JjHTAYA3FR3JuQ6DLbKjLax+o20xVLoWNBByCzhgWs/2eV8MS+XCPTfBB/fOjpCk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAzc7TGyboEwLxmx83k0jNQYPdpc1+d7LVlQIqkPlrlibW1GCO
	cWvs7ELUafWODWXwEeeoObeB01MaXf1rUJMZ8+Rs7E+cghi0xdx2RGVatHCCvV00hfBSUjdLb6D
	9CqS/mvDUsun1uItZgdwlNBVNfUNjvGcttyoARj0jaQ018NwzENZTdHxv+pD15kw9
X-Gm-Gg: ASbGncuhWIZ8X8Fck7itwic7y4TrAXja4MMK/s4mrlGZheBA//M8QOfCMZnnsgFr4ff
	FRV5reFOwKrHol8vRr6Si58vLoM/793qC/sDAUWzzWilLH+XcN3g+WDucviw8Qt/MjgVhgHdCKj
	KKzS4h4zmQB8y+62Cq32ahmx0QnI7UOw8pmnWr+Ze3yUSILB6+ZOm4THsnfWDJoTBTYZrPxhF2M
	1ib+uIYCDE5ehMV8uKebTmlhvkp4EOzAyaSxCbpQPK1cCY7Ag/9G4LpSiPaT4OaS3Q2nruUifu/
	LbtGrMFdMFLLEkI/gisYSfU37uYeJhPtzE2j3carWTV0AB9ngnXY4yfg4ScUp27BVuSzGMIn+vy
	B8Jg=
X-Received: by 2002:a05:6a20:748b:b0:222:c961:af1d with SMTP id adf61e73a8af0-23d6ffe87e6mr2240716637.8.1753439289545;
        Fri, 25 Jul 2025 03:28:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcoWYoGQXYu3rtHHm6pbecDn/qL2cZKxe3/RJvKjNQ6NNG6GAfo3k4QtWiaO7SVZ5BTcqMDw==
X-Received: by 2002:a05:6a20:748b:b0:222:c961:af1d with SMTP id adf61e73a8af0-23d6ffe87e6mr2240664637.8.1753439288884;
        Fri, 25 Jul 2025 03:28:08 -0700 (PDT)
Received: from [10.152.194.206] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f6c1153bdsm3107477a12.47.2025.07.25.03.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:28:08 -0700 (PDT)
Message-ID: <ab54649c-be62-48a3-a268-11a142880367@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 15:58:04 +0530
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
 <4a94fa66-8140-4cc8-996c-0ed097b4004a@oss.qualcomm.com>
 <08fee54dd5afc5c8b4966188eb3016713a3d8c8a.camel@sipsolutions.net>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <08fee54dd5afc5c8b4966188eb3016713a3d8c8a.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Zll5AMWDNBmJe9dzHRLhJOwrJdbgpvPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4OSBTYWx0ZWRfX9YWWaiiWG5qA
 o5m9fzQuo3mG7QTCUFbk+Pa5QQhDjR6YE6akHz2TWvYIeZ0+VFyGgtjVi16toJ5KLVcc7LCOruW
 rqWESlq8dsuUca1oUJmeysFAfIEx9vE9aNLypEBfif+Htr51FYtwT5JhlmoFplqLC3z/LXwCMk3
 34PaCNe7TJjmJ8gH2DT5jRlybb71LJ8nDSxkqKSQ0AxdGGc6M+HvASby0SwHAxGZcNGEZeVeGJU
 EdltXmdkQD1JaPhnca3ZtWFng+g2rGoelvngTs1NcSOc+RsEUpwhGLG0ftA3yuKE772dyOoCXKc
 sPkkW9BLeq5LYL4L0FOFK4CG/H+Bwg4dJ82rZsD7K2Z5v0yQstk9Ttj1jx8dGUDSziD5KWZSvya
 QuRrsOzLrWRGtB3ShMzKybbiLIkC8MRAOvhhii+wbps+yWF05WBoa1K8VNzXe7CvdWkaA1gf
X-Authority-Analysis: v=2.4 cv=d8b1yQjE c=1 sm=1 tr=0 ts=68835c3a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=UwGmu7aJlIbNikqOgSMA:9
 a=-jldLyFC3DKovf74:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Zll5AMWDNBmJe9dzHRLhJOwrJdbgpvPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_032812_566933_ECCA2E0C 
X-CRM114-Status: GOOD (  50.58  )
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

On 7/23/2025 4:03 PM, Johannes Berg wrote:
> On Wed, 2025-07-23 at 10:04 +0530, Aditya Kumar Singh wrote:
>>> FWIW we also have some client side code for it already. It's probably
>>> broken ;-)
>>
>> Yes, I’ve seen that. I’m not entirely sure if it’s broken, but it does
>> seem related to CSA parsing from the link—there is code handling that.
>> If anything turns out to be broken, we can fix it.
> 
> We just never tested it well, that's why I said that. Sure, if it's
> broken we'll fix it.
> 
>>>> Assumptions:
>>>> ------------
>>>> The critical update procedure is highly timing-sensitive.
>>>
>>> There are two aspects here that I feel maybe you're conflating a bit. On
>>> the one hand, yes, some of it needs to have the precise information for
>>> the counters. OTOH, some of it is really not _that_ timing critical,
>>> e.g. whether or not you actually get the information live at exactly the
>>> right time. Though of course a frame that's transmitted after a beacon
>>> that advertised CSA should not suddenly _not_ advertise it even cross-
>>> link.
>>
>> Absolutely! We acknowledge that achieving the ideal case may not be
>> possible. Keeping the logic in the kernel brings us closer to the
>> expected behavior, whereas shifting it to hostapd would likely result in
>> a much larger deviation.
> 
> Fully in hostapd I would agree, but not sure it should be fully in the
> kernel as you propose either? We have some middle ground for CSA today
> with just the counter updates, rather than creating the elements and all
> that. Not sure we couldn't/shouldn't replicate that?

Replication is do able but skeptical about its scaling. Discussed below 
more on this.

> 
>>> Wouldn't it be far simpler to have hostapd indicate the critical update,
>>> and even the BPCC value? It also has to include BPCC in RNR and other
>>> fields, do we really want to _parse_ all of that and update all those
>>> values?! Seems iffy at best.
>>
>> The challenge is that if hostapd takes on this task, it would need to
>> send updates for all partner links. Theoretically, this could result in
>> up to 15 beacon NLs being transmitted. Processing these NLs and updating
>> the beacons would already be time-consuming.
> 
> Is it though? I mean, where do you see the bottleneck? Locking wise it's
> just the wiphy lock that shouldn't be contended, netlink isn't the most
> inefficient API ... sure there are roundtrips involved, but this seems a
> bit "handwavy" to me.
> 
> We could also always have new per-link attributes for the beacon
> template updates for other links so it doesn't require full commands but
> just updates the beacon tail (probably only that?) of other links in the
> same operation?

Correct. Okay so two things here -

1. Considering single beacon update with tail update for partner links.
-----------------------------------------------------------------------
In this case, the NL size is bottle neck. During MLO MBSSID, already we 
are reaching around 2k bytes. Sending all tail data for all partner 
links for this MLD might not fix in 4k NL buffer size.

2. Considering separate beacon update for all links
---------------------------------------------------
So here assuming 1 MLD or a few MLDs will work. But assume max MLD like 
typically 16 or multiple of 16. In this case NL commands will flood.

For instance 16 3 link MLDs. Link A, B, and C. Link A started CSA.
Then,

for each MLD (0, 15):
	beacon update for link A
	beacon update for link B
	beacon update for link C

Now for the same link A, in MLD 0th and MLD 15th, this increases lot of 
time delta for CSA. MLD 0's link A will finish CSA way before MLD 15th's 
link A and due to synchronization (single channel context), it can not 
move to next channel.

Agree that this issue exist now as well, but it is very small since for 
same iface, back back to all links are sent.

If we say lets send for all interfaces in link A first and then link B, 
then may be by the time we are coming to last link (link C), CSA might 
have finished?

Also, each NL will go with current CSA beacon and after CSA beacon. 
Assume now link B started CSA. Then again there will be beacon updates.
So too much interleaved updates?

And if you see list of critical updates -
Inclusion of a Channel Switch Announcement element
Inclusion of an Extended Channel Switch Announcement element
Inclusion of a Quiet element
Inclusion of a Wide Bandwidth Channel Switch element
Inclusion of a Channel Switch Wrapper element
Inclusion of an Operating Mode Notification element
Inclusion of a Quiet Channel element
Insertion of a Broadcast TWT element
Insertion or removal of a Broadcast TWT Parameter Set field in a 
Broadcast TWT element
Inclusion of the BSS Color Change Announcement element
Insertion of an Index Adjustment Factor field in a Multiple BSSID 
Configuration element

Modification of the EDCA parameters element
Modification of the DSSS Parameter Set
Modification of the HT Operation element
Modification of the VHT Operation element
Modification of the HE Operation element
Modification of the MU EDCA Parameter Set element
Modification of the Spatial Reuse Parameter Set element
Modification of the UORA Parameter Set element
Modification of the EHT Operation element

Inclusion, modification or removal of a Transmit Power Envelope element, 
if the AP is an EHT AP.

Any of these will trigger beacon updates of almost all links available 
in the system.

> 
>> On top of that, managing
>> the additional offsets required to update the counters adds another
>> layer of complexity.
>>
>> OTOH, the proposed design just takes 1 NL update and rest it does
>> automatically what is needed which will be less time consuming than
>> multiple NL commands flow.
> 
> I still don't buy the "time consuming" thing, but I agree that managing
> the counter locations would be more difficult. OTOH, that's a list of
> counters per link, so it's not _that_ much complexity?

In normal MLO case, still manageable. But with MLO MBSSID it complicates 
further. Each non-Tx profiles BMLE can also have per STA profile of its 
partner and there can be offset there too along with the per STA pofile 
of the Tx profile. Also, assume link A and link B both are doing CSA and 
link C is the reporting link. This fellow then will have 2 offsets and 
if in MBSSID, then it will have 2 * non Tx profiles number of offsets.
> 
> I really don't like the parsing in kernel for two reasons:
> 
>   1) it's a lot of complexity that would never exist at all when hostapd
>      gives the data because it's building it, it doesn't need to parse

Fair point. But in a way if you see, hostapd still forms the beacon (the 
main part) of each link. The thing which can be taken from other link 
due to MLO, kernel is helping to stitch that give to driver and as well 
as updating the CU/BPCC counters like it does during CSA.

>   2) less importantly, I also think it ossifies things since the kernel
>      would need updates for even minor changes in the layout or elements
>      (this of course already being true for FW based solutions)

Not sure if I get this clearly, but how do you say so?

The main beacon content is still formed by hostapd. Only stitching some 
additional elements from other links and putting the latest values in 
the desired field kernel is going to do.


>>>>       2.2 Parse the MBSSID profile element.
>>>>           2.2.1 For each non-Tx profile:
>>>>               2.2.1.1 Extract the BSSID
>>>>               2.2.1.2 Retrieve the corresponding link sdata from BSSID
>>>>               2.2.1.3 If the critical update flag is set in link object, set
>>>>                       the CU (Critical Update) bit in the capability element.
>>>>               2.2.1.4 Set non_tx_update = true.
>>>>       2.3 Parse the multi-link element.
>>>>           2.3.1 For the self link (already known), fetch the latest BPCC
>>>>                 value.
>>>>           2.3.2 Update the frame with this BPCC value.
>>>>       2.4 Update the capability element in the SKB:
>>>>           2.4.1 If the critical update flag is set, set the CU bit.
>>>>           2.4.2 If non_tx_update == true, also set the non-Tx CU bit.
>>>
>>> How much of that can we let hostapd do?
>>
>> hostapd forms beacon so it can do all of this. The only bottleneck is
>> communicating all link's beacon update sequentially via NL. And if
>> another update happens in the meantime - for example link A started CSA
>> and then link B also started CSA, these will pile up the NL socket queue
>> with beacon updates.
> 
> I do wonder if this is a practical concern? And if you have seen this in
> practice then where does the bottleneck come from?
> 
> But it can also be side-stepped by batching the operations and not doing
> a full update like I wrote above.

hmm okay then I guess, need to experiment both approaches and see? 
Unfortunately, I don't have real data at this moment.

> So I'm not sure from a design perspective for mac80211 we should let it
> be constrained by this. That doesn't mean there aren't other reasons for
> the design to go either way, but we can work around this one (if it even
> is an issue.)

Yeah true that.

> 
>>>> This mechanism sufficiently handles critical updates due to modifications
>>>> of existing elements (elements related to the critical update which are
>>>> already present in the beacon and just one or more field is/are changing
>>>> its value). However, in the case of new element inclusion (elements related
>>>> to the critical update which are not alread present in the beacon, but is
>>>> getting added from next beacon), additional handling is required.
>>>> Specifically, the newly included elements related to the critical update
>>>> must be added to the per-STA profile within the Basic Multi-Link Element
>>>> (BMLE) [3].
> 
> [snip timing explanation]
> 
>> You're right, but that's not quite what the original text is trying to
>> convey.
> 
> OK, sorry, I misunderstood then.
> 
>> There are generally two types of critical updates:
>>     1. Adding a new element, such as CSA or CCA.
>>     2. Modifying an existing element, like VHT/HE/EHT Operation IE, TWT, etc.
>>
>> In the second case, forming the beacon is relatively
>> straightforward—only the BPCC and the critical update flag need to be
>> set. However, in the first case, it's more complex. You need to insert
>> the new elements (e.g., CSA IE) into the per-STA profile of the affected
>> link within the reporting link, as shown in the earlier diagram.
> 
> Right, of course.
> 
>> So to handle this case (additional of new element), the below steps are
>> additionally required on top of what was already explained above.
>>
>> Does this make sense now?
> 
> Maybe more? I really wasn't reading it well before, I thought it was
> more about when the new elements were added, rather than the fact _that_
> they need to be added.
> 
> I guess to me that was really almost the same, the beacon changes.

:) In second case, just some offset value needs to be altered (BPCC or 
CU bit) but in first, beacon is stitched from top to bottom.

> 
>>> That kind of also seems like hostapd could just update the beacons?
>>
>> Yes it can. Only thing is multiple NL beacon updates.
> 
> OK so if you're really so worried about that, and that's the main thing,
> we can add the per-link updates into a nested element in the switching-
> link's nl80211 message :)

Netlink buffer size might be a problem as the beacon grows. But will 
have to explore further and see more on this.

>>
>>>> Update BPCC back to NL:
>>>> -----------------------
>>>> After the kernel increments the BPCC value, it can emit a netlink event
>>>> containing the updated BPCC value. This allows hostapd to receive the
>>>> latest BPCC and include it in probe/association response frames, as
>>>> required by the specification.
>>>>
>>>> This coordination ensures that all - beacon, probe response, and
>>>> association response frames reflect consistent BPCC values, maintaining
>>>> compliance with spec-defined behavior for multi-link and critical update
>>>> handling.
>>>
>>> Yeah not liking this too much I guess... Why can't hostapd maintain
>>> BPCC?
>>
>> It can only when everything is fully handled by hostapd. Otherwise
>> kernel should be owner of having the latest value. It can report the
>> latest value to hostap upon any change.
> 
> When is it not fully handled by hostapd though? It always decides to do
> updates, no? Are you thinking there are cases where the driver
> (firmware?) unilaterally changes some things (say the puncturing bitmap)
> and never handshakes that with hostapd, just starts overwriting the
> beacons? Maybe we have a broader architecture discussion to be had here.

No what I meant was, if BPCC is given to hostapd, then all beacon 
updates should be done by hostapd only (including partner link update). 
Since then the correct value of BPCC will go out in frames.

> 
>>>> Complexities:
>>>> -------------
>>>> When adding elements in per STA profile, the element length might exceed
>>>> hence fragmentation needs to be handled properly.
>>>
>>> We have fragmentation but all this parsing means also we need
>>> _defragmentation_ first, which is awkward?
>>
>> I think de-fragmentation is already supported ? If not, we will have to
>> add it to support it.
> 
> It is, generally, but it's completely separate in terms of memory
> handling etc. so it's not that simple.

Oh I see.

> 
>>>> memcmp vs hashing
>>>> =================
>>>> In the section where memcmp() is used to detect changes in beacon elements
>>>> (to determine if a critical update is needed), this logic could
>>>> alternatively be handled at the hostapd level.
>>>
>>> Yeah sounds better to me :P
>>
>> Okay so only the link which is undergoing a change, hostapd will signal
>> to kernel about critical update? Rest kernel will handled parsing and
>> updating the partner links as per the need?
> 
> I still don't like the parsing though. Like I said above, that's a lot
> of complexity that simply doesn't even exist when hostapd controls all
> the updates.
> 
> 
> I really would have envisioned this much more along the lines of having
> hostapd start the channel switch (WLOG on link 1 out of links 1 and 2)
> with an nl80211 message that has:
> 
>   - post-switch beacon for link 1
>   - during-switch beacon for link 1
>     - CSA counter offsets for CSA, eCSA, etc. elements
>   - post-switch beacon for link 2 (?)
>   - during-switch beacon for link 2
>     - CSA counter offsets for link 1's CSA counter
>       (for all the per-STA profile link 1 elements)
> 
> isn't that pretty much it? All the BPCC is well-contained within that
> and maintained by hostapd.
> 
> I'll agree that this limits to only doing a single channel switch at a
> time across the whole MLD, but maybe that's not the most problematic
> thing?

Oh, we can impose this restriction? But this won't be backed by spec right?

> 
> OK I guess I'll have to think about this more ..
-- 
Aditya

