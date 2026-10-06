Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D85CA5FFE
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 02:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNxjXpkyaL0SakgY6wB+Mhgiw6lt5SjM6SRsBvtmBUE=; b=RHbPWqD0eKK0pexT5/ZYAi6zzB
	4UqWN6WjLauV2mE4WMOc7ZHiGP7IOMFZQKbkfDMAvqULKOL3wH9qj+4bmHAqR15xc4hWBTQPX0aTw
	jdlIrN5s94dcxeMVNkA7zn2CQOv8eApi9Rgxx/JXCmHSGZqHuN2cYu5Bm1+p6HwrPXuXVRNrGUurb
	RoHkNa59L3wmJvNLHoOF/Z1xiSDzUqMwFZJnHw7lIeOl5qhRQx6iEDbhHUFCSltKu+fYzOjI6TvO3
	pzZSdR/2bK6OfAjJLUO6CE4LG+4vAGKGVWTX1+Bcdv+FdX8ljzdJ3oxwxXWpJOU/h4zZALNR1T2Mh
	htKUU+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDuYs-0000000HU3h-2Enp;
	Tue, 06 Oct 2026 02:05:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDuYq-0000000HU3K-11g9
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 02:05:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KMpf02359910
	for <ath12k@lists.infradead.org>; Tue, 6 Oct 2026 02:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WNxjXpkyaL0SakgY6wB+Mhgiw6lt5SjM6SRsBvtmBUE=; b=J1IqsO3g2C6N0AMv
	iKgK7ACfmSQEdpDdDbnENbzGWHhc0nLBrrt9KdOvSAbje7QFpoD9s2kC5OhuxTFz
	NukD0yvHazO3gZDzFcsPpUxSyt/ffxf0TyHzhVdlXQITSa5dRcoOM3LucWzzXCgJ
	Ta4Q//sQsasArmQpXKlqCHXDkcrCfmM/pOFbVbo62E+1XgUDMWYm0pxXTnSih4xE
	QLZZiAXz3RqKupDQfQ+xd+pVlLd1yhM6AI5cqSjQLDOC+Ix2pSRuRwjcjVhMk5zE
	7UY2psnlKY69c4EQNZxz29tOfRCp2RmjAYI6ExVP5auIswipcntNeXrTxmwxkhe2
	dTPJGA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4j1ns5qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 06 Oct 2026 02:05:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34ef0362d95so4467815eec.1
        for <ath12k@lists.infradead.org>; Mon, 05 Oct 2026 19:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791252343; x=1791857143; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:cc
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNxjXpkyaL0SakgY6wB+Mhgiw6lt5SjM6SRsBvtmBUE=;
        b=MFqD8YlWGZ1UqK31pZPonBozr8dp7rVtxdU19xInpa2/9u6cjoU59908hj3GguWZS8
         7wFDWPNdL35WkKkcPztT8asWrm+urBofSkYb3OPCWoZ3aXvIJL1OsPouExKU26xbBdtI
         R4rZ+726ToHI8+OQqXW87jwArV0n1Q4QnJGnjLKKuVEOhTqqiRnor8BSiVsLBA/IObsa
         Wk9b0WBSEBlqT3mY6hYotbT7nr09TjrJw1mwQFhhdLbLq7M1NUaMT5Ycp5FPRXfzstlG
         5BNANw8NWBSVsUZrg0SWX3SIa5tKjLDOmXATkmlfwtyVAHPMTYhIew4cAl7tfhVzNtFB
         5LYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791252343; x=1791857143;
        h=content-transfer-encoding:content-type:in-reply-to:cc
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNxjXpkyaL0SakgY6wB+Mhgiw6lt5SjM6SRsBvtmBUE=;
        b=zPKu/qB4swnlXwoxTH6lKJBUyDhZuxtVYef2XiRnyQEndQ4bvlWuOWBeHvMwTFcZbx
         syyYahy7g64+AreJAs1mJcaYlhjxrMUpoJcEdTwtQ8cGH+X98FuGroeHmJztlk8ucSUh
         dtFbbONuWBVk7K714nG8+0RMwzEqiCi+DbY3nPZuQmsH4AAqVR8fmsgW1Utprm2s8s0b
         OuAY5fgat0/Hx6tkgUPCJsE+X8FWPaoiQxYi0mjc+5x6lwwvTyG5HqtfvL0kLb6X41Jl
         bHqEyy16XuL9JiDQkzwXdUScpzJ25CFPOjMAR7Iuhr6mrrSfrgkz3WiJGLgEPYdBjgMS
         Zrmg==
