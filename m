Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327E9E7D271
	for <ath12k@archiver.kernel.org>; Tue, 26 Sep 2023 09:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OS4Me0WcJMxfho7g28yNKgOKpuk8XTts4vy6vpEObkU=; b=bBbbNg/iTA+zK5
	JmIaDubq79kErq5oNcPjP1kTOUeLplRHp01Muv/NB6Nd7oMbr8u3BqPOUdbjakuhlEEIb2uKZQ/7l
	BV+ivu7mtae8f8xm3tqUvGFJupvvPKQy4u9nkFkY87zDdl3fXVvgZfpxdt3VEckEXFaWqF0Rj8gwp
	LJGn0SZOk3oFNuj8jPZXDzvMIUv/FtEg+pB2xv8QpoCX2K7FLIu4inhIBZcu6Lfg8AJUuYOBEmPNm
	jTGb6VxJXynlHAfD3cQCTT9pCunS1jzhFbOCjfcVqPnaO6MVJqlnrfK5er9Oy7PtQLkMfLv8TrYaQ
	8f0vSO0vQIO8jnclNnBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4ap-00Fzbo-2x
	for ath12k@archiver.kernel.org;
	Tue, 26 Sep 2023 09:42:59 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4an-00FzbM-0y
	for ath12k@lists.infradead.org;
	Tue, 26 Sep 2023 09:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=J07PKgzvHv9pru8vLLpOFovCpNHRFFMR8SOnLLFgFZk=;
	t=1695721369; x=1696930969; b=OzxJ64wWzGbzbNZ+mlZqs3x6Re0M2DbXpNuo3fLhIsNhxgX
	tZjNxqtw7uUa4pTFFDLTSjQSB1TRgjXWu9LfhFazDrP+ce8wiUvdzrEGldmugPHXch+15g607XF3m
	8vS8cRTsDN/Bm2YOSceHp0KopjH7nEATKfW4zZLXCu9/aoeF4tDfCYCqp4ilVJflwaetgW6LQfp5G
	gw0uNBNPEzI1beLr5leV0P6t6qyaWdTfcaMNHF4JqziLZSqZWv0wCe4lu2cDVcJHosvd6wdetpbx0
	VCy2iohn7bojZHGsUIkHmlDypknR1Emk1b0/+1UQ5kDm6B/d/yYS4ZdftdY8ktMA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ql4ac-005RdD-1M;
	Tue, 26 Sep 2023 11:42:46 +0200
Message-ID: <d42b46d628c1d0d09d8772f19cec0b572251c02b.camel@sipsolutions.net>
Subject: Re: [PATCH 3/3] wifi: mac80211: update link RX NSS by
 ieee80211_sta_set_rx_nss() in ieee80211_assoc_config_link()
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 26 Sep 2023 11:42:45 +0200
In-Reply-To: <7e350410-0e45-910d-68db-ea1d85df958a@quicinc.com>
References: <20230906103458.24092-1-quic_wgong@quicinc.com>
	 <20230906103458.24092-4-quic_wgong@quicinc.com>
	 <e6ea3009c489fae910adbf2e1c766f2d827f287f.camel@sipsolutions.net>
	 <7e350410-0e45-910d-68db-ea1d85df958a@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_024257_359784_84EFAFF5 
X-CRM114-Status: GOOD (  28.49  )
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

On Fri, 2023-09-15 at 15:53 +0800, Wen Gong wrote:
> On 9/13/2023 5:04 PM, Johannes Berg wrote:
> > On Wed, 2023-09-06 at 06:34 -0400, Wen Gong wrote:
> > > Currently for MLO connection, only deflink's rx_nss is set to correct
> > > value. The others links' rx_nss of struct ieee80211_link_sta is
> > > value 0 in ieee80211_set_associated(), because they are not pass into
> > > ieee80211_sta_set_rx_nss() in mac80211 except the deflink in
> > > rate_control_rate_init(). This leads driver get NSS = 0 for other links.
> > > Add the ieee80211_sta_set_rx_nss() in ieee80211_assoc_config_link(),
> > > then the other links' rx_nss will be set to the correct value.
> > This is pretty much true, but I also think it's problematic the way you
> > phrase it. Software rate control is pretty much, at least currently,
> > _not_ supported for MLO (and I don't really see how to support it, if
> > firmware picks the link to transmit on, as it probably should).
> > 
> > Thus, I'm not even sure we should be calling rate_control_rate_init().
> > Clearly we do today, but it's also obviously wrong for everything except
> > the call to ieee80211_sta_set_rx_nss().
> > 
> > So while I agree that there's a problem with the RX NSS, I disagree that
> > this patch is the right way to fix it. Yes, it also fairly obviously
> > fixes the problem, but it just makes an existing design problem worse.
> > 
> > Please change change the overall design here so that
> > ieee80211_sta_set_rx_nss() isn't related to rate control at all.
> > 
> > johannes
> So should I delete ieee80211_sta_set_rx_nss() in rate_control_rate_init(),
> and add it into ieee80211_assoc_config_link() as you said before here?
> https://lore.kernel.org/linux-wireless/ca0f6ea2d78538ffb6640f2e56d65c89c86f5221.camel@sipsolutions.net/

I think that would make sense. After all, rate_control_rate_init() is
related to the software rate control which isn't really supported with
MLD, and the NSS init is unrelated, it's just updating a piece of per
(link) station data.

> I checked the git log, ieee80211_sta_set_rx_nss() is added into
> rate_control_rate_init() here for VHT, so is it correct to delete
> ieee80211_sta_set_rx_nss() in rate_control_rate_init()?
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=8921d04e8df7475d733d853564bdb001e83bf33f
> > 

Well we'll have to call it appropriately when rate_control_rate_init()
is called today, and then the new places in your patch, I guess.

But I per the above that makes more sense semantically, since we don't
support software rate control on link stations.

johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
