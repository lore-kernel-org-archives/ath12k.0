Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8C1C04FFE
	for <ath12k@archiver.kernel.org>; Wed,  8 May 2024 12:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hrrGPAq63QCB3MtkFDf/C+/vtNGFMQ8dGk2GFJgvSrU=; b=o7X/n8woS3FIp86r6Jkd4KKY0i
	bf02nFlh6oK264GQuD0bAnRiFOq0XSED199k8HthVTgPZUaJtRWObKVbSfLc1yASLqRThOQf0IEwR
	Zzt9L1LgocBSamHDhMFKNj4uodhZ3n5pggqkqtRGdxKbHkFT3DGKcbuV269eiCWSMquImIjPEznDb
	S7YTC1sxJWeNiVNdgm/vnhPxknrujYT9qBaLiL9Ackk4oXCp7sO5L7t2KDv1MV2v3W0hm56NACKQl
	SA4egi8doGYzaDMj4Ba0dFX+ZTE2T8k6eYW2SBg65+Zs3VXkkzQBQD73NmQEHGQo1JvgaK+RYp3Kt
	0SrbG9lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4gQV-0000000FRBr-0JDb
	for ath12k@archiver.kernel.org;
	Wed, 08 May 2024 12:29:39 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4gQQ-0000000FRB3-1pFo
	for ath12k@lists.infradead.org;
	Wed, 08 May 2024 12:29:37 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a599eedc8eeso1018521866b.1
        for <ath12k@lists.infradead.org>; Wed, 08 May 2024 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715171369; x=1715776169; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hrrGPAq63QCB3MtkFDf/C+/vtNGFMQ8dGk2GFJgvSrU=;
        b=gI+50j2uIVTiSQAXcPjFn5FR/GHZgKkKP6476w/IIoUoO0NnSeb/8+kkGNJl3Vac80
         QorHTwAKqh5TDWRpwXGue3P31YWfAAQOiG81utJOZcOwRffxnyO5Bso4TH1eo4EIRbWT
         iGB6HpsAjzVBQJmUybWTUE+fGAu+bzmXq3AozbN0K6zLUyircT2sb76CdVEY8JTG+c3X
         XnRm9gXbIDaaht/gUdrcdgyZAIKvxPH4NVlgHXAHDk+1FLwvRPLy2wXx/Emr1Nv0CP55
         D15P2kPJkTG8itpQJJoW9jKwrBMP1XPK8HjOA90trH8sBZXKmpzNQQ+g8GCLrFXM5DT+
         l1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171369; x=1715776169;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrrGPAq63QCB3MtkFDf/C+/vtNGFMQ8dGk2GFJgvSrU=;
        b=rGXnudByejHMokbWhn3ilBbARB4biIQIEEAdvCetR8kXkRGGd0aGBMi5Y/3qbChiNX
         o2MUFuCuo/9hiKslm9yu0A23psuiwGHnNHacX7j48g3z+D78fKSuEJwhAO/S2OvRHz4O
         Pkthl+Kj7EY7r7JOpP/OZSaXaNzgopsl94MIhM13uFJsVJncT2D9smQFCFlSjpjVH6P/
         SF5DQtoyPi2r7DIlxsjvt+kc8aIVvzW0ODaZpwxjtmCFdWswtHOfopeFBonokxX4/7J3
         VPEntzx1qfXUpFVJbPAE4sPZDJBn5AGMeDiPUubmyQh1SH4T6YmyDj+FfadHGYGTO/kk
         Ajtw==
X-Forwarded-Encrypted: i=1; AJvYcCVcgNbtfvnHzMLJt2HAiLS1wKFqd3699eCWgsF+daGYE2HxnG9uJSAdMMJ1Ivt7K2OqekFWHikyFMmbXUkvjl6sbnJY5x5jCKIiXA==
X-Gm-Message-State: AOJu0YyWzhRD+0IoFWbVdH9T9Hj5Wc35QGOqzAO0FN8riAJm4ZBWGuJR
	XK4EfOzWA59jPWVVQs7fB7O1s2nIGLuxRLMAARvrN4ZoQtZOGyohTw9L9XbckPo=
X-Google-Smtp-Source: AGHT+IEXHT82LKEfyEmTpLYruC5p8iUP+itIIbvEMOW/7yXOm0eX3R221ONDVAoP2sIsVt2ksDJSQQ==
X-Received: by 2002:a17:906:6d04:b0:a59:d3ec:4f33 with SMTP id a640c23a62f3a-a59fb952bd1mr156424466b.39.1715171368851;
        Wed, 08 May 2024 05:29:28 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id lb14-20020a170906adce00b00a59bc8c01b1sm4562644ejb.82.2024.05.08.05.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 05:29:28 -0700 (PDT)
Date: Wed, 8 May 2024 15:29:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: quic_bqiang@quicinc.com
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: flush all packets before suspend
Message-ID: <7a96ca11-80b5-4751-8cfc-fa637f3aa63a@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_052934_649111_F55FE91F 
X-CRM114-Status: UNSURE (   5.10  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hello Baochen Qiang,

Commit 692921ead832 ("wifi: ath12k: flush all packets before
suspend") from Apr 22, 2024 (linux-next), leads to the following
Smatch static checker warning:

	drivers/net/wireless/ath/ath12k/core.c:58 ath12k_core_suspend()
	warn: sleeping in atomic context

drivers/net/wireless/ath/ath12k/core.c
    48         int ret, i;
    49 
    50         if (!ab->hw_params->supports_suspend)
    51                 return -EOPNOTSUPP;
    52 
    53         rcu_read_lock();
               ^^^^^^^^^^^^^^^
Disables preemption.

    54         for (i = 0; i < ab->num_radios; i++) {
    55                 ar = ath12k_mac_get_ar_by_pdev_id(ab, i);
    56                 if (!ar)
    57                         continue;
--> 58                 ret = ath12k_mac_wait_tx_complete(ar);
                                        ^^^^^^^
Sleeping in atomic context.

    59                 if (ret) {
    60                         ath12k_warn(ab, "failed to wait tx complete: %d\n", ret);
    61                         rcu_read_unlock();
    62                         return ret;
    63                 }
    64         }
    65         rcu_read_unlock();

regards,
dan carpenter

