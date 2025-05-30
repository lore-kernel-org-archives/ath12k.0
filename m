Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A518C5AD49
	for <ath12k@archiver.kernel.org>; Fri, 30 May 2025 21:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zqMKiyJJReHl0zm1LWfJC6bfrlL/JGqZD0aLMmEOVzY=; b=JXIXpQLnofySSFZ4j+Uojt18LJ
	oGmZahKEZvn161xoikhbyPEvWTLO6Asxjra74Ph4FczrtFh97tyPf7D4gJfLNsz7JuwAksM3c5eax
	4JJqTyPujI4LmzpXqYPd7q7JtvRfVhck24vdTpwycbgVf9qgDuicE3E2EChHctejA6OQYhzkL3XhV
	WKyelEsj8clPfOu/iQWK5WRHcvsKQYtRlExLrayFBJrjFPY3niVxp8dE06HWutn0Hh4rSX1WCy5Z3
	Ew/zVD7FV0eBFIdZsCM/gem/IHQ8iab58zo+k5oCuxvQn1GIZqJmEMmYIZo1IFvB0VLOMEEJq+bxA
	8HMKsw7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL7b7-00000001yAW-0Dbo;
	Fri, 30 May 2025 21:49:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL7b4-00000001yAC-3ZjC
	for ath12k@lists.infradead.org;
	Fri, 30 May 2025 21:49:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so15298505e9.0
        for <ath12k@lists.infradead.org>; Fri, 30 May 2025 14:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748641741; x=1749246541; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zqMKiyJJReHl0zm1LWfJC6bfrlL/JGqZD0aLMmEOVzY=;
        b=WEjFlmgS9/YC4U44rTbKe75sm64BzRVRg550SKY22iB6/rm25UpEZnpCG7yeBT+UCT
         IuZDZibNHisqnyKBePnNS8oCVA5AV5HgI38+IGm+6BUONzPrt0zyjiD8rX7vku9MmLd4
         9PrXfi1eTyVz3q5m6cuvVXbyyROxvycQA1StnBjn8uZ3f4TJtF+hTtz+9lL/nY0Fkowc
         bFy5e4QwyyC3T/u8yisrBmB+Lkc47aqLGEAQpt4FzBfNywyTCStUNey+51BpsttMLm1w
         TlJWHQhhlHxfYyTzPzLrr2ml4qOKCaMwfpN9CA+g8F7lT8P20bDOTwBMBOTdeaJ5TAm1
         V0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748641741; x=1749246541;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqMKiyJJReHl0zm1LWfJC6bfrlL/JGqZD0aLMmEOVzY=;
        b=MxWlE1CHpC1e/YjeEFNU2WCRfWi5/EplYS3lIWXufo7/are8YnzZMzCaHf+7qIAp4d
         /QbmWzjgbenOHpPguVrbYLVUmAhxXkqZEY3Ax3/exsAXS88mGbd7XCDaREWiLHqqy93R
         fzRgS3yef8uA854BPJpnn1MoupTi+2uLsBQyVLekEH46/HoF/gDnjmlNzCzMXMiHdWS2
         +JXK47vQd8yUgP7qZxQdgEbsHlPxMjp/mac68qpJOtAwEzKvJ6mG2dDuLIGHqtG4zYY7
         o5mzJ8sQrnagswvKz6zkqX08/+1uOvqV9A9vDqRFiS2THChk6oUnujnyjVR1OrYyxSwF
         lk/A==
X-Gm-Message-State: AOJu0YyXLmkB5op6VlfdxmADn9D8HfSy7KhdThb8Mq/EPGIWGpMmDBMa
	mL+RX6cdSbkUpqBXl3DYSIn+RruOtWphcdnuSPSAVHhikLk2nueNkHH1bhbJ7pZ5DkU1Lsj9EeQ
	cevnG6K8gN2vxJQDDqVBPMl0W0tVFFMI=
X-Gm-Gg: ASbGnctvSn6++RvbbOTeduTREvs3zIH2A5NLpdJ1C0C7Sz7s2h4bbLxoS8w09l9Xsss
	z1VuwNA6tv8tcBTEnW7y75hx+vBEYZuKMbmo1unoZ9HOMEShi2rPGwYx2dERny7X4yRBcux51c0
	wt9COz+ppD46EV3s1XGa523pIJdPE+nVE=
X-Google-Smtp-Source: AGHT+IESdQbbYhpqGkdj6AB6cOwb+bHGclyeTnV+a8RTS/8ln7fZSxeW9a2GXkrs77GrMkzScUB7GrzkK5IrCpVcCuI=
X-Received: by 2002:a05:600c:1d1a:b0:43b:c6a7:ac60 with SMTP id
 5b1f17b1804b1-450d6ba777bmr43011605e9.10.1748641740877; Fri, 30 May 2025
 14:49:00 -0700 (PDT)
MIME-Version: 1.0
From: Walt Holman <waltholman09@gmail.com>
Date: Fri, 30 May 2025 16:48:50 -0500
X-Gm-Features: AX0GCFvMjUSFsVul_8LV_bReS_sBchY5qMln8pofijRWJZJJY0T19gs6kHpTT_Y
Message-ID: <CAMb39_mQB4h_NMsVW+_HrgSHGrFoKTTSqzqeBAtbc_xunX92eg@mail.gmail.com>
Subject: Re:[PATCH ath-next 0/2] wifi: ath12k: Fix station association with
 Non-TX BSS
To: rameshkumar.sundaram@oss.qualcomm.com
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>, linux-wireless@vger.kernel.org, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_144902_888954_75F00A82 
X-CRM114-Status: UNSURE (   5.00  )
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

Hello, just wanted to let you know that this patch series has fixed my
inability to connect to my 6Ghz networks utilizing an ASUS BE30000 3
node mesh system. I've worked on this for months literally, so this is
exciting! Any chance this might be considered stable material for a
backport to 6.15 mainline? Thanks for your work,

-Walt

