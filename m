Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E294C606A321
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uFTmIGq8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMpzJaoH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D+8QP49YMFroNM6RVv5M8lHNnUxyk0QDBwrPHQld9vQ=; b=uFTmIGq83Gzc+s
	5o5wfXrPQbs+mjXn0xiQtp2Y+3z6UcAfrr2ZhkJri+Ux6rRg9e3pJbWwtuvaIBhApiRXDsCQvcrVQ
	AGIEEbcHP3+rnuIZYby4ZkCBVlzvOpxfZD9Bk7IxAkH4MFkcNv0ioZyeGlVsLTimi7/98/ga1Zmk/
	juALMhRzA6vGKQdWPmY2JKCtKxLsYC666451EpY2ObNH0DYneCKFD9rpU6tSx5GAlkAxTlkCaL8Y+
	tyyj7Be63vCure9oQOxMJDM6PBzcvyKEzB1+3BNytdfTQZLjKrA82I98t8wsJjITDC06QoCn2LQ8L
	PKeuHYEbjSnXD2ZHXcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXLAT-00000000y6J-1TRf;
	Sat, 28 Nov 2026 16:20:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXLAP-00000000y5q-3BLD
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 16:20:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso35174105e9.1
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 08:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795882847; x=1796487647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+8QP49YMFroNM6RVv5M8lHNnUxyk0QDBwrPHQld9vQ=;
        b=FMpzJaoH3w8x1P3BBTPfXDiagKcLRT098rwDvVoO0DlCNAWMq31bPrOyhi8mcedIxL
         D5FnzoO3M7blxdc70PhJc51EZ9htCy7PZJVJOciaFMU+qU1dFRvkrawiDucMYwWv6v9e
         Kf9C3l8tCtuceZREzY/Ad8ChJV+EmcWwnWVyPQGzx+lArvU6eesMyNu564y9YPlYo4Tw
         Yn+ssjyPn++qcOGR0kwkQPNNLHEnULAPdQPs2l0ZRWucr9QpPVlo21kUwkPV+AbWQrod
         FLIAv6WoH4Seib79/RWO2knyjEOWrIiVyGPZ/oqCrAEdcgh+mPJDv5wmuhNBStww/E9P
         yo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795882847; x=1796487647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+8QP49YMFroNM6RVv5M8lHNnUxyk0QDBwrPHQld9vQ=;
        b=JS4df3SYV93WTwZ8mCS56Df0g8GFj2agaeCM6l3VZgLmQ/L5g9ZlWVbgaHfLazTL3g
         kdVeIjHi85ETcZKcsd9CBqbURQsaA0KKfapDvvB6pHr74610TWvA/nrAMcTwiv7op5yF
         nVo63E0zOI5Uf2J/uNzXguvMSOVqhohea9zSk8VlfuzibCbAzxQNVfa6cKGw5iNDmYsy
         qh4XJXmAhlrSKk1qLXH7gUiN7fxT2JXcNHgMAWFYfBOb5/bihlJxcnNKtTlA3QD4AY4R
         0rjsd4Zyc8QYYZN41NoK0uurfKz2dj7G/9+W/E/x46WiaJN6pUAo1WAss6B+OHNm2K//
         +9kA==
X-Forwarded-Encrypted: i=1; AL+hErHpg2535QWK2wfxPYIkdiUyxbcyhD88GBRPZlUfZVbbn9Kpg3dNoY4nTFiiH6a1OwoBwPRlB8A=@lists.infradead.org
X-Gm-Message-State: APuU4Z8LHftJt741UmLdRjoEPJXY6CdgPhctmz9CqRuMruJcPPxBaY++
	9lpTCUQuAiSDd74NCvSNTSxrZLqpRInhY1p1MjD9vAisTqtjeT4h4dgE1pZIMcE816E=
