Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFAACA9ED1
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 16:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2A8uM5YoDGAXJ61F13Xmmod47Ap3MAHsB+2T9f5DjhY=; b=Iy5FMjTGtG25jd3Ad7+McHVhhL
	6nGbNQKgdQ5lz/PTHsdQFGHDDkg0/kqkFPmHz7pyB25WIqrD5s09IJnXAhVA+VVLVNfTCMd416ODT
	08ZXy/A6d539SGueiNLZ4Kuh7eQfUTTCUlUaZADdcnKkzKvPlyjcteC57pSOsBWvl2NbWhwZtFYPD
	xti6EGazubn5Urcx14k0G81O0OdyPiu+rUpW1Cyyhj579cg8dunqpSMsSaRvTLYysgqUq1fNvOSSW
	9FkkkQEhtaUboYDHbA933gwGwGqRFTQi0W6US5XRR5pcm1/jhr9EYXfM3DqA5S3Q+FJsFyBZczqSZ
	hQha9JbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJN7-0000000B2ea-0zGZ;
	Mon, 12 Oct 2026 16:59:33 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJN5-0000000B2du-0Qr1
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 16:59:32 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso289190eec.0
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 09:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791824370; x=1792429170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2A8uM5YoDGAXJ61F13Xmmod47Ap3MAHsB+2T9f5DjhY=;
        b=JT4xmGoUOL3pDCBTpCvVXTwh29dCQhGdfGY1e/gWnHos8nQBvnNpFhZLC5yUxcmD4W
         odTAa5UHfFVGuTEaeXAAvncwz01+rF0xvI23XJULkMVmAAoJSf/2zZYsqQPmeIH+4q8x
         /9yepNsBnx97RXafFpgKEN8/3uiX1TVt9I8xzgiiPwFBmoAqbbQYRc6aai6FtE64sQIh
         jCRSzRI8ygCzNQR3W3M3lF1w6i30LGauKU8B7z+KVRrV4/JGuGcQjYhKQDSmHzOGIF5W
         ZkWVVYyaDFi1/wIPqSWjWgiNErCYiGBcM8u1FxXXsJILhdWfJHrcZ6ZGcNFD9OH2DFVP
         RTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824370; x=1792429170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2A8uM5YoDGAXJ61F13Xmmod47Ap3MAHsB+2T9f5DjhY=;
        b=H4QvJf7g+wvKuc9CDL5pl5MpoA2WnqXFFFnSpCQIlTpjouPrD8KjeVefilyhP+SDez
         NKofyMlY3Z4Bi1x7VuapUs5djQZWTOUDM6wdU5lV2u7+3VmtfmWo3dSNSFUlVOEpRNqb
         RpvXhn0vf2PrfkzgK4jQe572jAqiI4nQaCWJZJ05Y5kFhxzGSMgHh214rYzkQLGkxtdl
         wMV8QJRyIskEBiu5j/6ZjQW3Q74XiyHrh3f0HfEYV7SJyTbn5rMyBR831RmBnb24Rm1n
         NQEoIWtysuChAqU+ClLSeEtllME3cVcJPQTOoVOs63LJon8xMMO+zjKI9E6W5a2on5hk
         d1yA==
X-Forwarded-Encrypted: i=1; AKwUvBwP3m2nCFyJ8C4UZcwzBVUa8iT8o+nQMZUDDmIAHSVtridPnf6jNupyWyUEY++ZmJtKKNKZLcQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYLfmzVFYevM/+WqGA6yCwe7X9Jj8hanwn0MDITu+ytTP6KWXTPu
	QdKa8+RVRfO2wD9LFrIOg2CpFvUNr5pfyBOK8JC3rQQjvoJ//FB+CoTWDVBrCtKoqv8=
