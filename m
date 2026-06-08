Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE00CD6E79
	for <ath12k@archiver.kernel.org>; Mon,  8 Jun 2026 17:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/9g7+8oC3yBt2suG9dk3CdbNFRbx6wAs2lmTlHEx+E=; b=OwYNLbRLBi7q6Qphbt4jbyjixj
	SmY9tANyhCjIX9FHARYhkZrj5U8ffswvXx/ykp2O531Y0dF4zJySvKhhIVQ50wjhuUVJ+AVGUTTt6
	L4PQCA+Vi6Jw51Fr+V4ZOjbsD04SiXuaZC4qwuNwVvKjP8+WZXyoClaiVW5xXrUbXZ5+GZkJejJO4
	ayDQ1aX+M8sIhluMtQz7/NpRkesq6Fq1vcAqdcvoiQGcNL4XRdLgBf62YUjam1YbX/LZX4W0OFA+l
	uN1pOryFYBDFQ0ooa2Pl+AFhbOqXESQwImHbPJIc6IdOh9Thz8otKPcgxpCfxMuiDr3ECjBxTXdS6
	UA4JlOPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWe5N-00000004Ddd-2cNy;
	Mon, 08 Jun 2026 17:48:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWe5K-00000004DdA-2LjS
	for ath12k@lists.infradead.org;
	Mon, 08 Jun 2026 17:48:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFTIg3971294
	for <ath12k@lists.infradead.org>; Mon, 8 Jun 2026 17:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d/9g7+8oC3yBt2suG9dk3CdbNFRbx6wAs2lmTlHEx+E=; b=V+yRhuKT5R9WKJxp
	/4XxY7Kaa5CEQKU6oq21a7PmTwhzGDdnm/sPGZNQ5Pe+ZZlIpA8Z8zsm30pZ+sLk
	0b6OOGlRmTZxxoMlJM3qdrgMpbPIw8AVhVe8/ia/fq990OdNu9UIFzR4cvecClPi
	rF9YCsmTBhGOUYRd1HZUflX8Yju1bGe30ueC6io3Pom11Boxnq1oR9Zy/eiBsojB
	aTh6SSq8ncArbC2u+k9DuMS+BKHcM3OXi+eYzNkl1dpitHBjYBz/QyvOCE0F1xrC
	k3058kr8exNNsqxiw1GQlB1nMLNOfVgLsxsjdTnaGkbu6iZaVxdWsFgCu4daTQj/
	b99SRQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuptj6p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 17:48:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304df51ff3eso4212327eec.0
        for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 10:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780940904; x=1781545704; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/9g7+8oC3yBt2suG9dk3CdbNFRbx6wAs2lmTlHEx+E=;
        b=jRaGDNh94yg+fzJu9msKKE/k/tRQsamLn5UJC9l3AwcqeiE6cBxpdL+jem+4VaNna4
         pXZw6/80SxaIklFK2Fsgq9S6AxqoIwLuaJosjryZnj/oz98F+z+wXpDqfncsNksudSYR
         gaAacwVhPr/r5J9dwOCYvIEsAcRUcRtkje65Q2pUisTKIAzi2qnWi8MPjd0nmSMjhAr4
         PXux2ECITion322VLOnvedUHr/UnJMiptulU4okHTF57vf4fq8T9dU77M4P0Fr68bMNp
         UqNQNDrjfonLazfn/619nW9KQQkhGzNGwYE0GYFlc6JvTtsQ9Lc5PYpLdoX6gAmYafY8
         hHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780940904; x=1781545704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/9g7+8oC3yBt2suG9dk3CdbNFRbx6wAs2lmTlHEx+E=;
        b=RUe8RZTrpvhN0Lxidhygv1Arhi76BxQx3TfkhtmCbzuyiVne7zmP93cqf7nle9aFmF
         6oOtVJJTLFtXmcHSaNxpIwLl3iTFT+Ef3moEjJkxy8kHkQYW+9z/8D/WegdZfE8dVs42
         8bNZYv8xOnG9oXNNh5H3Mc7C/5t6CMckxaitxVW4c2/Ok6G5LFE6H/obWsmIh7Cafp53
         qxB0gFSYDz+EW/NkcuRmE4bhXCnvKMlbecZfe5nNNgALqnRKLIEnV9gggPStkFO6YYA9
         Kmc86Pn1Xrz82YW9S56BglqEHiHwPQDoOlP/RRcIx10VsBaifC4yB2yJVe5X4TDo/T4y
         ajHA==
