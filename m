Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77052C02182
	for <ath12k@archiver.kernel.org>; Tue, 21 Jan 2025 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mElhxqDWL3nmKtABnnj5PpFNGRnfcx1UhS+XeGlosA=; b=jKHbekEmGYiVxt0AC229e/+U6L
	U2E5Olab+HYi1p+RLJEd4WUqM1PJoxjHdgz68MiVS+N4raPabOF5C2J4/WquOou/H7OzFvmLJOJda
	mX9kGtSaP8/V6wKRYAIc6LG3kOZ/XyCyoUmfAH0KxrETey8pEXCWucbsM2kXRHxkVd/LaAzH8DaGE
	bVkr68z60JTg9c9qjQ8g8OOM85ORZNtkBzNcgXRVuhtGulN23kPXplp7xZCArLgXGga0DoZU4/zqM
	h06naLFyhYMfi5Ev6ChTHK+PfRJpwa4pq0nesbbV0HSE5KIiyCkiqEc4QgRVoH0CRp+YCe3khB8Vw
	5kBHOQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAsR-00000007SVA-0wbX
	for ath12k@archiver.kernel.org;
	Tue, 21 Jan 2025 09:48:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAsO-00000007STe-2TDR
	for ath12k@lists.infradead.org;
	Tue, 21 Jan 2025 09:48:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43635796b48so34334335e9.0
        for <ath12k@lists.infradead.org>; Tue, 21 Jan 2025 01:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737452931; x=1738057731; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mElhxqDWL3nmKtABnnj5PpFNGRnfcx1UhS+XeGlosA=;
        b=dsPWA6jCPIDNtGpHg9b6BHVlUYlPSQrQvaMZTXvmRY7GYBUu0h9mVfrVIH4FaZULFk
         mcEkqgx0a8kgenoKobxBPvPeQ0Nm3lQTJBeGEqMzJm8Ngsz10AH1XgWPDyr3W8+VicGY
         Et6MSVW76wFUQMqg7+/duz2SxXsm96VhDbKPhPTWKF+Jox4igXAVwUZgmEhUFpwehgzS
         OwKnrBAEvvjNgQRLfxk5wnesK72DfpAjAQ0YarmLvVrqPnIGdWTJQYV4LQilLxHIwuiF
         7eENFGp8pmy5JIxB7TqvXL/KJ7SKk0Dhn46G55I8GW0T4LSNa+kueTOdY1YPvl+H3zUp
         uvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737452931; x=1738057731;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4mElhxqDWL3nmKtABnnj5PpFNGRnfcx1UhS+XeGlosA=;
        b=gtaWXr1x3DvUy41A0Khn34dLN56KRB/pJXmItzgE4azkBU2bWVET3bxCFCCsNrRvjC
         n8rCWZspEmJX7ofLx4iO0bD7Td+vhNCqBuEmVJsL3aiyBYMygnN8IZxw43fdRdPn8Cxy
         t4r46EueM9w0ovBwF1kkEBFEzb5wlzJcoEVpvaHSuuY028C3jbtfgjg1zA2Gt/n+++NO
         D8Oolqz/8+CD3hW65dhbiKOKxgL94gQEZO7WZwHhsdPeOL106akTQtq75x8zSB5e+090
         5sJBO/TUc/1uhnb4C0AvOXC5hHmu3Vs98clMMW9TOCijiwf6DdWdZPW0eB/pREJpZhw4
         sc+A==
X-Forwarded-Encrypted: i=1; AJvYcCX71SaZpNRCPuyrMB62sxIiPClpj1ENES2PAztlCdJuNqW0kCnoxeglLkuavH89Au+UfykAiJE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxS9EvKZ5WiaeuW9tLFHMMX52dconuCfM+TTG3fpt6R4BxVvvPI
	OYgxOeMV7Tkv+IqMoJvlU14ARsvdTbqE2HMEJqxoRB1yNwWMZy2E
X-Gm-Gg: ASbGncufVWw0U5TuvsRDQQBSpGzt/Tqlnk3uK/Tcxo04y+H2uWAlbND393jc64TfDYh
	U5hayVs7YqThEnqhx9n48Q+TZQYy5ZNW+3yP7FFqHLh/Z5KCQK++y8CGFI/QcGWbCQOieysx8DN
	LK/G+Ib2ddL4ZgOXYTS1TFJAZYPnK9dNDxlYStJ6fGzgUZB1GEP6Z9+4OLUIabwJrJt6C6i3jVs
	SXK4fiw4G6Iwo1IaUHnQUUsX4hYH1qOMuhGK2fBsA68glsD9Ul3y3NB27+yFnYXcgZpl4nBNLHq
	LpjTVgHQ6mjz
X-Google-Smtp-Source: AGHT+IGP65D0Pe5aHLN0us1kvEpjhb2rySYwVy/45FGTEUFh1I2k1u1NHeivMhZzMxrgoZ5ckjOfpg==
X-Received: by 2002:a05:600c:218e:b0:434:e65e:457b with SMTP id 5b1f17b1804b1-437c6ae9bdcmr220684815e9.3.1737452930664;
        Tue, 21 Jan 2025 01:48:50 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c4e38sm231134495e9.21.2025.01.21.01.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 01:48:50 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jan 2025 10:48:49 +0100
Message-Id: <D77NNT0XWFMM.3F8D0CVJ8C7SI@gmail.com>
To: "Karthikeyan Periyasamy" <quic_periyasa@quicinc.com>,
 <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] wifi: ath12k: Add monitor interface support on
 QCN9274