X-Gm-Gg: AYBFou3DnTFzl4Bgc0fBqMJUI8HGPOIuVZwSE3fgim43H1xK8i7W50nxqzIZ0TE5cON
	m4o66nvOSvydasJJfiIhHeRBrbSe1to4My4uLIUonLMAWW7wvJVDsY6pNWSDW9BeLv8WA5aelUB
	EUIorioqDhA87ooldAgjqxP1OTlWDUH+CrOAJkigxkziNTD+slLd784xuzbSM0vUZyWRfJ4yjcx
	H2+U4C4TfGOu/vknyxJ6C6x5sFgB/9mNgaKD7fkShdbHECFu/Z4hPWoJ4VbSbmKd/XpzQbCOcD6
	4SVDBsAeRTNnpxRQylscPDsP2hSUNCxBqtDRcO0VWv6RzuePjVIwq8niD4tjPQBK+q7dcE+ClOu
	RpR9u4JhckFtrDT9VIUO9qXhvwXhd7AKOEIWpnvDH6gklENbcWQFR5hS5Z+F/TgJxLfTYQK6Fhg
	Of6dcZc1GpSx0Xa5R1YHyDyDJVgNJkV1vuu28J2BqRlmU+VOHgdmR6Cad3zE5D2Zu0gjops2z0J
	OWomYo/ihxX92iYgswyobkA3xGtyOjUJaKq45fuit3FkW7KR+3EmnufVaJH3wCc8jRCrfvCCAMT
X-Received: by 2002:a05:7300:aca5:b0:358:1f59:48c9 with SMTP id 5a478bee46e88-3581f594a27mr15009040eec.24.1791824369666;
        Mon, 12 Oct 2026 09:59:29 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:1464:826f:d188:9e33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm34296900eec.28.2026.10.12.09.59.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 09:59:29 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y 0/2] wifi: ath12k: fix M3 buffer reuse in my CVE-2024-40979 backport
Date: Mon, 12 Oct 2026 12:59:23 -0400
Message-ID: <20261012165925.32575-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_095931_150269_935B3569 
X-CRM114-Status: GOOD (  10.30  )
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

Hi Greg, Sasha, and ath12k maintainers,

My backport of 05090ae82f44 ("wifi: ath12k: check M3 buffer size as well
whey trying to reuse it"), which landed in 6.6.158 as 9a38ba5561d9, does
not match upstream. When the existing M3 buffer is large enough, it
returns early without copying the new image or updating its length.
Upstream copies the current image into the reused buffer every time. In
6.6.y, recovery or resume therefore keeps the old M3 image unless the new
one is larger.

Restoring the copy needs one more upstream fix first. Once a smaller
image can be copied into the buffer, m3_mem->size can shrink below the
allocation size, and that shrunken size is later passed to
dma_free_coherent(). Upstream fixed this in 00575bb44b2c ("wifi: ath12k:
fix reusing m3 memory") by tracking the allocation size separately.

  1/2 backports 00575bb44b2c.
  2/2 fixes my backport by restoring the upstream copy on reuse. It has
      no upstream equivalent; upstream never had the early return.

6.12.y already copies on reuse but lacked 00575bb44b2c; my backport of
it is now queued for 6.12.y. 6.18.y and 7.2.y already have the fix, and
6.1.y has no ath12k driver.

Testing: both patches apply to v6.6.158 and on top of the current 6.6
stable queue. An x86_64 allmodconfig build with CONFIG_WERROR=y is clean,
and ath12k also builds cleanly with W=1. I tested ath12k_qmi_m3_load()
and ath12k_qmi_m3_free() in userspace with firmware and DMA stubs under
ASan/UBSan, covering same-size, smaller, and larger replacement images,
plus allocation and firmware-request failures. I did not test on ath12k
hardware.

Previous series: https://lore.kernel.org/all/20260929025856.85683-1-artem@trailofbits.com/

An LLM helped compare the backport with upstream, prepare these patches,
and build and test them. I reviewed the results.

Thanks,
Artem Dinaburg

Artem Dinaburg (1):
  wifi: ath12k: copy M3 firmware when reusing the buffer

Baochen Qiang (1):
  wifi: ath12k: fix reusing m3 memory

