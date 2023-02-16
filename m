Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A785BC636CC
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 14:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L5ftlXybFuV5p+gJ3M91X4z7wzvYVP8iqcc8eZHPeR0=; b=MnidInXzk3Lphr
	/9cD+wZGkSjmfhwVM19NzL6zPyerQkoUhaLh9Ox4L9b/mMAMA/KV9xyMLWrZmA6CLLYcbTtFRtEcC
	MlukSU2pTHGI+j/CMwT3mDrWB6Mgs8NIYSeVuI93CvklTQmOEmHgRoi0rWT8PTvBFqFfR9JIYlW1c
	xheaaVHxhbUwNHPIVkxTZ5kMTzvaDRFVeyyj46zvwEt4nAmqYuGmUYLBSuV1untYgnSi3okkRSMXM
	KmMf6M3jaAxOorGYnEwnCQcafbPElwsIGQ+OyUmqERWSJBexWtpR/vuTudC14W0UcrTe5zn3QV6GB
	hvZ+Km4C42GUzWdE91QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSenq-00ATrg-4T
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 14:00:02 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSenn-00ATqX-DN
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 14:00:00 +0000
Received: by mail-ed1-x531.google.com with SMTP id t16so3063739edd.10
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 05:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/mLBXwQk3w8rNq3af7s9rk+inKK5+Jx4um73ChjSJJw=;
        b=BF5FMHRxz1/4XZi7CzLSZUJ9WmKf1T2Boqn7gG0c9lpvnLOAuVCls50aMbuejQ9Ue4
         t1qK1XgPR3y45L4T5vOqdHjXJBk0yxBarYiHLmWu53tnVksU/bnPYN6Q9/Socl375so8
         f6a1EpVLBBvq+WOO5hYU7XJmedPLmmimwElIWUisytG7aPa8iB64tg8HCQLe3gdrR8P8
         fipIEHPyZTAbxrgqiy7ha+WJ2dQPUsFEy6ai5GgHeu0MEtFOc52jbTcgVsyBD+a+KfA6
         MLJBPNDeqq6K+p3rIg2RQTFZafNiyKRSCxFTW2xz0vhrQ/EzjVEZvpi/Rbop19D/O0Qc
         /dEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/mLBXwQk3w8rNq3af7s9rk+inKK5+Jx4um73ChjSJJw=;
        b=ol60WvVftGi15WjqmsAb9G5nlQym2bLfYCPQPxINwhtZmsz29Wl6VXwLmIjp2dRkiW
         x00Z+FDr4rsmMrqmq83lXl6lXA0fPG6SIoCbe14OAIP86lUMmIU7USzTHD6OM/gD7bQM
         axOO+sRhp3KJq4Mkwx1HCm7SLGLPWpKBNFMOl472m1zBQyqldBW4ytkHlycCL21QCdxQ
         iSSnafLKdZm6IvdM9B24ooRH+0licClGYb1NarDrjVI6zOgn3I06/iz9EQ46rUjMNx8d
         38SgXCSXruWJASa0ABDaZ8RpuHL6LgHcS7ELOdYoGkdp7JwXr3b3JdJWWq0JIlmil/y5
         svEA==
X-Gm-Message-State: AO0yUKW7riGtS9SKzSEkqjNlI3dNG5YJmAtuTbiiGsvxYmCH30Yq6siE
	uSXisMeAyQOVL2hgvJfhA18=
X-Google-Smtp-Source: AK7set80XAlkzGbUvn2n9QLT3Wb/rEx56CFGTGNm6sNyMcILxU+WB2TvU3LOH3I0OnGFL6pzzP52VQ==
X-Received: by 2002:a05:6402:3446:b0:4ab:4641:55fb with SMTP id l6-20020a056402344600b004ab464155fbmr5321274edc.42.1676555998209;
        Thu, 16 Feb 2023 05:59:58 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e26-20020a50a69a000000b00499703df898sm894352edc.69.2023.02.16.05.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:59:57 -0800 (PST)
Date: Thu, 16 Feb 2023 16:59:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: missing kmalloc checks
Message-ID: <Y+422WFdVPaDJuCe@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_055959_470447_24D07416 
X-CRM114-Status: UNSURE (   5.58  )
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

	drivers/net/wireless/ath/ath12k/mac.c:2792 ath12k_mac_op_hw_scan()
	warn: 'arg.extraie.ptr' was never checked for NULL

drivers/net/wireless/ath/ath12k/mac.c
    2716 static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
    2717                                  struct ieee80211_vif *vif,
    2718                                  struct ieee80211_scan_request *hw_req)
    2719 {
    2720         struct ath12k *ar = hw->priv;
    2721         struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
    2722         struct cfg80211_scan_request *req = &hw_req->req;
    2723         struct ath12k_wmi_scan_req_arg arg = {};
    2724         int ret;
    2725         int i;
    2726 
    2727         mutex_lock(&ar->conf_mutex);
    2728 
    2729         spin_lock_bh(&ar->data_lock);
    2730         switch (ar->scan.state) {
    2731         case ATH12K_SCAN_IDLE:
    2732                 reinit_completion(&ar->scan.started);
    2733                 reinit_completion(&ar->scan.completed);
    2734                 ar->scan.state = ATH12K_SCAN_STARTING;
    2735                 ar->scan.is_roc = false;
    2736                 ar->scan.vdev_id = arvif->vdev_id;
    2737                 ret = 0;
    2738                 break;
    2739         case ATH12K_SCAN_STARTING:
    2740         case ATH12K_SCAN_RUNNING:
    2741         case ATH12K_SCAN_ABORTING:
    2742                 ret = -EBUSY;
    2743                 break;
    2744         }
    2745         spin_unlock_bh(&ar->data_lock);
    2746 
    2747         if (ret)
    2748                 goto exit;
    2749 
    2750         ath12k_wmi_start_scan_init(ar, &arg);
    2751         arg.vdev_id = arvif->vdev_id;
    2752         arg.scan_id = ATH12K_SCAN_ID;
    2753 
    2754         if (req->ie_len) {
    2755                 arg.extraie.len = req->ie_len;
    2756                 arg.extraie.ptr = kzalloc(req->ie_len, GFP_KERNEL);

kzalloc() can fails.

    2757                 memcpy(arg.extraie.ptr, req->ie, req->ie_len);

Crash here.

    2758         }
    2759 

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
