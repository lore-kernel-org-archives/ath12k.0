Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DE4606A31A
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 04:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XvjhqPnO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZoD02Hvp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ixvNCvc3ElMgxUSC7xZq0g0AIW9Y+WnUXNOWMqR4I1Q=; b=XvjhqPnOnJeX2V
	zZaI/7T0KP6HnJXTAMgDNh0oHZZArN7A8gwIhBOlSLjc7c2w9wlMRa/3IfiWnbPs8v7FdatY9F/+e
	HL74+yzlPXL/UEv6wrldC/tebbQd4ZM2cx1ve6n/f18U+atnTlJjxGsOQhvzgjeO+gW6c3xqq2rEW
	aZu2+R9IynLBoo6AZ/ghFyvAfQa+xObhW9g7AtHOw0z4BwKtNvLISfeKmLLXH6MyJJw0rLkp3sFYt
	p60TrqncRYKFtcBWkxjn/r4nRqVN8OgQOeTOneql3RwBM7iwrVhe6E6AoE0X8RaghKtllFt8jxPy2
	WoIXvrRhDe+YgSzoX7Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMe5X-0000000AnoI-2zE5;
	Fri, 30 Oct 2026 04:19:35 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMe5V-0000000Anny-0H91
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 04:19:34 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so144376a91.1
        for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 21:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333971; x=1793938771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixvNCvc3ElMgxUSC7xZq0g0AIW9Y+WnUXNOWMqR4I1Q=;
        b=ZoD02HvpGOMC/CdlEGrfGXDlXI+wQ9DQHbF8o3gK65+UaC+MZcfySd2N+Uf6VmjVRw
         gVHwm3akL8tpboQCxsbAhLQb9sHNZ2P5VL35xJYJKHh0qg0qXGsPxXQgJHCKVQBKUVC7
         GxVUiCRcjPLuyMdFI9McerqPYYkluaB9yZVCM0BMVwiFzTnMs15BcVmlDasZs75VOfw0
         /rJSDfFMOPhGX5QxgrdJ3VGWT/qrMWmd3y4FuH9Rc4dJUkmlJdo7Xl2deFRYqL39m5kb
         YyjVVIO2mNbPaSJBnnkB/obzbQGfMEf5Qroj28l748N9gwzCT/22LJAVFd4bnxLGx0MT
         vlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333971; x=1793938771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ixvNCvc3ElMgxUSC7xZq0g0AIW9Y+WnUXNOWMqR4I1Q=;
        b=NEOgk1FLIncoVCix6zwbmzLK06FJCLkC9HNjg7Pdc6h03IXWcskwOCZapwA011e/r8
         g4/G8a1k9MM0rtlWSDQ3ZokIvHn+d7nlw5QOh9DmtYYhu1NLr209pDO9qV5yoqsaLLZX
         17czYXmkKqdIo9aJPccyswRXk20yIdIR3FlW3+LmaQpJ79L6GgAGC4F4oaF/EI4Pmiva
         7akh+CIi6/M0B+UrtoKPSYQay/ahr2jZ23Aikt+TOb8VpVGtMfzTjVJoMUe3GXKIjcRs
         PH3qD5FxOfGfDh0qTwlK+HRdAAtVGTGzniSWLxbWtbuKazxUB8J6JC5EbAmNanE7o7EM
         TYIA==
X-Forwarded-Encrypted: i=1; AKwUvByVouoVTaqRbD5MhHxwCn3vDCp/m0viGy10PKWdvS5dl3mrFlkixhzcfudAbuTBJ61QBRw0pRk=@lists.infradead.org
X-Gm-Message-State: AFq9FYLjAoauWjSFMqxWkDTfWdHNO8l2v3WtOkhjNcnoq6lpHFPaMs5C
	WVHyoi36XrhsOTqS9yH1Dg1uVvUAxOPqK5HljadTwda80smNeVVOdkM=
X-Gm-Gg: AYBFou3iVGcYjmVafXS4azhXIO8AP9gmG+ZGRIpKPcvtHpWd/wIc9BpUKfLgPQJBT+x
	yZ6y0JZ9z7lGF/3blNysw194YShoUhj+cDo251ZMaS98lML85QbCE4WsWKuTjBYUcXU86sae8Bh
	octJAyIfF/e2T+sPIGAu39saqTXnk7w0qDohc8dwycNRsAlUys6HNpfmEeOkTZHcdU8wuoEyCOn
	rvVw2jFR8FLB631g8/8lZp1RXP5tzWzS4NgPV5EqRyFbetqJOuwK0VYGaO/zTUOcoCTz5XhrWiY
	vLxmKiYGXaGJpvMmEpAlFXEUDRjTLE1b5mIgizjbHcS1UeKl/WqjI5Z9knZg5e5tzDsS/s9hsIm
	m1iqWe2vKKdTJhz/CjReSmpLPOz/bmj9TcdvXmIGo0m9+aGI/FAjjPbsKSiP0L5kg62CuRPD9Ed
	Lvw+awMVBHBTOJX4kSdIncY9YUqLfGD31+5lxGDqb1FRvhCOKzBWX1aNb1chPRUeJDT5o/un1UN
	pM9vhofcy4sfuKOT48Y0tRAIykZZyNdseSXfDjM9n+V6MtCbJSgiZKfytCppYPfsMENmUmFjSLq
	8sBue1AssHVeYVNu82nBoBnSiS/n4+yXjkopiRMStXIreSStLJuTgWBFPCdUxvLS49dp
X-Received: by 2002:a17:90b:4406:b0:3ac:b6eb:e0dd with SMTP id 98e67ed59e1d1-3ae8984de49mr744782a91.50.1793333970822;
        Thu, 29 Oct 2026 21:19:30 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb1bfdsm1030302a91.0.2026.10.29.21.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:19:30 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: jjohnson@kernel.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH ath-next] wifi: ath12k: fix MLO 4-way handshake timeout on QCC2072
Date: Thu, 29 Oct 2026 21:19:01 -0700
Message-ID: <20261030041902.2740757-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com>
References: <20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_211933_111384_93EC7BAC 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Aug 15, 2026 at 09:43:29AM +0800, Miaoqing Pan wrote:
> This is observed on QCC2072 where EAPOL M3 uses the MLD address,
>
>   deauthenticated (Reason: 15=4WAY_HANDSHAKE_TIMEOUT)

I hit this on an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite)
with the on-board QCC2072: Wi-Fi 7 MLO SSIDs (SAE, PMF required; one
6 GHz-only, one 2.4+5+6 GHz) failed with reason 15 whatever the
association link, with M3 dropped by mac80211. Non-MLO WPA2-PSK on
5 GHz was fine.

With this patch, applied as posted, both MLO SSIDs connect. I tested
on v7.3-rc5 and again on v7.3, each plus out-of-tree Glymur
platform/board patches; on v7.3 the tri-band SSID connected as MLO
(on its 6 GHz link) and rejoined MLO after s2idle resume. That tree
also carries your separate dp_peer fix (8b6b871332b5, "Fix failure to
create ath12k_dp_peer on MLO reconnect"). I haven't tried the rebase
onto ath/main that Jeff asked for.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke

