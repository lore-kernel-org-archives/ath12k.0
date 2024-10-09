Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9168ACED62A
	for <ath12k@archiver.kernel.org>; Wed,  9 Oct 2024 08:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLJVWehmFbOOxGZYpNzLo94Hs3PFFYW5teQQXPK7uLQ=; b=BQE5QOoUn1axZrDJPCPmxdW+2W
	yeIZv4nGnCrA/P8gQK+P5+Mpit9ezZca1bVi/V1u4Qt9Y0tkyj5thgxxWwVRMsPELVShRxQr2CtDW
	TDT77gNJGM7rwaQXVbgEy2pFoexHZ4C4vY94WuA5OEk+KkahYpi8U80hW1BqmcX1ZZtV3MkyFviBC
	QiMJow8Ujmt5KqSz8iez4xYipfA1ET9SsjzC+CrF+EPM1RkilzPbivLi9+CE+77WaIYFwmaEwPnwx
	AJ4uOo+FQ0jluVEXV19l1PoS7JKrnxhfY2s67HY/ce38MzRYY4C5Np8fLWumTOdiGhMq4ncl8Ls3f
	ZVWC0MYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syS10-00000008Rl0-1F83
	for ath12k@archiver.kernel.org;
	Wed, 09 Oct 2024 08:25:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syS0y-00000008RkN-443P
	for ath12k@bombadil.infradead.org;
	Wed, 09 Oct 2024 08:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aLJVWehmFbOOxGZYpNzLo94Hs3PFFYW5teQQXPK7uLQ=; b=VZ9Czp8Ed2t4nVbmJtbqDITNFI
	JTbkFDa1AsTTO5xxAbSqemYgiUCYX+XxOUS7ZyWcUkbuyO+MbWMq36hvuIj7C11XL0Dgz8sgks7Sl
	g8geve5GN06k7H5rws9PkCzfJ7cKjjmfr4AK6jVghVnPVCmCyu22ud41X34fEPAjTcDwHiwCkVo26
	sNvIkiAZt9jQHSBDwmbInvimbPWgJ9LlWXf4lzb0tV6pbY1VEB71TgaceG9ZdmGTXPlZ5R6ZdOmNR
	yVOJIolemvTzxJ0WVpjoV7l8fDNcLeM6TwsHQ7vphaIgzine8YRIDUJ1khQwx1TpvxcNn2Txk1Mjp
	08dh7S5w==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syS0w-00000004rTO-0p4q
	for ath12k@lists.infradead.org;
	Wed, 09 Oct 2024 08:25:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-431137d12a5so1444065e9.1
        for <ath12k@lists.infradead.org>; Wed, 09 Oct 2024 01:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728462343; x=1729067143; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLJVWehmFbOOxGZYpNzLo94Hs3PFFYW5teQQXPK7uLQ=;
        b=MhMO8qnOACDC4emZUlmIrmSe/z6ch5FGZ8q50Gdslg/q89+hYt460BqEDTOR7zHHNk
         BQvh7G6qsiqLhynhXm/s1DOAMBvbHgI5pFL8y2ZRk86E3kSe0fM9mvArir6uNAguvnXk
         z0le8/4DJFEqWPtt0DmU6w/CIIBd6zJ3C6ZpH/rv3AorP+vr5V6J7d/zAXfGfDp3qMKJ
         Gy7+Jhxd03qZ0QNHICJ7aHiizHLv5R2/RTH+dI4VaqxtkLHojHQMGEwwlIRUMdPkDAoK
         DRtDpAhqNxIHVl0R3h38/v2dDd/xSWYfZ4IY2rSgjUZtc+cbbC3N/6ktZ2Qo0ktmBqxE
         Q/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728462343; x=1729067143;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aLJVWehmFbOOxGZYpNzLo94Hs3PFFYW5teQQXPK7uLQ=;
        b=L2L6/r3bCJQT2CzBJX0QTwy+dsZyJf3JI+mtOPHGnfcqWO8YLTj3ATN6ZhgnLtr2aL
         WkC8J/oQWx0kGVa8KFU36DFfA3NxMEtaW5YxfrFOZpzVNwRRd8WS+hNZrQRp4AQmN+D2
         dL+VQSZcMCqVucNwj+WQ587mP6NCt1KlhX6hxzVKU/aymB59euSZda8sSbUKBO0xYCQ3
         +te1ADZxm0IMo+erVT+kCLtgj+B23aLyeQenlI4LmxicX3I0pVmsWsgdXLQuTjYG6QpI
         2Isdsl9OmIRJqFyNaiCDGRKLMLSpiLy4bc+vqM942ddvnzlCpi7t8RWJ/1Yj60o3kKA9
         gjEw==
