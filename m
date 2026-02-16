Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C08E63F15
	for <ath12k@archiver.kernel.org>; Mon, 16 Feb 2026 17:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRx/Lm4pAe/AFgor8xlXcXnKCVXzzTERQn5gOs5u3Tg=; b=C6eObYUhU9uc+AxP1DXXFIY6Tf
	P6cHAtoU7TTXcio6pXl2hUs3eAhkRtH8egFKh4HdMeOqXuPfrckmGgmDsc8MXWBVv3ENkmm2RrVcA
	S91qVMhsSwFErnzh1I5qpyVKQVDsOK2Dp24RqCerVz6xcEEQMOYMMCrcnLuJs0gRlBCFiFSbzTaTF
	2tZ9u3OaSi+Z8rBGYkQDNVegQf6GdoNKdNMgsyGGEeQf0IsA7thRcJzaKEZ547e8da/rJmdIDaaE1
	lLZxTTAqg/68Rd3GtZ1zl0bvTjFd8oNmnwdVsNLZlOtRqHbLOH9HYvtykz/WImJPDU1GOeh7Rzrwh
	SkYBaoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs2Du-0000000750j-1G5H;
	Mon, 16 Feb 2026 17:17:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs2Dl-000000074zl-3ii4
	for ath12k@lists.infradead.org;
	Mon, 16 Feb 2026 17:17:25 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GFuYpV302197
	for <ath12k@lists.infradead.org>; Mon, 16 Feb 2026 17:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tRx/Lm4pAe/AFgor8xlXcXnKCVXzzTERQn5gOs5u3Tg=; b=NuwGtpHJ4hpqZV4O
	jZaMlMAIOtqPO4Eq9RXjN0hESohcsT9GtSauZACQXPDm8p3tsSDncakEt8viW4E6
	OH4dCkgvEZcw5sbp7ezUY+v6VKHHIC1tq0DtdfHPHRRSboDQSj6TYYBy9z/hQhEJ
	CDo+LiBH1CzFLhWLLP0pRr3cIENuJTGxhAcCu2luhkFQ2TDdReEm5kqHcBA0WQmf
	+5Kl41ZwlsrjB1WWFqtlKIpQSr1MgpDjTMRqw7SD44b10WLLZHAi7ovwHgmUJr63
	Zhve0Tiwv3uGujCPcWspF6c6Qu5xjOwDfT7VjXL6ENqlnOvKdTmDLe5UrWxvh5t/
	5jJo3g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9r6md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Feb 2026 17:17:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824af3c6c0cso1640087b3a.3
        for <ath12k@lists.infradead.org>; Mon, 16 Feb 2026 09:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771262235; x=1771867035; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRx/Lm4pAe/AFgor8xlXcXnKCVXzzTERQn5gOs5u3Tg=;
        b=GKg/vcz1zzuI+qlmkMDOlZ9+Sqg0vAlO2/n8154paWIRJJIVoiu7QAfRYRtiXLbnhg
         lL2CoLGBOdVmhHBjtynX/Xgt/eIT82byywizTDS4VaQLHHMh/aTFQZDlLLRIfSnHIG62
         JAfMSdfhF9dNg1UIOnCE+VQ49/ZcQbcykyWcDclp1SBRGFuguQXYMbHmlVstWNuA7kPO
         bIl9M2iSCtqzTMjWbZcmxTXVallTmsAe7nnqnzuRl4AJA86o1jcoEOSBSRhi1P7OcNKx
         6YtUFZD3SWIMjNhEqZPgRHhUSHehfjvaQ/NQcRv3zmQ5eh/zNalOh3kgNy/RiSrzTDV5
         TN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771262235; x=1771867035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRx/Lm4pAe/AFgor8xlXcXnKCVXzzTERQn5gOs5u3Tg=;
        b=ulbdESXucpthM0k2CuNXvTNUrPQ2pRFVPcgYqLRsOU5YkVwfKzkqb0XYBc8jQXEULf
         u3FAUbVxNSeQpPgj0Mgjx8Sv74TuKs/2mkUNjEkHMNUIRd3I4c1uXk6NZ9TNck1FwuiD
         Lm3vWEKr8v6WQnTpM4BAtE33wYi2QQ7jLjeMvwcEal4IJsobkcK8tw9O61rYw9kdLWDF
         Jml2EpMsvOMTHtqKvhSW6sGUG5n5RmqEhLjZrLRxMLpH6nkYuNZD7xDDiUxyGnR1T2YN
         wEFMkViUK9VeVKzqgVcUxX5ksMyGS7g07/3WDaHFCuGPqZ/e7POw2fd1C1rHE/F6WZvJ
         iToQ==