X-Gm-Gg: AZFdTZe8PSkqJY1ksZwhGtzqlRrvPlRPs5DuZHuYzGAfK7gUV+7CY+gXuwVmolmMMSj
	5TgoF5u/zM2mrd1s8/XgpNZHteAbltFZ7S7t7dvWD8HFdHAOnQJ9AD51rukoV0eRAEzrlcY/Uac
	gEPJX4CTTh7ju40Ub1Lf6TXExWbiA+7wXfq4dYK9zhwG+xjosSj6rD/cK5SyjVyQcJHMyCm1O20
	9ok6qpYWg783ZtLoolQNLvBwqwEA+Ia80eklNFZr8HJMMEZCgQ7IdG6umkAZVU+C69oav6fKRAT
	c376T5VaufLWO/xks5UveblXpBIxLQO40+qaB/O4dsBX8Fv4PuXNqzt1oeq7yqKd89BV5uoavF4
	oGWIk8v8shc9wMH4t0Py0C2fYqQcJLbYah5sT6FOhN0O4WmywjaLL2C+IWcIIwPMqEcfQTnbD0X
	iSZ5lhJ+3lsAjPi3mFxETGmjBmsAv8e8tnYohYabGNjvyy51XfPBOiTZMqBdNyth7n2TRd3xSxT
	vD5FJhMD2LzCG5tGMuH7E32EBCFjAZJfh+nqVlf4tq6mFlhJTiWo98X5LRwlgZhQOaK1Ff2cThe
	7dos1Xlg1PeRuarbmqE56TTOVtcASqGJFmc/EYoqur0=
X-Received: by 2002:a05:600c:6744:b0:4bb:afae:150d with SMTP id 5b1f17b1804b1-4bbafae24acmr162024675e9.33.1795882846959;
        Sat, 28 Nov 2026 08:20:46 -0800 (PST)
Received: from fedora.kevinsoyer.org ([2001:a61:25ca:5000:edf8:6430:c80d:924f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm819054785e9.3.2026.11.28.08.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:20:46 -0800 (PST)
From: Kevin Soyer <failforce@gmail.com>
X-Google-Original-From: Kevin Soyer <Failforce@gmail.com>
To: baochen.qiang@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH ath-next v5 00/11] wifi: ath12k: resolve RX link id via logical link id on WCN7850/QCC2072
Date: Sat, 28 Nov 2026 17:20:39 +0100
Message-ID: <20261128162039.18561-1-Failforce@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_082049_844600_78AAB8DC 
X-CRM114-Status: UNSURE (   9.06  )
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

Hi Baochen,

Tested the v5 series as merged in ath/ath-next (HEAD <COMMIT>) on a
laptop with WCN7850 hw2.0 (Quectel module, subsystem 1eac:8000),
Fedora Rawhide userspace (wpa_supplicant 2.11, NetworkManager 1.58).

With the Fedora 7.4-rc4 kernel (Linus tree 4dce97c6c265), connecting
to a Wi-Fi 7 MLO SSID (SAE + FT-SAE, PMF required, 2.4+5+6 GHz) fails
every time: authentication and association succeed, then the 4-way
handshake times out (reason=15).

With ath-next the connection comes up as MLO (valid links 0, 1, 2;
links 1 and 2, 5 and 6 GHz, active). 5 of 5 connect/disconnect cycles
succeeded with ping OK, and the link was back with ping OK after a
40 minute s2idle suspend.

With ATH12K_DEBUG (debug_mask DP_HTT|MAC) there is no PEER_EXTENDED
event and no "failed to get peer extended event" timeout, neither on
connect nor after module reload. So this firmware does not advertise
WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT, and the host allocation path
from 8/11 is what makes it work here.

Unrelated to this series, and also present with 7.4-rc4: on every
disconnect I get a warning from ath12k_peer_delete_resp_signal(). The
HTT peer unmap for the partner link arrives before the WMI peer delete
response, so the link peer is already gone. For vdev 0 the order is
the other way round and there is no warning:

  htt peer unmap vdev 1 peer d4:0d:ab:33:b4:64 id 7
  failed to find link peer with vdev id 1 addr d4:0d:ab:33:b4:64
  htt peer unmap vdev 0 peer d6:0d:ab:33:b4:65 id 4

It looks cosmetic, connections are not affected.

Since plain 7.4 can't connect to MLO WPA3 networks at all on WCN7850,
would it be possible to route a minimal fix via ath-current/stable?

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Tested-by: Kevin Soyer <Failforce@gmail.com>

AI coding assistants helped with the debugging and drafting this
reply; the results are from runs on my hardware.

Thanks,
Kevin