X-Gm-Message-State: AFq9FYImAsOLf6BQPY9FnjxaZnBMQMBBCmwLuMcxTr14yBYslZT8qqPF
	1aalyhvOFzsdhySex1wKjCW2JuuhvpSEyoNKEctmiOU8A6aD6fYEQZ/YoBkPL85YU3F8Jc0S2bA
	z2e8cm4Aq4rYaqizrkGQ95j2BKx3qeOQobYU19gYBKb/nwejsBuBzbRSeBjWckxF+NAjLlGLE
X-Gm-Gg: AYBFou21tx8M4OXGe5sgmOy0paiOtYA2h5WZ0hpSvLSvzz6101w/CueoeNWJMmDkycu
	JgeeT8cr7oHqtu7U+XSN8e19Ku+0hJNKCvHY2jgxiKX4/32l3yq2KPPExB9XzSxLtWc3EHwNbUT
	Yunc7hSplkKfkSgewS6n4HU8mUuaMPvBe4I4xn1p1Pjv2ZOy8BD6akPidAl9l3i+0KwN5s1YQUe
	f2lokeFIh72WDbIiEwXX1aRTSrzwR9xYPPl22hWRtVqn+9ThDOehiu9ObKqQqG6R+KB+u4tyf9M
	nNQ39tctVMn9hBJXsebh6phOIGxal6rJSj0psicRhQkAN3Alg4ZAjNWcS22oXcBVTuUfTjwrYTk
	b+XezRAwFqaj82F2fVYV5Rvw5PzRj/eVf41Y3Xvn1M7BFAVkkAShxlv/jXA==
X-Received: by 2002:a05:693c:638f:10b0:34b:dde6:29c7 with SMTP id 5a478bee46e88-351114568a1mr11781800eec.19.1791252342337;
        Mon, 05 Oct 2026 19:05:42 -0700 (PDT)
X-Received: by 2002:a05:693c:638f:10b0:34b:dde6:29c7 with SMTP id 5a478bee46e88-351114568a1mr11781765eec.19.1791252341505;
        Mon, 05 Oct 2026 19:05:41 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a299cdsm2360672eec.12.2026.10.05.19.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 19:05:40 -0700 (PDT)
Message-ID: <3db68884-f6b5-499c-9959-7eec59ba40cd@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 19:05:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] wifi: AP side locking improvements
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
References: <20261004214504.1636783-14-johannes@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
In-Reply-To: <20261004214504.1636783-14-johannes@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwOCBTYWx0ZWRfX0NUXmfj4yZCm
 oXa9H1p3vYnv8yS1qoQUAcC3ChaGPjK68fFcDhLI/gW7A7XiqUQYJQgjsN20Yaytv6dvmWfutGW
 N37tGolxlFgBB8IQtcCd6kyS10jX/dw=
X-Proofpoint-ORIG-GUID: 2bdbBzQc8y2yJziGdQ9AUquMQaIZh6Db
X-Proofpoint-GUID: 2bdbBzQc8y2yJziGdQ9AUquMQaIZh6Db
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ac45777 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bb0DoZlYktw9nqMOHAQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwOCBTYWx0ZWRfX+nLoPF/iCdZG
 HuzLPLaN9LPaOAoRJXBdwf3EtCEpvh7tCrh1ebtYcY++BAh1Z5+SVELVKbBJAhKtpIhv6WdtORx
 PntpBJHPG1AypI2078QuCu/FHnpAVX2CA5oZ4t9K7rvR7vO5HRM/IssCtH+j12yDXx9rJ1CWQlg
 XvDcZ6QdzPG8/TygLEdWpfbVY3E7XkwUJ6jpdybvSgqVLFVRUmTns0qmn1Fnfo1nXjca40AbrgG
 3IOifxr5NcwUXQVIckW0pMLQhwcndaybeuF8kVMZwq/9+2R8UXtmRqn9+RPblQY15UaPofsNLI4
 f1duSD0oP1EDRsCdeoDx0zKR2WQeJvnHPQrqa2rlUbiiOe7FRYvRd2/TK9ndGHC6VFFWYOAQFxL
 sy6XUp8cf8YvXGdWVtQvYEYLaTQ5rIYhroSwUZSVUR90OLtlcKyYk7v78GIO8QLyYYOrkNAyGiM
 qKypeRd1LhK4LhLrrRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_190544_329607_84136D24 