X-Forwarded-Encrypted: i=1; AJvYcCURVc0nuS81/5IOaifBmFPLfEvX95iTpv2krZfgLfbwpKelFvrK+mvHkyiBTtVjsP1mjp4G9bM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3RuAQS6qi9G65+QCbZ7YxoK/OtULng79NSZP/U0wTsBvMBU6u
	+RqPNQ9WCKIFWxPiJbDubKkWdbHT+ZbO+TY0nYPm0ojVHkaizm4y/I+/XcJTTgYNuZz8Ea7/bKl
	uw9uk1h/d/KTl/9aV10IbL4nEwTZp3T85+8UhjpA5sAGP3VzrvcwpeIfY8wIB/NIK
X-Gm-Gg: AZuq6aKJpSmtHIWJezVU1ct8s6H5JzzY3Sr2CY8K3YyoBr2/s0AKf884xwbcpMSx/zH
	B4k2tuR0W4nEiJl5XGK6GfWu0Q5TyHLb0v8BJDT6JJJpydeTFT12X35GJFtVbe/wvcoOxrKufku
	lpWienQZdss8w/rOsdJF0e1FQGhJvA3kILIPsUZadHx3Ml7MtrayoZ25G3TgYz/C6DyEe9RHrW7
	O4VyWmyuP20qaCOtFG7xv8R9WnV4TuIN/OuwITbhM1aOsR1vN5MG18HoOw4nH9LDyP4s4qlGHIO
	oqIBYvzHkS1kZxEGXjaFGCmR4WAdr3pa2mG3chMSDpEFLK/4q3Qj/+XUB1pCu43dpuxXKpIexIY
	jlRG/6l9xhU3LW5n7OpJO6XpoUer775SypBn1S5s7qSlIQAFBHodB
X-Received: by 2002:a05:6a00:3d48:b0:823:cbb:a484 with SMTP id d2e1a72fcca58-824c94e7cfcmr9441766b3a.14.1771262234345;
        Mon, 16 Feb 2026 09:17:14 -0800 (PST)
X-Received: by 2002:a05:6a00:3d48:b0:823:cbb:a484 with SMTP id d2e1a72fcca58-824c94e7cfcmr9441748b3a.14.1771262233801;
        Mon, 16 Feb 2026 09:17:13 -0800 (PST)
