Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13515C4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 08:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8s29BLzGYp7Bm8cEbRP6OwjY4YuJ83Rd6mv4uVp6Msc=; b=2ItxD+TJ4tIGPztifGXs07RXv6
	/UZT7EazcnMZeFotazaF9CT6+I5HpW5uah4LpBPRg2VxJRftchtMuT3zuubiE+z3WnX2WQWzldcjC
	usOW4t+zc8ibH7DcWC4A/KEzl9XVG9pQ2HKYiyJRWP2ekGXKctE9jjWlakyjdT57fQWyd50FKe8Oc
	RwPPto768Eza603A9MS/JXUTwm3goekq8m0ueQzQG1HwHoVVfPbyeaqHpb+RaexeFxqiMwyd+jKsh
	Xd6+TAdWWAvoYah16O4qhthr+LcMFgfOcsYGx82r7BLoTYaKTremH2CAJVY8NDgCzoy60s1TcBIO2
	PgJNlIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryog2-0000000CYhH-2VOp
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 08:05:26 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryofv-0000000CYfK-2vRJ
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 08:05:25 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-41a5d695e4eso4171255e9.3
        for <ath12k@lists.infradead.org>; Mon, 22 Apr 2024 01:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713773117; x=1714377917; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8s29BLzGYp7Bm8cEbRP6OwjY4YuJ83Rd6mv4uVp6Msc=;
        b=J14r8WvU+w1gE5YUy8rhDdAtq8QdwKyfxgYyX/wVS+jhzUAAHdjiRTE44e6ypa6oqc
         FKo3Y7q8NgKFBv5MiSiCbhON3WFT+30aBcu4cKBSEWlqYhcztIRBcgPGQa0y/fsV0lWL
         /hMXlnWAoMFJscMZKO/+3ZahSgQ+YELgbiy/5dHb7EAZmhbrMom6FniXYsKsPQ96Trhd
         gAkXoXBHs45mPjcH0XJkzEz3rAx4XJaKU/JSctqHpUSGqgGc4qqM7IbKEKmrzaqiXfH1
         oMzH14wr3Q17Gdae3OdNY6jdHLNsydwtll7LnWLOutuhIMcmBqHb1g04SqqBOI3AkSzo
         KlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713773117; x=1714377917;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8s29BLzGYp7Bm8cEbRP6OwjY4YuJ83Rd6mv4uVp6Msc=;
        b=mNd8rFf9tDGjTraMSsdpSLembS8+wo1TCZiRakGEB5HNHlkWBLsPZa1RuIMRptflzd
         G3ZW7dOQJhYtmGFP5PnoVht6WwQHSf8FgknWKAjo9ze6PehUEzcPeBJy8vJXUsiljovw
         Dh5YQVguPdtHyfWGJg+ImpaDQ1vvELEQNTXAsTXX/CyubFjZchgLwtB/enZwqMH+Y3YC
         mBmkq0ABL4XRA6GZZbDJFd7QQNubAKr8B3uzuZIO0Ocoybx3yzCROGUofAo/JAc54j1t
         hlbl6N7z+2J+n0ttO1vY34NU423cDtA4mdtWcl7Xb+90B8+UF+WxyvomP1U0JuLtAL9B
         c7VA==
X-Forwarded-Encrypted: i=1; AJvYcCXBroXglNJ9YVqSPOK5KkqrQjSHn5mfx/8q7bRZJLXRThuK48OK/yZ3HZHrPe3mzljutlz6oRdLO9Emyh6pjwHxqS8tOyL0xHVRCg==
X-Gm-Message-State: AOJu0YzyPlimXehfkKWNgwb2U+2njvVKQj4UJgdek0mZPx4+TKRZWo3B
	3/4gYVxd3qV/gvPeNwr+/kI8KwTxXiy5xlg7Afv8UKsc0YV9qb0E
