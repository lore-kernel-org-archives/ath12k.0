Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB723C54F30
	for <ath12k@archiver.kernel.org>; Sat, 24 May 2025 11:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuL1lj5+r6l1nileRznb8GEE5TYQHgpOYBvPYyVMCQw=; b=e74715dlHf2zqszrezeLxv/+Ws
	xp2XJNkQAERlA5HjKuRplaKAJeefqoiW4ddtP1ntJlOS5s46RIANM08iCoNsRI7lcmgtnVRvBjgby
	ZaNccAERPiZGZ4mMsuuy5M2mkYY/Q9oXnJQ4jp6jmSCju7ubnpUb5dNNtXsCmMFh9tSROgk2RmWVJ
	JObtwJU2yBu/Jr+QwReS7hXUnk9RjigoOWiJ8uoR46UfhLC4+iRzMh27wuJjD8JwpE/vH6Jm8/NdR
	5tOvuEjD0XtwIh0hm9VnX4WSQZbaKFsVfDBBA/+l0R99oX750FQOGjTLfdGF9EZdeuSmktpLcci7H
	R0NMekHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uImdq-00000005lvO-1oaV;
	Sat, 24 May 2025 11:02:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uImdY-00000005lrD-48do;
	Sat, 24 May 2025 11:01:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A4069A4EEAD;
	Sat, 24 May 2025 11:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5130DC4CEE4;
	Sat, 24 May 2025 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748084514;
	bh=jsOFI/3l7DI68xEW1jpWooo+c55YFp/WUqSMUC7U6gc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FUTcZTb1+vcx4eQmPZq0637754gCIx1Js52QbIOBUvDcGX1cLJDouMHdbFVwvEFK1
	 f/P1Xi7uyDYo/cPpvTbqcJm86nebUJE6RL8HRM+RikQxsUX79u6hQ62jT2xEFP2Tbu
	 vOb/3P1D7xEPWiZdkQnrNvwYY+g1CfWTJgyWi9zuU+jK6Wp/KFHcBMsYHgXMUODh2S
	 RBBq4E17tSFVH13MFamEDxNfBkwgD65pgmGc5rzqXLbnMwpT/1vlb70F0yrDGgCNxi
	 /7ohF5gVgOzm/8aT5ZTzx2nSvyEdB17mNel+QloUiPUNK6JPwGsWZxaIP6wimhcJLf
	 InKP0E/yrD4OA==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e33252046so2060887b3.3;
        Sat, 24 May 2025 04:01:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGM5KZoAKRZfu73V0kGYvKxuQH55Ii+8kfZh/toC7swXe5Kxi1irFi4Ndtm4uJzUnDwprH2L5W@lists.infradead.org, AJvYcCWdq9flrxaLN4TO2r3NTGojqqopNMaOKCEe4HhhLS+xRLTSzEscyH5rI7aJLGgTcOXEBDxAaXE=@lists.infradead.org, AJvYcCX5AC94ykdXClbxytHkZRu06lnBhX5prQwP18cvhT8Ufz9nhTH/msz6UdIo8QyOGbfrIAyltgM2@lists.infradead.org
X-Gm-Message-State: AOJu0YxXB7Pe7qWGGOcSxJbA/evJySgYCQIcnNQ6k2eJZ0xWvUUsIfT4
	/hJq5/HSXjjGVnKCdlAiWcrHjiOqDsNtyztY9ceUMnsVAIONi7Ibq217gAX9dL3Cok5/7MXqRW6
	AofFuwaRDlVMRJIji00fggxgdLNkRwds=
X-Google-Smtp-Source: AGHT+IFJVdZ543r+wIyn2Imhhh/2TGC+yMudMhDw1/AM/qAFP+N7wR+LWtgSrHl5DYBkEaNMuQIbk3KltwcTmicgV7Y=
X-Received: by 2002:a05:690c:921c:b0:70e:2fd7:de8 with SMTP id
 00721157ae682-70e2fd710d6mr10753577b3.29.1748084512607; Sat, 24 May 2025
 04:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <fcfa4e63-e421-42d1-b6da-11d2d7d2dd95@oss.qualcomm.com>
In-Reply-To: <fcfa4e63-e421-42d1-b6da-11d2d7d2dd95@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sat, 24 May 2025 07:01:41 -0400
X-Gmail-Original-Message-ID: <CA+5PVA61i6upJES0Ex+fu=3te0nL5C6UsBzwdqqG71=D9cFz0w@mail.gmail.com>
X-Gm-Features: AX0GCFtakdGE72uU9Nz4698nzxMe14QZAD3v4jd7XJvJegpl_2qLoV6ELz6n7T8
Message-ID: <CA+5PVA61i6upJES0Ex+fu=3te0nL5C6UsBzwdqqG71=D9cFz0w@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20250523
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_040157_088958_FE07BCD3 
X-CRM114-Status: GOOD (  14.07  )
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

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/561

josh

On Fri, May 23, 2025 at 1:08=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> The following changes since commit 3fbaee2775a4a6d44021aa035823a7388b0874=
fa:
>
>   Merge branch 'robot/pr-0-1747839277' into 'main' (2025-05-21 15:05:37 +=
0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20250523
>
> for you to fetch changes up to 2e91d8c3c4bd34a27177180a38f62d3ba3c96031:
>
>   ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.=
0_V2.0_SILICONZ-3 (2025-05-23 09:50:02 -0700)
>
> ----------------------------------------------------------------
>
> This is an update to the WCN7850 firmware that fixes the widely reported
> failures due to the prior version in ath-20250424.
>
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL=
_V1.0_V2.0_SILICONZ-3
>
>  WHENCE                        |   2 +-
>  ath12k/WCN7850/hw2.0/amss.bin | Bin 6082624 -> 6078528 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

