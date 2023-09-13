Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822F2CA5513
	for <ath12k@archiver.kernel.org>; Wed, 13 Sep 2023 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/oPyzuFKpeGF15VPnTqhC68bosFn5xH8Vt7uoaiVZcc=; b=bNQq1yzoMyGM2U
	ruA2kNkv3EdGOk1/DuWuh9F7alZD00xZyBg2MNrBmRuyBdkLXjMBKxoT0CMQ6uZ7KKCb7ktQNOKYN
	FLBYJ4dIH899ZXiYyZMoCccin751yUeLKR04uBIG0O4Y9voiu0D84cAT18Yl/UDPao1FpaUVpfFdb
	dCVFwj8CMWWL4RDB0er9jxaOv3nhTlw6u526Ia1zyBHHMaObyvVCXNxDpj7TuUoiwOcBUW6ySESVH
	h4wh8szEa3q68UM/jF8wc0TcvcsUNsG5oXsBPl1iVkcT1KRnyF21BlFNo6ElGz6HO0+4QWfuq5nTL
	mdDg6tnklBedBuW22X1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLht-005DSj-0Z
	for ath12k@archiver.kernel.org;
	Wed, 13 Sep 2023 08:58:45 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLhq-005DRU-0p
	for ath12k@lists.infradead.org;
	Wed, 13 Sep 2023 08:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=IJmGX4PzqBWbICPZgzgys4nGdzhJ0QEPwQa9yf0ZT1c=;
	t=1694595522; x=1695805122; b=BX3sgbAWO5ULhJsaTla/O08H11tSHMH4RS2UAUhxAkSCLem
	qPGNRATWIrPohdTPRoYkfK6A87krb7pwSIbATaT/wk/YEShFRn1aiPKrTogNqswgLcFm0tmTTNDf9
	RcXB9gFCVM+rWgeafoDZYOpi+anj9RMHih/NSdqdA0rXW8Sa9w5LU3r+WoPQInLzsSh6SkC16cuF8
	9lQM7J4PHus5LWbC+GJFXHU4raszAiTNfFQ0KlgdVVkU8Tbw/4TUrlf4IgSXwJ1VG9a+hW0AFxPlA
	fw6wYLRA6GNr1orN60CLabRGRx9m/G8CFT4up1rdml5uJEY2DCuLWJ9W5f7pn+0Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qgLhn-00Ehnm-33;
	Wed, 13 Sep 2023 10:58:40 +0200
Message-ID: <4b597bba9dc13c3260f174826de38b4f1bc3bf6e.camel@sipsolutions.net>
Subject: Re: [PATCH 2/3] wifi: mac80211: add support to allow driver to set
 active link while connection for station
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 13 Sep 2023 10:58:38 +0200
In-Reply-To: <20230906103458.24092-3-quic_wgong@quicinc.com>
References: <20230906103458.24092-1-quic_wgong@quicinc.com>
	 <20230906103458.24092-3-quic_wgong@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_015842_311305_9CB2CD3F 
X-CRM114-Status: GOOD (  15.41  )
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

On Wed, 2023-09-06 at 06:34 -0400, Wen Gong wrote:
> There are 2 fields valid_links and active_links in struct ieee80211_vif
> of mac80211. For station mode, valid_links is always include the bitmap
> of active_links. valid_links stores the bitmap of links which is created
> in mac80211, and mac80211 only indicate the info of links which is existed
> in active_links to driver. Finally, the active_links is the bitmap of
> links which station can interactive with MLO AP it is connected to.
> 
> Currently the active links is always only contain the primary link,
> primary link means the link used by the latest exchange of successful
> (Re)Association Request/Response frames. Then it will always have only
> one link in driver after connected.
> 
> Hence add this ops in struct ieee80211_ops to allow driver to determine
> the active links bit map dynamically while connecting to MLO AP.

This commit log does nothing to address the question "why do we need
this", particularly since we already have
ieee80211_set_active_links(/_async), so the driver can pretty much
immediately enable all the links it wants.

I see no value in this patch whatsoever.

> @@ -166,6 +167,13 @@ static void ieee80211_set_vif_links_bitmaps(struct ieee80211_sub_if_data *sdata,
>  		WARN_ON(dormant_links);
>  		break;
>  	case NL80211_IFTYPE_STATION:
> +		active_links = drv_calculate_active_links(sdata->local, sdata,
> +							  valid_links & ~dormant_links);
> +		if (active_links) {
> +			sdata->vif.active_links = active_links;
> +			break;
> +		}
> 

I also _really_ don't think this should operate at this low-level
infrastructure.

johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
