Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D61C61DA4
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 12:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YofPioeCdDVULB3BXWEfzAxN/c1Uf6p4w7L7y2b40N4=; b=2fwV+Fo0E9SytB
	fE7d6jBq/Bh8LEeqTnZI1sSGcJcbCbcXNT85uVajWc0F3xEhJxgDqqKsXpfk8PcAhJUKEr778ruYh
	P7VlL7HVHgI6OOrzyDdpfxlJJYoQeVKrBv7HkFBLMqZLWgfg7WwlwAxwqWbhlBMG6bPXPfUZpQc4p
	sOUiqqnXYTDysjNU3zNwBPlsoYMqoF+BN3vCQZa0yxpkTljTWkVludAmsQXy7vkxoB06N2kHZdVsL
	DRBfFpWb+iAdd4Qc9zVP0kTpLPV+iKMY+OPklkp8JyucefWzC2D6IQTUHtOjiA1D+i7c36lKhBktN
	TOpOJxFy8wb9EiH/V03Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdNt-00A9hz-FN
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 12:29:09 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdNq-00A9gt-AW
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 12:29:07 +0000
Received: by mail-ej1-x62d.google.com with SMTP id f21so4703403ejq.8
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 04:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NA7qP01LFw1LKeNSZIlwsECPftMMJ1XE2jzmzgWplsM=;
        b=GDw1zpe+Vp34S93Kw0FS4btavYSKEZB2wFbArOZPWfuLuFNJOJgTu9Una+7qAzxaMW
         SL8QQPrcCjeHvAUcANO69vb2ATkNNyYnQFXTgGmQIEx4GJYsiK6QBhaL/6bEh9aAR1j1
         gsasYU+EPjDt3U3pNr+19d0goGB2dHJDmT+CDiu87nBrZBzmsfSqbG4RCawDqPPuHxBV
         /AQcgrqU+BOvStiXedlWhJjsK5FLSltOGxeKBdbLG8Zv7jdw3cHlSK4QNhNS5jwj0KDR
         RmAzdii/wZvS7jPPKaiNnONtMp0Rr9g5R0957Zm9Gez+3i9JPNqJdzzW/AU85x1ECe4E
         IT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NA7qP01LFw1LKeNSZIlwsECPftMMJ1XE2jzmzgWplsM=;
        b=G7t2y5J0/vWwkX9KMJmQjKL1ChYlvWqiVP7Y2OLAulHklDFPV0/aUbjX6bT4S+whN6
         ddKqeoyh/CnxX+1LvPbkWfkjARzBzZ9Kp7hiiikWrFgq+psLAHRezY5oYNz2/fn6jA5r
         Xj/mYd3HGgMfOzFfG/5ocGCC1nt4Zl6XKz0GCeTKgkuNj6jAQZDGKA+VLObxMLQlSTpz
         lnzjkaNs/xgM3MIAfWV0s0vHqMwMfOpstioKlUDB1gVufXaZqfgVBIvAd1mw4xpYbxYo
         5MlZJXwJflCMBcd9wk609FCwKAZTkU84wUwq58obaL9QNdqAewTCmEW181Mrgq6E5x8C
         RMAw==
X-Gm-Message-State: AO0yUKUQp5CZylNIBIj2hivgR09+zK2s5U/ofSDWz71C7Lm0/6LuCr1x
	cU3NoDQv9qwS2tVop8NcNgU=
X-Google-Smtp-Source: AK7set8NqwOQi1y3jsCEp1xSlmtSb2bZG3t4jXOQ64FAuSfEoMOLIawOreOXgRO7tynh98GvHWhFBg==
X-Received: by 2002:a17:906:4dc4:b0:889:d156:616d with SMTP id f4-20020a1709064dc400b00889d156616dmr5583377ejw.27.1676550544192;
        Thu, 16 Feb 2023 04:29:04 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906474b00b0088f8a61eb48sm750773ejs.154.2023.02.16.04.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:29:03 -0800 (PST)
Date: Thu, 16 Feb 2023 15:28:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices
Message-ID: <Y+4hgdh7iTOPFiyk@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_042906_400060_10EE212C 
X-CRM114-Status: UNSURE (   5.77  )
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

Hello Kalle Valo,

The patch d889913205cf: "wifi: ath12k: driver for Qualcomm Wi-Fi 7
devices" from Nov 28, 2022, leads to the following Smatch static
checker warning:

	drivers/net/wireless/ath/ath12k/mac.c:5872 ath12k_mac_op_unassign_vif_chanctx()
	error: double unlocked '&ar->conf_mutex' (orig line 5854)

drivers/net/wireless/ath/ath12k/mac.c
    5822 static void
    5823 ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
    5824                                    struct ieee80211_vif *vif,
    5825                                    struct ieee80211_bss_conf *link_conf,
    5826                                    struct ieee80211_chanctx_conf *ctx)
    5827 {
    5828         struct ath12k *ar = hw->priv;
    5829         struct ath12k_base *ab = ar->ab;
    5830         struct ath12k_vif *arvif = (void *)vif->drv_priv;
    5831         int ret;
    5832 
    5833         mutex_lock(&ar->conf_mutex);
    5834 
    5835         ath12k_dbg(ab, ATH12K_DBG_MAC,
    5836                    "mac chanctx unassign ptr %pK vdev_id %i\n",
    5837                    ctx, arvif->vdev_id);
    5838 
    5839         WARN_ON(!arvif->is_started);
    5840 
    5841         if (ab->hw_params->vdev_start_delay &&
    5842             arvif->vdev_type == WMI_VDEV_TYPE_MONITOR &&
    5843             ath12k_peer_find_by_addr(ab, ar->mac_addr))
    5844                 ath12k_peer_delete(ar, arvif->vdev_id, ar->mac_addr);
    5845 
    5846         if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
    5847                 ret = ath12k_mac_monitor_stop(ar);
    5848                 if (ret) {
    5849                         mutex_unlock(&ar->conf_mutex);
    5850                         return;
    5851                 }
    5852 
    5853                 arvif->is_started = false;
    5854                 mutex_unlock(&ar->conf_mutex);

Should this return after unlocking?

    5855         }
    5856 
    5857         ret = ath12k_mac_vdev_stop(arvif);
    5858         if (ret)
    5859                 ath12k_warn(ab, "failed to stop vdev %i: %d\n",
    5860                             arvif->vdev_id, ret);
    5861 
    5862         arvif->is_started = false;
    5863 
    5864         if (ab->hw_params->vdev_start_delay &&
    5865             arvif->vdev_type == WMI_VDEV_TYPE_MONITOR)
    5866                 ath12k_wmi_vdev_down(ar, arvif->vdev_id);
    5867 
    5868         if (arvif->vdev_type != WMI_VDEV_TYPE_MONITOR &&
    5869             ar->num_started_vdevs == 1 && ar->monitor_vdev_created)
    5870                 ath12k_mac_monitor_stop(ar);
    5871 
--> 5872         mutex_unlock(&ar->conf_mutex);
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    5873 }

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
