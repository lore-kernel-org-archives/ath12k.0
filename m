Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B372F9EDE0
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 14:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTItmSKJevrRTerdc3R+aPw8HIJ4fgrUwrhkwX2FGZY=; b=jpHB8Ma91oU72BUQZdduPo/ElV
	wK69XdcYMiffSFfJdIT+0wfndbIV8yLR8p8XHBSK3JsA1TFwL/kyoDwqWMNs0LQ3J/kay/JAW/hGs
	AfC7PtmgDvbJOdhMDw2OJtZ3vSGrU/Gx2LfWFcIh47/MTX7GfSm0zuKRlTJ+SZngs2Su8m2VuujeN
	9RPXYvbf8T6isFB/axFUCg7+W8ldTjDG2lhEaIRMZZhSVM/HcsQqX9TmV6/WPLNNKHgMV4zN1j8K/
	ziZHn8Xv5dq2VxvYSEamo2u4ljmVJQEA1LPqde6JxW6IY9esu/TLchNzDK/CT+a4MMDzweGIVaiuu
	KOLrUtlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYUJ-0000000AMZe-3yaC;
	Wed, 22 Apr 2026 14:23:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYUH-0000000AMYp-1VHK
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 14:23:34 +0000
Date: Wed, 22 Apr 2026 16:23:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776867806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MTItmSKJevrRTerdc3R+aPw8HIJ4fgrUwrhkwX2FGZY=;
	b=lU0NPNP6aEESM9TR50ruLBAEZtUW3RHIPtLcXUJ655A7Ejg7+fRht/IoERer53JDSpTgn/
	8ghN1wXmZ+rqg12RpwJD3g97Rw/tzUFjFjXj+yvopgMNh7Mhjqm5zdrzNDD0IsdaZEr46y
	Z8rGC1FS6pOIylUGg0r6xHJa5+MwKMQzNAssfzhFAdEDMopL9QS8JvndBE5SCs9jWBBTYm
	tNBG2rGnhhkZIvw/wj8dr6Qw5o8BusPhEN4NjXQTVSJmRFkA7LnN0Q0Tw3kJmT5QQv4kpz
	ps0SH4jyQy7/ZTNdWa2NgUE7FkRp8mAnAEDG9gaPWa3aJ+pqqjk/Edf5Vaevhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776867806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MTItmSKJevrRTerdc3R+aPw8HIJ4fgrUwrhkwX2FGZY=;
	b=czcPPctozdzNm3TMqVBPnWsUXaVlHnvFeJMr6JzTxw7xbAFL/Wmj5jBhWQ5DueUndR6bw4
	kT0JU1OkDMItRnAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Yu-Hsiang Tseng <asas1asas200@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2] wifi: ath12k: fix false positive RCU warnings on
 PREEMPT_RT
Message-ID: <20260422142325.Glnd_2Zc@linutronix.de>
References: <4cdf2e61-fe69-4168-9df7-55bb71585dfe@oss.qualcomm.com>
 <20260421172500.1050754-1-asas1asas200@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260421172500.1050754-1-asas1asas200@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_072333_559506_7AC999D6 
X-CRM114-Status: GOOD (  10.48  )
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

On 2026-04-22 01:25:00 [+0800], Yu-Hsiang Tseng wrote:
> Two functions in ath12k assert that the caller holds an RCU read lock:
> ath12k_mac_get_arvif() and ath12k_p2p_noa_update_vdev_iter(). Both use:
> 
>     WARN_ON(!rcu_read_lock_any_held());
> 
> On PREEMPT_RT kernels built with CONFIG_PROVE_RCU=n, this produces a
> false positive splat whenever these functions are invoked from paths
> that do hold the RCU read lock (e.g. firmware stats processing or
> mac80211 interface iteration).

It depends what RCU section is expected/ tested for. SMP+preempt can use
preemptible RCU which does not disable preemption either. So this is not
PREEMPT_RT specific. It would be PREEMPT_RT specific if the RCU section
is implied by NAPI processing to so.

> Root cause:
> 
>   - On !PROVE_RCU, rcu_read_lock_any_held() is a static inline that
>     returns !preemptible() as a proxy for "in an RCU read section".
> 
>   - On PREEMPT_RT, rcu_read_lock() does not disable preemption. A
>     task can therefore be preemptible while legitimately holding an
>     RCU read lock.

As elaborated above, this is not PREEMPT_RT specific but preemptible
TREE RCU.

>   - Callers such as ath12k_wmi_tlv_rssi_chain_parse() (via guard(rcu)())
>     and ieee80211_iterate_active_interfaces_atomic() do hold the RCU
>     read lock, so these warnings are incorrect.

If both this then use this then I guess something like
	lockdep_assert_in_rcu_read_lock()

is what you look for.

> Typical splat seen on a WCN7850 station with periodic fw stats
> processing:
> 
>   WARNING: drivers/net/wireless/ath/ath12k/mac.c:791 at
>     ath12k_mac_get_arvif+0x9e/0xd0 [ath12k]
>   Tainted: G W O 6.19.13-rt #1 PREEMPT_RT
>   Call Trace:
>    ath12k_wmi_tlv_rssi_chain_parse+0x69/0x170 [ath12k]
>    ath12k_wmi_tlv_iter+0x7f/0x120 [ath12k]
>    ath12k_wmi_tlv_fw_stats_parse+0x342/0x6b0 [ath12k]
>    ath12k_wmi_op_rx+0xe9e/0x3150 [ath12k]
>    ath12k_htc_rx_completion_handler+0x3df/0x5b0 [ath12k]
>    ath12k_ce_per_engine_service+0x325/0x3e0 [ath12k]
>    ath12k_pci_ce_workqueue+0x20/0x40 [ath12k]

If that is the call chain and there are no spinlocks involved then
PREEMPT+SMP+lockdep should trigger with this patch, too. The suggestion
above restricts this to lockdep only but your patch does so to.

Sebastian

