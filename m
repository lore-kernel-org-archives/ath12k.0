Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BD9CA5511
	for <ath12k@archiver.kernel.org>; Wed, 13 Sep 2023 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+eAfWN99ts6eqBj9urQZ2VYu3yWIa1yRls/XZlmVnA=; b=EJWX1We8PBfoh8
	N1uqxJO+YSMP34kz4Bm/VzPpP7toPcpSB8T/oXetNk5nH40riQrm7IKZcf84qm82Uvyi9KPs8pyZL
	/wtHItpFoXVMpMp7kQRSMBnleVLMpmNDaBxVhSwQZ4hOPO5AtcsrmQ6639mdRhjpgG4xhaWd0AkKK
	RZ06O/KIPfu58zwRYnNiQWBYBVDQm7o417qOinuRgML/HIFE8Daf7d8XsksuBXDWMAYdSrWz5AJvy
	B7J6nVNKZOxkwKOv2230GhZk8/AWqZ8etagQ8cX+CvVtQ42Ogz/gjIrPCieGQ9FKrKOUlPiOUZsC8
	h5yzmjH1XycUMMC7idLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLnW-005ESZ-36
	for ath12k@archiver.kernel.org;
	Wed, 13 Sep 2023 09:04:34 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLnT-005ERB-0j
	for ath12k@lists.infradead.org;
	Wed, 13 Sep 2023 09:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+2hcaoJP5aajGwDX7qpJONypAVfCQ/NTzjrYDO0mpow=;
	t=1694595870; x=1695805470; b=wjQpnmZurpx30IuveGcYNNpuWXj64VsfzLQjwhMXUz9vtcj
	dx4mIvgiVrCxB8PA9ZvBJ/3FJ9wuFYwNquZ6hgkMwH1lcU8/tQtXQ7hZF3I2yte2kbjwZ3ov8iZJx
	9znX0u2YU71sYUM3zN+MzlHrqsWKl4D05MsDkk6dEIBXic7xUMAsBHWIQm8kl0Dki2+oMUo0LWD4L
	ahPFEZ7vJ+GxEPOs4LjjZveq9oc5k8oHxsH3Nsqyi78fawa0ie0Okk23tQ7cXLBaI1MrxJdCxUJq7
	v6nBw/l7xX5htPJGfqfvirORdNSz8fmo8LxeR9Y5H8KeYGVBcFvQ77YuStT5Mmbg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qgLnP-00EiA6-2u;
	Wed, 13 Sep 2023 11:04:28 +0200
Message-ID: <e6ea3009c489fae910adbf2e1c766f2d827f287f.camel@sipsolutions.net>
Subject: Re: [PATCH 3/3] wifi: mac80211: update link RX NSS by
 ieee80211_sta_set_rx_nss() in ieee80211_assoc_config_link()
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 13 Sep 2023 11:04:26 +0200
In-Reply-To: <20230906103458.24092-4-quic_wgong@quicinc.com>
References: <20230906103458.24092-1-quic_wgong@quicinc.com>
	 <20230906103458.24092-4-quic_wgong@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_020431_597249_07648E2D 
X-CRM114-Status: GOOD (  14.31  )
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

On Wed, 2023-09-06 at 06:34 -0400, Wen Gong wrote:
> Currently for MLO connection, only deflink's rx_nss is set to correct
> value. The others links' rx_nss of struct ieee80211_link_sta is
> value 0 in ieee80211_set_associated(), because they are not pass into
> ieee80211_sta_set_rx_nss() in mac80211 except the deflink in
> rate_control_rate_init(). This leads driver get NSS = 0 for other links.
> Add the ieee80211_sta_set_rx_nss() in ieee80211_assoc_config_link(),
> then the other links' rx_nss will be set to the correct value.

This is pretty much true, but I also think it's problematic the way you
phrase it. Software rate control is pretty much, at least currently,
_not_ supported for MLO (and I don't really see how to support it, if
firmware picks the link to transmit on, as it probably should).

Thus, I'm not even sure we should be calling rate_control_rate_init().
Clearly we do today, but it's also obviously wrong for everything except
the call to ieee80211_sta_set_rx_nss().

So while I agree that there's a problem with the RX NSS, I disagree that
this patch is the right way to fix it. Yes, it also fairly obviously
fixes the problem, but it just makes an existing design problem worse.

Please change change the overall design here so that
ieee80211_sta_set_rx_nss() isn't related to rate control at all.

johannes


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
