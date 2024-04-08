Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D05CD1292
	for <ath12k@archiver.kernel.org>; Mon,  8 Apr 2024 08:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLgfYQ5s9rsrrIhibvCgUcqNuuLWPWgk8CaFmWUfAJs=; b=aBE08aJ6ROyRq6HGuMzjkEp1QJ
	VdKZdXJmfrAl5L+jyH8IlCO+4c/Jhf4+MOYvg0SLM8wFlEnwmq2YGIls4q3Ejw0kfFgmkVBChhVxC
	SzwqKnAFmWJ6d1EGT9c/DTiMlogna7vDA9FwCZVZoQcUnmrRtvOMJl7MZbOK9ES3Dawmf4v3KTDwm
	nT+DhCNI3u79icpp1vSxIebNysFhUXArRqHtxv48tD6YKlhecaMDhWzYsJvhbemt4ZVmpjgCVvdQd
	FyVrSBBIHgr4Kx3A930+hF3QbsAYv3VeHBvojdLFJlDMJq6yATl9dTlAXhACLKjQx8JBew3j9HuAV
	eNaUxN6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtk3g-0000000EpcJ-24ah
	for ath12k@archiver.kernel.org;
	Mon, 08 Apr 2024 08:08:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtk3Y-0000000EpXb-3QfZ
	for ath12k@lists.infradead.org;
	Mon, 08 Apr 2024 08:08:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7791ACE0E3E;
	Mon,  8 Apr 2024 08:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF95EC43394;
	Mon,  8 Apr 2024 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712563721;
	bh=V7M4y7XTf0T0833wa2t0Wn+YNRY8QpVFJNT3MF0ol+k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pcmSnrVLK+yGCkqXOWSkW8nwTCPlgKpd2f6QdN/h+9429QjQQy9xwiEklsdWWIHnE
	 DkS0y15OT7O9gkcioL8ANUEmlQxu9p8agompzM7FbmqLPT3R+k9gHOcCajHLF5xRxN
	 FFyaDzY04ZwhTPYL7MkFthx+amL3SNTmjn2dXLeGD9QoVEyaCMNxUexc2HSpTZCwiQ
	 7NxZnPtNNGnbMTbXm94YQHnH/kRCOIAXjmlD66dPq7l8p2FPuuzcgXnIMXj6fOT/uP
	 653C/vhK+Plddj4WkgGw2jXyjUwUGi65EnLn+Q9Uhz6X8fjOJvLir9v6G1X9S9paXd
	 V4IPGmM79N8kw==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Gregoire Stein <gregoire.s93@live.fr>,  <ath12k@lists.infradead.org>
Subject: Re: WCN7850 disconnects and reconnects in a loop
References: <adf6e7df-11c7-4692-ab8d-d53eb5675045@quicinc.com>
	<AS8P190MB12056A9DFE1C0A1C6BB12EBB873C2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
	<73d44b87-57d1-4737-b6ff-c312a6b64852@quicinc.com>
Date: Mon, 08 Apr 2024 11:08:38 +0300
In-Reply-To: <73d44b87-57d1-4737-b6ff-c312a6b64852@quicinc.com> (Baochen
	Qiang's message of "Mon, 8 Apr 2024 14:09:58 +0800")
Message-ID: <87ttkc1dkp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_010845_158632_52AB4AD6 
X-CRM114-Status: GOOD (  15.66  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 4/4/2024 11:41 PM, Gregoire Stein wrote:
>> Hello,
>> now i'm on the last commit of master-pending
>> (6.9.0-rc2-wt-ath-1-mainline-g853450ce5ca0)
>> here are the various logs you asked for:
>> https://gist.github.com/GreyXor/927e7871e70630beabb522aeddc5891e
>
> Thanks for the logs.
>
> From dmesg and NetworkManager logs, connection and EAPOL frames are
> good, but DHCP transaction fails. IWD logs show 'Del Station' event
> received after EAPOL is done. So guessing 3rd party triggers 'Del
> Station' due to some unkown reasons (DHCP session failed?).
>
> In order to know who triggers 'Del Station', could you help reproduce
> this issue and collect mac80211/cfg80211 trace?
>
> Below steps for your consideration:
>
> 1. enable tracing on mac80211/cfg80211
> 	# echo 1 > /sys/kernel/debug/tracing/events/cfg80211/enable
> 	# echo 1 > /sys/kernel/debug/tracing/events/mac80211/enable

This is just a suggestion but it might be helpful to include also driver
and wpasupplicant traces to the same file. For example, here's what we
documented for ath10k:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/debug#tracing

>> There are iwd, networkmanager and dmesg
>> iwd is launched with -d and the ath12k module with the debug flag
>> thanks
>> 
> And one more question, is this issue specific to AP? could you try
> other APs or could you try other client with this same AP? We can do
> comparison to narrow down.

Another things to try narrow down the problem is manually running
wpasupplicant. And also using manual IPs (no DHCP at all) or just use
'iw connect' without encryption.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

