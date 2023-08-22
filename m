Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FA1EE4993
	for <ath12k@archiver.kernel.org>; Tue, 22 Aug 2023 11:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kj9Cx8xoUQJ7rRoSeZvSwie6H6z6MlE4B0gNG1zns6M=; b=HP2JxuO3Ai5+az
	eXoiJAUK64nSM0SkTVxjPJKFZqE7j+DDdQWugMmRJq4JPx5OWU6VpJV2KV9fToleENsZWuPrDAFGS
	cXqO1frig28xqlnBoHPWm4pyfMTrqJ9klQAVJsFFjW7bGaaTDZopvZdgLDeQdPjYU9ogcdo4Rxycq
	7aW6GJ6r4JTUPBXqNhsosxjxonUdCAIzsdsLZ9/aSeVHNkKe71T3VALTXXCWgFXyGJd4UBlnPBAtc
	eafs6NIsjCSbH4W28W6p+AO4Hml/tU3QL/wQhbdIVpVpDGHFTvVSDNFzemfV45DHxtGiCehv5KixM
	cvUtMjKw1XH3qC2xJ6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYPNF-00Fo7m-0K
	for ath12k@archiver.kernel.org;
	Tue, 22 Aug 2023 11:16:37 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYPNB-00Fo7O-2a
	for ath12k@lists.infradead.org;
	Tue, 22 Aug 2023 11:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=mkW7mf7IDVG5Od3Z5Q/f49ZooKwzTbwmE/yQzEcHPI8=;
	t=1692702989; x=1693912589; b=Vhj/qL0Uw3Lmj66cuRCvTnXeQZXsP594ADvTgClAClFo8ci
	A7Okv/H9ZWTkz2eNfw7bZufLaA1UxsPUys4mIhSQ5qiK6PTVnDsTkcNBI0Hm7iP9/B5hz+gEoisNc
	fPrRiENm+WjgMGs08R/diy/8WFGiBX9AgzoARMYtMUzg6iPSLnuloIBLXvJijCa/wkIFzQyfy08Ph
	6pNDSPYYFaNP4D4d/nzWifvUKuNmBntsY/+FqAqHXJkchvSrnqfqzASWdkS0KVJlbI2BxY+z5B2rM
	HPIMyoEKm+vMMkpiqYAtQepH9Ow/Sbl40hKxIaL3OuemJzas3K7FYwune4z1kppw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qYPN4-00536j-23;
	Tue, 22 Aug 2023 13:16:26 +0200
Message-ID: <c4d2c8987f929f29da96154e0fc6c9e94882310e.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: mac80211: fix cfg80211_bss always hold when
 assoc response fail for MLO connection
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 22 Aug 2023 13:16:25 +0200
In-Reply-To: <20230822100409.1242-1-quic_wgong@quicinc.com>
References: <20230822100409.1242-1-quic_wgong@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_041634_066190_D91C3FEE 
X-CRM114-Status: UNSURE (   9.36  )
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

On Tue, 2023-08-22 at 06:04 -0400, Wen Gong wrote:
> 
> It is 100% ratio to reproduce the issue with this change.
> Add "mgmt->u.assoc_resp.status_code = 1" in ieee80211_rx_mgmt_assoc_resp().

Don't think that adds any value, but I guess I can always remove it.

> +		/* use the addr of assoc_data link which is set in ieee80211_mgd_assoc() */

not sure that's so useful? but anyway

The reason I'm even writing this message is that you didn't think this
change through:

> -		const u8 *addr;
> +		u8 addr[ETH_ALEN] __aligned(2);

That has some other consequences you need to adapt to, in particular

                /* need to have local link addresses for MLO connections */

                WARN_ON(cr.ap_mld_addr && !cr.links[link_id].addr);

makes no sense anymore. Not sure if that's the only one.


johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
