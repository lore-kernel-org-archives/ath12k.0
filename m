Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896D6C43458
	for <ath12k@archiver.kernel.org>; Fri,  3 Jul 2026 07:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxjMdu5JOVdPnBPpE21xEaCGzEk7c4qDGVEijzuquBs=; b=GK9E3O47NExaItEzuCXTrq8xZr
	n+9Tj8s5liLVqAtNjdl5dQHit9oAIbneqPJU7K7e28Oqr8wWSEg3Q+ER05Z++bubtZXzF5Tq6UaRO
	qL9tJbiZWKlEFHmPvPibEZs970dgWPneEwMBii8X7D29QaBbBykCMPxF8+QBq/2nMOq0H7GKmdoQd
	J8DRBd7Nfu8gBc4WREtoVKLjvSrB000nU3NuRqHiIN9W2gHmhk5W3UicAlhQr37KDArdPfo1PPAE5
	PasTkSYnpwvZvxeeeBgeQtYRrT9LnPpQgly4P4njwwmxvklp2+86RV9AjJgIDo9uoBVXAZuOspLQ3
	seGx7M6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfY7w-00000006GEt-1Ggd;
	Fri, 03 Jul 2026 07:15:56 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfY7u-00000006GDz-0Gk5
	for ath12k@lists.infradead.org;
	Fri, 03 Jul 2026 07:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=NxjMdu5JOVdPnBPpE21xEaCGzEk7c4qDGVEijzuquBs=;
	t=1783062953; x=1784272553; b=GFINnPsEmNOlMK4hdqQeWmqwcQ6V2Cf9Em187mHwRjkWeS3
	EpWVoJDm+IZWbH9sqCuLKnHYk7NqcoL17kdYIwhSjT/CpYBFfPZ0BPu6jrLhsHW98rdkQui4wwnXT
	GOisWoAO2GzrdzwErRFDT1u8+zJPJ4CzzjiYAyJHGhfzJVoDC+z93awobiyexjgztwm6RlWcU02PS
	G7mjD7UzEVce/sNnvOOAhYdyCtIrD+RR8mrlQMD/T0Z6R3eI3rfwA8YCWayKteBbofMpY6phROx5G
	AiZ/YC+AyOlTIJtZuxUoSHZnq3GA4X7edqq//luvdLSJs+HSEjnH3eufFyTb6XfQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wfY7j-0000000Eo7S-1sB2;
	Fri, 03 Jul 2026 09:15:43 +0200
Message-ID: <251c85cf04f523e6dba6c5e02e252ed6b83a930b.camel@sipsolutions.net>
Subject: Re: [PATCH v2 ath-current] wifi: ath12k: avoid flushing scan
 timeout under the wiphy lock
From: Johannes Berg <johannes@sipsolutions.net>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: Wen Gong <quic_wgong@quicinc.com>, Carl Huang
 <quic_cjhuang@quicinc.com>,  Karthikeyan Periyasamy
 <quic_periyasa@quicinc.com>, P Praneesh <quic_ppranees@quicinc.com>, Ramya
 Gnanasekar	 <quic_rgnanase@quicinc.com>, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Date: Fri, 03 Jul 2026 09:15:42 +0200
In-Reply-To: <20260703060219.2998148-1-runyu.xiao@seu.edu.cn>
References: <20260703060219.2998148-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_001554_391134_0C9C623A 
X-CRM114-Status: UNSURE (   7.59  )
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

On Fri, 2026-07-03 at 14:02 +0800, Runyu Xiao wrote:
>=20
> @@ -9975,6 +9974,15 @@ void ath12k_mac_op_stop(struct ieee80211_hw *hw, b=
ool suspend)
> =20
>  	lockdep_assert_wiphy(hw->wiphy);
> =20
> +	/*
> +	 * scan.timeout takes the wiphy lock before aborting the scan, so do
> +	 * not wait for it from the locked stop path below.
> +	 */
> +	wiphy_unlock(hw->wiphy);
>=20

No. Don't drop locks in the middle of someone else's (mac80211 here)
process.

If that work requires wiphy mutex anyway, better just convert it to a
wiphy work.

johannes