X-CRM114-Status: GOOD (  24.69  )
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

On 10/4/2026 2:40 PM, Johannes Berg wrote:
> This obviously goes on top of my (fixed) RTNL redux series.
> 
> The idea here is that wiphy mutex can be held for quite a bit
> of time (e.g. waiting for firmware), but beacon updates (e.g.
> with the critical update design I had proposed a long while
> back) and other things should be fast.
> 
> So with this not all things require wiphy mutex. These are:
> 
>  - beacon and related template updates
>    (this one needs driver opt-in),
>  - mgmt frame TX,
>  - control port TX, and
>  - peer probe.
> 
> This does make the implementation slightly more complex, but
> the added complexity is almost entirely in mac80211 (and some
> in cfg80211), unless a driver wants to opt in to unlocked
> beacon/template updates, which it has to implement itself for
> obvious reasons.
> 
> I think we probably want this even without the critical update
> design we're still debating, but I thought I'd throw this out
> here because a lot of the discussion has been focused on the
> latencies throughout the stack, and I never thought they were
> fundamental. QED ;-)
> 
> johannes

With both the redux and this series applied, I prompted my review agent:
prior to the 2 patchsets (18 patches and 12 patches) ath12k relied upon the
wiphy mutex to serialize many of the mac80211 operations. are any ath12k
object references now subject to new race conditions with this entire set of
30 patches applied?

The reply:
<LLM>
New Race: ath12k_reg_notifier vs ath12k_mac_op_start/ath12k_mac_op_stop on
ah->state

Before the series: ath12k_reg_notifier was called from
notify_self_managed_wiphys(), which ran inside reg_todo() under RTNL.
ath12k_mac_op_start() and ath12k_mac_op_stop() both assert
lockdep_assert_wiphy() at entry — and mac80211 calls them holding the wiphy
lock. The wiphy lock was acquired under RTNL (rtnl_lock() → wiphy_lock()), so
RTNL serialized the notifier against start/stop.

After the series (patch 18, 7fccd0f981b5): reg_todo() now holds cfg80211_mutex
instead of RTNL. notify_self_managed_wiphys() calls ath12k_reg_notifier()
holding only cfg80211_mutex — no wiphy lock, no RTNL.
ath12k_mac_op_start()/ath12k_mac_op_stop() hold only the wiphy lock — no
cfg80211_mutex. These two locks are disjoint.

Inside ath12k_reg_notifier(), the first thing it does is read ah->state
without holding ah->hw_mutex:

if (ah->state != ATH12K_HW_STATE_ON)   /* plain read, no hw_mutex */
    return;

ah->state is written exclusively under ah->hw_mutex (in ath12k_mac_op_start(),
ath12k_mac_op_stop(), and ath12k_mac_op_reconfig_complete()), none of which
hold cfg80211_mutex. The reg notifier (on CPU A, holding cfg80211_mutex) and
mac_op_stop (on CPU B, holding wiphy lock + hw_mutex) can now execute
concurrently. The ah->state read in the notifier and the ah->state =
ATH12K_HW_STATE_OFF write in stop share no common lock. This is a new data
race.

The same applies to the ah->regd_updated = false write further down in the
notifier and the ah->regd_updated = true write in ath12k_regd_update() (called
from a workqueue with no lock), and the ah->regd_updated read in
ath12k_regd_update() — none of these are serialized.

Before the series, RTNL acting as a global serializer masked all of this.

Pre-existing but Newly Exposed: ath12k_regd_update vs ath12k_reg_notifier on
ah->regd_updated

ath12k_regd_update() is called from ath12k_regd_update_work (a workqueue) and
reads then writes ah->regd_updated with no lock at all. ath12k_reg_notifier()
writes ah->regd_updated = false also with no lock. These two were already
concurrent before the series — workqueue items are not serialized by RTNL — so
this is not a new problem introduced by the patches. However, RTNL previously
prevented the reg notifier from being called while a mac op was running,
which reduced the window. That window is now wider.
</LLM>

So we'll probably need to address those issue.

/jeff

