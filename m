Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21725D69114
	for <ath12k@archiver.kernel.org>; Thu, 28 Nov 2024 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=25wwbL1/aRSxbqsU55Z0VkbAIYXueGynmh1w5+yJMjc=; b=iZPVTnlLOIlbvXFR3Gg4E+OMt1
	r2kjWghsBMClqYynNbP/8sHArSBF0t4emmdRLoch8Df2mDzCU0C26eJqdgUpPyvx+LltEgmnVC3Gj
	nsyxcZI/Y6webeGmlRJw26izhmv87UtpUMvkwirO7cocoXRJIpS7tFEV+lbRYeBk0KtpJXnQ0Ng+f
	spBne/CNKv5jXIH4ywZRuIs/ft5ErN+yiPo/BBxO4/oV+B+07Wqo4ynizCnr1rB7MPXoLHCFATYje
	VvxA+ZNJKajBIOIhgroYa73PI9AoGAPjrizcjJN/mfmZNz7BF6r3Ino0hi9zmILYGmiG8YWVhFQD3
	gjEYWI1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgEz-0000000FquY-3ijV
	for ath12k@archiver.kernel.org;
	Thu, 28 Nov 2024 15:15:37 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgBQ-0000000FqNQ-3vtL
	for ath12k@lists.infradead.org;
	Thu, 28 Nov 2024 15:11:58 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4668a28158cso18312511cf.0
        for <ath12k@lists.infradead.org>; Thu, 28 Nov 2024 07:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732806715; x=1733411515; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=25wwbL1/aRSxbqsU55Z0VkbAIYXueGynmh1w5+yJMjc=;
        b=ir7kWfp4wWAx7CsmBULGHC52gschO+cEgxs/3Gqh6Df1NVEmSVxOJ6LRzFi9dImEXt
         NV5jE/LSZ6WmKgty9hYBNrUf1Y3myf58nHL7VHH8UXerLpTX+ywccQoDJ2SkNymG1zLo
         nDo38FlQCNz4abhAF/3CJu8nGRHmEI/HG4L9QxV5Dptk6lnpqgnc9z7gJHoJwSpHSrv8
         TVFOiMbBCucSQzDBkCJhSsOoiFUrxiET2ul57yNx508HaRzxogSHf6MDPzpkYxeHQANK
         JDeQVksIxvQoW6FjSyJIunRlaLsNJQpDVkMt8X0B+ZWjZfmEsze4YzyP4McALe/pkLLe
         RSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732806715; x=1733411515;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=25wwbL1/aRSxbqsU55Z0VkbAIYXueGynmh1w5+yJMjc=;
        b=edivnAcBiin/JLtGs6nQFEGf33wa/EEcK9s8JT77KOuSKHZ+If8x1MiR/eOJmk9nuO
         zxajODecA8Aqr85ey4HOsnijJ9MJTtWThPaLv6bq4bjhQBRg21T7OY+Ba1NEkUamsfdI
         8B+7ZKbMGnPm4e6fFiM8rmdcLdwfb3gRTgSyFX+jQwqHZAazG3TOdTBNNiweWagecadG
         3bRZCwZT8jfLVzwtfXaTa2S/NMuTfo6hAAsdOaWFTaOVlDEj2bwjjqDjoNCA2M4nr1Ql
         CUWqFcuIwT7v68/AeNlVJSlpED0szFHEie79zjeMKBJ/TuuOYxHf/0oqj2pbscr8NPlm
         MG/g==
X-Gm-Message-State: AOJu0YxOq7dN0oZQ8ZqoE9aD7uD9AMHJ1BY7nAa948r3jiXrxJelT6fK
	5gtYjpoGfGaoS4tgguFY3iytY9u+uSa9ocKXoA4Qf636wdjjO8wqMrJ3Bfk3lIIzt8fBiA186xN
	8dwx3W9rF7fmLTrK5EiTNQzHAu00ioSs8
X-Gm-Gg: ASbGnctYFhTImN2xhzfARNr9muigqIi6U9FjhHfHiT8Q103zJjjtcLb0AeGKDa9pEXc
	EQtZhwEV2UUrnXXjklPAhLm7j65XD/Zok
X-Google-Smtp-Source: AGHT+IEifM1337CLrhWPHOO81150TVJgoX+NHWzRWcccPa88mfWytNRoCBNOFahy29P/0lowUq1Vwk1qSx9rUn8NABs=
X-Received: by 2002:ac8:5ad3:0:b0:462:b7d4:42b2 with SMTP id
 d75a77b69052e-466c1b19550mr56494631cf.6.1732806715020; Thu, 28 Nov 2024
 07:11:55 -0800 (PST)
MIME-Version: 1.0
From: Demon Huang <hyh19962008@gmail.com>
Date: Thu, 28 Nov 2024 23:11:44 +0800
Message-ID: <CAF8Er24cwadjjFdN5fsHpfiqoyEOi9htHvOEjhMDkZAD4cNzuQ@mail.gmail.com>
Subject: ath12k-firmware: WCN7850 hw2.0: add IDs for Acer Swift SFA14-11
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_071156_971715_21E55DF5 
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
  I want to add my laptop's id into the board-2.json:

* description for what hardware this is:

  - Acer Swift SFA14-11, ARM64

* origin of the board file

   - downloaded from
https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware, it was
commited on October 15th.

* ids to be used with the board file

  - WCN7850 hw2.0

    + "bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,qmi-chip-id=2,qmi-board-id=255"
      My device has "subsystem-device=8001", so I'm placing it next to
the existing entry of "subsystem-device=8000".

* attach the actual board file (board.bin)

    + "bus=pci,vendor=17cb,device=1107,subsystem-vendor=105b,subsystem-device=e0dc,qmi-chip-id=2,qmi-board-id=255.bin"
      I'm reusing an existing bin data.

* other message

  After adding the id and repacking it to board-2.bin and then
reloaded the kernel module, I gave a quick test, it can run up to
890Mbps.

  Tested-on: WCN7850 hw2.0 PCI
WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3.

Kind Regards,
Yihao Huang

