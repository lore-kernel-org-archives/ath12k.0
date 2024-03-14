Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B21FC54E60
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 16:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRKE/T/FFJ4r9HCXQ39y9gRkdBn91MEXUjGvFJ5LUTM=; b=hTgTYg2U6YrhVifB5idpFdJsqP
	0blsLkZ0ip2QpFin+h2cjbTABZo0CPniSer26FPI4PJnbqB7Tj0LV2ejAc4VHIL605348LXU1chB0
	6ZyXZjHu4qsGTgPuE0yvn0lRrCeLmHwwLyYMvMcFZx53eqSLYAU48wKn2Kn4umj9BGan1ZoNnkzNx
	sA295dgIOuW0SO913uq8ImRuoXFUunDZjz1g/6FF04K9AySBQg7z4/5ymBeUgZOD+UGNm7FpuM45s
	j8cC/biQXxKP5v6aubwFRJNqJwOeWH1nJz7la15DzmqcZ0ymkEMzDwbpS8bqpC7TdImWauh17y4BE
	rQCZbaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkncs-0000000ExqZ-42N8
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 16:08:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkncp-0000000Expk-1rvU
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 16:08:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D651C61514;
	Thu, 14 Mar 2024 16:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F06BC433C7;
	Thu, 14 Mar 2024 16:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710432490;
	bh=WsyEV6gDeA3xHpPD52WprrFr/fBZYtp17xNX05bGtMQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=aCJW8QaWjfycEKtLdynk0qYQ16q449zRW/x2/kZP6iLqT7oSTvPjrdmpREUKyWz4X
	 6Ke4lPybdUtvnETixqMkuKWWf7j1xIDN7ZV3pXuJpg6PdXZ5igYudacWDP7blM6sBw
	 fZp9kk2T/tAIl1lZxRuutwmKQlUluOBFIxOpLzLCj4jKHYFNGitSJEM1rzZbSt7fWT
	 HparpP6mJGRvoKO2CZnnc3mQ4KkCo3C3YOcL8L34qWzPmNBp+TJyC6XBPzFG0KOCYV
	 u13GNKclin5e4u1IkdHzPqqFmv+DDWYY/UseoMdU/Ev6vQy47NstqfpfkTZDkkFULp
	 4U/2/Ue2L/CPQ==
From: Kalle Valo <kvalo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,  Johannes Berg
 <johannes.berg@intel.com>,  Miri Korenblit
 <miriam.rachel.korenblit@intel.com>,
    ath12k@lists.infradead.org
Subject: Re: [PATCH 2/2] wifi: iwlwifi: mvm: disable MLO for the time being
References: <20240314110951.b50f1dc4ec21.I656ddd8178eedb49dc5c6c0e70f8ce5807afb54f@changeid>
	<20240314110951.d6ad146df98d.I47127e4fdbdef89e4ccf7483641570ee7871d4e6@changeid>
Date: Thu, 14 Mar 2024 18:08:07 +0200
In-Reply-To: <20240314110951.d6ad146df98d.I47127e4fdbdef89e4ccf7483641570ee7871d4e6@changeid>
	(Johannes Berg's message of "Thu, 14 Mar 2024 11:09:52 +0100")
Message-ID: <87bk7g4x08.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_090811_552639_67BE9951 
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

+ ath12k

Johannes Berg <johannes@sipsolutions.net> writes:

> From: Johannes Berg <johannes.berg@intel.com>
>
> MLO ended up not really fully stable yet, we want to make
> sure it works well with the ecosystem before enabling it.
> Thus, remove the flag, but set WIPHY_FLAG_DISABLE_WEXT so
> we don't get wireless extensions back until we enable MLO
> for this hardware.
>
> Cc: stable@vger.kernel.org
> Reviewed-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> ---
>  drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c b/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c
> index 1935630d3def..69227954e281 100644
> --- a/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c
> +++ b/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c
> @@ -360,7 +360,7 @@ int iwl_mvm_mac_setup_register(struct iwl_mvm *mvm)
>  	if (mvm->mld_api_is_used && mvm->nvm_data->sku_cap_11be_enable &&
>  	    !iwlwifi_mod_params.disable_11ax &&
>  	    !iwlwifi_mod_params.disable_11be)
> -		hw->wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
> +		hw->wiphy->flags |= WIPHY_FLAG_DISABLE_WEXT;

I think we should add the same for ath12k, right?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

