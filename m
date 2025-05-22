Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F7BC54756
	for <ath12k@archiver.kernel.org>; Thu, 22 May 2025 08:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1fTB/swNzWWmYp5oJCHFgWQwcocMbpiQpoHyf5EFUE=; b=P8crD7QqqR22iOwX0net85vfN1
	IQG6JUEqkfi9SJN5xZgm7Kf3kiHby217HHZLGkMs1CsGj681aaLcgbpJBCrasJR4xa380KAwwTf9u
	Q6x3eRq+Jf23wQSuBlrXjbYu1QZeiI+pTg2UwcgP9VWPryCsTHox8pt7WZyYQIT2W8wDoejWvImai
	vJ1X0qK+P1sx60cn1PYAiGcaakg/j7VZo15kVNJSXAACSsKNMmDYZq1a8RJZunrSoRUTRZW+dAePD
	7wGPYIWGLSOSzjS7MT8kVv6tWITKPSkVchsW5kX+B4+1IjuLrBTzR3x8ht0Gmjqz9zHYVKBiC42ew
	chEvfdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1Xh-00000000Kdr-42cV;
	Thu, 22 May 2025 08:44:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1OA-00000000IeO-2cIg
	for ath12k@lists.infradead.org;
	Thu, 22 May 2025 08:34:55 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a367ec7840so3460500f8f.2
        for <ath12k@lists.infradead.org>; Thu, 22 May 2025 01:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747902892; x=1748507692; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1fTB/swNzWWmYp5oJCHFgWQwcocMbpiQpoHyf5EFUE=;
        b=mAikdmBZ5YApVNO/zxxeN2DL4vGiC05NbBuYnP5TeGZq1ur3muG5HDB9sEecy0iEO6
         ffICZsH/5rC2YyFRjukWT6kAcmtmkVfRDjA9Ml8KBfZSDu/TvoN2EbPon5BnNqgJ/JlB
         oNWyLeWImLZ7Wl3bmXNl5CvUrp3Bd2SHDZM0N2tJlNAs9l1lfDsvJc9nu2Rvzp94iAs4
         7AfsVAMObySDXvJFwq8dH+i2ga249g9QTLihubVmr83t57m85rGl9iB+UuSqA5mR7R2C
         Uj0jTnuKIZtDsWhkNPGRB2lM2HovXsc83rOmg7ZVe1Ao3ObpJBSurSy6rrMnZInEmq9x
         fCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747902892; x=1748507692;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b1fTB/swNzWWmYp5oJCHFgWQwcocMbpiQpoHyf5EFUE=;
        b=lrI2G/gDm+L1XicMZuaC+pYdRg+6rxci6UoQWWy7BFbcVWjmFm092c91NThhXA35An
         V1lZ+4qTH/Pt1m0MCL+AeOqlCY864rUyqMKPBawOeqmPi1XGF9NbVcoidrUUwIJTi/rQ
         zhvHuWc/WhuInZBtqeW3+MenB5t4iJ48zii2C822QhyH31Z6upojIwfvQKcrNzQuSOY5
         v59heGGlvJjghmiralaNz1V76eMIiH9i5PIORbywaveJKbO8UAzL+5trZirEv8DTTg/N
         1JKCHbzpVh0fUGLD9AvmZHgflxv4pYBkcUk/YC4yH7HEcsFPVc//7ylPBeY19EslgNLl
         IfBw==
X-Forwarded-Encrypted: i=1; AJvYcCXf1RdMpcC8QnghEhrZ7+mnKBb4dMVfIsd3uQwrwb5LF1nA8BH/WB4YiKcwDo4rRWvIUX77zMU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6/TZcJxtPiHCVLefaeSENuHtn5YAIVFUlipEwfaRMZKH3bdCR
	8h20GCLiM29hY5gRWn3Y3fv9lWnaAFmB0MK2dPMrM6Aii34HcCr+EZrx