X-Google-Smtp-Source: AGHT+IH29kPFT629rzGfG3WWj0i6IBffylSNx7YQAIdH4ZQUoGK15aJCeZEU5NWQ+lVn+dh0nMzMsw==
X-Received: by 2002:a05:600c:3153:b0:41a:7c99:cb40 with SMTP id h19-20020a05600c315300b0041a7c99cb40mr492695wmo.15.1713773117194;
        Mon, 22 Apr 2024 01:05:17 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id k29-20020a05600c1c9d00b00418948a5eb0sm19548875wms.32.2024.04.22.01.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 01:05:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Apr 2024 10:05:16 +0200
Message-Id: <D0QHV8UV73N5.2N5E3MH37JQW7@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: drop failed transmitted frames from
 metric calculation.
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Karthikeyan Kathirvel" <quic_kathirve@quicinc.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.17.0
References: <20240419170314.3117623-1-quic_kathirve@quicinc.com>
In-Reply-To: <20240419170314.3117623-1-quic_kathirve@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_010519_755493_93FAC180 
X-CRM114-Status: GOOD (  15.06  )
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

On Fri Apr 19, 2024 at 7:03 PM CEST, Karthikeyan Kathirvel wrote:
[...]
> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wirele=
ss/ath/ath12k/dp_tx.c
> index 9b6d7d72f57c..164431b7eb4e 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
> @@ -481,18 +481,36 @@ static void ath12k_dp_tx_complete_msdu(struct ath12=
k *ar,
>  	/* skip tx rate update from ieee80211_status*/
>  	info->status.rates[0].idx =3D -1;
> =20
> -	if (ts->status =3D=3D HAL_WBM_TQM_REL_REASON_FRAME_ACKED &&
> -	    !(info->flags & IEEE80211_TX_CTL_NO_ACK)) {
> -		info->flags |=3D IEEE80211_TX_STAT_ACK;
> -		info->status.ack_signal =3D ATH12K_DEFAULT_NOISE_FLOOR +
> -					  ts->ack_rssi;
> -		info->status.flags =3D IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
> +	switch (ts->status) {
> +	case HAL_WBM_TQM_REL_REASON_FRAME_ACKED:
> +		if (!(info->flags & IEEE80211_TX_CTL_NO_ACK)) {
> +			info->flags |=3D IEEE80211_TX_STAT_ACK;
> +			info->status.ack_signal =3D ATH12K_DEFAULT_NOISE_FLOOR +
> +						  ts->ack_rssi;
> +			info->status.flags =3D IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
> +		}
> +		break;
> +	case HAL_WBM_TQM_REL_REASON_CMD_REMOVE_TX:
> +		if (info->flags & IEEE80211_TX_CTL_NO_ACK) {
> +			info->flags |=3D IEEE80211_TX_STAT_NOACK_TRANSMITTED;
> +			break;
> +		}
> +		fallthrough;
> +	case HAL_WBM_TQM_REL_REASON_CMD_REMOVE_MPDU:
> +	case HAL_WBM_TQM_REL_REASON_DROP_THRESHOLD:
> +	case HAL_WBM_TQM_REL_REASON_CMD_REMOVE_AGED_FRAMES:
> +		/* The failure status is due to internal firmware tx failure
> +		 * hence drop the frame do not update the status of frame to
> +		 * the upper layer
> +		 */
> +		dev_kfree_skb_any(msdu);
Shouldn't this be ieee80211_free_txskb ? I'm not clear when to use which.
> +		goto exit;
> +	default:
> +		ath12k_dbg(ab, ATH12K_DBG_DP_TX, "tx frame is not acked status %d\n",
> +			   ts->status);
> +		break;
>  	}
> =20
> -	if (ts->status =3D=3D HAL_WBM_TQM_REL_REASON_CMD_REMOVE_TX &&
> -	    (info->flags & IEEE80211_TX_CTL_NO_ACK))
> -		info->flags |=3D IEEE80211_TX_STAT_NOACK_TRANSMITTED;
> -
>  	/* NOTE: Tx rate status reporting. Tx completion status does not have
>  	 * necessary information (for example nss) to build the tx rate.
>  	 * Might end up reporting it out-of-band from HTT stats.

Thanks