X-Forwarded-Encrypted: i=1; AFNElJ8rEFjxDlULAz5pdw89s1BI1GdEG29Wcyfdk/z1vTvVJd0OdUyHhV/NKNFsJ77vcShUaQOQsSY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnjaOOLzdzj/1L532XS5VO6YNsOwm890bhBpTQFYlVbtOA33kc
	rlXsYW0JlljUmK8VSacZib1iT2oBw8/ib4HbOqmkk7OOS9cT0Y/QVObZcWwAVj9KFS3H7mAmrgB
	bLjI9NraayVVcJ1SefEbsrnF3lRH9N21RiV5kRiMUx68V96dv4eXEDrBHM1geStlV
X-Gm-Gg: Acq92OGmpeAz4iLbAo4oWduWwlKWWvbLRO8XrQSwOIpU6/aEcnv+uKZq1m0zCcB0N8x
	BUex+EUGQ0qAAlKywmQM8MtbTcpQW7qkAqjEcm33+HYZZM7gMNpISmISMP8NXkA8AhuuYJIvA8b
	xhbPFf8Z0r5PyG0ix+Wrkux7p99thS9NPS8lgLJztZjFWe1xV4wYmKnP0akS/FK9qlVCh9UaeMX
	BvUkkHP07V+H97R7pjIL77eAapnYHdWYGlpKLbz58Kjqc9U7J+teW8zr6Tw2X/C+Kf2PXOpTzuK
	vzEBVR7u1f3//5BjmHkdoRu9FnScmUaARQmYRnInnZwzEfZhmUnkKH3tCuqI3XkeduNbj8IiXJu
	of10N/508UaDnPSEayEVoiHeucn6vqB/HlO48kzwRuTdXJgZAwhJxj8WfQyY=
X-Received: by 2002:a05:7300:8190:b0:2ef:8b72:1b9 with SMTP id 5a478bee46e88-3077abcee73mr9540526eec.0.1780940903824;
        Mon, 08 Jun 2026 10:48:23 -0700 (PDT)
X-Received: by 2002:a05:7300:8190:b0:2ef:8b72:1b9 with SMTP id 5a478bee46e88-3077abcee73mr9540498eec.0.1780940903154;
        Mon, 08 Jun 2026 10:48:23 -0700 (PDT)
