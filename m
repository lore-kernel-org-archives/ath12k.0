Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A2ECC6B2F
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 05:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VByP+HgL4tMgo0fXnPHtZaEKMdZ3+L8eEwWP22mboo=; b=wKTCl1JFTcHkPwMmpi1QCCAkYw
	HS02BDEP1jNRsEi4cdNP3OC3+9Ojs+P738WSfINQa50Q7FH2B3gfifGCuy0U/tpsOGUABTQHXrp1H
	ACEWMyW0/Dq1P/ADOyiN5Tz8u2TPclGHYsipaEpiI5d+jxM6fWiwoNhuWnHKu9tGo5yJrMwwv7B/3
	/tIsK3Q0rE8KVLnJePyemCozzrKg6a/QtR1brs7vRRTShWYHAWTMaGpdBD3blyf3fl2ozZbpJ63T1
	obXrJrFXtYRI3tYFcWf17+dW8GQC3CTRsfzEZhjw0NnJh462hqjyhJfL0tNlcuurDhs7uQqevlAWN
	5JHDRgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEN3-0000000GtFd-05S3;
	Thu, 15 Oct 2026 05:51:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEN0-0000000GtEw-3auR
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 05:51:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wlCE1889647
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1VByP+HgL4tMgo0fXnPHtZaEKMdZ3+L8eEwWP22mboo=; b=cGOFA7OzkrW5dQ18
	1lt9QomyvLvWouWBXReJz9W7wn+QIIkGxIj9yD7Y478SS6XnH5nJYwmC5J/8itec
	1BcLVJu0rI7VgF5RN6o2Qp3hdo355KjQKCx1QI3VwHdy6zevlgbIZ91NQKv8K4IG
	bRRYKYDOnxTeRsQ83Oz3ynmOtd30jBM/nUO7YMoPKRvtpdtqfYQ7/4/0aXlnaPkH
	NDhH2YWdbe0OEck0mtANQ7tYythDM5rGgObRUw/k2AX1iURk9nWU+oO2LqgOmtPP
	crlxiQ4vCSHd8L3UV1AVQg5/9v+sGUI33GEGzczr1RP9AuJPuAwphnmBkV3+Wthy
	rRaFKA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda0bsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:51:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so1047972a91.2
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 22:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043472; x=1792648272; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VByP+HgL4tMgo0fXnPHtZaEKMdZ3+L8eEwWP22mboo=;
        b=gxBtVUHlQ54xPCmKRwhHiPBwSRnAHSZso00q0jw/2UAbADwAArGqUOIgLkw3jss6ua
         bydihRmuZ4D6ng7yl5bkjxbWYY57pItgs+85U1VjB47+nQ1xBV/EzMy63Z6b00eQ7g6l
         nID/5mlEuWyR9PJIIJHv0eyhs37VSevyaHzDXjWtjFpfc2piV+SXhEOlStDJo/C5jqw+
         jCpzJ3oqg6MrCdCH/IUzXBl0Aa+mt5AAx7mapmP+Ah2/fU2wzzttWBPAJ/9jmzogBpCn
         HThyBDi8pY0H4eBHd4Or1kSR4GrM4hu77BqSqzFOO/K+FFKALa1puA2In3cmDeqluTp8
         BGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043472; x=1792648272;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VByP+HgL4tMgo0fXnPHtZaEKMdZ3+L8eEwWP22mboo=;
        b=nyx6U3vgLIdlU6q87NttrXrbgWhbKZ1eNOUrammpUvV39ZQ832kdRb93OoKVSdz0F3
         sySWUUZ6s0EB+O83EKKrRG6hmzba4I2bN4gXBEpu8wEX4KemSJD4eou/tAEt4AQrIuFa
         +YXLcG6f8NpmUmnf7FyxKGhY7a6KX8MAavfDUw7g0rhnL4xGnd1GVt7T3tcK5CKxzAxL
         buDaJJHQjwsVjtZRV9JxOWT+MdnmvpbE8XcBhy0W1P9yx8vpuLonmR2RRdQ1l0JvffAJ
         LtzAl3iMj1GPrdHF6AZamWjOvL/loOxslep/mUp9diPPio1xutAPF2oRUleaHOM2tIL2
         WoJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxpKB4BWnGh497NobMmrXPidIHNWvr4I2Zs/kSd+g2/H8dFS0yBYucegRYHFlMgJkJhaRMoCM=@lists.infradead.org
X-Gm-Message-State: AFq9FYJYP7KKYk4xCUp+LwBwkSoxf9Eh7eu6qoN01d32cu0LjTVBmPq2
	P4BMBj1q4wWqvU1tiRdVNoLSq2H4gLN0tC3o3IHAZs4I7UwCPPWPm4e5fyUG8iHC5Pt0Xv0NNJ/
	EUUXXNlSgqrq3uOBgMYdGM7LQVAsPO8/dmjb6nrGzeBuVYqwufY+/APKr7S6qXyas
X-Gm-Gg: AYBFou2N1GILcZpTj7B1T398YJTsyapFP4x5LnTfdcq5QWKj38x8XYiKL6tAJg4FE/j
	lXWrSYuxC61miEcDQkpO+rSmu8OG1K2gNSG7PTeiM2Ge5ykN0HI8Frb0k2fxbGqGEQXVYfEu3UW
	uuL48qLBNAZOMB3LLheTlG1g9EPy8W4yBqPJfcH+sVFpaCeE1Yl9Mco06ySy6VH0dkUoIFspbPn
	wcNc18VYhGkf+SxvM1useh8G07QL0LBCr8rnmudaV3FBDVCHX5E1S82Myrq+RYY5U6KBGlgOT6l
	/naNf/6SLodsT6sBN/d/Xonfo19WH8LEHBCbgmQdppCXvSmcEHSWSBVfF0Gjbs+XQ67I6WAuW/M
	7tdRMC04fMmznpyPVI8oPDC1G9ZJjuqZCHyEW1avjIghPiKkLrQYDjmrwmiUQAw+i6Ob0LfU=
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr15464779a91.14.1792043472117;
        Wed, 14 Oct 2026 22:51:12 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr15464767a91.14.1792043471638;
        Wed, 14 Oct 2026 22:51:11 -0700 (PDT)
