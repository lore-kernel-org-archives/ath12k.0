Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99874C43458
	for <ath12k@archiver.kernel.org>; Thu,  2 Jul 2026 08:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDQz+NYkTBHSULK0tw+Mm8elpzXTkLrFpJWp8OOPxRk=; b=cz24T15ivzVW1SM4tfhG95+22o
	8eiFNebKumhPA/K/6d65Jk/SypZFapw71qqSm/+R8QXz8Q5Avo4iHXmb3kM6flgGsn5b3z2xeDkxu
	r9PpyBBCAa+r8rTnUAnemvViWDTDHuPLHA/sO8o1Cyd1W0jhMuSh83cqRGFYkr24svbn+FbE5IJdn
	VPq4xBQqO48QXe0zYxpa4q27jEXk2N/oO30EZSUAW1eo8wGht/kTcxNJGS/pX+dRx1oqsprQZ7vUW
	5R/DJZns6nwxnRCE6DjUhgM53uoQYl4eYa39DSuQCDBeb7aKGi/5MOQ9+dpPecDr3xxo04dDBZRFb
	dN1YXrDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfClc-00000003rbp-3iNT;
	Thu, 02 Jul 2026 08:27:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCla-00000003rbB-38wd
	for ath12k@lists.infradead.org;
	Thu, 02 Jul 2026 08:27:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA07C60120;
	Thu,  2 Jul 2026 08:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851061F000E9;
	Thu,  2 Jul 2026 08:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782980845;
	bh=vDQz+NYkTBHSULK0tw+Mm8elpzXTkLrFpJWp8OOPxRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hkYJjHheBiigSCIoxAnmBnm2Bv2li9Wt0V/580iIt97g+Qrcrl/x51jeXGSSBer4N
	 G8ZKzu71v+Ztthqr3JIPrs2YJj9D7qbkxUzhIYzarWZPgQiaBamvYPihvcQtIxaDpa
	 rnh9tbuT81gfZDB+QWm7HZ6b2Fuj1Iqs6AZ2ft+3KAfMwrBosipBQB9reYyIz+THZV
	 YRpOs2QdLr7ugW9crkovYbsPxYd+v1B0mMjw/cdJOcm71xTzmDe2rETZdLIqtOprgQ
	 538oSgv1t2IdpzYrb02oFqE2FPspC5qTTb4RIneR8kbqhk8V8dooW047Fjf+FmWdPW
	 ZbW0tPAXYrQRQ==
Date: Thu, 2 Jul 2026 10:27:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Andrew LaMarche <andrewjlamarche@gmail.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH] dt-bindings: wireless: ath12k: allow calibration variant
 for WCN7850
Message-ID: <20260702-beneficial-hopeful-binturong-a0bee9@quoll>
References: <20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com>
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

On Wed, Jul 01, 2026 at 05:42:24PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> qcom,calibration-variant selects board-specific calibration data for
> systems where the bus and device IDs are not unique.
> 
> This is not specific to WSI-capable QCN9274 devices. The WSI binding
> already allows the property, so allow it in the WCN7850 PCI binding too.

Why? You need to provide reasons WHY do we want this.

> 
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Where is any user of this?

Best regards,
Krzysztof