Received: from [192.168.1.8] ([116.73.159.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30791f6381fsm9238976eec.0.2026.06.08.10.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 10:48:22 -0700 (PDT)
Message-ID: <1a584e78-1039-40ba-a6d6-d1af2516c3d8@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 23:18:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next 0/5] wifi: cfg80211: Add fragmented per-link
 station stats in MLO
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
 <7d251045171a4146604b8788479efc0e99224ff8.camel@sipsolutions.net>
Content-Language: en-US
From: Praneesh P <praneesh.p@oss.qualcomm.com>
In-Reply-To: <7d251045171a4146604b8788479efc0e99224ff8.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9RFdGQdVH4GgAMEIzgbnDxYXPCnW2j5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2NyBTYWx0ZWRfX60RN2VqMTNIa
 JrNqyEe11GgxcDdbgy/EvuLL5/kouPvUdNWIqEUinqEOidVSaXWFJ+Sz9GcW6csS8eLH7WjMKcN
 8LqMOqYyjpv8LMdRYBjfoeRWH8gHrvHKxIyKSgnuimt4HxQCvZNsCdEPIw0eOM9lPtQHNEzmH4Y
 75ZKd2abe3MmKXJ9pmfFS7tArTzyDH3qEhdZDZg3Aj3ylxpOcFI/W57eTyYZULfJ31J5RwxvN7t
 RYVP9DqKPnTqqjlCtOhWEQ92+jVIwX72E4aRGZMqIm0rAA3NosYoFITDwNiNIfeo9pBk21iLd39
 7/IMg71dsYJOBN9U0MctvMN6Ae3mFykmMHzEuOybDrKUv28xPIvPOor+OqiiZjfCvElUuHuob6i
 BqZh6x4KnG8thIK0xo+gStCm/9fMttDF0wLvIC/0jslc+U2++kO17EUnJP4bhZfvLX0AVogY8ZP
 7sFzWiyqA/kAw9Nm6Yw==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a270068 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=0XKIscjZuezYqwSxLmfFhQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Kw0TDqbp-FwB6xDATtQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 9RFdGQdVH4GgAMEIzgbnDxYXPCnW2j5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_104826_720915_82C1E545 
X-CRM114-Status: GOOD (  16.16  )
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


On 6/8/2026 12:46 PM, Johannes Berg wrote:
> On Sun, 2026-06-07 at 23:29 +0530, P Praneesh wrote:
>> This series introduces fragmentation support for Multi-Link Operation
>> (MLO) station statistics in nl80211.
>>
>> The current nl80211_dump_station() implementation works well for legacy
>> (single-link) stations, but it does not scale for MLO peers. With
>> multiple links per station, dumping all per-link information in a single
>> netlink message can exceed size limits, resulting in -EMSGSIZE errors
>> and incomplete dumps.
>>
>> With 802.11be (Wi‑Fi 7), a single station may have multiple links, each
>> with its own statistics. To address this, this series introduces a
>> stateful dump mechanism that splits station information into multiple
>> messages when required.
>>
>> The dump is performed in two phases:
>>    - Phase 0: Aggregated (station-level) statistics
>>    - Phase 1: Per-link statistics sent in separate messages
> [snip]
>
> Overall, this approach seems (mostly?) right. I have a couple of
> comments reading the code itself, but also:
Thanks a lot for your quick and detailed review on this series.
>
>> Aggregated Stats (Phase 0)
>>
>> NL80211_CMD_NEW_STATION
>>   ├─ NL80211_ATTR_IFINDEX
>>   ├─ NL80211_ATTR_MAC
>>   ├─ NL80211_ATTR_GENERATION
>>   └─ NL80211_ATTR_STA_INFO
>>        ├─ <aggregated station attributes>
>>        └─ ...
>>
>> Note: No NL80211_ATTR_MLO_LINKS is included in this phase.
>> Per‑link stats are sent in Phase 1.
>>
>> Per-Link Stats (Phase 1)
>>
>> NL80211_CMD_NEW_STATION
>>    ├─ NL80211_ATTR_IFINDEX
>>    ├─ NL80211_ATTR_MAC                 (MLO MAC)
>>    ├─ NL80211_ATTR_GENERATION
>>    └─ NL80211_ATTR_STA_INFO
>>         └─ NL80211_ATTR_MLO_LINKS
>>              ├─ [link0]
>>              │    ├─ NL80211_ATTR_MLO_LINK_ID = 0
>>              │    ├─ NL80211_ATTR_MAC = <link0 MAC>
>>              │    ├─ NL80211_STA_INFO_RX_BYTES
>>              │    ├─ NL80211_STA_INFO_TX_BYTES
>>              │    └─ ... more link0 stats ...
> This description is missing another nesting level as
> NL80211_ATTR_STA_INFO no?
>
> johannes
Yes, you are right. The per-link stat attributes are wrapped in a nested
NL80211_ATTR_STA_INFO inside each link entry. The diagram incorrectly
placed them directly under [linkN]. The correct layout is:

NL80211_CMD_NEW_STATION
├─ NL80211_ATTR_IFINDEX
├─ NL80211_ATTR_MAC = (MLO MAC)
├─ NL80211_ATTR_GENERATION
└─ NL80211_ATTR_STA_INFO
      └─ NL80211_ATTR_MLO_LINKS
           └─ [linkN]
                ├─ NL80211_ATTR_MLO_LINK_ID = N
                ├─ NL80211_ATTR_MAC = <linkN MAC>
                └─ NL80211_ATTR_STA_INFO
                     ├─ NL80211_STA_INFO_RX_BYTES
                     ├─ NL80211_STA_INFO_TX_BYTES

                     └─ ...

I will correct it in the next version.

Praneesh.



