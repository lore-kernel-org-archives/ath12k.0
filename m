Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0445CD4F54
	for <ath12k@archiver.kernel.org>; Wed, 20 May 2026 05:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSiwQCogWokNb1E8QEhJhk/M4DdIyPHBuO9qw33NBag=; b=a13oNlMzBW/HSGUbmq8VDVTfpC
	gatvXkSuhE/C02whX9YIRUq3hl0LY7hLjQjy44ZH7uuIuYwbLj7shJClXxozePIuHoSI15wMXKoRL
	wpNzwz3qnr22BAD7fvt4pCvYqIbGEKdaWmu9M5GBA/OVqHBSJomfwlsZ7HaN8t//z78XQBhHVUZPu
	ele8gshz32Tc39yiShqtYlpdGGyJOMS/0SMyEcJxH0eT4WcSqF9vSms8LGqlaA5BOOsy8/+k5uMbf
	g4JSQ30YsOkVJLuoWFMmCnR/GHSqSfVeaiHRcHkBeEeNDa8GSqOIpEL6HKPk4dpsKQCWYxlu4NNF2
	u0Fyy8iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZ7w-00000003XBp-2AGw;
	Wed, 20 May 2026 05:05:52 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZ7u-00000003XB3-0JgV
	for ath12k@lists.infradead.org;
	Wed, 20 May 2026 05:05:51 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-5165195c8b0so51547551cf.0
        for <ath12k@lists.infradead.org>; Tue, 19 May 2026 22:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779253548; cv=none;
        d=google.com; s=arc-20240605;
        b=FmbuL2gFEr0Jg8S+lSzJeavcx/8XGnQubPFm7ph7ZeM4OPvhKC03M4k5pXAxDbNMe+
         jpb5nJUyc/cj9Bn1eTayRWKP/Gh1XhmEbxQPSfnxGn0a8iR0zxAq5JaRAxb/hmpE6LEl
         qUpm5yRcGWXUq2VDmN0rBbGA829aHEppgj7rePzTz2lbtbMXv43INPQoNeYbpIrK8KsS
         bgHgmBXbSCZAsSV7DIVBbAjibbAokVp2zp21mmkvnMlT7VU9xpZ2pLl3TWWik+7U4bFN
         pU4Fqb4KyHA8/pNChpNPtsHuGtQ9+SFODxnRjUHDx7oZF1V3NsbzJf2J3baFtkzE60G+
         S9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=mSiwQCogWokNb1E8QEhJhk/M4DdIyPHBuO9qw33NBag=;
        fh=kh2Z40pjRVtl/Al3SJmbxc2nxIOCcDHNfPYm8axROgA=;
        b=X6ec2uxjCWGsLCXINGuflUBUTdPu8Y4vwPrZvhOO68I1RwLwVvFexZ4YWDHLsG3/Xm
         KhwfSpysJd2Jq8ZQs6+1p90rYjawJfcNGfBrDh7MSTqhfrOH0A1Cg550M0rNHxWFOJYD
         4qTQg/JHnNUQ3JaSiAyitRZB0LtXWI6q0JmrUqaJ4jpMZm3EpChIAmr17AIP5UEC8pqP
         N8mkk2jzo+hWgH55qkhyyDQ3PKjYmL31pKA53tZQCcWILd5UEmHsiIQRRuL1oFpcKir1
         mGVTxJGN2d4r2nfHxudCkvFBT4uYEhOE+dmO2Bl0lnXVFpkFwSU7FDPvQCXYnnllVXaX
         4YIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779253548; x=1779858348; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mSiwQCogWokNb1E8QEhJhk/M4DdIyPHBuO9qw33NBag=;
        b=W5BpL7QmJ53RlFjU5BrvQcNQGnWcCzEA62sG/KuKFRx7zI5OYgyNthGPm8xo0JqJfO
         th1Ptyq8JFCDPDA8NpIXtNDdSRP0pfL5x+8Fr77gO6QScxT3FgFb3P79/FFkKx2duRVE
         MhEhxFuBDKncqfLW86R8M/6z4Z0QhLuG9hQC7/ddu/Bk4GLxvYJzJK6T6wYz9zKeNbjs
         /yybluE0bdBBGISHA2GQbxoBAo2JBJuqrjgjZ579dXZ9o3fnWgzKM3VIQYuCmU2+nq9s
         KF8F+jeR40K0AJRmF5fiRbAyjj66vacLbMmWS6LMYe1GOnas7KQpcTgiUAoRiOcuzPML
         JE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779253548; x=1779858348;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSiwQCogWokNb1E8QEhJhk/M4DdIyPHBuO9qw33NBag=;
        b=K7imFr+Gd1Lb/kSaXgoZSS6++ZqdUsGIDDQqJyL8aiRz2fcse13nhYbpYPYnXnV50n
         wFoegxTTAiu2s1/iAGBqWeL2524Qi7O9jjOwLS4z9aHTStvKnSsA/FUnYd27b5m5t3c9
         nmzsLYhO/q/3/+4d4ldI3GnhibTbD9+eiwwMExY2CtgPl7ivPH4WtrDK5I7Z4gzmwFZn
         2kEMMoB+m5P3OiIOIUw0sFLYb9hl17IVKp5C+k9DMNPPy9tzJ+sB/4GP08zS6xxu8mzT
         lquCh6B+z+3hmcMRkR5Lf24kk7ILKcmqvJb1xqqQ+/O4kjdnpfivN88Vly1ZX2EJ5M4l
         8v3w==
