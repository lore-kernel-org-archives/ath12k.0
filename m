Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D31C36010
	for <ath12k@archiver.kernel.org>; Mon,  7 Apr 2025 19:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obdefS3r581wDFQ7rWGjcvcIm67aBo+xTKXGRKlq1Cg=; b=Kt07jupJBmpFqMp3nhclsBPLDO
	ibLIkFUvBHnKu0GMHPmDZvetxMl91abJXjR5S8UtW5p2bCf4EJWl+3sExyxiEgO22U2/3nJrtZv3B
	akLrsqAW5x0A4LTTq3V4HG+DQD/1c4iDnKP8u07gf2xFVba1ouQ7OSE2+tKVooEZvOcyuZRHW4WS2
	OOmit17btGdbI5vUyv1GDSC6A6gcqttn+byW/d6FGyB1ktVv2e3jCNCcKxQ2h2syNr2WRlFkiZi4c
	ocCForfqQB+ZEMQt1UYzPLfgwRG5VW64F6NlggNvyWp0EfGj+j7PKynnhBpLJgOgookjbdZXlNA/E
	eI4Xc0wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rx6-00000001mGx-35MP
	for ath12k@archiver.kernel.org;
	Mon, 07 Apr 2025 19:16:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rNj-00000001aaa-1OH3
	for ath12k@lists.infradead.org;
	Mon, 07 Apr 2025 18:39:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C840A484D2;
	Mon,  7 Apr 2025 18:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41D1C4CEDD;
	Mon,  7 Apr 2025 18:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744051177;
	bh=FqBbfujZorWgG3rPeHe3EJNi1KkKcFDOQUHyCf5TY6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arFXIKZA9VCS2brkxZJUTn7YyPSvWytivwyTvyMlTXOiZdn1DfXL2T9jkGH6fztBi
	 hnKcsF0bAr+tBA7v8TPaWzcS+u6xzN/sa8pFk8/UPVwgaaybDk0KQ0l0o0FAU7QsBq
	 fghq56XwRgZ6rVbW22jGMQgoDSotfSSekHQV2WGuiaz7JQa/UAzdkcfsZPvslMIEB9
	 bV0rRCi0WuO7t9sLFrSkm8RX9JBF7ohec66F7cgx3I6D3a9JWfgMGkQBnd8CgtQiSB
	 /cFy7ueImq3lKm/NRlh2J5uu4Brzes+mNmB/eru8AVV/ndag+iMGui8oyuPiUC01IJ
	 as1yGmblcd4ag==
Date: Mon, 7 Apr 2025 11:39:34 -0700
From: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] wifi: ath12k: core.h: Avoid
 -Wflex-array-member-not-at-end warnings
Message-ID: <202504071138.98D5B6E@keescook>
References: <Z8-Snz86Xfwdlyd7@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8-Snz86Xfwdlyd7@kspp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_113939_432596_3E06BFAE 
X-CRM114-Status: GOOD (  18.50  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Tue, Mar 11, 2025 at 12:02:15PM +1030, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Move the conflicting declaration to the end of the structure. Notice
> that `struct ieee80211_chanctx_conf` is a flexible structure --a
> structure that contains a flexible-array member.
> 
> Fix 30 of the following warnings:
> 
> drivers/net/wireless/ath/ath12k/core.h:298:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Hi, just checking in on this patch. Is some adjustment needed for this
to land?

Thanks!

-Kees

> ---
>  drivers/net/wireless/ath/ath12k/core.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 3fac4f00d383..d6b4c4d2c400 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -295,7 +295,6 @@ struct ath12k_link_vif {
>  	int txpower;
>  	bool rsnie_present;
>  	bool wpaie_present;
> -	struct ieee80211_chanctx_conf chanctx;
>  	u8 vdev_stats_id;
>  	u32 punct_bitmap;
>  	u8 link_id;
> @@ -303,6 +302,13 @@ struct ath12k_link_vif {
>  	struct ath12k_rekey_data rekey_data;
>  
>  	u8 current_cntdown_counter;
> +
> +	/* Must be last - ends in a flexible-array member.
> +	 *
> +	 * FIXME: Driver should not copy struct ieee80211_chanctx_conf,
> +	 * especially because it has a flexible array. Find a better way.
> +	 */
> +	struct ieee80211_chanctx_conf chanctx;
>  };
>  
>  struct ath12k_vif {
> -- 
> 2.43.0
> 

-- 
Kees Cook

