Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D28C00528
	for <ath12k@archiver.kernel.org>; Thu,  3 Aug 2023 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Dm3CilZ7LzRzXKVhm/szyNaBlT5y51e3XmF8dMV1Zs=; b=mOx8anmnFwd6+H
	MPfZ8hbhIJoAutzLJUneCIiAWomfYDEvjK/vtEF70xoLveF3tMicJ03Vsj/dNAUTidzsqVsLbnPYD
	9Nkb76grrtLKThJhen/Aj3zS0nU0ffbaqRdCsuEagyCNDSHFhWvYUy3e8vtwouGd8HzADWgGTTcTg
	TmOxJ8GHNLfU3imoKWJMEPxVVXQKxhWNgplM74ZII2tYE8Zk8O7uS47QmNRxGot1/HA0XE6AwMULT
	aNlvEP16exSICQ0tlVC4XzLWq46EZu+ut0SW1JJxISgjBWHY2FkNKPZ6MH9rZjw9tnOo4wTl3vrzA
	VVkb6/fgdN1jU1mMvxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRVbf-007Myq-1A
	for ath12k@archiver.kernel.org;
	Thu, 03 Aug 2023 10:30:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUUz-007AnT-1v
	for ath12k@bombadil.infradead.org;
	Thu, 03 Aug 2023 09:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1cy4ZV0Bg5+4W3+7C2+dQUxkboIJPWTiw5dbOuYrQXw=; b=fIcxgC5+RksfOuENb6A0ARpE8e
	cfGtd4uP8ByXp96Rsh2SPeOESRwxyTSOpeEVH2vIEs9KaMD7+rEQWD22njHhRfaCvkQ/CWMTqZUng
	5EZVSkGF8mIt1UKenetam6DqLXNZr3YXLeUhCUyASURYqWdFunH0DTupitziNIGgLBKmXAFcMTpve
	7v8LqwdMZeXwh2v9Bp1ocX4S5+dq1LoLfVCB7WX45C86xOUP0/SbsdNbn/GLJY3luLowW7pSuHEhz
	chj2rFwKJPu8G2bCQ51aVH4VSCasOrtOvsvTse+q9oooSzsBVuZ2kQclb1oo9GdheVVnBjlFnVZSY
	iLb8P4KQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUUw-00GiDX-1C
	for ath12k@lists.infradead.org;
	Thu, 03 Aug 2023 09:20:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A0AFF61CDE;
	Thu,  3 Aug 2023 09:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8DCC433C8;
	Thu,  3 Aug 2023 09:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691054396;
	bh=ShL7hrHKNKPly01wi1qDkRUwsTVX6toD8afVDWIE21c=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=F/QQkStCbotVXmvBcxARavevCuFoNh97OEFhXYg1+xefLjNksaaz+8xtsjmOSNZaQ
	 bTkst+Qe9jqs1gtuU3AJZRn1EyJ3/D7VCe4RPaV1cYMq/DoXTdiooneCz30s/qOH0g
	 vYyf8QUfWll9pzdilBXYbWkOoWMU9EdSDOixnZ5KNEj4Sq65TkSg2wRkX+wpCLzh+o
	 jfmXvF0NThAVJ31CMwzov8JeOgU0faFeefGiDGS50AfuHhWA/xYq90UI5T53N2bNhY
	 Y5GdaG076u7hR7gIj9qmk66oj+l7N8r2thuZ7UuOqLSwawuU5uOKY5Nf7PFP+hKN4u
	 /mPwxK0OgeHfA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: avoid deadlock by change
 ieee80211_queue_work
 for regd_update_work
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230718024724.29120-1-quic_wgong@quicinc.com>
References: <20230718024724.29120-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169105439308.894438.14073090276070005288.kvalo@kernel.org>
Date: Thu,  3 Aug 2023 09:19:54 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_101958_758902_7DD56BC2 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> wrote:

> Deadlock is easily happened while shutdown wlan interface such as run
> "ifconfig wlan0 down".
> 
> The reason is because when ar->regd_update_work is ran, it will
> call wiphy_lock(ar->hw->wiphy) in function ath12k_regd_update() which
> is running in workqueue of ieee80211_local queued by ieee80211_queue_work().
> Another thread from "ifconfig wlan0 down" will also accuqire the lock
> by wiphy_lock(sdata->local->hw.wiphy) in function ieee80211_stop(), and
> then it call ieee80211_stop_device() to flush_workqueue(local->workqueue),
> this will wait the workqueue of ieee80211_local finished. Then deadlock
> will happen easily if the two thread run meanwhile.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

8198950ccb7d wifi: ath12k: avoid deadlock by change ieee80211_queue_work for regd_update_work

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230718024724.29120-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
