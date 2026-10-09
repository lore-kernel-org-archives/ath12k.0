Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF75CA6019
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 11:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUHUFUY4NzCCSaGiOWXxAvH4BZ6AxctNDD8n2CNZFRI=; b=qyClCkFu5vlDARwb4NvXVJGihz
	oD88sigw5mNXLmDxTw7mS6TbXuKVxIDZ0ac5J8/GiNivGJVLPjF8M9nT132nVasfTYTsAJJIawVbg
	4MhCIGiB+KmUM1Xmq/nst9qZsDWpmLHPsG1BWpZFrSYJbS70m1rd8s1IMrUczA7l+GbhqnU4WWjAN
	XAYNArY2TRVjH5L56Xfo9SZXj0dVFKENy0lua4IduojV+xVEPXs9tZnijmw+ipTzwyLCAkkuPFsBN
	UxW1HDbz/AOI5Y8Rid/GLgMjcXhOSTQGOYPAeuxq065uOe/yRKXNKZKNcRFVKJmy+6rCN1J3uyKTc
	hLylertg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8Ns-00000006841-2iRj;
	Fri, 09 Oct 2026 11:03:28 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8Nq-0000000683g-1guK
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 11:03:27 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-678febd9307so1982569d50.0
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 04:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791543804; cv=none;
        d=google.com; s=arc-20260327;
        b=C+FNGbGHZto94fehQFHmTRdjpmblQB53eabgRyjIsPEFjBxeaX/71Gvr+C/3qU/vgr
         hvLEO9mzZCy40mxbBPBJkjQQJOQw7BYx4zeYJSumusxdi608/F01V8Y4bsuQHDDO7+QB
         UDjDQcsoTLT6COoUF/NDtJ1yp+5y330rAVPkzQ3GH+ojLaq2sbaH4UE7hEn6vNegI315
         bpr8BdHt/mmflS03noEATrXTQxqaAR5PPXzYMuT0zS8sn2tDPZ8xqrQfB3F6TmmcatpW
         3iaUx59zWOGtUtM+PNxmScgUlSSPBcxXclxce2bUX+TImtOXbOryp5FqME+hMqGfoyJ4
         hNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZUHUFUY4NzCCSaGiOWXxAvH4BZ6AxctNDD8n2CNZFRI=;
        fh=mmfliRDk5w1GRwTcgxWyYxmKdHX3ccCr6GflM6Moi7o=;
        b=fn75YqhwNGtI6QzpKXwVTcSk+aAfdiO/Q+w54aagc2UA0EqFpDWpNtpPnRCuEaAVze
         s+KNsZuhXbxdly8TTdrfkMz4HyhQ3vgWH8kJrAT6fPhgalGMoBGc2FENhogmSOKQE6PC
         wVPKQrV0qSKq/SLZb23ZoBMvAJ4bundbfj8kmTFOBkPB2JlpAbBT90TCq+FyO95iGkeb
         sV+AqiZGn5LUE5N8Dk2I69aY72g+BmsX7fx9E4JagKWgYNGBLlsyvTW8TUva+tcnd3rA
         VcZtyUrPouPceVw10O2uSy9uf4TECHGkrZh6LvZD5e+oCX0g2q2HU+lamS43jgr522dJ
         hZJQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791543804; x=1792148604; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZUHUFUY4NzCCSaGiOWXxAvH4BZ6AxctNDD8n2CNZFRI=;
        b=PRdnaTC7QE/aB1WgvRy7E3PBffidJAgjm/R1zKm1sUGR3htkQjNu/gy3Z5xBct5mty
         3Vb+xWiQg7tPLbeBthBn7WA8xNcB5etXmJ7icnRdqahUWzzrf6NKRf1Wws2D+SttT0Vl
         AqzJUZqchpkM69TzmSEInnjTvTVfqQCUv0cP0fWmP/DKnNzHYayxylOF3a/Wsq04OUE9
         FK1zJuV7w3Zblt+2Mhtr9wocRozpPg2Pa0V17j1BFGLX1mZFFDogJDeOeGcQbDuhVMho
         CkCEMukksJItx1C5hmQSkZFF747KDcbP/KF3StwdIRCw+3RENt7VQQ5Hj4QQ4LXzKAcF
         8iPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791543804; x=1792148604;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZUHUFUY4NzCCSaGiOWXxAvH4BZ6AxctNDD8n2CNZFRI=;
        b=BSYKR8aopChjr9IFwnv3P/P4vupsnw6ieg787oxBTHEtXA12CPi2Fii52qnRJ3nQlo
         B3cPinKngzhnx19icREnndB61oVoy1ukkqFPfiZ7Ing+e12eWuSO17DbV2b/6hqzCVjV
         WAbW0/o6U3ke8yRuQMFhN5p86b0/puMB55DvSjaHqdK7ZylmQJlfbkjqGgavTF8ZZAnV
         INu6QrWuIRMl8bEPnKUPs8ucpYrkOC5Gha9hb2zKrkGLEnu2btmS6o2xQAi6GNeHTPKV
         0QQBydwnkS8dQxWs+5IJHj5yvoTP7/oJaZ0HaEwhTXbWJXj3TQH89KAIr4G9Drw4hL6o
         ZwyA==