X-Gm-Gg: ASbGnct2yRWCEKehCJs1atqWWJ287SI+U0Y+jW0EqEeXQ09bWxgaOCx0f0PttTEgEuO
	TGZSuaJ92e7mHTry1pRAbP+I3vrLx8fr/3o9xAH+23aozqRjcL/0dUfADAXu+YzM+1t1k7tDlrf
	TPj/h0K73du1phExHm0PQmYi0nfUJlEEHSJVR7jHFpOVa4SJFXIamoYT0xUWZyljT2KCjUET7Hg
	dInsQ4bQ4tYKNv2qtxkw5gpJl4oXGay6uwSqhdiOjnhaHz/p6Fl80bYp0E6YHQ9PJdJen9kps5b
	qKtlA0s5bMr/xeYYbAsxY330PH806x8iJze1VXZri09sM+Ans4L30Vzsaa/utyn6kOSf2A==
X-Google-Smtp-Source: AGHT+IExEwr2NroN2VTAq+V2IZUILYxrbMXqDlsfBtFCfMOb+ACjpmRjVcpe7vA5cSdNaULw15JVXQ==
X-Received: by 2002:a05:6000:250d:b0:3a3:76cd:3e83 with SMTP id ffacd0b85a97d-3a376cd3fd3mr11183064f8f.23.1747902892399;
        Thu, 22 May 2025 01:34:52 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aea59sm99321675e9.25.2025.05.22.01.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 01:34:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 10:34:51 +0200
Message-Id: <DA2JV34RZGAQ.24P9Y3C865UHN@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, "P Praneesh"
 <quic_ppranees@quicinc.com>, "Jeff Johnson" <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH V13 8/9] wifi: ath12k: add support for 160 MHz bandwidth
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Pradeep Kumar Chitrapu" <quic_pradeepc@quicinc.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250418174818.3336510-1-quic_pradeepc@quicinc.com>
 <20250418174818.3336510-9-quic_pradeepc@quicinc.com>
 <DA08F3TG062A.151WKWWF5OPL0@gmail.com>
 <c21146ef-3cf6-4d8e-a32d-8479e4d96f3b@quicinc.com>
In-Reply-To: <c21146ef-3cf6-4d8e-a32d-8479e4d96f3b@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_013454_662345_0EBBE799 
X-CRM114-Status: GOOD (  13.15  )
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

On Wed May 21, 2025 at 11:38 PM CEST, Pradeep Kumar Chitrapu wrote:
[...]
> Thanks Nicolas,
>
> I believe IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ mean only=20
> 80PLUS80 not both 160 and 80PLUS80 and STA must set=20
> IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ flags for indicating 160 MHz=20
> support. Please correct me if my understanding is correct. However I=20
> agree that we must allow STA to connect irrespective of which flag STA=20
> sets as long as bandwidth is 160MHz. I see ath10k and ath11k also allows=
=20
> this by setting default phymode of MODE_11AC_VHT160 for BW=20
> =3D=3DIEEE80211_STA_RX_BW_160 case.
> I will make this change in next revision.
> Thanks
> Pradeep

Hello Pradeep,

Well this is quite unclear for me maybe Johannes or someone more aware of t=
he
evolutions of the standard could shime in.

From what I've gathered:
  - the naming IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ implies bo=
th
    which points it was the case when added
  - and the original 802.11ac-2013 Table 8-183v states:
	Set to 0 if the STA does not support either 160 or 80+80 MHz.
	Set to 1 if the STA supports 160 MHz.
	Set to 2 if the STA supports 160 MHz and 80+80 MHz.
	The value 3 is reserved.

Things get complicated after:
 - later versions like 802.11-2020 have deprecated value 2 in favor of the =
new
   Extendeed NSS BW feature
 - Table 9-272 still implies both 160 & 80+80
 - Table 11-23 & Table 11-24 implies only 80+80 but both talk about the
   'VHT Operation' Channel Width field and not the 'VHT Capabilities' Suppo=
rted
   Channel Width. And thoses had different values even in the first AC amen=
dment

So it feels like when no Extended NSS BW Support is used (first gen AC devi=
ces),
IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ really means both 160 & 8=
0+80

