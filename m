Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885E1EE49AF
	for <ath12k@archiver.kernel.org>; Wed, 23 Aug 2023 06:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S17NLB8I8qwgxhlNA3LnhOcaCCuGON+jxL1ccA+U6Q0=; b=yZDHUr+lqCXYrK
	g7zaYH1xPqgmFcS+Nd1rjfrmQDa1yS8kaJTWM7+ahCyP2w+WhBl7iBZPXkZfdt97INtvzVVt6IWT7
	JA174EiuGoRoDL2zmoeZoU0QhzQnYl3mpcYFhEPDy/MM0J3x1G69B3f9pbyfe0pkgaAoRN5B3WZU7
	V+Ux+8oxAyI1SkgmawRZatfSH+wUbndecFMypDnP27C8oazhWiqBS0VEAOvdkbicMZ7S7eIMP8J8d
	6HQTWOdadYeEf0oTNKwHt6Wsm/HE6CBJ+hQpuwD8CCpIHsECIVsNPaMvvQ5+G1A/4JbiWwQTtNsdt
	6CwpSO8IoT97cCLoy2LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYhSF-00HOuL-0n
	for ath12k@archiver.kernel.org;
	Wed, 23 Aug 2023 06:34:59 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYhSB-00HOty-1w
	for ath12k@lists.infradead.org;
	Wed, 23 Aug 2023 06:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=a3Kw1m3sTWZpr7vRhEXtah4OAfpsV2xAyGg0LqKsvDA=;
	t=1692772488; x=1693982088; b=l/S2mnwWjaZ2RNCOZCKq+uvviqOBDpXKa0EsDAhpkwMuJym
	I4mvj8QpznpCw91Do5FyVg8BVY/HRMHHk7182aRE3j/mYCwRzfdf+ylnkKA4Iiw9iS2/22OkBJz0W
	5iMRcJrINZIY5cD+2/P3rWI94CJ5+bvzqttATaf9xEAJMN7s1JrD/gYimyammE9MeCObM2insMsoX
	jrQxTRabT05AxPB1B27bi87dEkXbfSho3JEyaDsTwah49uOzWKGJoHGsQCSdHvk+HMME2IgzDbznb
	V5aBpAWxDtOHk6PBOBYCVKpGU2pviZmnEA77eJt5VrUR4toGHmGNc3onMnTV3FlA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qYhS1-006kBP-2v;
	Wed, 23 Aug 2023 08:34:46 +0200
Message-ID: <941b1bdb6852f20722fa3a5b01f546f054f9e8a8.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: mac80211: fix cfg80211_bss always hold when
 assoc response fail for MLO connection
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 23 Aug 2023 08:34:44 +0200
In-Reply-To: <bcf65017-0dbc-e957-f382-98c6dc406346@quicinc.com>
References: <20230822100409.1242-1-quic_wgong@quicinc.com>
	 <c4d2c8987f929f29da96154e0fc6c9e94882310e.camel@sipsolutions.net>
	 <bcf65017-0dbc-e957-f382-98c6dc406346@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_233456_144154_EBBF89C7 
X-CRM114-Status: UNSURE (   9.28  )
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

On Wed, 2023-08-23 at 10:28 +0800, Wen Gong wrote:
> > 
> >                  /* need to have local link addresses for MLO connections */
> > 
> >                  WARN_ON(cr.ap_mld_addr && !cr.links[link_id].addr);
> > 
> > makes no sense anymore. Not sure if that's the only one.
> 
> After this patch, the cr.links[link_id].addr will be a valid local link 
> address from
> 
> struct cfg80211_rx_assoc_resp, so I think it is not needed remove now.

You don't understand.

The issue is that it's set the line above.

>                 cr.links[link_id].addr = data->links[link_id].addr;
>                 /* need to have local link addresses for MLO connections */
>                 WARN_ON(cr.ap_mld_addr && !cr.links[link_id].addr);

But look at that! What values can cr.links[link_id].addr get? Note how
it's a pointer - assigned from an array.


johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
