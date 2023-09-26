Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB06E7D271
	for <ath12k@archiver.kernel.org>; Tue, 26 Sep 2023 09:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGXJO+8wd1vzhWWVGLs6fbj+BQQ+EWP3X3gLmIrF1FQ=; b=yPUdWodV35ozgj
	lgBs1dt/uOJA4IWT/lDTwMPGKjx7s/zKTfDmD8qhRL4pHNoX1Usepkst9L5HKHk13/Q5aA2h5MNLf
	UhwzMIR3eLVxM4eu+YsUvKBEqmtk0z4DiQ3S48L4B/ECXVlkIVN0tUMSo1G8U7UKAJuedfVugMPSJ
	S2auIP0YVpArx+J+YDiqEIvI6lsZm64/QTVtq5d9OMARX8Qz3uw4hBdkb356aQIm2UjfDntvFcAm/
	2XPf4I/RwfI0/x/4tfhqkgGzjeKSRCz3IywC5Wh0a9CiJ+qRKAu6uOdFufELazy4wLVu+FqcFyxuy
	hgHxf3MFNh7+DXLVVo0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4dR-00Fzpo-2w
	for ath12k@archiver.kernel.org;
	Tue, 26 Sep 2023 09:45:41 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4dP-00FzpN-2o
	for ath12k@lists.infradead.org;
	Tue, 26 Sep 2023 09:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=cKtdQqDRUJj7y/VLgZzxcJrmVo/eQVJf4ZnkNLE6taM=;
	t=1695721539; x=1696931139; b=XxeUoZIgl//ZrPvKlQre7YCPLQfVTwmhT6MZmynywarQMB5
	pBFMEJrpIt4X5YyfyFX1w1iiuaIPQenSJhC1vXzClS3PnSAhtzpSHPikaXU/k+nXssW7Yq/p8xeHP
	qVRuDkwSz2geox9UWkDXmxoEHiZsq/fAGKxWJ1z6fxvKydg9AgSiLX5n6QpYYW3DoHUcnAkhrAFir
	wSYLn5UIVlFCfUpakn/2uq7ND5mZXjOuX7+BuCJH5VGfuT+6GldY+cNlc3AdCPB0ils0CmHTBX49n
	W6NVLNDt84wO2qmNPvHk7YFseAq34hmM7JjIn8jFDq4s1TeY7DmQTfrvmRdNhXzg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ql4dN-005Rpq-16;
	Tue, 26 Sep 2023 11:45:37 +0200
Message-ID: <4dac29f3844309fb62afe6acd4c4ebd379b0a194.camel@sipsolutions.net>
Subject: Re: [PATCH 1/3] wifi: mac80211: add support to allow driver to
 generate local link address for station
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 26 Sep 2023 11:45:36 +0200
In-Reply-To: <d23b617e-5ca0-e721-0c2a-fcca8942efef@quicinc.com>
References: <20230906103458.24092-1-quic_wgong@quicinc.com>
	 <20230906103458.24092-2-quic_wgong@quicinc.com>
	 <cd762f33b1c15566237c85f1e265ee8a00006f5c.camel@sipsolutions.net>
	 <d23b617e-5ca0-e721-0c2a-fcca8942efef@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_024539_910624_6F723E48 
X-CRM114-Status: GOOD (  18.70  )
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

On Fri, 2023-09-15 at 16:11 +0800, Wen Gong wrote:
> On 9/13/2023 4:55 PM, Johannes Berg wrote:
> > On Wed, 2023-09-06 at 06:34 -0400, Wen Gong wrote:
> [...]
> > Maybe after all this explanation, all we need is a flag "reuse MLD
> > address for assoc link"?
> 
> yes. It is similar as I said before here:
> 
> https://lore.kernel.org/linux-wireless/b9c6d022-12c3-a696-c4b9-cb14a6d30a45@quicinc.com/
> 
> > 
> > 
> > > +		ret = drv_generate_link_addr(sdata->local, sdata,
> > > +					     link_id, link->conf->addr);
> > > +		if (ret)
> > > +			eth_random_addr(link->conf->addr);
> > should probably refactor this into a separate function though.
> OK.
> > 
> > I'm also not sure how the driver even knows that a link it's being asked
> > to get the address for *is* the assoc link? Do you want to rely on that
> > being the first address handed out?
> Current I used (vif->valid_links==0) check for assoc link. When
> drv_generate_link_addr() called for the assoc link, vif->valid_links
> is 0, and it is not 0 for other links.

That seems a bit questionable?

Well then again, what do you want for AP mode? Anyway you can still
distinguish, and if we later need to change an internal API that's not
the end of the world either ...

So OK, I guess we can live with this, just would like to see it wrapped
up into a single function.

johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
