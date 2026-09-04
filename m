Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BF5C624D3
	for <ath12k@archiver.kernel.org>; Fri,  4 Sep 2026 10:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohGWrXfHWMg4JgWw+mktaBplBpkoMMHgTBE4CxY0ANs=; b=eL4IWLbisHnzUs9udiIE7Fo4k+
	snFpPsbDqVQ/yC+cASKkUd/O33rsKWvSzlwPGjRBNWha6VDeMQOI2A7KJl9DZkgsVkaovouGYjy92
	QY+b59pKje/4TK1RG06rKdSXT10pJ0KMpMd7rpj08fo88I8Rja7rYoYBJdf+5VjEzRBr7SH0obDip
	ArPk/5XZkEbssQnAu0AOkMP8EYeLt3efoeSZJ21yPFLX08i4yA92t0OPmKr+rWTTMNbkODqRd/3Q5
	dPvfHIQ51TwobdMj/vdOhn9xJo0BM/rClqHN9oucarzxM+Ad1+HLae5a2MtP2DCpVdYlKxUfemP+o
	33+tYZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RJN-00000001hgV-3Ehu;
	Fri, 04 Sep 2026 10:38:21 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RJK-00000001he5-0ZfW
	for ath12k@lists.infradead.org;
	Fri, 04 Sep 2026 10:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ohGWrXfHWMg4JgWw+mktaBplBpkoMMHgTBE4CxY0ANs=;
	t=1788518298; x=1789727898; b=nmxFSkJPJXhbzUhXMbL0TB4jDwCX7be9k+YhWa+VaRsc1VZ
	4fV5pmuJFJe5vl3G9/0oBTZ5agRKmW1zNHKacIfvXd3uVGX7ZkkUymVcFVUfYLeE78cSFVubpRqMD
	Pe4fb3Hv1xO/N2b3DWnvnQU0kAz9g4GH2CSOGzV2fXT0pjVXa2UeEalOmXOZOnQeLzkHv0QgP6Req
	xXZ4pC6t0398/gGm5BPXDp5foa6JRTS0/oQ49DJcrHnPXEXC8YJi/5qQtdHXqhekPcL7ZSUMidQIo
	aOS8qzgGrr0u8ujDDQ/Nms6929jdB7HLAl8B3zhD7XkPWd6Kz55+CJFVlEOBNAdg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1x2RJD-00000001L0H-0AHO;
	Fri, 04 Sep 2026 12:38:11 +0200
Message-ID: <47c4ba195ae49552538ea65f4f13de7d3dced266.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next] wifi: mac80211: Report parent AP BSS
 parameters for AP_VLAN
From: Johannes Berg <johannes@sipsolutions.net>
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Ganesh Kariganuru Mahabalesh
	 <quic_gkarigan@quicinc.com>
Date: Fri, 04 Sep 2026 12:38:10 +0200
In-Reply-To: <20260820052426.3177309-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260820052426.3177309-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_033818_176764_CACDC4D7 
X-CRM114-Status: UNSURE (   8.85  )
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

On Thu, 2026-08-20 at 10:54 +0530, Aaradhana Sahu wrote:
>=20
> +struct ieee80211_bss_conf *
> +ieee80211_get_sdata_bss_conf(struct ieee80211_sub_if_data *sdata, int li=
nk_id)

not sure I think this function is all that useful, but

> +{
> +	struct ieee80211_sub_if_data *bss_sdata =3D sdata;
> +
> +	lockdep_assert_wiphy(sdata->local->hw.wiphy);
> +
> +	if (sdata->vif.type =3D=3D NL80211_IFTYPE_AP_VLAN) {
> +		if (!sdata->bss)
> +			return NULL;
> +
> +		bss_sdata =3D get_bss_sdata(sdata);
> +	}

at the very least that part is pointless, and should just be a
get_bss_sdata() call?

or are you saying you somehow found a VLAN existing with sdata->bss
being NULL?

johannes

