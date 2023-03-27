Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34B0C76195
	for <ath12k@archiver.kernel.org>; Mon, 27 Mar 2023 09:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFlG/akoGUcHWogFiefKtChbH/iF41Eptivu2efPUiw=; b=oO8GCGEVXa5UhF
	HiJ0wVOn9pTYbX5pOeV47vDH/T4QQnNT/D1u7KjXqwsfjT41zezbU3QPlWtKcAzcnfu4q/om9AeRH
	pBTon5olukV+SH0fiJeKpeOSgN+zqK0O06cKXh69jjL1cwHfqhtE0UK6JObdrzG7H+EWZ5w1lJySe
	A2X5vdc91PRXZCQHxyuwuA6E0oqZ3KDUBKs7GSttdRu1W95R7q/fL6IZAw9Rq8J65IgBVKXlMoggv
	yPwqnPN7wZOJjW7iC5iC1ZCd86IMehkvWE0xuq3U7dqh7beSPHuDuuC2T3jEpLtjU5RPfg2KKycKM
	nQ+8eMHqhk9TVPC0E6yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgimF-00APR5-2C
	for ath12k@archiver.kernel.org;
	Mon, 27 Mar 2023 09:04:31 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgimC-00APQ8-2e;
	Mon, 27 Mar 2023 09:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=KT+V6uIG4ofrfprd41e/+KLeNMkaEY3gPnoiagZ5l4w=;
	t=1679907868; x=1681117468; b=GsAcZqPQSH/6w8eeGPTQO6cJNMgkOK0Y4w/SQlN+C2mI3E+
	ZBtXf+g0IarxnxydhEfzJrvwYaV4QeHdT4WrXduC4yFduB/zeGBQ1RTVDFR7eTLOrmdaiH5Rn1v9T
	j9TMbobNZUbLVVdh/EUDD/fv4mBQBoDqWQvtk6D8Xf659NIJ2gTwAB8FsODAG1y5ivPk6tJ1DeA+z
	Ws5Ww3ZXfhrq1+Hi5yFYi4rS+AfGNYVNq+07KR4lzM9L+97pxQaAijuRi2jxFyeeq3FwHely2w0BO
	W2I6XiOpS6Vdl1NIalO/nHwn0alYkO04MP1lKY1o6HzFvch4INjE+2v+XVLK4HCQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pgim7-00FcYR-33;
	Mon, 27 Mar 2023 11:04:24 +0200
Message-ID: <a20e39027ca0b89cae2259d35ff19d03c3c6951a.camel@sipsolutions.net>
Subject: Re: [PATCH 24/27] wifi: mac80211: implement link switching
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org
Date: Mon, 27 Mar 2023 11:04:23 +0200
In-Reply-To: <31b91fad-bd14-b6e1-8abe-fceb66085ecb@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.d99dfbe65c90.I92385ba882ec984a9a2ad18293173436657e82aa@changeid>
	 <ca5177fe-3b9f-2309-9afd-1d5e827540f7@quicinc.com>
	 <50719d34bc48d816d00b56d3d9efdb59e3e51a16.camel@sipsolutions.net>
	 <31b91fad-bd14-b6e1-8abe-fceb66085ecb@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_020428_861396_DEB48BF1 
X-CRM114-Status: GOOD (  13.47  )
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

On Mon, 2023-03-27 at 16:40 +0800, Wen Gong wrote:
> > 
> > > > +	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
> > > > +		struct ieee80211_link_data *link;
> > > > +
> > > > +		link = sdata_dereference(sdata->link[link_id], sdata);
> > > > +
> > > > +		ret = ieee80211_link_use_channel(link, &link->conf->chandef,
> > > > +						 IEEE80211_CHANCTX_SHARED);
> > > For the 1st link of MLO connection/NON-MLO connetion, ieee80211_link_use_channel() is called before drv_change_sta_link(),
> > > And now it is after drv_change_sta_link(), May I know is it also has some design here?
> > Hmm, probably not really, at least I don't remember anything about that.
> > 
> > Not sure it makes a huge difference? But I suppose we could change it, I
> > don't really see why not either.
> Not huge difference, I have made little change in lower-driver to match 
> that. So it is OK now.

OK. Still maybe we should change it for consistency? I can try that
later with our driver.

johannes


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
