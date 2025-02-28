Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04EDC19776
	for <ath12k@archiver.kernel.org>; Fri, 28 Feb 2025 13:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lg5hPU/uY1qyK3mZY+dAoRZXvu9zhz0vOaPCxWh92mU=; b=BOjpSqCosXtoya9G9LU3i2zLs+
	0ZM712F1FEnO2YysLkGKP5dIspEO6d7tqDprhU6XqhdXZvjbIMkP4vwr9c/uaCCP6hnt20+ywl1b3
	QvSD+h9eAml4TWDx9s3aWX8JpEPMaGAw5FHz33p4dWTB+mW72vuLeGzzUhsDp7pH3Vaixoiix0kka
	I6p5dEahorXzNvYfdgStWV5lu3tGWxS8xNSudHdkH4k7DgAxEquIsirpxojxgdKrtB++nJtOAzvk5
	5mQghlbIUsSPyXYb1mRmqdxWS737I3Ogop+BxjbHcqd6c5tEEzLugXZpu/Z7aZbMXTlazqLSorptB
	AD0AmN7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0gU-0000000B7H4-1vHI
	for ath12k@archiver.kernel.org;
	Fri, 28 Feb 2025 13:45:46 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to0ff-0000000B76n-0gTC;
	Fri, 28 Feb 2025 13:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=lg5hPU/uY1qyK3mZY+dAoRZXvu9zhz0vOaPCxWh92mU=;
	t=1740750294; x=1741959894; b=VuvkT1BHus4dPbXmaFlunuqdoSutOZi59cGDW5BrhmduOPJ
	zELUMo8hImBT7SUVYRG/5vdD5Al8PwQcIgsWlDNm8Y0Md2/J+KF0UoAqNbwp9E/t3twuI0083Yk1r
	S2DP4UZxP1KbHprodHDKcH4Pv9lPwxNdyyxZFvjLG5jvXNxGeuNZm7wuzSes4xaF/yfOWi4SS/JHl
	qsRBvUhMSqOeo5HweX5W5ZgWU4Q7ZjdS/IGxL6WY320lWMmlClCZPiTm3MLroZMJ7nOqAFWZpTFJv
	V5r29unQlrJxeEbc2hA8X/WtGcT+jVsatyB6DC0lah1NdKTj4U0hp1XNiyGqVXDg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1to0fb-0000000Dm6H-228K;
	Fri, 28 Feb 2025 14:44:51 +0100
Message-ID: <e38f01b2fe15902770cc11de24e82fcfed1aad5d.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/3] wifi: mac80211: restructure tx profile retrieval
 for MLO MBSSID
From: Johannes Berg <johannes@sipsolutions.net>
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>, Muna
 Sinada	 <muna.sinada@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:44:48 +0100
In-Reply-To: <20250213225036.3118133-3-aloka.dixit@oss.qualcomm.com>
References: <20250213225036.3118133-1-aloka.dixit@oss.qualcomm.com>
	 <20250213225036.3118133-3-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_054455_200071_87D92930 
X-CRM114-Status: UNSURE (   9.65  )
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

On Thu, 2025-02-13 at 14:50 -0800, Aloka Dixit wrote:
> From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
>=20
> For MBSSID, each vif (struct ieee80211_vif) stores another vif
> pointer for the transmitting profile of MBSSID set. This won't
> suffice for MLO as there may be multiple links, each of which can
> be part of different MBSSID sets. Hence the information needs to
> be stored per-link. Additionally, the transmitted profile itself
> may be part of an MLD hence storing vif will not suffice either.
> Fix MLO by storing an instance of struct ieee80211_bss_conf
> for each link.
>=20
> Modify following operations to reflect the above structure updates:
> - channel switch completion
> - BSS color change completion
> - Removing nontransmitted links in ieee80211_stop_mbssid()
> - drivers retrieving the transmitted link for beacon templates.
>=20
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.co=
m>
> Co-developed-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
> Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
> Co-developed-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c         | 20 +++--
>  drivers/net/wireless/ath/ath12k/mac.c         | 33 ++++++---

This probably shouldn't come with so many driver changes in the first
place, but in any case the changes don't apply on my tree.

johannes


