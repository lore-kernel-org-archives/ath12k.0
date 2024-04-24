Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C5BC07E8E
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 07:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XX5ZBXN6Sz9rNOKRXlE1sizd9rwXNODWEDVONeQGMr8=; b=OxeTkt0SEiVabOZlifwARpRcAS
	6zJhbZuKJ3/npNIX+JPncR4pl3t3zP++qksCxtKZvMXKNbSUHOrhx2PlK8Cou0Jeq3wLPfMnit2vz
	XA4tgcFOHi7w2a9Qhn3iB8EN7sn4YWy0RbdbnPYMedE7jKULCnQsEo+58IH+8/fcYc5+X1mGRQpz7
	y5gaO46qaEUsJnTBAuBa8kK1K8UVoi3nroVkT19pj4hyvpFAguBXn8Ob1xMfwAVG9u9mF5F+PN7tN
	iPQ3gQzS8V9dGvQ6UR9Ds6sRw5ZXmf4/l48HJbXFS9JQVDlv7e+sC38OgrJKjxLFwRMUcebULjgGd
	xkFR7uQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzX3P-000000036g1-0oiF
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 07:28:31 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzX3L-000000036cv-0Gc4
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 07:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=XX5ZBXN6Sz9rNOKRXlE1sizd9rwXNODWEDVONeQGMr8=;
	t=1713943705; x=1715153305; b=EsF3t9XJCEnVy9N3RUhnN56pUAgB38FnJNQu8VcvVgqiwiv
	8EtsdTdrIYgGzjyi+Q7A+ce2+5zysPa9TqoZMsRDWYpCIS6m+o1WOze/Osix3F2DM/j/32BarEAbv
	TqPi0fd09Q93l2ZI7IX6YPslUxRosYbmkozTcd+XX6S/kjGOcukksh+BEThvBSE4ibIqIpnFtNd3I
	j/mqS+WNFxdd9L8iseDx5f6oxWxT2SvQXUzB+g7dX+slxU5fshy1v1OgL5yIW+6g6xbgUWL0NSZkG
	hkOHHtGwGt/ASlp86w1BXeOqW9Xy1VzSapTlCkqLk90FWs0NbwltZgPywzkPvRhg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rzX3F-00000003PGm-3UIo;
	Wed, 24 Apr 2024 09:28:22 +0200
Message-ID: <517caf852d37b3803bcf087a6b575f2ecdb5ba10.camel@sipsolutions.net>
Subject: Re: [PATCH v2 3/3] wifi: ath12k: Add lock to protect the hardware
 state
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 24 Apr 2024 09:28:20 +0200
In-Reply-To: <20240424065646.1666166-4-quic_periyasa@quicinc.com>
References: <20240424065646.1666166-1-quic_periyasa@quicinc.com>
	 <20240424065646.1666166-4-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_002827_439968_54E21931 
X-CRM114-Status: UNSURE (   8.53  )
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

On Wed, 2024-04-24 at 12:26 +0530, Karthikeyan Periyasamy wrote:
> Currently, hardware state is not protected across the reconfigure
> operations. However, in single wiphy models, multiple radio/links is
> exposed as a MAC hardware (ieee80211_hw) through the driver hardware
> abstraction (ath12k_hw) layer. In such scenario, we need to protect
> hardware state across the multiple radio/link at the driver hardware
> abstraction (ath12k_hw) layer. Therefore, introduce a new mutex in
> the ath12k_hw layer.
>=20

It's your driver, but ... it would seem _simpler_ to do locking across
the hw with a single wiphy model, because everything (except currently
for ath12k_core_reset and ath12k_core_restart) already holds the wiphy
mutex. You can probably move those to wiphy work.

I'd avoid doing lock explosion like we had in mac80211, it's going to
come back and bite you eventually :)

johannes

