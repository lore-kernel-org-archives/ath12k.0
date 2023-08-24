Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364D7C3DA6F
	for <ath12k@archiver.kernel.org>; Thu, 24 Aug 2023 07:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VMcB3WfnCItgXg4UgKr5roJMbO8Uf20aUjKKq8Dqbs=; b=iI6+ahVjEkhNA9
	vuK12SzS64ddtZHte7w6H/TBVj8r9dPGJYiL5wrAczbaw4WXC/ArnvVy1LnI3+KI1Z7SEsp7WPjNg
	+bIe80hBXA9nawRcaCD+jJmwDfETJJ0VshyfV1yiGIEzmlvhJdVu750nROF8DjsFyO7uN/1jTo98W
	gWOSX9B4J1gP+985VdpKvj3QhLjLg3fCLLuArP0C2rfPGKimR8R26/IFUFRSh+JT0ibT78DhiPJ/w
	T7tcv6/07Gk9YyD8sEvh+xXwKhbekAFADOo8LM+KwdA8PwR4ZS0gb2FPwHels2BynW+eBG/gonO5g
	9a8v3EYeYhbSIHcc8q2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ4N3-002N9a-2Z
	for ath12k@archiver.kernel.org;
	Thu, 24 Aug 2023 07:03:09 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ4N1-002N8l-1o
	for ath12k@lists.infradead.org;
	Thu, 24 Aug 2023 07:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=zALOp5VktsXUoujeClhjSu442pyiTs4hvdJBxkxufGw=;
	t=1692860587; x=1694070187; b=MYDpjWujCTvXCFaLjjwULAkLBOSIUgGCMewJhKhHmWYQpTt
	yi7JCROxNRnNNu2OLPVZ8W8Ju31Tc+uz8pkeDYP/Rwf8Xu743z3THiZ46p8Tcr42zNNbcCUAPdDTN
	Kjf3bXGvKBUyL2ZfhASVnlQghohP86/nER+blP7BnFhaPzuPlJCTf21do+k+GaD7ls5dhX8sNQLbT
	LzAMhl+QrafjgNAvu7xIgqDrhfZW1EO/756wl31HGtf1H8N4I85q8An9lwJyVyO2k9rQq/Ox+jB+1
	eEpqrv1GfsnKWSQR79R1nDPNTW0fpufwby3b6sWMWtKA1wKwid0c7Q5vkoVrKeUg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qZ4My-008ioQ-3C;
	Thu, 24 Aug 2023 09:03:05 +0200
Message-ID: <b050f2633da4a81ba7cd70ef58c8e95d011e840d.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: mac80211: fix cfg80211_bss always hold when
 assoc response fail for MLO connection
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 24 Aug 2023 09:03:04 +0200
In-Reply-To: <1a193edc-23a8-6631-5beb-2020de489934@quicinc.com>
References: <20230822100409.1242-1-quic_wgong@quicinc.com>
	 <c4d2c8987f929f29da96154e0fc6c9e94882310e.camel@sipsolutions.net>
	 <bcf65017-0dbc-e957-f382-98c6dc406346@quicinc.com>
	 <941b1bdb6852f20722fa3a5b01f546f054f9e8a8.camel@sipsolutions.net>
	 <1a193edc-23a8-6631-5beb-2020de489934@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_000307_604937_D4148E7F 
X-CRM114-Status: GOOD (  20.32  )
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

On Thu, 2023-08-24 at 10:26 +0800, Wen Gong wrote:
> On 8/23/2023 2:34 PM, Johannes Berg wrote:
> > On Wed, 2023-08-23 at 10:28 +0800, Wen Gong wrote:
> > > >                   /* need to have local link addresses for MLO connections */
> > > > 
> > > >                   WARN_ON(cr.ap_mld_addr && !cr.links[link_id].addr);
> > > > 
> > > > makes no sense anymore. Not sure if that's the only one.
> > > After this patch, the cr.links[link_id].addr will be a valid local link
> > > address from
> > > 
> > > struct cfg80211_rx_assoc_resp, so I think it is not needed remove now.
> > You don't understand.
> > 
> > The issue is that it's set the line above.
> > 
> > >                  cr.links[link_id].addr = data->links[link_id].addr;
> > >                  /* need to have local link addresses for MLO connections */
> > >                  WARN_ON(cr.ap_mld_addr && !cr.links[link_id].addr);
> > But look at that! What values can cr.links[link_id].addr get? Note how
> > it's a pointer - assigned from an array.
> 
> Oh, I know it now. the cr.links[link_id].addr will always NOT 0 because 
> it is pointer
> 
> to an array "u8 addr[ETH_ALEN]" of struct cfg80211_rx_assoc_resp.

Yep.

> So maybe we can choose one of the 2 things to do:
> 
> 1. remove the "WARN_ON(cr.ap_mld_addr && !cr.links[link_id].addr);"
> 
> 2. change like this:
> 
> WARN_ON(cr.ap_mld_addr && !is_valid_ether_addr(cr.links[link_id].addr));
> 

I think we should check that it's valid, because if you don't fill it,
it'll (hopefully) point to zeroed data somewhere.

johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
