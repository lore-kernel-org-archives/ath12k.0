Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445CDC433FE
	for <ath12k@archiver.kernel.org>; Tue, 18 Oct 2022 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3fvyYPH/OM5KjlvHyXFdNWdOrwFRjggtGkx7n4PMvs=; b=OBA++1OLUL35W6
	LfyHuqIZKQBvdNwFr2GbJJ9RGFju+xBce13tgxvI33KIumC8DpHe3Y7nLxay/B/HBNPSKTPMeVHdM
	dNmziU9qFER5lsk6EtHP0udIRUyH0dvWBWKQOfWTRRxkbeEthJSxnaK2YJAQJW/Te1J4G15wvpPrZ
	7tvp8aHLotJGU0Xah9oYFzlPxoecFvSOpL98OlKurQy3UeC28Fb2pu7NE8gkhf+eCay4KLuSN4GHK
	BtCQJPz6TMCrxNTXpS0iAkd+kCee7i4YS4e0UkblMpk43KtF/aYK1u6uyaLqLWhjzNtm1RsUhxrF+
	8LaRxJHbz/Hv2HqViFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiIy-004UdD-NU
	for ath12k@archiver.kernel.org; Tue, 18 Oct 2022 08:50:32 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiIu-004UN1-Op; Tue, 18 Oct 2022 08:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=iczZLwrjd7qnO0JGrmafBUJ/nSM8K8ORSyalNpGMBFs=;
	t=1666083023; x=1667292623; b=bHm7nDwH6bZpKkUHtyg838gR5J2BECtc/0EPyaIh0u19+ZL
	PiLTNjLoKiTqaw1SMN9MjSj7P9JMov0jLneOEfI13evIBVArG/TImh8sj8z/dWkFGA3T7NPG1Zgfr
	6s4dtaKNrJp/VOYP15P4K2Yy776UFRmzzlKMXZ+G/8i16WRzb7UI6ed5yFIzQndnJ1DCYvZKacKPu
	oA5V2Lb7I3R8KDvmg2QdPH57oOiRWQHHQUY8hGCQnyUWeP6mRCPs2vyaNokSI3DxAEex3zxV+OUji
	/up4c2XjUMR3OmJHi63omCsZwVZecsuR4N3CRuQkqUWoOvWWyacbZpYI+F/wxzfg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1okiIe-00A6BU-0z;
	Tue, 18 Oct 2022 10:50:12 +0200
Message-ID: <3483d05c1d5a39b9243b54d9f28450344a897655.camel@sipsolutions.net>
Subject: Re: [PATCH 01/15] mac80211: split bss_info_changed method
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org
Date: Tue, 18 Oct 2022 10:50:11 +0200
In-Reply-To: <c38b4da8-488b-2d09-631a-1bb6c07440a6@quicinc.com>
References: <20220601073958.8345-1-johannes@sipsolutions.net>
	 <20220601093922.347d47c279fe.I15937cfe8405999084f164ddf57390f8b8d2bc61@changeid>
	 <c38b4da8-488b-2d09-631a-1bb6c07440a6@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_015028_837028_EF257459 
X-CRM114-Status: GOOD (  13.42  )
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

On Tue, 2022-10-18 at 16:47 +0800, Wen Gong wrote:
> 
> > +	if (changed & ~BSS_CHANGED_VIF_CFG_FLAGS) {
> > +		/* FIXME: should be for each link */
> > +		trace_drv_link_info_changed(local, sdata, 0, changed);
> > +		if (local->ops->link_info_changed)
> > +			local->ops->link_info_changed(&local->hw, &sdata->vif,
> > +						      0, changed);
> 
> I think you/someone will change here later for the "/* FIXME: should be 
> for each link */", right?

Maybe. I'm not actually sure it's really needed, it depends how we use
this in the future.

> It lead error/kernel crash as below while reconfig single MLO link which 
> link id is 2.
> When test with single MLO link which link id is 0, not found 
> error/kernel crash.

I'm not surprised, I just worked on fixing reconfig in the last few
days, will post it after some more review/testing.

So I think that might not need changes *here*, but rather a proper FW
restart. Which I haven't tested in AP mode though -- was the crash in AP
mode?

johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
