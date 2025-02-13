Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40978C021A0
	for <ath12k@archiver.kernel.org>; Thu, 13 Feb 2025 21:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Za3PSPVLT1V/Pq0VFLS6fiDhlmaRCZ9K+feiKnCshc=; b=VcciW9sFuqTbNWWMM6f4fOTf43
	WSatL++avHTnR0IGzmi2GyOqUOIeMB5H+zyfSFYAaCKa9JdQVd5+1xfoWyqcL+TLPw+OKajdMlZDz
	ee8uqFt4YBTJdtnBCpc8jWfsCyKU+wmyOzhDIuIWOWhwN/FdGI4Wz6Ep/bTMBt1LjY37A9xeFTmu2
	IHho+tQOLARBfvNXWb+NKPzHMpfd5M0sgiL+hQh4fHnN9LP2ssJQb8yTf2p8MetUzrIjEPDLZQ6nN
	AOZLahUyfF7FyCTj2NCb6I+qnVqhiemra6PJ17AgmWYKG84R3A6tSpYoJbfis/nJbJWm+3bNo1FgR
	r8fgo0+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigiw-0000000ChA4-4BB1
	for ath12k@archiver.kernel.org;
	Thu, 13 Feb 2025 21:26:18 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tifeZ-0000000CWIw-0Kcr
	for ath12k@lists.infradead.org;
	Thu, 13 Feb 2025 20:17:44 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 1E3F22C0064;
	Thu, 13 Feb 2025 20:17:40 +0000 (UTC)
Received: from [10.20.38.246] (hirgnt03.hicv.net [173.197.107.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id BFB8613C2B0;
	Thu, 13 Feb 2025 12:17:38 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com BFB8613C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1739477859;
	bh=eC1VWI5r8buZru3ijs68Snpb8KODJYPuJ1AjeGbvIkY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FvwzSAB9BVEaZbDB5ZChn8Jz6XjxfmcnCsLFXKe39y+UOmUTXvlrQifk3OxWIAM4r
	 C8Bis6Pb7sHvkfSzXwLTd/p7QoBfLxmpN42OgXFmOjuEob8onCNcFMW2WNDWH6+sZn
	 FIVywXR3Gduc5gxnM4CsOsSwbS5sVXlCH5s5gIe0=
Message-ID: <26f57f33-459d-4563-b0a5-2c5c287e1d55@candelatech.com>
Date: Thu, 13 Feb 2025 12:17:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] wifi: mac80211: correct RX stats packet increment
 for multi-link
To: Sarika Sharma <quic_sarishar@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, johannes@sipsolutions.net
References: <20250213173206.1665731-1-quic_sarishar@quicinc.com>
 <20250213173206.1665731-2-quic_sarishar@quicinc.com>
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <20250213173206.1665731-2-quic_sarishar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1739477861-srSMj0ZTYEjx
X-MDID-O: us5;at1;1739477861;srSMj0ZTYEjx;<greearb@candelatech.com>;be06782f8752dab23be3bebda63580b2
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_121743_198927_6B688DE6 
X-CRM114-Status: GOOD (  19.45  )
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

On 2/13/25 9:32 AM, Sarika Sharma wrote:
> Currently, RX stats packets are incremented for deflink member for
> non-ML and multi-link(ML) station case. However, for ML station,
> packets should be incremented based on the specific link.
> 
> Therefore, if a valid link_id is present, fetch the corresponding
> link station information and increment the RX packets for that link.
> For non-MLO stations, the deflink will still be used.
> 
> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
> ---
>   net/mac80211/rx.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
> index 1e28efe4203c..eb3e2d550c8f 100644
> --- a/net/mac80211/rx.c
> +++ b/net/mac80211/rx.c
> @@ -231,8 +231,19 @@ static void __ieee80211_queue_skb_to_iface(struct ieee80211_sub_if_data *sdata,
>   
>   	skb_queue_tail(&sdata->skb_queue, skb);
>   	wiphy_work_queue(sdata->local->hw.wiphy, &sdata->work);
> -	if (sta)
> -		sta->deflink.rx_stats.packets++;
> +	if (sta) {
> +		struct link_sta_info *link_sta_info;
> +
> +		if (link_id >= 0) {
> +			link_sta_info = rcu_dereference(sta->link[link_id]);
> +			if (!link_sta_info)
> +				return;

I think if you cannot find the link_sta_info here, you should just use deflink
so the packet is still counted?

Thanks,
Ben

> +		} else {
> +			link_sta_info = &sta->deflink;
> +		}
> +
> +		link_sta_info->rx_stats.packets++;
> +	}
>   }
>   
>   static void ieee80211_queue_skb_to_iface(struct ieee80211_sub_if_data *sdata,


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

