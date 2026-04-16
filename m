Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A5CF43841
	for <ath12k@archiver.kernel.org>; Thu, 16 Apr 2026 07:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGpbNMxSv5gqGpFfnjmtY7u/uvCzpl0AeOIlUoeqXDw=; b=zqgoGRSZR5iRWKGhdQ1XCNA8zs
	+TievpwJZ1C6jTO36veS020qxfF28WUBJinb8REBjmcq+XrYkxbWm7GMUKgsBUwwlyb4EuHCqGx4i
	ao5YmFjbXAnJmCEQ959OZszd1GUaydOwyp+fLKhlcGKmpdkzYNZOv9z0du7cpuweTozsChImlvxVZ
	EXEmmWHRGXV1Pd5rBzkXOSBMG5WmgtseksxE0dLxo7Y3KEslJ1mMT6aRWjQb3hpmLdcn6a4Hd+bgI
	j/XuQfh7biwc92v1gUpuIWstT1ikwVStigRlf9X9VPdmTU7EbpuIJCWTMLTcoCrXMJ4yw2vVVMT/H
	wVvWRdbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDHUd-000000028sz-0rkD;
	Thu, 16 Apr 2026 07:50:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDHUa-000000028sX-291z
	for ath12k@lists.infradead.org;
	Thu, 16 Apr 2026 07:50:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6OsAg2652064
	for <ath12k@lists.infradead.org>; Thu, 16 Apr 2026 07:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGpbNMxSv5gqGpFfnjmtY7u/uvCzpl0AeOIlUoeqXDw=; b=DlQd4DNfZ/oPIR90
	f/AxI1o/NUi9KTHtqu6eLXkxpUp+ZuHoIaVBSOEUvoCyzFhf27zYoeQuiKrWPe2/
	1ZRTRizgjd3a3p04B5WsbQ64TWxM1egkFOE2tuBaSbHjBQ9sKQaoJSz5aS2IXutz
	ARCRmHvB5rU2OiQsMuA+CZlTWK/GHGKQJyEkSsC1i7X1KDRLAYuoVuzpY/gp2z7L
	pWm4hHEfgNA+II26N2PeRGtzHOs1mAy/W9DdgWo9PpXd//kvD0Ds7vVAit7wE7lm
	glF5WtbV684ecsbRmFxRiYxTp32KdmkbY3m+WOkqH4Enw+0YTaEGwOAkY+8imaoE
	WUdewg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfug8va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 16 Apr 2026 07:50:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso48784165ad.1
        for <ath12k@lists.infradead.org>; Thu, 16 Apr 2026 00:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776325825; x=1776930625; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGpbNMxSv5gqGpFfnjmtY7u/uvCzpl0AeOIlUoeqXDw=;
        b=kQ7hJSvgJOpFRfOVUYwpecvtfKY+/QPncxm6oS550fV5spVE5EK/AgJAbeMmhjD2LP
         a4Gi06+C0IjlyAQAAz8zHAoDiKB9tZzOjNHM6F/hRvXWNR9XXqOMITmgVzht8wz6CpEk
         jXEVn+W95h3mRYDgh0Cja4Z4F6yVVUqubqT0djgfCg4QpOEN+MwC/mK9ywDZQ3oOqS4n
         MRAS5+Oo+3m52+9a2/usnbeL4LjrZNHNQIftTaYbCk5kc5os+AcYO0dE2JTlUS7hiWVQ
         h93quPusSy/c/psbmknnB4Q5QEPCIGEkmpWztLq8Usb33dhX7BJRz//E43/ps/ZDp/PM
         Ep2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776325825; x=1776930625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGpbNMxSv5gqGpFfnjmtY7u/uvCzpl0AeOIlUoeqXDw=;
        b=tGrmh7T9AECJPAIs/BSAtLjXgSxmoDLwN4XEp1aORacwi0gXgYuVWf6cMHlWTdBw25
         pICpKNLyEA9aMe5oQqsVuRu9KKRm5iFU66EoyPFSOor58Jay2qAw2qwbcej84jVpSaVz
         YJeJe7xcL8PT1NJGBOFsVb5kmfrsf+zqed3RG8B6jFkNgqbEzU5pIc+lzbnF9Sy+2AfD
         S3zrNJpXaXj2VJtdI9drinCqkSzi83fZuF02hsj83MsXWFeXcXhl78nBRCUdQoaDxBmE
         OTbWPr+cpR+pDheHH/+bB0AROFsQe0/Owb4Y1twhK+Pt5AAPZXh8XlTyWBXdi1sM/qtm
         2pow==
