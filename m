Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0F5C61DA4
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 14:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t8wJWhgyKor4KiEF/PCoIiJYS1sauaP5boUaDKxQcHY=; b=GduZ+iV3XZGXqQ
	tPZqQ7w9g/mebvng0XivRlqEbRPEtD2X0aRTD1Nnk+9bCSrfHMQ/nLFlNClO7OmzdtPvfoLQpDSCW
	cq0xb1Jkg6KiKGO4YH8nRln7Rm3YvjtcjMVNWjfAjTJpfHZzotdnjNYVgGRBJM2okoIRmKejdkRgh
	vv+ih5CeXD0LPgv3iiVcso+IG+pcleGk1kWCx9FDNVaAivo13d52Q9MelUfccW9tIpEM/CfL+2kmn
	Uo3WAuk5YHWjuX/TxcK9Oc17/a4sSP4gimaRF2fUyVXvwZlPqXHqeFNU9tdKfgQQsrrlrTn5M6Dmg
	jkRmX4oyFgWQ6xZKPoUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeny-00ATtr-Dv
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 14:00:10 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSenv-00ATsj-JR
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 14:00:08 +0000
Received: by mail-ed1-x52c.google.com with SMTP id c1so3136473edt.4
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 06:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+NXOwXt2XF0u/KysHVmZ6qrpmQMTSUbbFPegW9VK4U=;
        b=Ffk0fKanhETQyl2bW3nfIl7ElqmkuBPNHEidhvZeHqEl0dqf+/8LPtmTk7G/rwhLlv
         L6nbJ3Tkjst0d3ACOHME1gtKHO284mMnd/xD70AY458ZGcSgCNXfJ5prl1gsEeBCBXRC
         q9RW1Mf80+0MmB8Qe/vUbWNxY/GrN2+h3J+fQFS6T0vBGf9UbZFN3t2NiXC9tvQUu3qs
         fkY8g+7ijOY1g3vWfN/yZqAzQW78phq6B3ArxFT7x78Vo40XTgVNvPfQ7U8Ayt3bGI0N
         tWiyHjd9m1vk11NGYikZdvvU9+ZIyb7uDWzVuQrcnNAHvLWNYuUWqFtCLsSHiPg4qRzL
         r17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+NXOwXt2XF0u/KysHVmZ6qrpmQMTSUbbFPegW9VK4U=;
        b=WJjf2XwLjHMaC+bRVGYtpiesPWuqqv6rR8QKQpngsB/TIsFYQURU3gv/qpawJVTMe9
         c2NeQApt8HvOtAl6NuT5Al2wI168xIXYH0h8wXMX4nERdHIFIbg0oAVTUQN7vsYnwHZc
         9X3k8ttGgRLUcLniNuklidcH3LMUX2+nHHur48hRwItsGviASBsPRZm5zkNkXmG8OtV7
         UTdQjGjDKXSK684QeCEcB15y7TNiyYZj1RKkQkiAlDRqJmnnBUS3gJzNkbo2Vt0JD8NW
         KIX2KImMBQkcchDKQpa25f3r38n4OniNqH+tbdOJDyishymYbbW0d1GwJaxtlnk7TjfQ
         gXcQ==
X-Gm-Message-State: AO0yUKUBs+uXMfI1mcMYaEAXugRvr0auAbq4OIcsrx+HPZ+jqh55AZ6e
	liN+KLtdKRWWVktq3mE1l69L/4YBPRNfgA==
X-Google-Smtp-Source: AK7set8bmO5UeFnldtz2eBqPSowOjNIJVo1iRPOR/8+4NO6ojC4sx7zQZntKzaAfXBDTIwj9/+9iNg==
X-Received: by 2002:a05:6402:5159:b0:4ac:bbaa:842f with SMTP id n25-20020a056402515900b004acbbaa842fmr5836279edd.39.1676556005251;
        Thu, 16 Feb 2023 06:00:05 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a25-20020a509b59000000b004acbda55f6bsm906750edj.27.2023.02.16.06.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:00:04 -0800 (PST)
Date: Thu, 16 Feb 2023 17:00:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: counter leaks
Message-ID: <Y+424ql0+1A6MMHG@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_060007_660171_92607B4F 
X-CRM114-Status: UNSURE (   5.53  )
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

drivers/net/wireless/ath/ath12k/mac.c:1031 ath12k_mac_monitor_start() warn: plus plus leak 'ar->num_started_vdevs'
drivers/net/wireless/ath/ath12k/mac.c:3173 ath12k_station_assoc() warn: plus plus leak 'arvif->num_legacy_stations'
drivers/net/wireless/ath/ath12k/mac.c:5087 ath12k_mac_op_add_interface() warn: plus plus leak 'ar->num_created_vdevs'

drivers/net/wireless/ath/ath12k/mac.c
    1003 static int ath12k_mac_monitor_start(struct ath12k *ar)
    1004 {
    1005         struct cfg80211_chan_def *chandef = NULL;
    1006         int ret;
    1007 
    1008         lockdep_assert_held(&ar->conf_mutex);
    1009 
    1010         if (ar->monitor_started)
    1011                 return 0;
    1012 
    1013         ieee80211_iter_chan_contexts_atomic(ar->hw,
    1014                                             ath12k_mac_get_any_chandef_iter,
    1015                                             &chandef);
    1016         if (!chandef)
    1017                 return 0;
    1018 
    1019         ret = ath12k_mac_monitor_vdev_start(ar, ar->monitor_vdev_id, chandef);
    1020         if (ret) {
    1021                 ath12k_warn(ar->ab, "failed to start monitor vdev: %d\n", ret);
    1022                 ath12k_mac_monitor_vdev_delete(ar);
    1023                 return ret;
    1024         }
    1025 
    1026         ar->monitor_started = true;
    1027         ar->num_started_vdevs++;
    1028         ret = ath12k_dp_tx_htt_monitor_mode_ring_config(ar, false);

If ath12k_dp_tx_htt_monitor_mode_ring_config() fails then this should
decrement ar->num_started_vdevs and set ->started = false

    1029         ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac monitor started ret %d\n", ret);
    1030 
--> 1031         return ret;
    1032 }

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