Received: from [192.168.1.2] ([115.97.96.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69efdsm10689806b3a.40.2026.02.16.09.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 09:17:13 -0800 (PST)
Message-ID: <156d6d48-d135-4acf-a5d7-c9ae80523864@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 22:47:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v8 2/3] wifi: cfg80211: add initial UHR
 support
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        Lorenzo Bianconi <lorenzo@kernel.org>, ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Ping-Ke Shih <pkshih@realtek.com>
References: <20260130154259.265130-5-johannes@sipsolutions.net>
 <20260130164259.54cc12fbb307.I26126bebd83c7ab17e99827489f946ceabb3521f@changeid>
 <f96125eeda23451c19067359eb9d10b4047bcdd3.camel@sipsolutions.net>
 <5d54feea-d0cd-4bd7-b0d2-02e42f0fe5e1@oss.qualcomm.com>
 <be9ab3c7f05b0f56f19aee0ffc7c2f96138b9a05.camel@sipsolutions.net>
Content-Language: en-US
From: Harshitha Prem <harshitha.prem@oss.qualcomm.com>
In-Reply-To: <be9ab3c7f05b0f56f19aee0ffc7c2f96138b9a05.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDE0OCBTYWx0ZWRfX7RTclXcIGvOp
 618i9gf/f8hvxfLe+YhwteIbsBtJ/m3NRtXshhNsyWgQlw1LiWGGDrz21Sne/llqUrqf8bInZuJ
 PBjZqeAKdvK5PIs5vijjC9mvMq9cBXpEjZ9QcafhvMoWdhM3QDLjS0KoTA2NPM5tVZRgYrsT8aa
 V7dqwH5mJLKSb965+5GKhBW8/jMzK6dbfuehGeimVVoZjR9I3z/ZGgqsQls+7Znr93KJJTdY501
 NaOypN8/ME6wFhei+HN+XhFazuYzNTbewDehaboMkBMQ7xodsSHTxngZdRo0tjKczyZn4jpDi1U
 p9+KyN3HgUocL5OFl6bk+xjV2g/KNrz28ohSvgRXqf1D6SWRtKMY9qVMcZ691j4TriMda7p9o9E
 +BtvXoc88FCwReqMLnQ4Kh3kK0awsEDmGfTprUToEivFmKwgvITHjmdFG75AbBT8gZq7g3CAbhy
 2XZnNb6Hds3qR0fXwyg==
X-Proofpoint-GUID: XOPhlCNuHC4jfd1dcknzeqhfvxggNIeG
X-Proofpoint-ORIG-GUID: XOPhlCNuHC4jfd1dcknzeqhfvxggNIeG
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=6993511b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6sPDMptOXngzVA0SphYZxQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=41PRVchwZf4xR-Uy6oIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_05,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_091724_116879_B3386B5D 
X-CRM114-Status: GOOD (  47.27  )
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



On 2/13/2026 3:41 PM, Johannes Berg wrote:
> Hi Harshita,
> 
>>> Should we add a separate netlink attribute for the UHR operation, which
>>> hostapd would fill with the _full_ data like it appears in association
>>> response etc.?
>>>
>>> That way, hostapd doesn't need to build a separate data/attribute
>>> structure but can just use hostapd_eid_uhr_operation(..., false) for it.
>>>
>>> An alternative would be to add more attributes for everything, but it's
>>> probably more complicated on both sides?
> 
>> Thank you for the suggestions.
>>
>> We feel that using separate nested attributes for each feature is the better approach, as this allows us to reuse the attributes for the Enhanced BSS Parameter Critical Update procedure, where similar information is carried in the UHR parameters update element.
> 
> Heh, I'll admit I'm surprised - I'm usually the one advocating for
> finer-grained attributes, and here I didn't ;-)
> 
>> While this approach is slightly more verbose, we believe it offers better extensibility for the future.
> 
> Does it actually, though?
> 
> I had sort of expected hostapd to add the UHR Parameters Update element
> to the beacons, and configure some way of having firmware set the
> countdown ("Countdown Timer"). Turns out this is not only in beacons but
> also in probe response, (re)association response and (UHR? [1]) link
> reconfiguration response frames.
> 
> [1] the spec says "Link Reconfiguration Response" but I think it should
> say "UHR Link Reconfiguration Response"
> 
> But I guess this is going to end up a continuation of the previous wifi7
> discussion from last year [2] which hadn't really completed. And Lorenzo
> just posted another thing on this [3].
> 
> [2] https://lore.kernel.org/linux-wireless/20250717045540.27208-1-aditya.kumar.singh@oss.qualcomm.com/
> [3] https://lore.kernel.org/linux-wireless/20260212-mt7996-link-reconf-v1-0-2b110340d6c4@kernel.org/
> 
> 
> So I think maybe we need to figure out how we will do all of this first?
> 
> Naively, I would've said ... something stupid. I'm reading the spec as
> I'm writing this ;-) The UHR Parameters Update element is actually
> included in all the beacons across the entire AP MLD.
> 
> Maybe we need to take a step back from our previous discussion as well,
> and introduce a broader concept here?
> 
> 
> I could imagine, for example, something where you say in the nl80211 API
> some variation of
> 
>  1) Let's start a new update operation ("NL80211_CMD_START_MLD_BSS_UPDATE"),
>     I guess already with some parameters saying:
>      - the updated affiliated AP (link)
>      - the number of beacon intervals you want to do it for
>      - the post-update UHR operation (?)
>        (or the new channel if it's CSA? etc.?)
> 
>      - maybe - more critical if we use it for CSA - already the beacon
>        templates for all the links? with all the things I say in (2)
>        below, but that's more complex maybe?
> 
>        the reason I say this is that there's a difference here in how
>        the counter is done - for CSA etc. the things have to disappear
>        from the beacon immediately, for UHR updates they stick around
>        and the counter indicates "in the past"
> 
>     returning a cookie for the operation.
> 
>  2) hostapd updates each link's beacon now including the UHR Parameters
>     Update element(s), for each currently ongoing update it includes -
>     indexed by the cookie - a list of offsets where the counters are
>     updated.
> 
>     Thing is that this depends on the operation - CSA will already need
>     the post-switch beacon template so the flow can continue without
>     involving hostapd, hostapd may however need to update the beacon in
>     the interim (both pre- and post-switch ones!) and need to refer
>     again to where the counters are filled in ...
> 
> 