X-Forwarded-Encrypted: i=1; AFNElJ+rGRrJqjuvZhKijeZXwpfom4pk65Pwq36xK6eJ1Kj546shFsNJ68aWlndkXTdwtmY3E2nLTNk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrfZmHYCEXdWKa/gNKmV3SfE4UNpMjTDpvAtf/C6TMIE3jP6t1
	tBrjN+Ky4ecXx2VwBzoI2CM9eWmuTPYThgPd9uQT0aaCxHbnE0YBfSSzoHAp0rU1GIFM6VF4Pqi
	QSE7qOw7em74h+RH9W7MvoNd0et8FNTVLS0avo3EnzhlreFivMXIBH3v4MIWBF7gB
X-Gm-Gg: AeBDievKRugF+g2O3GuhJDl2OlqjLQJzdgPDQ/TBSRZsnjaJvVOaBIupkdwz7uTjl6E
	2YODAqc9FZWypWnqAYIvcQtPCrTNmRPT3QdflHGDR357Dma7/jQLrTqdLoLWHFc13FeLVLyzh9G
	cgLVRKC6vD5r98ULnLeZw3cVZvDul5a/QNT2mqZHjuscr6Ovg4AKR2wk6Sv/q+AEzZWuO2EK4qV
	0bHbB94rDh+QZU2UFRJ5KFLdLaDelZ59HclFzTwy1MnOAYNkGdxtTywlhAHTQvPFLEhiVptX+Ln
	m/cabqZN96j1sSvAZn/1Ku6tTfrdKC4bLDjrnRP/yfgVaHWkUd6Z62efMw1SUBrVCthpkSnElXJ
	5rlzg6JkIaAZPhpx00POI43c1n18iouzI7E7ay2B8HT7gtRmUaBzcwINw9C7ktos=
X-Received: by 2002:a05:6a20:7d9d:b0:398:7df5:2dae with SMTP id adf61e73a8af0-39fe3c2d54amr26625061637.9.1776325825407;
        Thu, 16 Apr 2026 00:50:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9d:b0:398:7df5:2dae with SMTP id adf61e73a8af0-39fe3c2d54amr26625018637.9.1776325824820;
        Thu, 16 Apr 2026 00:50:24 -0700 (PDT)
Received: from [10.152.207.30] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f670791bcsm4586014b3a.18.2026.04.16.00.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 00:50:24 -0700 (PDT)
Message-ID: <ffe60911-1ae4-4ee4-ac20-42ffeab89808@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 13:20:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v8 2/3] wifi: cfg80211: add initial UHR
 support
To: Johannes Berg <johannes@sipsolutions.net>,
        Harshitha Prem <harshitha.prem@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org
Cc: vasanthakumar.thiagarajan@oss.qualcomm.com,
        Lorenzo Bianconi <lorenzo@kernel.org>, ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Ping-Ke Shih <pkshih@realtek.com>, Jouni Malinen <j@w1.fi>,
        Benjamin Berg <benjamin@sipsolutions.net>
References: <20260130154259.265130-5-johannes@sipsolutions.net>
 <20260130164259.54cc12fbb307.I26126bebd83c7ab17e99827489f946ceabb3521f@changeid>
 <f96125eeda23451c19067359eb9d10b4047bcdd3.camel@sipsolutions.net>
 <5d54feea-d0cd-4bd7-b0d2-02e42f0fe5e1@oss.qualcomm.com>
 <be9ab3c7f05b0f56f19aee0ffc7c2f96138b9a05.camel@sipsolutions.net>
 <156d6d48-d135-4acf-a5d7-c9ae80523864@oss.qualcomm.com>
 <0f4b34f0b529fd93fc608d8bbac0e98516b7a3d2.camel@sipsolutions.net>
 <f3282007-a11a-4f68-86d8-0945e4979d65@oss.qualcomm.com>
 <d3ecf6e5580cbe50eee807b1e63109e42e3b956c.camel@sipsolutions.net>
 <416d08f1-6b8d-4bf7-9a63-c3c68497d990@oss.qualcomm.com>
 <c676b2cd73463fa88f459f0416c60b03f20dd027.camel@sipsolutions.net>
 <1cf0ae795b0e3e95b38cb7abf84ffad34c187fdf.camel@sipsolutions.net>
