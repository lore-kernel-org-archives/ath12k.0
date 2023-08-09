Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2902EB64DD
	for <ath12k@archiver.kernel.org>; Wed,  9 Aug 2023 12:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDYIFta2lAtMF5ai2tyUPnl04XhYTD4vobnKLSZAaVU=; b=mBZT15yhnWZfok
	FNI1ctXtujV4wpqGXnwY4wTPj857i8KH+wYzJEI3KPtLPbNkZrwlJEqM6ycmpIuucDdSawxRIFmL8
	GA3sFvTUr//s/HC6OyQuYsPZKfZcGelBAKZqb4Zt5TlT2f7rPN3EZBUB6ZEP6pM6d8kxFe4afSCoY
	3PH2219MdEq3034g4b9Q0F1gZ6ja+KgtZ2A7vPDP4EF2qghER20ksDWwFLe21mpPQ+DThgn010oR+
	RcrU7rHe3SPhOclgzGo4v/vNdY+CTS34ri0erLMwpoiMu+rDWrTUciy2SEsb1Dm/HzagiIv0p68xg
	4oTWyzWI1vp/pdH4D5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTi8k-004sRj-1J
	for ath12k@archiver.kernel.org;
	Wed, 09 Aug 2023 12:18:14 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTi8i-004sQy-03
	for ath12k@lists.infradead.org;
	Wed, 09 Aug 2023 12:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=DQLHThCaayDo78KE2Hy9nCESygQGK76URhOSoh3WTjc=;
	t=1691583491; x=1692793091; b=nHH1O4hf8jvZDAXvWWvvWK0M6Xyc2B5T0Q9DL+qvuRZ3UcY
	1VUAVy0tn6/rN29itsoVrvBfTOMAP5eEkV27/xETmmDmbOdy8RXL4FHCvb9xjPMtv/YzQECIBqLT6
	InWgbKwEvN19fESwMI2i9WMB6O5Nz1/5EJKV4r7NVsrvivbTX7rJvxs6D2lDIh8/GcVMasq9lf5N4
	fdvaxSlGTPlcL++55zn18OW2OO7ma2hZCWDXmThvsA3G2KmKTIXK0qVFMAQvPWE97lFWPjlqGoA/m
	TUcJbS5mrAOoU1r9RxePYqlomo8tzqle9pSIY21FIgE11RUIMsBgQ4T2yDg6y+Dg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qTi8f-00Ecco-1U;
	Wed, 09 Aug 2023 14:18:09 +0200
Message-ID: <7b27fa9f59bec600069bba9c2acd9f28dd753923.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] wifi: ath12k: fix undefined behavior with __fls in
 dp
From: Johannes Berg <johannes@sipsolutions.net>
To: Harshitha Prem <quic_hprem@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 09 Aug 2023 14:18:08 +0200
In-Reply-To: <5cabcc57acd781e90c35fcc9b3c6a8aa8fbaa581.camel@sipsolutions.net>
References: <20230809042738.13394-1-quic_hprem@quicinc.com>
	 <20230809042738.13394-3-quic_hprem@quicinc.com>
	 <5cabcc57acd781e90c35fcc9b3c6a8aa8fbaa581.camel@sipsolutions.net>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_051812_061626_28743F31 
X-CRM114-Status: GOOD (  12.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Wed, 2023-08-09 at 14:17 +0200, Johannes Berg wrote:
> On Wed, 2023-08-09 at 09:57 +0530, Harshitha Prem wrote:
> > 
> > During the crash, the fragment id of that packet was 0 and
> > __fls returned a junk value. Hence, it was identified that "__fls"
> > would have an undefined behavior if the argument is passed as "0".
> > Therefore, add changes to handle the same.
> 
> Umm. That makes it sound like you are surprised by this behaviour of
> __fls() and expected something else?! Please go read the documentation,
> and then rewrite the commit message. You really shouldn't be surprised
> by this.
> 

Also, btw, "Fixes:" tags would be nice for fixes. I'm sure Kalle has
brought that up a million times before ;)

johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
