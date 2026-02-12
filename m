Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D0CEEA846
	for <ath12k@archiver.kernel.org>; Thu, 12 Feb 2026 18:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dx2mtJ96lcO8Kk0cam68h5su84uGUvdZpDSVC6n0Ca4=; b=4xUNQnLAfF3UjuHJJnAV/6xEDF
	N9DB+6+vH6B1uR6LpWHgSOjYJSfzii3FQnScSBh+dGQMmb1GNJXDYJ0ViWwMYA7qD0nB0/HUNPoZv
	keQh+RvbEyS6/vB0RUj3WLPwbyEqCOFt0W+l5WTFEyZHSRkfviqgWYFSgrIp1ZHWB+ohroXGgYYL9
	fl79RAzAkPnjzryw0m1WZM0KZMcbdhLYqXp/2opvg/aP8weJWV2YHbGtDsg6iVszkejiyrEyn+3e1
	eotmuLYf9o1YGKMhNz66lKab1ClPC5AXkQ9iSg1v5QspoWqEpMnc95EpuCpsx1LfY6ikpOZIQyP2h
	zBRpWsKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbRZ-00000002VsC-1Ct6;
	Thu, 12 Feb 2026 18:29:37 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbRX-00000002Vrb-1yte
	for ath12k@lists.infradead.org;
	Thu, 12 Feb 2026 18:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Dx2mtJ96lcO8Kk0cam68h5su84uGUvdZpDSVC6n0Ca4=;
	t=1770920975; x=1772130575; b=gLTzeIKwsg0CtfsIRv0W8jX3CAvE3NXr9eceMDMfeTD5FAB
	jBiidQVUy5H3gjdgUgIHRY45qK60QaU8wyMpGU+6MO7BDR2SNXcO+dUii0JnDtwu1lG3A2exk+sB/
	SyhEaDQk8FKSduM8N9lpbO7pZS5tZ8hXs6DJW+zYONIjEJSAJvsDpKab444HQOzmL9+hNSVrx//UK
	T6sH3VE2CyFB5JICKmlWUkyDfn35ZfBpdHP7uOVM/3+GD8u/o6di9aGMpKJ+v+q+BipZXlqaQ6Y8S
	BsZk+PJ/b1aDjMn/t482PZocV4mxHEItmH3p6xR7L8Ui+UIsTvfpTKRffdYLqAAw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vqbRT-00000006UcP-19cl;
	Thu, 12 Feb 2026 19:29:31 +0100
Message-ID: <bb793bdd1875840315ff92dbff3675117bf06842.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v2 00/02] wifi: ieee80211/mac80211: Add
 UHR (802.11bn) Capability and Operation parsing helpers
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Thu, 12 Feb 2026 19:29:30 +0100
In-Reply-To: <6e9ff54e-dc83-46ad-8415-5c950d6c4444@oss.qualcomm.com>
References: <20260212172401.234059-1-karthikeyan.kathirvel@oss.qualcomm.com>
	 <c9353b48d4efdcdfcd46553e83a8131869c08b49.camel@sipsolutions.net>
	 <6e9ff54e-dc83-46ad-8415-5c950d6c4444@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_102935_530061_6CC4E965 
X-CRM114-Status: GOOD (  12.31  )
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

On Thu, 2026-02-12 at 23:13 +0530, Karthikeyan Kathirvel wrote:
>=20
> On 2/12/2026 11:06 PM, Johannes Berg wrote:
> > On Thu, 2026-02-12 at 22:53 +0530, Karthikeyan Kathirvel wrote:
> > > This series covers support for UHR capability and operation (11bn)
> > > parsing helpers for DPS/DBE/P-EDCA, and adds mac80211 hwsim changes.
> > >=20
> > > The code changes are based on the IEEE 802.11bn Draft P802.11bn/D1.3.
> > > There may be changes in the code to adopt upcoming 11bn spec changes.
> >=20
> > Indeed. I hear Qualcomm prefers 8 bits for the NPCA primary channel
> > rather than the 4 bits for the NPCA primary channel (offset) ;-)
> >=20
> Okay, I might missed any other thread if this is discussed, let me check

No no, that was a discussion with the spec folks!

johannes

