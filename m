Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5576CC982ED
	for <ath12k@archiver.kernel.org>; Mon, 21 Sep 2026 11:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYeJW5bTcHcFyRqoD8LOZOnJMT3bFUMUhzn24qlPg2Y=; b=sa3dntDELZHtXulPk3Vo0fvQos
	XW5vUZIA/Yu5LRQn0bAzY6QN6wnEELWx14eVvEWcELp+0Wq4MtKe1bTfJba3HkDeSthVtT9LnwHcm
	gsYQ+HN4m1+fBuh2qs7BhBJ3Hfll8HzXTDIod7Tb4ZWpb/EFoq8CxgLjLbTXDEcr4p/xoVHiI/wvq
	FLDptbuepnkUxieAl8iX5x1/MBEkAKSDF9amS7b86nLHiFGLvVbhbCqt3Q2TJO455CKfF2s/l/y0l
	kzIcmHAgCEevxCnAJhzapcjL4tMxTymAzTxEJsOtJbd8mVMyMdBWnrE750Fqj57LpkMVbG/50npnY
	nA23nM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cYo-00000001yKv-2dAw;
	Mon, 21 Sep 2026 11:51:50 +0000
Received: from s3.sipsolutions.net ([168.119.38.16] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cYl-00000001yJE-3Rrj
	for ath12k@lists.infradead.org;
	Mon, 21 Sep 2026 11:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=PYeJW5bTcHcFyRqoD8LOZOnJMT3bFUMUhzn24qlPg2Y=;
	t=1789991507; x=1791201107; b=LudeHORO3fz+gwtiRqPpFvtG87JspnRgmxLrE9l1eCLa5kH
	dNzuxzwz48dFik3K2idVSE+yNWnEFXPatgWMdIFSsChuCfXr3pNplO0oNjd/RcuM/uYdSTu25oaIE
	x6Hm0fd+d5eX+UHT18kdbgE814wlKIeuZu/iX7J3OqxFRdxhIrpV/nmvI4Ig5IURp3VVf8lSMFYI+
	sMfRKUf5p2msK8NkzEYxy71l1y/yGDfiyg7U47+cvi9yBKAVfphMtsaAZ/KO3sqf7o19KqRQRM/dV
	G3B/KWfOwbzZVsQQOoGcqpAm6SC6PFhFi9vvbUVbE6GfB8VSLG9KJ3KtUOVMhMEg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1x8cYf-00000005n3v-1GiB;
	Mon, 21 Sep 2026 13:51:41 +0200
Message-ID: <48ebf25d157b8c12dff724fb1f6a97a0b45849e0.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v2] wifi: mac80211: Report parent AP BSS
 parameters for AP_VLAN
From: Johannes Berg <johannes@sipsolutions.net>
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Ganesh Kariganuru Mahabalesh
	 <quic_gkarigan@quicinc.com>
Date: Mon, 21 Sep 2026 13:51:40 +0200
In-Reply-To: <20260915052923.3300269-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260915052923.3300269-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_045147_860188_AE36546E 
X-CRM114-Status: GOOD (  12.95  )
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

On Tue, 2026-09-15 at 10:59 +0530, Aaradhana Sahu wrote:
> AP_VLAN interfaces do not maintain independent BSS configuration.
> When station information is reported for a 4-address station, BSS
> parameters are read from the AP_VLAN interface, causing beacon interval,
> DTIM period and BSS capability flags to be reported incorrectly.
>=20
> Read the BSS configuration from the parent AP when populating station
> information for AP_VLAN interfaces. This ensures that beacon interval,
> DTIM period, CTS protection, short preamble and short slot time reflect
> the parent AP configuration for both legacy and MLO station dumps.
>=20
> For MLO, the per-link BSS configuration is used so that CTS protection,
> short preamble and short slot time reflect the configuration of the
> corresponding parent AP link.
>=20
> Only advertise NL80211_STA_INFO_BSS_PARAM when a valid BSS
> configuration is available. This avoids reporting zero-valued BSS
> parameters when corresponding BSS configuration is unavailable.

So ... I guess I can't disagree with that - but is it worth reporting
any of these parameters at all? They're entirely under control of
hostapd, so it already _knows_ - is there a separate tool that really
needs to get them via the station info?

I'd be tempted to just _remove_ these on the AP side rather than making
the code more complex to report them correctly, in particular since
basically nobody could actually be using them right now since they're
just broken ...

johannes