Content-Language: en-US
From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
In-Reply-To: <1cf0ae795b0e3e95b38cb7abf84ffad34c187fdf.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RQaIZ-4AAHWagalXE4xodUf0doFMt8bF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3MyBTYWx0ZWRfXwN0kV+xJlM0S
 CTRnzEg2Al1Q52VOvJmsWWZfsn4KPb4xvSF/fM33YpgOSd07X4kqO9tZF62sIdvV8+vvp1Mmb3k
 5d1hmVje5IFrIeJdbcjxwiDvxlFdoqD7lvs3NbSEQaKqbZkxjNKnGlj8qQrFkq6da9+rYI+YGtD
 QySmA1EIqaWIiAr7RftT2HJPRDdAUHZNdKi85jJbc6yIhg6/+wLzV7YfLo6GnaUAsnOrdBpRAtN
 7VYMqzSvZugPjirc3MBd5iZNqJjMso3tXevJ5tVU7E5BaG3Dc23ySCDPsgtz+Xz75Pk7/ZByChV
 fRXl/v3RSOFP/dy9xVsRHevUYqBI85Odiq1F+63njnCroSw5BwC1ikUCV2ggo0CxkkHHakvVrZf
 WBAPuqbYWK82G5KKwN+JM9dOGIc0i4GQ33dHk8o2NCMgFnAOd/TljkwobwnX/k7KbabFqv0jPjY
 apl+HAJPvrW+kuAv/ow==
X-Proofpoint-GUID: RQaIZ-4AAHWagalXE4xodUf0doFMt8bF
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e094c2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ePdpjyjeF8tyq4wwS_QA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_005028_568862_4C53F3BB 
X-CRM114-Status: GOOD (  60.49  )
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



On 3/13/2026 1:02 AM, Johannes Berg wrote:
> 
>>> Because of this, an event-driven approach was considered.
> 
> So - starting this again from scratch. Benjamin and I spent some time
> discussing this today too, and hashed out a (mostly?) workable solution
> that should address most of the issues. I'll try to summarise that
> below.
> 
Thanks for the detailed summary.

> As will become obvious - and that's why I quoted only the line _you_
> wrote before - this means we (including myself :)) need to stop being
> afraid of hostapd doing (soft?) real-time [1] tasks...
> 
> [1] I'm using that word in the (formal) sense of having a deadline, not
> of having to be particularly fast.
> 
> 
> Let's assume the following constraints:
> 
> - preparing a beacon template as a real-time task can be done by
> hostapd, given enough heads-up time
> - no periodic events in a steady state when the AP is operating
> normally
> - TSF drift between links is correctly handled (maintaining <=30us
> offset at any time)
> 

Handling beacon template within TBTT interval between links is possible 
in a model implementation but in real-time low-cost platforms where the 
AP is handling max clients (256) with multiple vdevs enabled might be a 
overhead for user-space to process.