X-Forwarded-Encrypted: i=1; AFNElJ9LnhzEnteaCszAnnvZ7jnxgk5J9sGIqeibiGae6IsT4NcrkGQkONE+pfUNx2iL4qj2sLBJye8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvjqqr2NFSgsGwGmMF5bc1z+Gm/xxAyIb8EG9GoUwmKjmLX328
	EixNbLtWco1kSAAQic6+8QQesiftItmM/dZlWhqAdJbSqd/vP5IOyyruFDLlPNsIetoiR5ubw66
	GOt130wUkyrjCdHVYTtevoKIM+Y9/wVdp5JVo
X-Gm-Gg: Acq92OEMpqpGT7m63ducmgc0WYhssSL9kqW/b7725PUBIS1KS30AYzDtMuPQ/Z63Nx+
	7sCR2TJleYSUnE2Z9ZWM6jcXPz02LekTdt2AZNe4m6fRulwojH7LOy1LCYJ9GIUAV+exQ2INxSd
	IKxFmfA2j3LYqzvCpH79zWw/h++knpVAMLiNbEVVNoi/xMIXLh94afS9QRS29dEEig4Y2VY3s0y
	+SBO+AkW2KRkHYQhacIIDT6qv5HoSODx+dV0FEBuDjHgSCxqiYSNrO4UPB1U9jg9/2gz+G+Yh6U
	j33m
X-Received: by 2002:a05:622a:1814:b0:510:1463:4fc3 with SMTP id
 d75a77b69052e-51659ea7362mr306840581cf.0.1779253548355; Tue, 19 May 2026
 22:05:48 -0700 (PDT)
Received: from 1074302158857 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 00:05:47 -0500
Received: from 1074302158857 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 00:05:47 -0500
From: Stefano Ursino <insalata.fresca@gmail.com>
In-Reply-To: <f2ad69a2-35da-4611-9466-eda63c264c1f@oss.qualcomm.com>
References: <f2ad69a2-35da-4611-9466-eda63c264c1f@oss.qualcomm.com>
MIME-Version: 1.0
Date: Wed, 20 May 2026 00:05:47 -0500
X-Gm-Features: AVHnY4JYfgVmDMXogroHIh0TFlqbt9TPSPb4Kq9wTruVwydVDhB8Fluofdc7Df8
Message-ID: <CAAepT2Su7dQL__DpX0JUwtErW8nedxTcmXEkZqyR7DU-YWnvRw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_ath12k=3A_QCN9274_hw2=2E0_single=2Dband_cards_on_IPQ95?=
	=?UTF-8?Q?74_=E2=80=94_firmware_RDDM_after_WMI=5FINIT=5FCMD_=28WLAN=2EWBE=2E1=2E6=2D01243=29?=
To: jeff.johnson@oss.qualcomm.com
Cc: jjohnson@kernel.org, quic_rajkbhag@quicinc.com, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, quic_bqiang@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_220550_125635_70FE4E0A 
X-CRM114-Status: UNSURE (   6.52  )
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

Hi Jeff,

Thanks for the pointer to Nazar's patch and for pinging the team.

Bugzilla #221550 was filed shortly after your message:
https://bugzilla.kernel.org/show_bug.cgi?id=221550

I see you have since assigned it to Rameshkumar Sundaram -- thank you.


Fix B update
------------

I read your May 11 review of Nazar's patch [1] where you pointed out the
zeroed-slot problem and suggested a compact-array approach with a separate
write index. I have implemented exactly that:

  - write index j (separate from iteration index i)
  - unknown module_id entries skipped with ath12k_dbg()
  - ab->num_db_cap = j at loop exit (no zeroed slots, no free_dir_buff:)

The patch applies cleanly on top of current ath-next. I can post it as
[PATCH ath-next] referencing Nazar's series and your review comment if
that would help move it forward.

[1] https://lists.infradead.org/pipermail/ath12k/2026-May/009267.html


Firmware regression matrix (Fixes A + B applied, 3x QCN9274 hw2.0)
-------------------------------------------------------------------

  WLAN.WBE.1.3.1-00162: stalls at 'failed to receive default regd during
                         init' (regulatory timeout, no RDDM)

  WLAN.WBE.1.4.1-00199: no RDDM; 2.4 GHz card (board_id=0x1, OTP
                         programmed) reaches 'ieee80211 phy2' -- driver
                         initializes fully

  WLAN.WBE.1.6-01243:   MHI_CB_EE_RDDM ~316 ms after WMI_INIT_CMD on
                         all three cards simultaneously

WBE.1.4.1 is the clean reference point: the hardware and host driver
work correctly, the RDDM is a regression introduced between WBE.1.4.1
and WBE.1.6.

Thanks,
Stefano