X-Gm-Message-State: AFq9FYIbtfbosc+RBtfBkennP64HpUdde9CVz/FyBHnHkRsQot2U54TH
	s8xXRwk8GEJgCR+5m6dtgoG6s28sgs2ZertQdBFD9kJyjvYRJ6nlRtexbk6DiS0eMAfE7gjkUJH
	1IU3Zx7vAcAoW2nBEigLGI8Jy6q4qn7I=
X-Gm-Gg: AYBFou2jp4EDsm5CSLX1HKrmhtaln7JejMAfs8L79GW1d3tWDNzmedk484F1uHHiGo9
	Zwo8ktaEBSVbiQR1nA9NALmaEsa/2/NrANbMFnZHTQ8/xxdBHus1xfSyeVCTyj7KXg2aoktG/L5
	iBNTfvk5srchY5GsTeNZ1kl5Z8p3Coa4gfTSG6jJcmlt18+Sd+rk22K46ANJ9gud+fOcWVN/M2S
	7mRSizGdMiwhkCSQB0cNLcwK0fa/KqKSR1C/sq73U2SRxQCpvaGLmtL8eSQc/p4GBa+gmGg+fwG
	QFRlkeh1bcAdmOroQZhQ9KPjlJpbrlJCMpgZ+dWeTt6TYrG+Pmz7uSjZhEMXRAdFIaE=
X-Received: by 2002:a53:d013:0:b0:677:c030:7d9 with SMTP id
 956f58d0204a3-679368f9972mr341121d50.27.1791543804412; Fri, 09 Oct 2026
 04:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1791408913.git.agent00791@gmail.com> <ccca0d5d087b862c3b41ab4d3c5849ca0dc2d32b.1791408913.git.agent00791@gmail.com>
 <e7181ed6-e14d-4fcd-a834-1ad07011b8d9@oss.qualcomm.com>
In-Reply-To: <e7181ed6-e14d-4fcd-a834-1ad07011b8d9@oss.qualcomm.com>
From: Nickolay Semendyaev <agent00791@gmail.com>
Date: Fri, 9 Oct 2026 17:03:13 +0600
X-Gm-Features: AclHuK8Wikn7f6BbrOGjigvQe4AyKjf4N1MfzwAWxqJ2Qv9Kxz-sdkvuemaMgOo
Message-ID: <CAOC=wvYtQ2ud-0F_YPV8pEP03LRZmDe02dwVJNMywa1X4OFF2g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] wifi: ath12k: make external IRQ control idempotent
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	jjohnson@kernel.org, wabsie@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_040326_479205_8898E868 
X-CRM114-Status: UNSURE (   8.58  )
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

> first of all, did you see any issues with current code?

I didn't reproduce a separate IRQ issue. What I saw on QCN9274 was
memory growing until OOM. I added this patch because patch 2 calls
ath12k_hif_irq_disable() again before freeing the RXDMA buffers.

> PCI already has a semantically correct and atomic state bit for exactly
> this, ATH12K_FLAG_EXT_IRQ_ENABLED, why not just use it?

You're right, napi_enabled is the wrong guard here. PCI already handles
repeated disables, so I'll drop those changes.

> As for AHB, can we also use ATH12K_FLAG_EXT_IRQ_ENABLED?

Yes, I'll use that flag for AHB in v3.

