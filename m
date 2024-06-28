Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08926C2BBCA
	for <ath12k@archiver.kernel.org>; Fri, 28 Jun 2024 08:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Y6J2zFonVb2ahpnlDNbtHbab3n2SI+dOEprUvkblMk=; b=c/uVcLOaWzPx5RpTyUPLdyqooQ
	R0C2I0VbR0epctF9AtiefNGDqpg3aWvUWcnZci6UnAmJ5xUwMafxjGCzkJU6wAs/g1s793BeGgqfF
	ZebdaKxasliX9YxJMAukXDDoi9OAr9BvVyRI0fbxQ/HMp+HMXA1xzD75RifzFN2noX6YYSXZzbNSh
	4gKXX8a4PfZ0Ycuw6kGV3x6kEs7OP2p0FB0++SiVgF0c1CmaDh9OX80R+TzKUbcB3uxmHop/lv+v/
	ocxFoVIDmGb5kPnTaaEeK4wkKOfKQMgDP2Z8EKohRqZr6LWnq5ZSkueJlyCyrC7cEqUstKJmM2r6L
	OtIcUpug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6uJ-0000000D3kW-2p9W
	for ath12k@archiver.kernel.org;
	Fri, 28 Jun 2024 08:24:35 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6uG-0000000D3j9-3s1d
	for ath12k@lists.infradead.org;
	Fri, 28 Jun 2024 08:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=3Y6J2zFonVb2ahpnlDNbtHbab3n2SI+dOEprUvkblMk=;
	t=1719563072; x=1720772672; b=HNBz/wVLcsAKmAMJQOrmsZhnsVCl4+N6aYl49duercsMAZs
	wvfH7iH901AJ1oEBVZ22J3dntT4Kcq2Iquf/9sbpqYAseRJBYdqVPn0ZERO7mk7vDfOmBIiRuxqZM
	JOWLc/sYgTNSRwuaCQGs4h+dPEteqyJevS4BQeyk3GczpgomDKUd6p4lABI31/NsBMxYNdC+oJLss
	F6f/vhR+lbBM07s617EDFUG8i8BS7srq3/rr1QAgVyD0d4O4R/x7tCZ1c/B+vlEu68pFZQKx+Q8qt
	s5TdYWp3WflTQZ4e2/QJZoRY/T/qlZdO0DoJa56AH1VXG9ZgSnSOi3rO09/ES93A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sN6uE-00000009W5N-1Qb2;
	Fri, 28 Jun 2024 10:24:30 +0200
Message-ID: <2c456cc91911cf1def96aa4378b70b001eda1c78.camel@sipsolutions.net>
Subject: Re: [PATCH 10/10] wifi: mac80211_hwsim: add support for multi-radio
 wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Cc: quic_adisi@quicinc.com, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org
Date: Fri, 28 Jun 2024 10:24:29 +0200
In-Reply-To: <b2f7aea3341e8610880e46d91e984a6e2c14b3f3.1718881762.git-series.nbd@nbd.name>
References: <cover.a7730420cfba0f204a60e4c30e6b0e07b441ff6b.1718881762.git-series.nbd@nbd.name>
	 <b2f7aea3341e8610880e46d91e984a6e2c14b3f3.1718881762.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_012432_978309_8B07B372 
X-CRM114-Status: UNSURE (   7.91  )
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

On Thu, 2024-06-20 at 13:11 +0200, Felix Fietkau wrote:
>=20
> + * @HWSIM_ATTR_MULTI_RADIO: register multiple wiphy radios (one per band=
).
> + *	Number of supported channels for the phy will be per radio.
>=20

This should document that it's a flag.

Also, you didn't add a policy entry in hwsim_genl_policy[]. It may have
worked anyway because that policy doesn't have a .strict_start_type in
[0], so please add that as well and set it to this new attribute.

johannes

