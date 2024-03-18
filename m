Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BCDC54E5D
	for <ath12k@archiver.kernel.org>; Mon, 18 Mar 2024 08:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WD9e5KRsKFSY3mJTRq+H/hatWIgf2BjwSx3HN41sPcA=; b=KlbM//Vq49e7hy6Xu/ue8KHS//
	cAR6C6TP/mia4Niv/RXwygggJQVfaVHAtTlplC2DN8JLd572mB+AdgDmPk5kaSN+Uey/zTPq/hO6d
	YXLc1INcXQDWxloY6M3Q88//Ry8QTpGizWalUxH9BcOq1lPDCbnEd1h+2wvwgu2PmScpmX6kzRDCK
	1bP1Ybe847aVABjlfecBQsWlKayXVoPmVrLFri9sGbB55nUuxYK7X31Akenazf1oVUfhpk1/0/QOg
	fRtRU9d7PYbKio8qM/rFjC3owqhLdqB74RX6xfOwILEQcynpPPezonE/jY77m0lLz1CnFmBARob0p
	HHxH5keg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8RE-00000007lMA-3faF
	for ath12k@archiver.kernel.org;
	Mon, 18 Mar 2024 08:33:45 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8RC-00000007lLC-1CCI;
	Mon, 18 Mar 2024 08:33:43 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-512bde3d197so3375268e87.0;
        Mon, 18 Mar 2024 01:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710750819; x=1711355619; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WD9e5KRsKFSY3mJTRq+H/hatWIgf2BjwSx3HN41sPcA=;
        b=mUS8ne512gc+gkNCFWOpcJXLNqdMes+IprfGBOgIgmC5EVhSF/2Cl+NGHp6qr/I5ex
         qbzjfvlgn+X4YdACpBCldUghxdq/8OBPG8gykR9vmWAZCVtJU3Hl/WqascjamKOrSSY+
         ahDjceJv/zVeMcj2+wZ6sGPZ6z6yjqZ8mlTyv0yehPnAawXND6+IVfGkOEcxpxMmuz1R
         IceGM60MAHAxKr5p31PKRjAAq7cvjXuXtssGMTDcHfP3ieFX5w0Jz05prw1LA/ubkmLI
         CLsj5XW8bHUy6cL0C8PH5fMuziGIwobkrpiPwz9YcZLAS3z5iT+aGe1VZX3Y9mKPn3z9
         XkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710750819; x=1711355619;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WD9e5KRsKFSY3mJTRq+H/hatWIgf2BjwSx3HN41sPcA=;
        b=UwqCdlK09tXDQyYD8Xtrhk0+oQpr2jcN96uw4xhhwGx6c1WBstUUOYra47aJPPeEzG
         QXG+Z58CohzCMGGIK2ljgtINPc44S1Iwv2O1wVOtv6DiDXeCWf2tMBld54PPj7bQDlzG
         bqN2yMFWWMeFjB2PXWCmmrfCjvjnwT0aTrl1x5VseHjJdhR+D0wF6AInTQzFGBx5/2ey
         lKagb4FmEdv0nlSBW+QHxK5mZNU6e7tY0SxYYMhnsoohfHUePVnGxkfaheApJvkdd2l3
         YnJVhpqfnzCjYRNS1uBH64RMT/s7tDYtnTjSqjILDqFHYnlJCZOW5IKCf/VkCZkgkqiU
         UDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH4MBTSDnbruTtzAJABgXwSk8l09IH98cEoDX4JgG8bsxDNVq0SAvbRFr/PAXfHs0W8qxPPVIwIM1zv2ZCJiGfd6xFT8qwC2LVR4LiTuUVIYeOEjONLUlgKxrADborlY5O1nhLPsw=
X-Gm-Message-State: AOJu0Yx7RRQ+98DYPvL/RHr3XKGcBL44PSQ4Ch0DtgE97yVKgbJOMqgI
	5Fk3QabrlG85FtF1oLGfzvXsH9MmHF4LKJr+e8RGTtbcjnaiZ1Ly
X-Google-Smtp-Source: AGHT+IEO594O017XxCncKzJ069xXLH7dPYMbXUEMfFgPTuke+UVDTO9OlPpFdSWe5W24rJCjQmEM4g==
X-Received: by 2002:ac2:58c7:0:b0:513:c962:71a1 with SMTP id u7-20020ac258c7000000b00513c96271a1mr7711444lfo.50.1710750818413;
        Mon, 18 Mar 2024 01:33:38 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id bi27-20020a05600c3d9b00b0041413a5473bsm855020wmb.32.2024.03.18.01.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 01:33:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Mar 2024 09:33:37 +0100
Message-Id: <CZWQJW12K3AK.AYQ7YYDWMV6G@gmail.com>
Cc: "Kalle Valo" <kvalo@kernel.org>
Subject: Re: ath12k & ath11k beacon miss detection
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.15.2
References: <CZA2NS7J83D4.18SU6W9R96KPY@gmail.com>
 <a35eca5b-e6e6-46e8-85b5-dbcbda0d2f04@quicinc.com>
 <CZU8N7QWGITF.1DC5A13NM18UI@gmail.com>
 <6874f568-88dd-40cb-bf57-d41b2d7aa41f@quicinc.com>
In-Reply-To: <6874f568-88dd-40cb-bf57-d41b2d7aa41f@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_013342_347120_5A4E7E45 
X-CRM114-Status: GOOD (  11.93  )
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

On Fri Mar 15, 2024 at 8:55 PM CET, Jeff Johnson wrote:
[...]
> > Hi Jeff,
> >=20
> > Any news from the developement team ? Is this something that got into t=
heir
> > backlog, or even better, got a chance to be looked into ? I'm sure if w=
e tackle
> > it on either ath 11k or 12k the other one will be trivial to fix.
>
> Yes, there is an ath12k patch under internal review and test. Hope it wil=
l
> reach the list soon.
>
> /jeff

Great news. Thanks !