Hi Johannes,

This approach looks well suited to handling overlapping update scenarios.

To make sure I understand it correctly, I’d like to walk through a
concise example where a UHR critical update and a CSA overlap on link 0
of a 3‑link AP MLD.


t1: A UHR critical update is triggered. hostapd sends
NL80211_CMD_START_MLD_BSS_UPDATE with an advanced notification (5
TBTTs), post‑interval (5 TBTTs), and the beacon template with UHR
parameters update element for link 0. Timers start in mac80211, and
hostapd receives cookie X.


t2: hostapd sends NL80211_CMD_UPDATE_AP with cookie X and offset where
the counter is updated for link 1 (and then link 2).

the countdown values would be handled in mac80211 with the offset
mentioned similar to ieee80211_set_beacon_cntdwn().

t3: Before the UHR advanced interval completes, a CSA is triggered (due
to radar or user‑initiated). Another NL80211_CMD_START_MLD_BSS_UPDATE is
issued with CSA countdown 5, including CSA and after beacon templates.
The after template carries cookie X and the offset. Since UHR CU is
already in progress, hostapd could also include an updated parameters
update element. Also, an updated UHR operation element which can be
modified in after beacon template if CSA finishes after the UHR CU
advance interval. (why to provide the UHR operation element separately
is because the advance notification can be before or after the CSA
finalize).
hostapd then receives cookie Y for the CSA.


t4: hostapd issues NL80211_CMD_UPDATE_AP for link 1 with cookie X (UHR
offset) and cookie Y (CSA offset), followed by link 2.


t5: When the UHR advanced notification interval expires, the CSA after
beacon template is updated to reflect the new operation element by
mac80211 or getting it from hostapd.


t6: Once the CSA completes, the driver updates the after beacon template
along with updated counter for UHR parameter update element. (since it
will be in the post notification interval)


t7: When the UHR post‑interval completes, the UHR parameter update
element is removed. Since offsets are known, the driver can remove it
from the latest beacon template.

Please let me know if this sequence aligns with the intended behavior,
or if I’m missing any edge cases.

Also, CSA during NPCA parameter update seems very tricky as the channel
information advertised in NPCA may not be relevant when there is a CSA,
perhaps stop the NPCA CU (still spec has not mentioned any details on
the abort scenario though)

Even, in case of link removal during UHR CU update, we need to stop the
UHR CU.

Furthermore, the UHR capabilities carries the advance notification
interval, post notification  (i guess yet to be added in element as I
see it in "37-8—Enhanced Critical Updates Mechanism") and update
indication in TIM interval, these intervals can be sent in the START_AP.
I assume, these intervals cannot be modified dynamically as these are
exchanged in assoc response (Will reconfirm again).

For beacon offloaded drivers, NL80211_CMD_START_MLD_BSS_UPDATE can be as
a trigger. May be we can add the updated UHR operation element in case
of UHR. So, that firmware/driver handle the timers as well as
constructing the elements since "the encoding of fields in Mode specific
parameters for any feature say DPS/NPCA/DBE etc.. is same as the
corresponding field in operation parameters field for that feature" (but
i see bit variations for NPCA between both)

I guess, this means the proposal of having a separate netlink attribute
for the UHR operation with _full_ data like is much useful.

Still, we are thinking through on all the other cases of wifi-7/CCA etc..

> Either way, it feels like we've reached the end of where the current
> design with CSA and BSS color updates will take us. Lorenzo already gave
> up and put the parsing into the driver to find the offsets, but I
> personally think that's very inflexible.
> 
> Some operations such as link removal may not need to have perfect
> timing, but some others like CSA really do want the updates to happen at
> the precise moment.
> 
> In some way, it's almost good that we haven't completed the WiFi7 part
> since the UHR part throws another curveball with the counters
> decrementing below zero - for past updates - in a sense.
> 
> 
> johannes

Thanks in advance for your time and clarification.

Regards,
Harshitha


