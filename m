Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AAECD98F2
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 14:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/BP8S3K7EAUl7PQnFjVmpuzHDdXnjTm3NfjEHjajEM=; b=lB+n/4TYnwltWSaHCDuoGI9Hyp
	qps6cpz4J27tHqQwV30o+PtHxnW5phjVqqvh44xR6p4m4Q7YT7QXWKLC6zBeRC0pw82VjOJhB3IaT
	UvlJuRWIAxTk4AejtnDHhJLw3IcVKkk9ytYGQDyHdnrdmo533A4dqOkLPMotkFyA9Bmvux9m9ZQjc
	phUVNp/CKDsLAt0yiowSheQQpwzbAlS0bHdJFb5qaChaGPQaUba+FSZiGe+STsrQl7qcl7Cs/M3UJ
	iPPh2FYVVoDVpe3YRtuobGhjtSqtuAnnfnB3g5n5udgJ8/szprw0W48wu9ai3v3Ij995oU9iXqcZ3
	6tlGYH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1uY-00000006PmK-05SB;
	Tue, 23 Jun 2026 14:15:34 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1uV-00000006Plr-14rR;
	Tue, 23 Jun 2026 14:15:33 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id A1B8F1D0012B;
	Tue, 23 Jun 2026 10:15:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 23 Jun 2026 10:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1782224129;
	 x=1782310529; bh=2/BP8S3K7EAUl7PQnFjVmpuzHDdXnjTm3NfjEHjajEM=; b=
	fWYbk6fkCNJC0bClPCw0ReBNdY4hN50DXQBD3DzXZQlrOQKgfkztR1qs6Z1B59lM
	mXq/zyIRZQrmHPdTdXkxYvjCvd20lyfjz2/V29HoOovlhp6A4DOzlzMdyapJtjhu
	5r1/IDqtzHbH+p/xPReg6U2FyANt6gLsceneZbidHLLxUiKNPks+heZBIsC2ddJx
	tj9TqzPSKgFxvaTeiO1Z7ZKj6GJcgk/YMtBaOH1GSWdsehZYWR+gxk8d31tcLAB7
	BwCF1YHE7yibxQGzSU/6HlSkZW5Yy79reIBWOfzzbrlAtJyaUb4sJTNCVIObJE/N
	e+ONpLAI6slz+TUEjkLKlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782224129; x=
	1782310529; bh=2/BP8S3K7EAUl7PQnFjVmpuzHDdXnjTm3NfjEHjajEM=; b=d
	5wFqDmeEoZULivheN107RbYoHR/AiayXFajvfWcvzOueC9a/OpQjUk33AW2s+wud
	S68bO7o76KRqu60FLYGAFtdjOekhCIvpbNUQvN9P2kFfK5dDKG+23b47W5uh1dKH
	NQtrv3gGm4PxEvVz0SKJCN8keHi+WTw60m2vGmCgsd20MXveWNhrP2eG2e0JJpPZ
	XGVL//Cu9WN6xLVC92JF3fWr5VKpTZvIRAukXIbhptKVayPGbg3JXMEopYBue/nI
	WM1DYcuU6FyRQ/yXXhEaoFRZfSpdJlp1xqwDKtu5YVEnOpGgJtsMu+R6PD5zHa2M
	mHTnAHikq1lmBSf7knMrQ==
X-ME-Sender: <xms:AZU6amHwTQM9Sk9JhzlIL57NdDglaID_OXxTc38efbiZpidyv0EEmQ>
    <xme:AZU6avdQkVDsxA6PTEivIkdxE6go6uZwehI57pW0EmO0xQPHgnuzLF5JuFpdrzzA5
    _HzYk5Ez-ESaJyJIB4X93m9w_dCFsRg1t8d1Dt4g1dgWU-8-xGFwg>
X-ME-Received: <xmr:AZU6avpw6ntrmuenZorUPiJQ5HFCLxO4Tkvhe2qmLGChLDJ4-SslPzrcciM>
X-ME-Proxy-Cause: dmFkZTEtltNPcCC7LyAuhl+F6mArHQnqSrrLTwwKExrXFThrGIeCpx+D/j+xo8RW9Aeb11
    IjCJP2gJR3JeMmMcXRHHc6ZvZ6CmsaWiTS/tZu5AS4X6umxRyVu9/omdNSNMa4zgDvnwCW
    LmHl7a3hynDEBCupmG8oHySMy/FUCpt/Tz2sFcrjvGVk/aUa11z+/lCkvOUcuHixlVVZ8r
    ZcUMBKg/CR0J6Y4jXqGMml/9io5G/QNccl03ob3/2wk0l+xsige7kSbMveB3jq78qV/YSC
    lJnh42RgTRJ5DEmJdAK32pyA+wRJ2tisV6YI/QxALvNOt4ynidfjUmsGnjE82cfrTiMFNm
    QJeWWpu8OaaduqTC9G4JqO+pr+PmThSgZweCJkdbqnABYAEWMbRu2s+UwgrQFNeHMyJ2B9
    TtA4yF7PCrI2OL1V0CL7ZfbZUXqCjsSZNGLaoymRlLmk7NVo9O1WvtzIq2P/JvK15//DRs
    W3XROktIIlBGsMFb0efJ/HdTNaO4NwV51gGtv6e0mz1cdFy8X1g7YT3RSR6WcqjMgEC8hQ
    W7x5QwP9IvMqVwnjnk5g+5R9tzgZO5hnaHgqIeXtPG/3Avjzug8HPYeIQ5BmM7hhjRMH3o
    tu+rJbr4GLksDf7NFO9DUBa2SyH+iniMKm8SY7vOr8lhc80w/GmFEPPVxlWA
X-ME-Proxy: <xmx:AZU6agA1NamTjmN3RGC8XCC_HfwZXZ8gcqBeavb-hNqv9gn5uUZvyA>
    <xmx:AZU6aoeyNTIhZh0SplNYIa4iGoTht0cruMnDxc7-vk10W11yGLgr8A>
    <xmx:AZU6agvtI6tevKqtZpX3n4nO5Sf6_Ql9XeImd-itP6SErmCHQOJDsw>
    <xmx:AZU6anjaUc7soy3hM31J9HPENUmjN0SAx6sWHgA8luzAM-jxLmRpPw>
    <xmx:AZU6ao6ItSUirKMV9MCX9Mu6m87XTdBBQkDexvO6oePbn2MnQCEz73lD>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jun 2026 10:15:28 -0400 (EDT)
Date: Tue, 23 Jun 2026 08:15:26 -0600
From: Alex Williamson <alex@shazbot.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: mani@kernel.org, ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 bhelgaas@google.com, jjohnson@kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
 mhi@lists.linux.dev, alex@shazbot.org
Subject: Re: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
Message-ID: <20260623081526.1366a16a@shazbot.org>
In-Reply-To: <20260623125637.1188867-1-jtornosm@redhat.com>
References: <r4jeqtx247iosfjdps6g4fqwtsdzine5qlgh33sdt4p6ktmaln@o725aolrpj4l>
	<20260623125637.1188867-1-jtornosm@redhat.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_071531_792321_9D05FE48 
X-CRM114-Status: UNSURE (   6.34  )
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

On Tue, 23 Jun 2026 14:56:35 +0200
Jose Ignacio Tornos Martinez <jtornosm@redhat.com> wrote:

> Alex, Mani - would you prefer a dedicated VFIO PCI variant driver (similar
> to mlx5-vfio-pci) to ensure the reset logic only runs in VFIO scenarios, or
> is the quirks.c approach acceptable? I can implement either approach.

It should be a device specific reset in quirks.c.  Thanks,

Alex

