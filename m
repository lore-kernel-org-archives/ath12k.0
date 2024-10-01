Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF8FCF6491
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 06:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOBAMPE2E0L5e0qcPlmXJIO+UucSSed3hXNvGmWiPqs=; b=07UKVWt9zqDniriqlFlZvNUlQP
	2tz8o+gqdSMtgvBMcqzjr0xjRQr5/VzcXG4EtpdcCYQu9MNLwYodL648sQnsYbAf7BfDh00PtWuEB
	2dCUjtds0MAJNAT9Ky3vUjvSV/PeX6m0D6CW9jw4r00MnypSPHuRXeAXp1yoL6I7cjzZNCCpg0pT9
	RaXZtnWcACqSxy/Nh1bRTw4cw0r9kacx2Wlw5VNaOOaMDqc7KLoBV3GKmahLXENkYszj5Wd5oAYdN
	j3SKdfyRKW/Q9ut6P4qSlNHlHso0l7OexcbvcOrBLlVP6wj6SvcfMmS5T2gxCOyUPc0rwnc7fFnrp
	zBSOutnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svWUZ-00000001lud-2M6N
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 06:36:15 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svWQs-00000001lVj-2KoC
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 06:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=fOBAMPE2E0L5e0qcPlmXJIO+UucSSed3hXNvGmWiPqs=;
	t=1727764346; x=1728973946; b=YY1TI6NgnHaUHii0SjNd6DmlOy1T3WWGGe9zlBYAGtrTeSW
	RXxrGGnc2ksMJRKqrKjSUY3G3SlmnpyEuYZ/y4NJkp3kN67tA7mBWl43fTxXPGFy5eaa0MjkVgud4
	TCN1807vXzgR67XbGInj27rTKeR7TvgMb7Z6ez5sVkPnPVF0u3Bi76jTBgSTy2T3m/HJr5x1pDHqu
	dsUQA03zueec4vJ/yJjZeaZbj2OYt4eftrZiMLbyporqvHWQFKU6337MpdpnOC9PqIj2tFOy60k/P
	ihNzHhwHv2Gp75kUW6ja+iY4s8y8q1P1jInlQshvLA2ElLgGLjCiVXTKvs55deWg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1svWQp-0000000EdAy-2EKu;
	Tue, 01 Oct 2024 08:32:23 +0200
Message-ID: <06708838017266efd2351f0bda1bf01b0ee2bef9.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: fix assigning channel in activate links
From: Johannes Berg <johannes@sipsolutions.net>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Tue, 01 Oct 2024 08:32:22 +0200
In-Reply-To: <20241001041518.2236297-1-quic_adisi@quicinc.com>
References: <20241001041518.2236297-1-quic_adisi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_233226_620888_00EA44A8 
X-CRM114-Status: UNSURE (   6.69  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Tue, 2024-10-01 at 09:45 +0530, Aditya Kumar Singh wrote:
> The current flow in _ieee80211_set_active_links() does not align with the
> operational requirements of drivers that groups multiple hardware
> under a single wiphy.

Btw, given that, I'd argue it's not really "fix ..." right now, since
there's no such driver and no real bug? Dunno. But "fix" makes it sound
like there's a bugfix, and it isn't now, it's just preparing for future
ath12k compatibility.

johannes

