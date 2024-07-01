Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FD4C30659
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 12:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfKHlJRFYAEBrpxDl9CAmo33xozCnPkEDxyFrV/CVMQ=; b=XY7OFTwuMx0CTLgPugSSv7uWeO
	bRIPsVKbiz320lmlWfjzf0li8YHrZf1xIhzsRuJb1d+C2yPKy49J5R3yGkMZEgQpq3HUm7ay88hmd
	3YGlc+RJaBVKTQ+wu6XwlDj4AhYGDv8a9CcI+tYIQobVqmiXCaHE/44dk/y0A/gh4P6uapFSRIw8Z
	AR8xXa5qtXpQO3QW5e8RX3A3WKg2QBwse/mune3s9tKDC2A6s0PIZNr2HV/+jiWv4hW3EcBng4/Q2
	tquHqfeRrCDAJUsPUqNgGSrR0Td8vf/RjJY+Srubt+WIys4/mH2uU7sqcIj6MvphXVLe/2orhIXFE
	fVy3cchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGFo-00000003FZc-3ukq
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 12:35:32 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFkL-0000000310p-0fhb
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 12:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=QfKHlJRFYAEBrpxDl9CAmo33xozCnPkEDxyFrV/CVMQ=;
	t=1719835378; x=1721044978; b=SN/zTMUJ1LXtxcRt4cQ+sNXaR4LdXC/11OHqx+yxoBs/LIt
	QNv+tGt94qoPafHkueTOIzI90S56CWUOsqmB+ss5j1p0eV4j6uNW/+vUT4bfqw80g3s5EU9v3NvWo
	a+utwRE5z9PiearzvZ3bMNoyothODienXu7RgtZ2tA9YIifZ6fmvJE1GQ5sH0cdUc5lJyXl2hQTGV
	a8/Ru9J7+aPirzlySVzdepifDjMAKqOpy6kPHLQnj5HHCPKL0py/wkzw9Glp0x7q2y+rE9urhf1Wu
	NWHQSa9m7nPywu/KGAAaQ47TBKEGEAxffp78DCyR7TFoebimFShYkFqGPMNeq1Ww==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sOFkF-000000025rN-1cua;
	Mon, 01 Jul 2024 14:02:55 +0200
Message-ID: <36437e815634609f8319a2be1094a19bea3ff2fd.camel@sipsolutions.net>
Subject: Re: [PATCH v2 02/10] wifi: cfg80211: add support for advertising
 multiple radios belonging to a wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Cc: quic_adisi@quicinc.com, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org
Date: Mon, 01 Jul 2024 14:02:54 +0200
In-Reply-To: <52f91e3121547ec50a9ea1fa1b7f395a96da52df.1719733819.git-series.nbd@nbd.name>
References: <cover.692a4cf1c6bce46eadecbcbf0f3e9e599099f8c4.1719733819.git-series.nbd@nbd.name>
	 <52f91e3121547ec50a9ea1fa1b7f395a96da52df.1719733819.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_050301_472964_AFD94C76 
X-CRM114-Status: UNSURE (   5.75  )
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

On Sun, 2024-06-30 at 09:50 +0200, Felix Fietkau wrote:
>=20
> +	int n_radio;
> +	const struct wiphy_radio *radio __counted_by(n_radio);

As you also found out, I realized this cannot work ... Sorry for
misleading you on this.

> + * @NL80211_WIPHY_RADIO_FREQ_ATTR_START: Frequency range start
> + * @NL80211_WIPHY_RADIO_FREQ_ATTR_END: Frequency range end

This should also document their type (u32) and unit (kHz), please.

johannes

