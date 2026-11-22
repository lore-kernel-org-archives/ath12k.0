Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9C5606A31A
	for <ath12k@archiver.kernel.org>; Sun, 22 Nov 2026 20:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EDcJVsNf;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=b8mnOV3V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kMg+zjgW2qcP+kPRWz/Nw5zZ3eqt0jtFvOR/PqTH4zY=; b=EDcJVsNfRS8w6q
	TnV8udOfDt4mxL+JtOTgHa4eA4intmnF/Zj9vA362rWoGx3CuuEitazuHYVQtdkZGPQzrMQIoMToG
	5RALfem6ZiJdED84zbmNM/XtkmUJ7y6yRMEcdu4/5Yy1AKWSig2Ru0gBhY2CI8GiiE15DOIX4qxyu
	3rB6Rn8EG1gg2Kh0J0LGUPmzB9kXQgRYjz6Y8jzkU7olv94ewdrdzPhw2oW794Js1O2nsekPsulna
	1Ejw68fLAJzintBidFm1AX8hhnEU9yOVRrhBmdgbVGWhfhc0LDfAnZ/KUCHrSnezFi+kjpQ9lfKMy
	eQcNtXra1UDpKW+tUpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVELu-00000001jQq-1FMu;
	Sun, 22 Nov 2026 20:39:58 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVELr-00000001jQD-23yb
	for ath12k@lists.infradead.org;
	Sun, 22 Nov 2026 20:39:56 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso3579586a12.0
        for <ath12k@lists.infradead.org>; Sun, 22 Nov 2026 12:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795379993; x=1795984793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMg+zjgW2qcP+kPRWz/Nw5zZ3eqt0jtFvOR/PqTH4zY=;
        b=b8mnOV3VYqiNxxe3rRTbecLtfsABSprkSaZTmVwomA0ZAZySjqzt3F1ntDjMog4Gd1
         uSYvY/N2Flj/A16ZSNNCxy/6DwF5IcEulLesjsDkqRE6Ej5XinwKM8kBDq30QuYu5Y+H
         9PnpNYfh7lLcA7rP8mnmks8lEOj0HexXZ54NSFDWSn4iSxn6VhUB+6Ho97ZYmVJKE0DB
         ztnixogUgfWnrzjM8gRkyxZGY1KllG90IAnRvC14w5f5usE2NvDahKNsSySKnfZB9CN4
         IrEToM4Y9MoFUtFf3IvVTv+RvIZnblf7y6QmGygLHQWDFVIl2+19/11m+Ce7zvrp1xx6
         pVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795379993; x=1795984793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kMg+zjgW2qcP+kPRWz/Nw5zZ3eqt0jtFvOR/PqTH4zY=;
        b=AetXqSFN6hYDVK3geeUwUsU2cXrTm4w8+Bnh5InSwvnyQM72zAipF92IXYU48jhDhU
         KEg+mOGu8Ek9igxTdVXgyra4D+1XIRetD+x/pP7vdctBv0GczKuNw3geFZauL7B9+iBj
         A/0lYLbrdVIIlxj0hv4oiSIuSXmfv2v6hDEq9WqaAPwarvB+sjS2CX03m0OZEt/2qhXD
         UhVwTa/OrLcHwhpRUlGM9QcQLK1Q2Y4yAOscONKzNQfO/jvLnRHNF/DHMvNnC4+TCLqf
         +YonnYQ9AGHHmzJNzvcx5he0D4FQ28eHPdBM2ZgnKpczaIrti482hGg1slPEY/Pvu2oT
         krEg==
X-Forwarded-Encrypted: i=1; AL+hErEWc+kFwQSWAspWWiY0tHhuTaMmHEOa6Owcy4KK4Thb/7NYNMSHw95cJQtiMPdJZFTetXLpJsI=@lists.infradead.org
X-Gm-Message-State: APuU4Z+xQ2Eb59X74ZzmX7fff/0s6J83jGAl8NjfEfWuH9PAerTQDcDy
	mkpH4X+LMEve9LhsKSqUXL+SAaHb9KJZQ91NamFGP6veuLs26uUQzj1rGAXqUKDHjG5343TdqKP
	+/gc0WGjW
