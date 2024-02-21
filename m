Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9856FC5475B
	for <ath12k@archiver.kernel.org>; Wed, 21 Feb 2024 07:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sF9o3elfGpYyxXaiq0z8GaPKdgyUIJ9WycY8zrb5ZgE=; b=GBw6Mo/he/2aFihflTRbpHfrci
	W5vf9+2WifRNcayZLvBJJODCVk3TlAjvvjziD7rReHEBwSgmKHgWSVQ3byHcHzC2pZifhazJ8fLce
	W2Xkytm9gjzUc1N+SBoEY6joKkqB87+Kf4LKLPs36z2yRertjqfgwtsBmglwAHovXbd8DqoffKXSz
	Ky8nnlXCPk/OQ7W5UKNTRbp9gy5n1OouwQ/S1Z6JtVmOWMcU2tcIgEJNe7SNt/Pms+0hzcAA2SQHR
	hI+2XOx/d0zuAXypFzuX3/nbVE+IO6bbEw10o0drkNZNQ/t8oZOD67ojpNq4UQOBATZliymJVPCLM
	b4bwq/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcgcN-0000000HPHT-0fun
	for ath12k@archiver.kernel.org;
	Wed, 21 Feb 2024 07:02:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcgcJ-0000000HPGr-2dp2;
	Wed, 21 Feb 2024 07:02:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B6D3613B3;
	Wed, 21 Feb 2024 07:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59807C433C7;
	Wed, 21 Feb 2024 07:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708498926;
	bh=imE1InGWhuxyDV8awU8NRAVI0mbmH2dm2WDFGZ70w7s=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=MgGLGNyDF8Ne1CoXb79zoyrkEID8wqrq/s8mZFFrOum0Y2E1XLZv/Gd+suSuBK1+B
	 Yt3/zJpvEmwvsVWSt4/I/xnYj50MAX/KG4E+MyNgIooFolFVoeEkRAbj9sKumtoXke
	 WYSPJf4BV/ExWHO+FPh7d6rr0DtdikMRPCcj5U9fxhqcB3/oBIYWoojU0Crj6ID39F
	 hZu0wEs3KOyeJLDjXhG1tqQG8ZpdrgPz1e+E9GbwJCplKU0X119Wk8KRAErzDDuCsh
	 yHJHhtXrQ/9pmm/Fss57fzntxurjn514vsRfQspAvzQrpxbHX+Ug65neQONPAKTlFs
	 9MTltPrAY8hZg==
From: Kalle Valo <kvalo@kernel.org>
To: "Nicolas Escande" <nico.escande@gmail.com>
Cc: <ath11k@lists.infradead.org>,  <ath12k@lists.infradead.org>
Subject: Re: ath12k & ath11k beacon miss detection
References: <CZA2NS7J83D4.18SU6W9R96KPY@gmail.com>
Date: Wed, 21 Feb 2024 09:02:03 +0200
In-Reply-To: <CZA2NS7J83D4.18SU6W9R96KPY@gmail.com> (Nicolas Escande's message
	of "Tue, 20 Feb 2024 18:11:37 +0100")
Message-ID: <87a5nub8r8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_230207_743094_97AF2AFB 
X-CRM114-Status: GOOD (  17.19  )
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

"Nicolas Escande" <nico.escande@gmail.com> writes:

> Hi there,
>
> I found that when using QCN9274 iun station mode, we never get disconnected from
> the AP even if it stops beaconning. Using iw I can see the "inactive time"
> increasing without supplicant ever getting a beacon miss event.
>
>>From what I gathered, given we set the flag CONNECTION_MONITOR using
> ieee80211_hw_set in __ath12k_mac_register (mac.c) we should detect the
> connection loss and call ieee80211_connection_loss() at some point. Right now,
> there is no such mecanism in ath12k.
>
> So looking at ath11k code I found out that in that driver we have a specific
> WMI event "WMI_ROAM_EVENTID" that can report a WMI_ROAM_REASON_BEACON_MISS that
> in turn ends up calling ieee80211_beacon_loss after some time.
>
> But trying ath11k & qcn9074 in station mode yielded the same result, we never
> get the roam event and never get disconnected either.
>
> So going back to ath10k this time, the code isn't exactly the same but even then
> we had the same wmi event, with the same WMI_ROAM_REASON_BEACON_MISS and we'd
> call ath10k_mac_handle_beacon_miss which in turn ends up calling
> ieee80211_beacon_loss via a work item.
>
> And using ath10k on qca9888 works well for me.
>
> So I have a few questions:
>   - is this supposed to work on ath11k ? Does it not work for me specifically
>     because of my chipset ?

Just a generic comment: QCN9074 and QCN9274 chipsets are designed for AP
use cases and their firmware tends to be lacking on station mode
features.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