Received: from [10.133.33.32] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2614738a91.15.2026.10.14.22.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 22:51:11 -0700 (PDT)
Message-ID: <aaf175a7-86e0-4da2-a3fc-df87d906f800@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:51:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] wifi: ath12k: fix MLO station firmware crash
 recovery
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org,
        Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260804175004.1761075-1-jtornosm@redhat.com>
 <20260804175004.1761075-2-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260804175004.1761075-2-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfXz5EiYwxbtsqA
 e0ozGrOZnoeRWPDqWGY+Ym9lX7bZgDL5Xf7W4l1p4J6RED2x5BjG5Zqvhr44T7KriqUw/Ny4gbX
 ioe2Anvxbta4f/IWErd50DZ5yO4FpD4=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad069d1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=s5qa2rFyFl07KiwIxvkA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 2SAmUvZLADfXDuM8w7uAodJkPwIPcsMR
X-Proofpoint-ORIG-GUID: 2SAmUvZLADfXDuM8w7uAodJkPwIPcsMR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX1+UB0hBf7WV6
 xBlOylQ29DQSrIlv6YL2s2CNa6spdccgyoA3gRhtLp6541ZHa9btA7lJBKVwRrzPh++mTTBJO+x
 GP5kuSILKOJ9TthOKDk+SdYzh8WD98+LbKPnzVQLtBJ777FTZVKiooIboczqYqUFgvMukMyDkk3
 noFLM9NKL66bv74p3YrGGNgsp32u1cHgX5vYZ6zKd4S2mFBZ+QkqoQXE9sQsKHJ+dSN5+6axc5U
 1CyF9lj5peRZ97nf+IGBmdJmbb/gN088h+86BsPYFLm03tmH/Ll4bsieLG0YotMqVfh3KswjrA9
 diNsZ14rx8PgVPAUhgGQlJXF2Pt8IB2FG78SdbzlwiDZYVQpLtaouqtGWOjP4te4a/NqLnKTp/E
 fqJFJEKYsdBp5X7TBz75H6Hc39eMgQu0ehU+mY4Tq3B4iHUT9s6E2ftW1Df8MweLiBG73s5Xd7Z
 jM7nNR98YW7rkgR8Iew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_225115_058408_29C15EBB 
X-CRM114-Status: GOOD (  21.94  )
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


On 8/5/2026 1:49 AM, Jose Ignacio Tornos Martinez wrote:

[...]

> Fix by moving clear_bit(ATH12K_FLAG_RECOVERY) from
> ath12k_core_reconfigure_on_crash() to ath12k_mac_op_reconfig_complete(),
> so the flag stays set through the entire mac80211 reconfig phase. Add
> ATH12K_FLAG_RECOVERY checks in change_vif_links, set_key, and sta_state
> to skip operations that are invalid during recovery. Add
> ATH12K_FLAG_CRASH_FLUSH checks in mac_flush, station_remove,
> clear_peer_keys, dp_rx_ampdu_stop, and peer_mlo_link_peers_delete to
> return immediately when the firmware is dead.


I don't think patches 1 and 2 are the right approach. Guarding every callback that can run
during recovery with a RECOVERY/CRASH_FLUSH check doesn't scale, whatever callback we
forget today is the next crash report. Besides, such guards don't help those in-flight ops.

The actual problem is that nothing stops mac80211 from issuing control ops while the
ath12k driver is in mid-recovery. I'd rather fix that than keep adding per-op checks.


---

Hi Johannes,

We keep running into this in ath12k and I'd like your opinion before I send anything.

Firmware crash recovery in ath12k (and probably other drivers too) is slow and async: we
detect the crash, then do driver internal state cleanup, then power-cycle + firmware
reload (total ~1.3s) before the driver is usable again, and only then call
ieee80211_restart_hw(). For that whole window mac80211 doesn't know about the crash and
keeps pushing scan, connect, add_key, sta_state etc. into the driver that's tearing its
state down, which gets us NULL derefs rather than clean failures.

The trouble is I can't see a clean driver-only fix. The driver knows the device is gone at
crash-detect, but it has no way to tell mac80211 to hold off until it calls restart_hw().
in_reconfig would do exactly what I want, but it's only raised inside restart_hw(), which
is far too late for a device like this - by the time it goes up we've already taken the ops.

So the driver and mac80211 are out of sync for that window and I don't see a good hook to
close it today. I see two ways out and I'm not sure which you'd prefer:

1. Do the whole recovery inside the restart path, i.e. move the whole thing including
state reset, power cycle and firmware reload into the driver's .start() reached from
ieee80211_reconfig(). Then it all runs with the wiphy lock held and in_reconfig already
set, so the sync is free and no new API is needed. The downside is we'd be holding rtnl
for ~1.3s, which I don't think you'll like.

2. Let the driver raise the barrier early, right after crash is detected, e.g. split
ieee80211_restart_hw() into two parts behind separate APIs: the first stops queues and
sets in_reconfig, the second just queues the restart work. That way ath12k can do the
time-consuming part outside the rtnl lock while staying in sync with mac80211. This would
also need a few op entry points that don't currently check in_reconfig (the scan entry,
for one) to be filled in, otherwise raising it early doesn't actually fence those ops.

Does either of these look right to you, or is there a direction I'm missing?

