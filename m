Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E7FC0015E
	for <ath12k@archiver.kernel.org>; Fri, 11 Aug 2023 09:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMDjmmzugE5Q5MONYSdFtlfbFRvLJNVyt3B9zrEp1bw=; b=y+tPqBA/buTIiA
	dwTmyamCYd1YEjdmOkNDianrdAGIuKIiYAro+nGMreFx1m/9oWj8Z8a8Vm/6N3qvZR9liJmJMrMbE
	tXzkNYRVE/xT4J9jcs5aP59VfoSVRto8MCPYHAVcRuBlJg2agRTcdxei7PGv/8UtznAhE8zyd5w2B
	Y7R1PByUBc2EPntnuUsZXqn9Z9fDU7ajLvrRETYSMXdXAWnrGfi3z/1zxOibmtOBsEJm/neCpQk+Z
	HFJozjKnNIGuDhZujxadO7L9z4o6FwtuhKNQ6cTfLBcWvlGU/n+mnrQP1HfRpTvP6DXZcYhO2XeDg
	Gl6V2YxQRX7x/H5/mJHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUO8m-009vmV-0t
	for ath12k@archiver.kernel.org;
	Fri, 11 Aug 2023 09:09:04 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUO8k-009vm6-0D
	for ath12k@lists.infradead.org;
	Fri, 11 Aug 2023 09:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=kl5XogxFnI73l/sfFXXeYw0AXQWQv1tYcOogssTXXG0=;
	t=1691744941; x=1692954541; b=iiXFIywMr7UvUnqUSzNltZsa2dm4l/YB3exIGosz2xJcF94
	fW3yzwrbDzLi2rUgOPjkyTlc/hPWntCT/XiR+A+QkhhEdVR/qXS7dvSe5L7/jY9Vgm2Kssu3OK4hR
	iAhNMhReCK/N0/ggk/99v0ShtX/TQfURzX8JI/Jbkytc2kBdNycbjXWCKvf84IMqpgN5VFTa+iTrR
	hFbxFXuWv2lGXUOEab2SKPAj1zXxoz6bN4RGY+GeYNl7c3tp/aWBe2iyYi1w9BjwVJMBRPkzkSQVG
	bcgQKJSkA33iAK4CdlDunPxve5wjJMYeSIALIVd5tsqfjsIUwR9Em+ybR8oEkiKg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qUO8h-000oRx-22;
	Fri, 11 Aug 2023 11:08:59 +0200
Message-ID: <8627bb8a3dddc33be7f1f97f30fc0f716328ff81.camel@sipsolutions.net>
Subject: Re: [PATCH 61/76] wifi: nl80211: add EML/MLD capabilities to
 per-iftype capabilities
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org, quic_rkaliapp@quicinc.com
Date: Fri, 11 Aug 2023 11:08:58 +0200
In-Reply-To: <cc6b83eb-ac30-34fc-4827-290a9ae25378@quicinc.com>
References: <20220713094502.163926-1-johannes@sipsolutions.net>
	 <20220713114426.4dfc9ebd0461.Ice7b841051cfeb23da17bb2caa0e45191b34c4db@changeid>
	 <d2f17799-6d90-9d72-a389-565163d723d2@quicinc.com>
	 <f577425e2d4fd6141c29bcbfbea919565da9326d.camel@sipsolutions.net>
	 <cc6b83eb-ac30-34fc-4827-290a9ae25378@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_020902_125745_12743EFC 
X-CRM114-Status: GOOD (  15.18  )
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

On Fri, 2023-08-11 at 17:05 +0800, Wen Gong wrote:
> On 8/11/2023 5:03 PM, Johannes Berg wrote:
> > On Fri, 2023-08-11 at 11:51 +0800, Wen Gong wrote:
> > > Now there are many nl80211_band such as NL80211_BAND_2GHZ/
> > > NL80211_BAND_5GHZ/NL80211_BAND_6GHZ... In the same interface, if some bands
> > > support EML, and other bands not support EML, then how to handler this
> > > case?
> > But ... these are MLD capabilities, not of the (associated) STA?
> Yes, I know it.

Then you can't honestly be suggesting we move "MLD capa and ops" into
per-band, no?

> > So not sure how that would make sense? What would you even _do_ with
> > that?

> I think another change is not move "u16 eml_capabilities", and only add 
> a new
> field "u16 eml_supp_bands" together with the "u16 eml_capabilities", the
> eml_supp_bands is filled with the bit map of enum nl80211_band. Is that OK?
> 

And again, what would you do with it? Not advertise EML when you have
selected links that are not in the map? And if the links change
dynamically in the future? You'd probably need a bunch of validation for
that.

And usually you'd probably always connect to all the bands?

I really don't get it.

Btw this is all client - so your client implementation can just not send
the EML action frame (forgot the name right now) when the currently
active links are not compatible.

johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