From: "Nicolas Escande" <nico.escande@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250119152917.2316514-1-quic_periyasa@quicinc.com>
In-Reply-To: <20250119152917.2316514-1-quic_periyasa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_014852_623859_ABBBFB72 
X-CRM114-Status: GOOD (  11.86  )
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

On Sun Jan 19, 2025 at 4:29 PM CET, Karthikeyan Periyasamy wrote:
> Currently, monitor interface not supported. Therefore, add the missed TLV
> tags parsing in the monitor parser, configure the monitor vdev state
> identifier with HTT filter setup.
>
> Depends-On:
> 	[PATCH v2 00/14] wifi: ath12k: Enable monitor ring for updating station =
dump in QCN9274
> 	https://lore.kernel.org/all/20241223060132.3506372-1-quic_ppranees@quici=
nc.com/
>
> 	[PATCH v3 00/10] wifi: ath12k: Add peer extended Rx statistics debugfs s=
upport
> 	https://lore.kernel.org/all/20250119135751.2221902-1-quic_periyasa@quici=
nc.com/
>
> v2:
>  wifi: ath12k: add monitor interface support on QCN9274
>   - remove redundant filter setting in ath12k_mac_monitor_start()
>   - set the default filter when the htt monitor configuration get disable
>
> Hari Chandrakanthan (1):
>   wifi: ath12k: fix link valid field initialization in the monitor Rx
>
> Karthikeyan Periyasamy (1):
>   wifi: ath12k: Replace band define G with GHZ where appropriate
>
> P Praneesh (5):
>   wifi: ath12k: Add extra TLV tag parsing support in monitor Rx path
>   wifi: ath12k: Avoid fetch Error bitmap and decap format from Rx TLV
>   wifi: ath12k: change the status update in the monitor Rx
>   wifi: ath12k: Avoid packet offset and FCS length from Rx TLV
>   wifi: ath12k: add monitor interface support on QCN9274
>
>  drivers/net/wireless/ath/ath12k/core.c   |   5 +
>  drivers/net/wireless/ath/ath12k/core.h   |  18 +-
>  drivers/net/wireless/ath/ath12k/dp.h     |   4 +-
>  drivers/net/wireless/ath/ath12k/dp_mon.c | 362 +++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/dp_mon.h |   5 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c  |   7 +-
>  drivers/net/wireless/ath/ath12k/dp_tx.c  |   8 +-
>  drivers/net/wireless/ath/ath12k/hal_rx.h |  17 +-
>  drivers/net/wireless/ath/ath12k/hw.c     |   4 +-
>  drivers/net/wireless/ath/ath12k/mac.c    |  74 +++--
>  drivers/net/wireless/ath/ath12k/wmi.c    |  38 +--
>  drivers/net/wireless/ath/ath12k/wmi.h    |  20 +-
>  12 files changed, 438 insertions(+), 124 deletions(-)
>
>
> base-commit: e7ef944b3e2c31b608800925e784f67596375770
> prerequisite-patch-id: afb04ab90da26435239077de723d1276946a194a
> prerequisite-patch-id: 1b12bea72973c14f461b8202eed9432f27932876
> prerequisite-patch-id: a6719494f46b8568504be8c64255676e67b4deda
> prerequisite-patch-id: 054756eb1705babff324a743e62685bb78035198
> prerequisite-patch-id: 889c4a0174fac23261705a42b46e923d7e7a0a18
> prerequisite-patch-id: ea0321fbd8a59c09191873f59b6aea8225f4b8e5
> prerequisite-patch-id: 3c8ccb635d319f8755649e445b68feb615fd82c4
> prerequisite-patch-id: d516b2a3196218f42fdf4567516a1fd2c8b4c40f
> prerequisite-patch-id: a2c59b4e468384e27d934a986e5fe9a951685fd9
> prerequisite-patch-id: 359fecf93ef53f39243cc1b3466ab06fbd33cc71
> prerequisite-patch-id: bf0b6542c65299c0bfa7fef2da6f09dd8453c39f
> prerequisite-patch-id: 1dc79cafb399be590d1e418afcc5a719ae35834f
> prerequisite-patch-id: fb1e39f2dce024ff692b0e6b112dc90c6a43ad00
> prerequisite-patch-id: 9ea3943ae0b6e6a5a09cb648eaa35f8087967ac3
> prerequisite-patch-id: 35da9ccb2466675b50e819029c13cbda70702fc2
> prerequisite-patch-id: 282cdacca7b9bbef5a94b1a78457304d38362af2
> prerequisite-patch-id: 5bdb2bd29cd4c92d23708432f451e92951c23f0e
> prerequisite-patch-id: 4b6f75cfa4d25f974f8fa61adbc85fff35a187fa
> prerequisite-patch-id: 6a015b7d89f3d61adb5d60eff2d63fea10d9c3b0
> prerequisite-patch-id: afba80a88de0869ade8954c32ebbec407608a1c0
> prerequisite-patch-id: 12367e8ecdccf254c41bd0518cea6877e4673bb3
> prerequisite-patch-id: d94f4a9c9b0b3bdc9e709efcae0cba4983bf440f
> prerequisite-patch-id: 8c9df1e16a25c3b9a3fb709ba9bc8d37e6f14a5e
> prerequisite-patch-id: 8db0be3595dc82725d9a195f3239402b9062d9f3

I've been running this updated series since yesterday and no problem so far
when running concurrent monitor & ap

Tested-by: Nicolas Escande <nico.escande@gmail.com>
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

