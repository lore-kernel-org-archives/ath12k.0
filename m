Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E0E606A326
	for <ath12k@archiver.kernel.org>; Tue,  3 Nov 2026 04:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q+cZkFqC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MsWJIyvS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KH9rI+FTAkxuqkR13fgxbhWlIQGCWTpzaXY6qAYNOw8=; b=Q+cZkFqCgkcIIq
	M9UKrcE5Wd+xW+NJJ56DK3GpQqNEw32Hbulwh73ZXon5dWzIZVWa+a3aoaTxwDBndPyszAmTWQzpl
	QGFmhGN71lduIuYaUW5frOoQWqkiZdKOMhSy/wxLCdYc4RpCgQUFJKrWe46ydqIjxCqW5HUONmCrX
	mEvwjPto4pcMVd64R4zvh6x8jyj6jfmNnYsDZj5g0+npV1xjPvUmH61tE5zzEWM9Qht2M1/xTtEEE
	Xoq6TPhnpVG9m2pbR6n8kOB72cFqgsK9eFDLWy+0vjWwGTl69cmbUCePT2w2526s6z40PFsIWRrR8
	4wYC+vX7kzZPPUeppIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO5mJ-00000000yfi-1QYi;
	Tue, 03 Nov 2026 04:05:43 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO5mG-00000000yfN-3hnM
	for ath12k@lists.infradead.org;
	Tue, 03 Nov 2026 04:05:42 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so4068598a91.2
        for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 20:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793678740; x=1794283540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KH9rI+FTAkxuqkR13fgxbhWlIQGCWTpzaXY6qAYNOw8=;
        b=MsWJIyvS1El1hUYeJEttCj9BG1Th0wWiXcv8bvheGdQbvzO/Zm8DZiF6Y2pdhbay+r
         JjCO2zTdicJt1XVjSv8WVwzVmDomBJDlIdw2d0AF3iBwk66s/sCnA1WMru1/wjJvTYIr
         KtgUL44PcvRpFVbpi5G4bRfxMfYc/tQJXoL12rPlG0G+DXOkdWT1acrP91xCTJm2aCzb
         HIwpCKlPm8f70WJP3BhBJaNfkY7JqjOHVrEy10wH88seBhIN7bKExKWTclfbb4mKLyif
         FEfRXSjey2PI1EWNS215+/LhV6U6VKIy5e9WDufWrWyrlRmPQJLjGEptrJHFxFAoN0g4
         yHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793678740; x=1794283540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KH9rI+FTAkxuqkR13fgxbhWlIQGCWTpzaXY6qAYNOw8=;
        b=E1MBi3dgRmYAYtwexxk/NmIdqoGhzWSFSmI282eSRiN+XCmJAovSON/7oS4Xoc+i19
         hpUlPqIELIE7CpvLu988nGQdC0M+KS5iONi1L3I75BQKrYL6P30J3+X6zILk1xtDga3P
         6pcR3lrvI6uROvRfU7mgVF6+U609eI+VYfIXvPfdHr9DOT088dbenDvxzP0T/0JnW0YX
         MH+tLepTbF2f2G72rEJIsHVtaRnVzG8zwykZMqEP7D3QVDB0yupPp7V5EUiJ2TsQgu0j
         wFaTpkvFIjjpMXGnq2RZwU/gZyS4KliNoVlZNV1HA/nEloipYt1UtdsXwk525C6VNSZy
         n+sQ==
X-Forwarded-Encrypted: i=1; AKwUvBxknmyOlp58YM8F1KYS6A4AMMuq6U4Yd869Fj3B3wRalOaAdzrmijXaVdzSCJuydgjcPO5lGWM=@lists.infradead.org
X-Gm-Message-State: APuU4Z9IztyceXrg33FzRbl4zEQ19peTk7JuaU0H+lymOIgF1rH7pEwX
	HmCuqC9FVTXbLPJ9mEPAYU70eKn8nivkaKcQNwUFMNjnbyQkXE3CGug=
X-Gm-Gg: AYBFou2VQpeqXVm1a9OdI++9VZn5RB+50yMuR1EVQ6LpKFvc1ZV+nqV2ZKObeACf4W6
	g7nfadaZqghUA3ukvvvlW+2mJwnJBZcTYqaSMWIMWD4T6mKwqA0RpX7Fr95U6S0w3MFokJUssJs
	pAMdPA+K0+VvCvSw2eBXN9Oq0DT0wHq99YXb/ve/tbTDM4YZTDf7AuZ30QViAWO01bmkSCtcsDH
	6lrhH8wE2RHhDz+FFa4/KJ4NjdhvIfm71ZODNXlRq5dD1Z2WiObeMR1r+5CqkXWcJK/XUsyHwFh
	hnYagNjl0DSeU5FwMQfljuI0XOsrv48Nx9fgdLH1gfdg7w6YPdGknqla7zX900VDz1EkpYND+T2
	3saHzI0H6fb0/mfDgk3sbMYr76t0SC9RffJHjno237Wnu8uAi0GInAdAxR4oPrBdSEd9w5D4Cj8
	jsVUL8Sw1WgKu//yn9DmbIIxgYiEVjMu9Q0OIl/t1f0u2PODS39j+keJmLFD7wQIrQzZddiw2kr
	xrBOSOe4DnBJ2l5ChsWgNh52Fe4Q+EAd7bPP8sxovRdKGJ7jzIgM3TvUB0sNDnB9OXCyjRH8ElU
	TOQGqyMZZNVGEe59sUML88lRjpT/K0YqysHnucg0opCtmvkUnNgGYx+DsOizY/FWz4A08ESxDzm
	YJkZbszShqLbdnw==
X-Received: by 2002:a17:90b:53ce:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3ae89817b01mr10006990a91.41.1793678739857;
        Mon, 02 Nov 2026 20:05:39 -0800 (PST)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5844acsm1965531a91.4.2026.11.02.20.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:05:38 -0800 (PST)
From: Burke Cates <burke.cates@gmail.com>
To: baochen.qiang@oss.qualcomm.com
Cc: Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH ath-next v4 00/11] wifi: ath12k: resolve RX link id via logical link id on WCN7850/QCC2072
Date: Mon,  2 Nov 2026 20:05:33 -0800
Message-ID: <20261103040533.3388284-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_200540_928394_DEA9F481 
X-CRM114-Status: UNSURE (   7.21  )
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

On Mon, Nov 02, 2026 at 02:38:09PM +0800, Baochen Qiang wrote:
> ath12k currently relies on hardware link id to resolve the link peer. This
> works for QCN9274, IPQ5332 and IPQ5424 but breaks WCN7850/QCC2072 which use
> logical link id instead.

Tested on an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite) with
the on-board QCC2072, on v7.4-rc1 plus c752394249f8, 02121aa4a012 and
1e678e37ff13 from ath.git and out-of-tree Glymur platform/board
patches, without Miaoqing's "fix MLO 4-way handshake timeout on
QCC2072". All 11 applied as posted.

A Wi-Fi 7 MLO SSID (SAE, PMF required, 2.4+5+6 GHz) that used to fail
with reason 15 connects as MLO with three links: 12 of 12
connect/disconnect cycles and 5 of 5 rejoins after s2idle resume,
ping OK each time. Non-MLO 5 GHz is unaffected. The firmware sends
PEER_EXTENDED, so the host allocation in 8/11 was not exercised.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke

