Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C05CE837A
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 06:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPR4N0J//5OXmR29nCGbEoccpWjo/sFzUSHK6PXL0V0=; b=hJ3/3GktrjV4MVIsg5kxUmsLGM
	6ki2lbI+EdbN1/6tDK2pQV9gW6nK4a3xhwoXRrLMAlSF8eVl2qkFhDi5AYlIV2BFWTipSi7u2u4U0
	OcQZociNmjJvHnaNf8qKQDGbvicZprkMecEbdBLLzpTJBTHRFpkzurD9BMx30dGk1dEUbnaJ8VZNk
	u9pjjCGjxp24Tdgs7XQH06yX28ovsG9a7nrt8cJ00GBGpKnZS+//4ZRzcodr8ov4ODIDwaIbP1otn
	4cuo5uSAhvPNyt8TgLe/XqCeFXQcOojATCccv2xY3tznSKGzvXQF+VTmtEfL6x4WPCD6FatuLSNR/
	1CuKJ7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svWUY-00000001ltx-1t7L
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 06:36:14 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svWPn-00000001lG0-06fS
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 06:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=bPR4N0J//5OXmR29nCGbEoccpWjo/sFzUSHK6PXL0V0=;
	t=1727764276; x=1728973876; b=uk/R4vUMBrnEtEFryvGFtKbm0TjZ9FrbW6F3ycVaDdE6G+4
	hGQ+n4x3qwz72Ptcl4504i4L8KNJxQ+VRHtWiFjiLhcybgwR86csbKhCDqXEOIKhOp1ECrapq3xoi
	7QYBVDakpaJJPv3pMGYI4kxjuATUMumVPZ7Y0jekaHz+A3Qb4NDoFeNAuYjh9Neehd6NWWQdqPbuZ
	IK0jvyn8Sj40Dcurt/4fRbWdMq6tgJ5fpKxcrn6yogJn5hr3Ho4aclY/atmQssCX5+o21NQZofeZk
	V9rbPyo44GTF3+cHiwkvbl2igFSgiRawYKGqMpzc+ccMGlCrWDtwCLKNOXFW+R7A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1svWPh-0000000Ed7L-0MFX;
	Tue, 01 Oct 2024 08:31:13 +0200
Message-ID: <0353d31db76afbd5d9bb2e7d42246ae3c8e14044.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: fix assigning channel in activate links
From: Johannes Berg <johannes@sipsolutions.net>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Tue, 01 Oct 2024 08:31:12 +0200
In-Reply-To: <20241001041518.2236297-1-quic_adisi@quicinc.com>
References: <20241001041518.2236297-1-quic_adisi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_233119_098380_D9D8B34A 
X-CRM114-Status: GOOD (  10.26  )
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


> +		/*
> +		 * inform about the link info changed parameters after all
> +		 * stations are also added
> +		 */

I don't understand that comment - you're not doing anything with the
stations here? And per the commit log it's explicitly _not_ after doing
the AP station. I'm not sure we should set up everything before the AP
station?

> +						  BSS_CHANGED_HE_BSS_COLOR);
> +
> +	}

You make it look like you just moved code but also snuck in a new blank
line :)

johannes

> +
>  	for_each_set_bit(link_id, &rem, IEEE80211_MLD_MAX_NUM_LINKS) {
>  		struct ieee80211_link_data *link;

I also think you put this code too early now - you're now first using
more channel contexts by way of _ieee80211_link_use_channel() before you
even release the ones from deactivated ("rem" bitmap in this code)
links. That doesn't seem like it could work correctly in general.

johannes