X-Gm-Gg: AZFdTZdJXj0WqaJwzcZZWjOimCwvbMOiOocPKSj7IZTCZeJHgCQBRlkzmRasjn7W0U6
	LQwUr3JmtPM5FQVsLyf9keDVDpdBWnVvxOz6oqJdpcjS79ZXNu9SoL8uYVLePXwiooxWUPaKxz8
	fNZ0WwkTDzRRbCDJeLK5e17x7k6rgYPaD4oiykscKJUBwox9oGusZIyA48UrCJEZYhLw4ejAdLC
	Kq7Oybu8CZfZydCLTveXBXZ2V/WNvyjk0wJkg76GrgE73NF/XBjCO9pWWc6I+Y8pjyK0XVM+Kcl
	S8MTm8RF6V2NT216UOgd6hBQ2qX2uj/Q/+ATKaWwoP+0ObtzaP5H6EfVyYNhrlNBtL211OxLUCB
	QMxeWOw7ZKybYF0np1B1lhHEP5G4pAnwhSMtewxfGDlPpb3xLRF1bAl4YjHUrzgdfnvhjFzcwdd
	rxZlRiuWAYgTxrXbIkJ4+kjZkRgu/jDZi0GjrHTXxotncVCKXE94fI77ocBr7wjSfaDTve2f7Zy
	ELCjwbkHEO7t91ZRXUfpz3zeLqZEz2n6AGWBg/vBlS9Mf0XAjVMOwqKQWEo+7JLc3vUahvxald6
	unrHH7BFaSsVdPv2NT+Am8ka6qQyYKrcNtdZDmWR3At3tndvHiwgUJOc26WW9V5djjjr1ugN620
	LyTFfejcybLXB8Svn1TbTMTlJ9ejAdAMXef7v/5DJEW31FpWlaMqwqiNCj7ngVdtnjEFLpGlUW5
	VYfaW+7g2jJcFvSWkvcPV2MbRkc65a51bc+Ord9rKpdnAQ2PP6WxZTU4o/B690vC/s646YXWiaG
	iukIoMJ8eKJeGqaVhfMVsrSz0bLBxB/fChlPVHd4HJ8vm3781PSj+34lCQU1KG7Lt68x0j4Cl+u
	afApwoT+V9LYLm6OTr4AN1IIo9gxPOZRI7idT+ygFddFZqbHtH4vTYR5+K6YW/uN1TGnu5o6z5w
	x
X-Received: by 2002:a05:6402:1e8a:b0:6ba:b1fd:6e6e with SMTP id 4fb4d7f45d1cf-6bab1fd70a4mr818185a12.31.1795379993206;
        Sun, 22 Nov 2026 12:39:53 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713cc00a54ea2c7a4b07bd3.dip0.t-ipconnect.de. [2003:f2:4713:cc00:a54e:a2c7:a4b0:7bd3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm4295727a12.3.2026.11.22.12.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:39:51 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: rameshkumar.sundaram@oss.qualcomm.com,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 0/2] wifi: ath11k/ath12k: apply the 160 MHz NSS ratio to the radio
Date: Sun, 22 Nov 2026 21:39:53 +0100
Message-ID: <20261122203953.1830745-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c1acfddb-2132-426f-9a23-472d8339dadd@oss.qualcomm.com>
References: <20261021165138.388593-1-julius@bairaktaris.de> <c1acfddb-2132-426f-9a23-472d8339dadd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_123955_566325_93C979FD 
X-CRM114-Status: UNSURE (   4.40  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 21:09:19 +0530, Rameshkumar Sundaram wrote:
> Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Jeff, the series still applies to ath-next 1983b40acfcb. Is anything
missing before it can be taken?

Julius

