Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C689AEE4993
	for <ath12k@archiver.kernel.org>; Mon, 21 Aug 2023 08:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvJrVXZbzWT89zMgIMXMw+y8JoM1eYoiDjUbO1PZ9jc=; b=ApwUsATKJ6rBn3
	qLBNZjXz36tTJKoyUuj2TWDK8UVdDNEpqoRAxbBSlw0xohXDX6nWSNuLahnq1ql+G/gQ/bh4u80PI
	1XCQySNjIQ/YOj2dWsY6yy01TESkjeNbzFBlvW5Y1WV6HKgYndl572KjqMe9X2UtOeaB2Q+AWVzjI
	FnGPV8swiH4Ff7d3/Zg/mWAdYgXTcRgHZYHntQfI8w07YSHrKWLrJHGoWmt7O7+9swSaqq0SseqtE
	2T3PXXqlrMTk0PEfrC+G7K8jPTJ795SRUYveV9sgrZ71MGJGkpfNp/+6fR/Reo/8UY+dijGiv/a54
	xT/DukiUhszXuBgCGC9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzr6-00DROg-1l
	for ath12k@archiver.kernel.org;
	Mon, 21 Aug 2023 08:01:44 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzr3-00DRO2-30
	for ath12k@lists.infradead.org;
	Mon, 21 Aug 2023 08:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=80azTiCRpTvKKCX7fWK8znRBwbAvsl/aHZiVJTGKhcY=;
	t=1692604901; x=1693814501; b=xZD3N8PrSTX38bqCObB+micBWytWBa8eTNvHkip7AMG4d8H
	HCZW8xHvWlkx1aNuMAX9MBhUmMa1aPpliFMlWdBovCotWhF1lhFUbrfSeyHuSiluuvNQq3MPeUj5J
	ZMHSfuyIAtq5XvSHdN95tBkpZYqhpQbJ1kQS9/lUxPywINETuYdgWMfmJ0aGkoMvcnq/FBn20P2EJ
	buqfmDuvyLrM9q387EMAwRg1O1/XYSlJ7i0udunjnDwbdzxh0rQHKAYc5H/syLuoSY1WdlJh47Ep9
	sn+hFeci7aslE/SC22oj62ZAIZfa+7isDlNrTp4BJL4na6XTM6KVU+SMrl6lvE5A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qXzr1-002s1d-2F;
	Mon, 21 Aug 2023 10:01:39 +0200
Message-ID: <cf1327bc62debc1772170b5f84ae09125bafa553.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: fix cfg80211_bss always hold when assoc
 response fail for MLO connection
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 21 Aug 2023 10:01:38 +0200
In-Reply-To: <0a264e30-af70-a6ff-eb2b-c3862540ee1b@quicinc.com>
References: <20230821061355.18168-1-quic_wgong@quicinc.com>
	 <5c072b0a45ad29dc03b989fbd9a9fd974ae0c23d.camel@sipsolutions.net>
	 <0a264e30-af70-a6ff-eb2b-c3862540ee1b@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_010141_979322_F3D8DF8C 
X-CRM114-Status: GOOD (  19.80  )
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

On Mon, 2023-08-21 at 15:48 +0800, Wen Gong wrote:
> On 8/21/2023 3:40 PM, Johannes Berg wrote:
> > On Mon, 2023-08-21 at 02:13 -0400, Wen Gong wrote:
> > > +++ b/net/mac80211/mlme.c
> > > @@ -5429,17 +5429,22 @@ static void ieee80211_rx_mgmt_assoc_resp(struct ieee80211_sub_if_data *sdata,
> > >   	for (link_id = 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS; link_id++) {
> > >   		struct ieee80211_link_data *link;
> > >   
> > > -		link = sdata_dereference(sdata->link[link_id], sdata);
> > > -		if (!link)
> > > -			continue;
> > > -
> > >   		if (!assoc_data->link[link_id].bss)
> > >   			continue;
> > >   
> > >   		resp.links[link_id].bss = assoc_data->link[link_id].bss;
> > > -		resp.links[link_id].addr = link->conf->addr;
> > >   		resp.links[link_id].status = assoc_data->link[link_id].status;
> > >   
> > > +		link = sdata_dereference(sdata->link[link_id], sdata);
> > > +
> > > +		if (!link) {
> > > +			/* use the addr of assoc_data link which is set in ieee80211_mgd_assoc() */
> > > +			resp.links[link_id].addr = assoc_data->link[link_id].addr;
> > As I mentioned before, this cannot be done - it introduces use-after-
> > free since assoc_data is freed after the loop, and the
> > cfg80211_rx_assoc_resp() is after that.
> 
> So I want to change the "const u8 *addr" to "u8 addr[ETH_ALEN] 
> __aligned(2);" of struct
> 
> cfg80211_rx_assoc_resp and copy the value, then no use-after-free, is it OK?

Yeah I guess that works too.

> 
> > > +			continue;
> > > +		}
> > > +
> > > +		resp.links[link_id].addr = link->conf->addr;
> > > 
> > Also, I don't see that we need to use two different assignments for the
> > two cases.
> Then I will change to both use "assoc_data->link[link_id].addr", is it OK?

Sure

johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
