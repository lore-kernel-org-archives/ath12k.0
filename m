Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF27C54E64
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XoiwOMA8e8KHXegBzR80/tUvb/4hIiUPb1QIhySE8xE=; b=pBdfzXgfUUfc7O6ViUilrNj/h2
	9X04z+2lpKEKe/BzMKMrmAI8Wnm4Jgk3lpYVBj2lSSkaczESbr9FGy+Ffo+YjNPxaGddoQ/Qv/foR
	q1y6gb/JQw6LDlwWv+e8brsiXmPSdD//nj/m5yVUEccXA1ERWiS5lIt00LPbvQFXfC9PPUCjHRjk0
	xNcDczNuihRjGuzonlL6lPJKzuXe2S4nv8YVVn1/KWwCuL5BTGOngyXwozrc+lbFGT0f1jdzgWbAk
	vau7PbN3nCJ2YXvrwzgXv6ESNcV3joEEF+KCl9nZmY+yNt9jhoikeefeoOheuAPDINShxrdKbGdGZ
	g+EAWi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqwz-0000000EMnW-2abC
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 14:41:53 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqww-0000000EMmx-0fdf
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 14:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=XoiwOMA8e8KHXegBzR80/tUvb/4hIiUPb1QIhySE8xE=;
	t=1711636909; x=1712846509; b=phlF6k+BQYO1diHO9idTl5acaXrqZN0UiKlJzl3iLj3/OJQ
	iWv361WRXoPqfgaier35m7uPl7hL3Yxapu70iK4EOpIrulZpwq5kp62b0x21+4M7Fi+OSQPHl1nMb
	aHkZvr1ExOWGXxCtmcAujGItgCyuN80bu0Rujk8NpLkuM7Hz/D4Czj28VZDxOPRTmAlokEUL8tqgY
	DuMR8d67u1NBvAl5UDy5zmiYycAfWgi6lUtUrhruM9dQKImEER6kSmwFjScvvfbqs/9nj0FcWNlhs
	xzQSArVOlmxbePft9AHOLIu05n/M6IGwF2LXNC8XrFznzSWLC1vLSpMBon2E4GwA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rpqwt-000000013Nt-1qr0;
	Thu, 28 Mar 2024 15:41:47 +0100
Message-ID: <ca70eeb3cdee1e8c3caee69db595bc8160eb4115.camel@sipsolutions.net>
Subject: Re: [PATCH 11/13] wifi: mac80211: Add multi-hardware support in the
 iface comb helper
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan
	 <quic_vthiagar@quicinc.com>
Date: Thu, 28 Mar 2024 15:41:46 +0100
In-Reply-To: <20240328072916.1164195-12-quic_periyasa@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-12-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_074150_223806_059085C1 
X-CRM114-Status: GOOD (  15.32  )
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

On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
> From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
>=20
> Currently, iface combination param supports single physical hardware.
> To support multi physical hardware, add hardware specific checks on the
> channel context creation and populate hardware specific parameters from
> the channel definition for which the interface combination need to check.

I haven't gone through this patch in detail, but again like on patch 9,
I'm not so sure about the implementation of the XOR behaviour of
checking global and per-HW limitations.

I probably wrote on the other patch that it seems it should check both,
but I realize now that doesn't make sense: After all, the top-level
combinations data must encode something that's supported _regardless_ of
channels, so likely only a subset of the combinations supported across
the different HW.

But that doesn't mean that I'm yet convinced that the design in patch 9
is actually good, with how it checks that depending on the 'chandef'
parameter. I'd like to explore other possibilities such as a different
function for that, for example. It could use the same underlying helpers
and mechanics, but it seems that might be better overall.

Or probably better yet: explore an approach where mac80211 doesn't even
have to _know_ about the cfg80211_get_hw_idx_by_chan() and all that, but
just prepares the information in a way that encodes enough data to
handle that, which really means going from

 int num_different_channels;
 int iftype_num[...];

to

 struct {
   enum nl80211_iftype iftype;
   u32 freq;
 } interfaces[];

or something like that.


I was almost going to write "links" instead of "interfaces" there, which
reminds me that none of this really even works well for MLO yet. Not
sure if that's better addressed as a separate first step?

johannes

