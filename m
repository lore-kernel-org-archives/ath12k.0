Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144E2CFA44F
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-Id:
	Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TF/FBLQpQTpb18qDl8W4BRtUr06P4aRYzhiuLxFGNRw=; b=jrkg/aamQ6/cFFFOif40XBOQMH
	7ILKpQ/hRjEGhdewSIEIt08Q8lIR+pIuN2miDuR4IoklZIA8zxIDOBbcISvUwrcdstgTPosDhhmuf
	TTV95REvupY5263nWeOD2jRqfF/1B4PnVtK+yUvHqi7obfqy87VyB5oFIaFKh3GBzYIGwIxvTNuOT
	rN6l+Dwv9XsUl7zZRdCMSYWwz2QVNeq7tkyBLn4QPFr5IEp+J+y2AI+wwSJISJQ2jTuaSj3ukP7p9
	IALCpeCGIkzMMMl4xtOjWO8EGV7tdPOruGagl+M/noFWzYjCaObw4ELIYMzVjcFuM5rXSYMjphEzM
	nadl1g5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e6y-0000000F7Ob-3IGd
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 16:21:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dPx-0000000EzD3-3q4x
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 15:37:03 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43161c0068bso56037905e9.1
        for <ath12k@lists.infradead.org>; Wed, 23 Oct 2024 08:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729697820; x=1730302620; darn=lists.infradead.org;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TF/FBLQpQTpb18qDl8W4BRtUr06P4aRYzhiuLxFGNRw=;
        b=KFjkC/B0MIOEqC/vId7PTjk4NWW9PHpsVXZ1rUj4GnDj1w0Sikdy9KVwRDuRuPZPsa
         Ra6J7OlqKLLyS3WZVOnQwAr1oD4u9ko6PUDC3U7+7sHZDRejuZ1Wtp1MgEtyx11H5827
         zypYOeKNUHP6ZrsNwK3pdfOCM6dF2SHd0qwJqxsKsqXa7jw+KseooJE519KX3Zw8NdMU
         iKapwVnojBeXUW048Tn5QMuhP3F89+cCNNYBaSxvnjg9y24r1Rk9nQIiYsPSoVj5RSr3
         BxAFnxa3gaDtB/femlIYj04iX8zmLNso5cQlFty7KUzYYLVqGxPiGAr+b5xZWoQiR5wi
         Ke9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697820; x=1730302620;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TF/FBLQpQTpb18qDl8W4BRtUr06P4aRYzhiuLxFGNRw=;
        b=fBfGgi1SjUJBusR1jzU36YWYysYBHi7Sd2nxQmTEcje/GXlp8fYzLrg3IalIyo1n8G
         DBLCW1sChTzMlpAEbWOy1hUlIJZ6cPVO22h1oSQ+SnA+Y6iBoVJL/IJ2pN0MlpVC8cVw
         aPCAgGXxAZt6F34+mGM58ZgqsRBY1XnpQVf5RmjJBBrQ8oFtwHwmaaUGqGTZqosg9K6U
         mXLm5v7C/txNzIC/7BVEStsgTMd/39pI51efWQFK/wooDItUfI5lGFW1S5h/G8WMzlBb
         RG84DlhDjqURFWq6Yu9PSCCX2kTedzs7iaBmYovCkdxflpCKvFxMEjMSUTXEO5EeOYLX
         j74w==
X-Gm-Message-State: AOJu0YzI0E89tUNeFIsqFXq4spYWpXM2KJ4ClGbhM//2FguAiXA4qnAK
	JmMUwOUWh8L/Fc2GsjUypgB0e8t66N8lzkrErS0NiF2HRYrAwWTiAW9YQA==
X-Google-Smtp-Source: AGHT+IHfNnLn0He0yvDmEJ46VjVCMV8diRZXS/OywUaI/bL0fAqJnhwnKFOo6gWGGiC6PbMA6PSF7A==
X-Received: by 2002:a05:600c:34d4:b0:431:5533:8f0b with SMTP id 5b1f17b1804b1-43184246647mr30555055e9.32.1729697819588;
        Wed, 23 Oct 2024 08:36:59 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bfd059sm19456945e9.27.2024.10.23.08.36.58
        for <ath12k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 08:36:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Oct 2024 17:36:58 +0200
Message-Id: <D53APBVN76LR.1NVIJSAOI4ENB@gmail.com>
Subject: QCN9274 targetted firmware version for MLO
From: "Nicolas Escande" <nico.escande@gmail.com>
To: <ath12k@lists.infradead.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_083701_973088_FA0BE7B4 
X-CRM114-Status: UNSURE (   5.79  )
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

Hello,

I'm wondering what will be the firmware version that will be used for MLO
support with ath12k on AP side.

I see that the mlo patches posted by Kalle [0] are tested against and old o=
ne:
  - WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

I see that curently in linux-firmware [1] we have a recent one:
  - WLAN.WBE.1.3.1-00162-QCAHKSWPL_SILICONZ-1

And on code linaro [2] there is an even newer one:
  - WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Is it decided yet ? Any pointers ?

Thanks

[0] https://lore.kernel.org/ath12k/20241023133004.2253830-9-kvalo@kernel.or=
g/
[1] https://gitlab.com/kernel-firmware/linux-firmware/-/commit/a2d650c9cbad=
5faede89a44bfc5eea32483a0f83
[2] https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/commit/3e=
e26f4705a4bf8c3ee1c935f5d21bad9b6d2612