> We evidently already make these assumptions:
> 
> - if beacon intervals are not the same, the TBTT offset in RNR is
> filled in by firmware (I see no way around this)
> - either firmware fills in TSF offset, or it's just zero, and not
> really accounting for slight drifts (but that's probably OK since it
> never adds up given the <=30us requirement)
> 
> And also let's introduce some new operations to driver/firmware:
> 
> - the firmware can drop a frame that it's not able to transmit before
> a given (as frame metadata) TSF value on the link, and indicate to
> the driver that this is the reason the frame was dropped
> - the firmware can create events at/after beacon TBTT (or beacon
> transmission), this can be controlled by the driver; these events
> contain the next TBTT's timestamp value
> - the TSF offsets between links can be known to the driver, if they can
> change (I suspect CSA could do that?) this can somehow be noticed by
> or given to the driver
> 
> With that, it seems we can redesign this whole thing to be event-driven
> and (mostly?) race-free.
> 
> In steady state, basically nothing would change from what hostapd is
> doing today. It simply configures beacon templates, occasionally updates
> them if elements need to change, and sends probe responses,
> (re)association responses etc. as usual.
> 
> During any sort of update (CSA, color change, EHT updates, UHR updates)
> things operate a bit differently:
> 
> 1) hostapd enables TBTT / beacon transmit events, these events would be
> generated by firmware and passed up, for each link, containing also the
> TBTT timestamp of the _next_ beacon to be transmitted
> 
> 2) hostapd waits for the TBTT event for the link that it wants to do the
> update on, ignoring events for other links
> 
> 3) starting from that TBTT event, on each TBTT event hostapd generates a
> new beacon template for the link the event was for, and configures it to
> the driver/firmware. Since that's a future beacon, it has to predict the
> content of that beacon using
> - the TBTT of the first beacon carrying the update announcement
> - the TSF offsets between the links
> - the beacon intervals of all the links
> (a bit more on this later)
> 
> 4) After applying the updates (a bit more on this later) and noticing
> that the announcements are finished, hostapd waits for one more TBTT
> event for each link and configures the beacons back to steady state,
> after which it turns off the events.
> 
> If, at any time during this, hostapd needs to send a probe response,
> (re)association response, EPP Capa/Operation response (or others?) which
> holds information about the updates with the current counter values,
> hostapd will create the frame per the current counters that it
> maintains, and will transmit this frame with a TSF cut-off value
> indicating that it must be transmitted before the next TBTT (over all
> links), or dropped.
> If this frame ends up being dropped by firmware because it didn't get
> out before the indicated TSF, hostapd gets a specific notification for
> this and then simply re-generates it and sends it again. This could
> possibly repeat if TBTTs are close together on multiple links, but I
> think it's not worth optimising for this case, though it could be done
> by deferring the response slightly based on timers, or at the expense of
> a more complex API ("defer until X and don't send after Y" vs. "don't
> send after Y"), neither seems really worthwhile.
> 

For dense client situations where we have the AP in a stadium or in any 
crowded place, the clients are moving between APs, we see that there 
will be more traffic drops for client connected as it gets dropped due 
to above condition. (Also, there is a chance the station might add the 
AP to the blacklist if there are more rejection while associating)

> 
> I said I'd give more information for (3) and (4) above, so:
> 
> For (3), also consider that it already has to effectively be able to do
> this for the templates thing we discussed, it has to predict what each
> link is going to look like in the future. I think this isn't too much of
> an issue, but care must be taken especially if beacon intervals differ.
> 
> For (4), I think the way how the updates are done may depend on what the
> update is. If, for example, it's DBE increasing the bandwidth, then
> could just do the update _before_ the 0 beacon is transmitted, and if
> it's decreasing bandwidth could do it _after_ the 0 beacon is
> transmitted. Some of these may potentially require management by the
> kernel or even driver/firmware (how do you switch NPCA parameters at the
> exact right point if not in FW?), and perhaps (especially for CSA?)

In offloaded case, firmware takes care of removing the newly added 
element(s) once the beacon with count 1 is sent. For CSA and ML 
reconfig, fimrware will send a completion event from which kernel/driver 
data will be updated.

> there will be some considerations regarding multiple interfaces.
> I mostly think this question is orthogonal, since armed with a TBTT
> hostapd could also request that this update be done at a given TBTT.
> 
> 
As mentioned above, this gets tricky in the cases which involves a low 
cost platforms in a dense client scenario. Users might not like having a 
glitch in their traffic (especially during live streaming) :)

> We haven't really been able to poke significant holes into this, but
> maybe that doesn't mean much. Couple of thoughts on that:
> 
>   * For each link, hostapd has roughly the whole beacon interval to build
>     the next beacon's template, which seems reasonable.
>   * There's a really weird corner case where an assoc response is
>     attempted to transmit just before a beacon, doesn't get an ACK, but a
>     retransmission isn't possible until after the beacon and it's dropped
>     due to the TSF cut-off. Doesn't seem worth worrying about.
>   * If the TBTTs for two links are at the same time, and the events to
>     userspace for them are not coming "updated link first", then the
>     beacon transmitted at the same time on the unchanged link may not yet
>     be announcing the update, depending on the event order, given that
>     hostapd waited for the affected link's first TBTT event. This doesn't
>     really seem like a problem, but I think could be addressed by
>     updating all the links on the first event immediately or so, or
>     (Benjamin prefers this I think) adding the first beacon's TBTT to the
>     response to the event enable command, I just worry that would cause
>     other races that would need to be addressed.
> 
> That's it for now :) Let me know what you think.
> 
> johannes

Thanks for the detailed answer with clear explanation. Yes, this is not 
much racy as we saw in the previous designs and addressed most of them.
We do think that this is suitable for the cases where the CPU load is 
very much low, also the time sensitiveness with respect to client 
handling is not a problem.

But, in real time use cases where the AP is getting deployed in crowded 
places, the CPU load spikes which might cause more traffic drops or 
connectivity issues. Also, if the AP is enabled with cloud analyzer 
which collects periodic stats, load will be high, thus chances for the 
user-space application to get the CPU cycle is highly subjective. That's 
why we preferred a offload solution where most of the time sensitive 
operation are within the firmware.

We will come up with a offloaded design that would be scalable for the 
upstream driver(s), also address the hwsim cases where we would want a 
minimal test cases for handling CU to facilitate upstream STA 
implementations.

Regards
Manish Dharanenthiran