X-Forwarded-Encrypted: i=1; AJvYcCVFIV3LO1RnS/hXwS5850KASWUx0G+USKL45YJZuwxGKwX+38Ojl8aWTVeVrY1ON/CX2BKfebo=@lists.infradead.org
X-Gm-Message-State: AOJu0YySMi7AtCxexEFybLUCfU+UTWsa8hpcvUUEJ9TvTZcIm1F5TSi3
	iiYzfQXPRdPIX1q4KdnvQHUX9h6w2HpRnc/g8NZv+PRBXmLm4YRuSmiAQg==
X-Google-Smtp-Source: AGHT+IGaeKaBN/+yVM5/82DOl5S9YcoWJ5/O5SoqGkr+H4MgcLO9os/k5x/8836Up417G2gPyPEoWg==
X-Received: by 2002:a05:600c:4f52:b0:42c:b9c7:f54b with SMTP id 5b1f17b1804b1-430ccf4c22dmr13919255e9.16.1728462342941;
        Wed, 09 Oct 2024 01:25:42 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d748d445sm12590565e9.44.2024.10.09.01.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 01:25:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Oct 2024 10:25:41 +0200
Message-Id: <D4R4RHZM9GWX.2V6MHL6HW9YG3@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 00/11] wifi: ath12k: some fixes and clean up for
 monitor mode
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Kang Yang" <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241008073534.1195-1-quic_kangyang@quicinc.com>
In-Reply-To: <20241008073534.1195-1-quic_kangyang@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_092546_344078_3C313C38 
X-CRM114-Status: GOOD (  12.13  )
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

On Tue Oct 8, 2024 at 9:35 AM CEST, Kang Yang wrote:
> This patch set does some fixes and clean up for monitor mode.
>
> v2: rebase on tag: ath-202410072115.
>
> Kang Yang (11):
>   wifi: ath12k: remove unused variable monitor_present
>   wifi: ath12k: optimize storage size for struct ath12k
>   wifi: ath12k: fix struct hal_rx_ppdu_end_user_stats
>   wifi: ath12k: fix struct hal_rx_ppdu_start
>   wifi: ath12k: fix struct hal_rx_phyrx_rssi_legacy_info
>   wifi: ath12k: fix struct hal_rx_mpdu_start
>   wifi: ath12k: properly handling the state variables of monitor mode
>   wifi: ath12k: delete NSS and TX power setting for monitor vdev
>   wifi: ath12k: use tail MSDU to get MSDU information
>   wifi: ath12k: fix A-MSDU indication in monitor mode
>   wifi: ath12k: delete mon reap timer
>
>  drivers/net/wireless/ath/ath12k/core.c   |   5 ++
>  drivers/net/wireless/ath/ath12k/core.h   |  23 +++--
>  drivers/net/wireless/ath/ath12k/dp.c     |  25 ------
>  drivers/net/wireless/ath/ath12k/dp_mon.c | 108 ++++++++++++-----------
>  drivers/net/wireless/ath/ath12k/hal_rx.h |  53 ++++++-----
>  drivers/net/wireless/ath/ath12k/mac.c    |  24 +++--
>  6 files changed, 114 insertions(+), 124 deletions(-)
>
>
> base-commit: b9545f4570fcfebe982439de7c9106e55b4bf756

Hello,

Two quick questions there:
 - If monitor works for wcn7850 shouldn't you set supports_monitor=3Dtrue i=
n hw.c
   Or does it still require more work for it work ?
 - This whole series seems to have been tested only with wcn7850 and not qc=
n9274
   Is it still not supported on qcn9274 ?

Thanks

