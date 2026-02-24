Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B24F4BB82
	for <ath12k@archiver.kernel.org>; Tue, 24 Feb 2026 20:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SK2m0+BCqZK3Z0MefFDAaeio2GM2wmtU79nlwdyGEuo=; b=M9IXyZ9GFleFtXu46jprHYitPC
	9mYIxEOgl5VUqoRBhNip+Oq4GnJJXFrHlhdkaJGJa81LKTT5TwthXtWdadwI6l9kKposNvZrUhpXd
	yjqDf8r5XHOID4OodCDxpppCLN7kx+p0uIYBjwgoE7rY+fOetw+rUK5h6dmHLBmNB12+ctSPbnYDT
	7gyK5BYdyYR7dtZ9P30MgBvLDYyCrYFuAjXY0QrxNLFZJ5qKmyDt+Oe5tAS+PlDPzh3c2ELIg4Jij
	deiYZGVwxEw+Trl27JjgJubEYfsR+jWPz5PykQSQ7P1iDoe8jJZDAdZ123VWMg03MDMyafzuV1Lb/
	LMvQlgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuzJQ-00000002m8H-2hjC;
	Tue, 24 Feb 2026 20:47:20 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuzJN-00000002m7y-3UA1
	for ath12k@lists.infradead.org;
	Tue, 24 Feb 2026 20:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=SK2m0+BCqZK3Z0MefFDAaeio2GM2wmtU79nlwdyGEuo=;
	t=1771966037; x=1773175637; b=lVfAKoJRzidvvV40Nzbk6xV63X7I1WGN5m/H11pkCL5/atf
	FdSYZwN4kNB64V6u84Nxm8WL32dPJXMtxblYxlej7DAxRTb3wQrXoq7++f+YVjduBTzxqjjqPMbvq
	k6Sum3SBTW56J6fBe2fa6UQfiJb6KV1gfBAoH9r42Wx51IHCamLKazPbB2L9Oimq/uYYDJGxRrY6Z
	xxITU2R/H4DWtYbrUviVwdkXDJheuQTV+eWcW7l9SoKEjeRXTeD1uCtnf2cS5A8+TQGo/eRTsr2pd
	RNnq9Hmw/1s54ROELS9DziiUDUCQjD4XlB6AwH1vvYWqohvuylRHNaPH0c+JTwpg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vuzJJ-00000000fr0-2SY0;
	Tue, 24 Feb 2026 21:47:13 +0100
Message-ID: <0877db64cce68a9c206796da7261065d5785fca6.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 1/2] wifi: UHR: define DPS/DBE/P-EDCA
 elements and fix size parsing
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Tue, 24 Feb 2026 21:47:12 +0100
In-Reply-To: <20260217054731.3667600-2-karthikeyan.kathirvel@oss.qualcomm.com>
References: <20260217054731.3667600-1-karthikeyan.kathirvel@oss.qualcomm.com>
	 <20260217054731.3667600-2-karthikeyan.kathirvel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_124717_892126_1FC109BF 
X-CRM114-Status: UNSURE (   8.22  )
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

On Tue, 2026-02-17 at 11:17 +0530, Karthikeyan Kathirvel wrote:
>=20
> +/**
> + * struct ieee80211_uhr_dps_info - DPS operation information
> + *
> + * This structure is the "DPS Operation Parameter field" of "UHR
> + * Operation Element" fields as described in P802.11bn_D1.3
> + * subclause 9.4.1.87. See Figure 9-207u.
> + *
> + * Refer to IEEE80211_UHR_DPS*
> + * @dps_params:

I think it being in a DPS specific struct, we can drop the dps_ prefix
here?

> +/**
> + * struct ieee80211_uhr_dbe_info - DBE operation information
> + *
> + * This structure is the "DBE Operation Parameters field" of
> + * "UHR Operation Element" fields as described in P802.11bn_D1.3
> + * subclause 9.4.2.353. See Figure 9-aa6.
> + *
> + * Refer to IEEE80211_UHR_DBE_OPER*
> + * @dbe_params:

same here

> +/**
> + * struct ieee80211_uhr_p_edca_info - P-EDCA operation information
> + *
> + * This structure is the "P-EDCA Operation Parameters field" of
> + * "UHR Operation Element" fields as described in P802.11bn_D1.3
> + * subclause 9.4.2.353. See Figure 9-aa5.
> + *
> + * Refer to IEEE80211_UHR_P_EDCA*
> + * @p_edca_ec: The P-EDCA ECWmin, P-EDCA and ECWmax
> + *	fields indicate the CWmin and CWmax
> + *	value that are used by a P-EDCA STA during P-EDCA contention.
> + * @p_edca_params: The AIFSN field indicate the AIFSN value that are

and here

johannes

