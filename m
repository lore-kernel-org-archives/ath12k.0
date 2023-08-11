Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D10FC0015E
	for <ath12k@archiver.kernel.org>; Fri, 11 Aug 2023 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suz9o+LhBrBZVmXhmtfv2W4zZKur3xU1m0nOKXyt3CU=; b=MH7LXzr5/7z2pz
	pvYSIzPl/OcYidWzrstGc6VfAbkIUsVLeOO/FZyNdJYmvlGXZsxm3dcuHNPI4ufb6zsde8NSnazCX
	xim/UQX380jUiMncw5l9xDa8RpqDDuccZ+4X5Er6BFCfy/7utJOiLzUz4LOZcmRufzo9D796Lx9wO
	XrDyy1p3xrUVelUaz3o8D/SoqnULFaowIkx8FTm3eJNOWYZqRQSZSOLBn7UKg4qwN3Ta+VEmRiLuN
	dJqhGJ/eH0QsEFDSlpgieTmibHnxpiTenHA3BoFOnVGMQsKmzWj5lFYoDStILEBWMGKS3dp5mzILL
	vHEGhrwg742yjw80OwUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUO36-009urK-2a
	for ath12k@archiver.kernel.org;
	Fri, 11 Aug 2023 09:03:12 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUO33-009uqP-1p
	for ath12k@lists.infradead.org;
	Fri, 11 Aug 2023 09:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=30O0i+CKxrgVUoyVg9Uo788qQ6EUk0N1sFInGdbhQMQ=;
	t=1691744587; x=1692954187; b=o2ZUUVTI0rZWznU/6WKhIJd6r89APZC3Qq85+MAbyI768Wf
	uhvWVhigm84AVYUyZ08kmD8qxU6r2wZQtBgknD9ctmrReSJMuy7lGe5MGceGuB+GG1ugz5Vv+1qTz
	2eDtcCdfLrMidNHE6q1IOSZL6Bc6xa7vL91U4htu8VnqVv8PSFhgp0gR0G26zazgsvuPHh0nEoIv1
	DOzULP9QWpHSwoPpM9EQE6kCJ+ffPP+G3k8HPx7QSCzmUiNeR9Xannghmwj8wZL0sEphYROSN6yjo
	oks9BKCcqcfOKh4pC9xvN7u/u4YQ9BhAwE+dliA9WOeTNOt3ZCgeuoZeXKFy0/Rg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qUO2x-000o6U-1D;
	Fri, 11 Aug 2023 11:03:03 +0200
Message-ID: <f577425e2d4fd6141c29bcbfbea919565da9326d.camel@sipsolutions.net>
Subject: Re: [PATCH 61/76] wifi: nl80211: add EML/MLD capabilities to
 per-iftype capabilities
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org, quic_rkaliapp@quicinc.com
Date: Fri, 11 Aug 2023 11:03:01 +0200
In-Reply-To: <d2f17799-6d90-9d72-a389-565163d723d2@quicinc.com>
References: <20220713094502.163926-1-johannes@sipsolutions.net>
	 <20220713114426.4dfc9ebd0461.Ice7b841051cfeb23da17bb2caa0e45191b34c4db@changeid>
	 <d2f17799-6d90-9d72-a389-565163d723d2@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_020309_829575_04827B55 
X-CRM114-Status: UNSURE (   6.78  )
X-CRM114-Notice: Please train this message.
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

On Fri, 2023-08-11 at 11:51 +0800, Wen Gong wrote:
> Now there are many nl80211_band such as NL80211_BAND_2GHZ/
> NL80211_BAND_5GHZ/NL80211_BAND_6GHZ... In the same interface, if some bands
> support EML, and other bands not support EML, then how to handler this
> case?

But ... these are MLD capabilities, not of the (associated) STA?

So not sure how that would make sense? What would you even _do_ with
that?

johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
