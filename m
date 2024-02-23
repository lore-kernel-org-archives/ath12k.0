Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED183C54E49
	for <ath12k@archiver.kernel.org>; Fri, 23 Feb 2024 08:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hU3iFOSCko42DRSnePDzSzRwdXNU3Nnq6+I0003hxQ8=; b=jEgKu2YZAGvRDvLAwwyO/LQEyE
	XUZWlkVpb50TSHJbhyH9Qrt+7uSeV50h+GLLH9cKuq0J42FnpR8Cj9Cd7LLsM0LYNDEmFj9JKcZTI
	mcDM4wZ1N1/KmUV+XFT+I6rAYWbOFe6p6ausfhnD/LjvWf0ivb/UkBoi0ahqqgo6qHwib3uIuCHq2
	Jt+IrZDPLv5kr7j4QR5TZv1MnOkcP5TblhEaktFSbqg0xO//MMQKOcIPf7R91Oo+ZE7/Lc26Z9nCg
	us9mTlWWESdT/oQgqgdt/T6DFY6YngO9w/pgXBuD7hRU2SxWyqpwxHJLZaYbhXfPzUcXGngc0Gocu
	ErTqS/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdR9K-00000008Xf4-2VDw
	for ath12k@archiver.kernel.org;
	Fri, 23 Feb 2024 08:43:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdR90-00000008XdF-1mt5;
	Fri, 23 Feb 2024 08:43:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-33aeb088324so70819f8f.2;
        Fri, 23 Feb 2024 00:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708677776; x=1709282576; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hU3iFOSCko42DRSnePDzSzRwdXNU3Nnq6+I0003hxQ8=;
        b=QXykgV18xXFaM4yKBWfpnnN3wwJlwXjYJ4gZbk23K3e0Pa/JZ18BaRWWo3VRMmv4Cx
         kICbj8k2NRYBwc0RWYNAmHAbC3YkK9pzkMZA2V79evayA+pDf2LScmZgFCc4TohGPHBY
         Hh4DrATG/PI9ma2PygxkR5P95QbwmFSkgDb3xhCADksnKIdRQdZdBBqamQsNu6yBBoMm
         Aw/KndT/T8tqRUZMungGABaa7x79m6XgZhIixNth11JeVYHIiJwVgyIrSXJhhXrrUPtC
         dj8wkMx+E2UEbqmzjl6J6IlQuhEwX5ofT9HF5sczHx8yBA9OCU1PjcqA4ZYjUILUjjtl
         13AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708677776; x=1709282576;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hU3iFOSCko42DRSnePDzSzRwdXNU3Nnq6+I0003hxQ8=;
        b=cH+A2twliTyBFVrSQ/G1aCv6S6uiuCWbS/ABJJ/q3343f3H9k+sUxfVjvkY6At2YKF
         gvI48u2ZcHjdS30lE5tTjbRflskHpXsIqqldY+v6VcuVCZfKGdzfgJoXZOxu01tDmaoP
         J4ohDPhqt3b2ldvaa3wfITW2YxbLXDY/wUdDTx9m3CyueN8t9PzD9lar1wQOzZhQbfqo
         CqM96Ixmcfr2lkbYqfEe/6/puzHay8RSnbGvlQSdVPE3LZ0T4F5+/VGafs41Px4WsKn6
         t1qROo6+yhxBb0jhNN6+mGEqtVUTEAyg2wDXtuYZBF/2MUe+uakg14LU0hIKZbHT63wX
         jF3w==
X-Forwarded-Encrypted: i=1; AJvYcCUbOvVVtb2JWQgjYThwXn7OPyjLvWnFtP8V1a09Lm/s4ksd7eiUkL1CGM7K2XIUbfx0tAqkfaB0CVA81Pc+YWaa5ZCWqQNDnqFclw==
X-Gm-Message-State: AOJu0Yw8bi2kxJdXqMKgCJ6qlTMnDkRCM6urfRlibVMBw/n/fintOVL9
	8u/beQFKdbHprWN1CT2/Kg5cA37jc/btDQ5KRoLUqRzaNAd6PGd9
X-Google-Smtp-Source: AGHT+IG5EOjMCDt4pixur26JEEpvHGDj1fIKjTHRorIkdfy0EcCrdWmA52/OSCNjq6tTnCmbEj9aGQ==
X-Received: by 2002:a5d:5244:0:b0:33d:3553:d395 with SMTP id k4-20020a5d5244000000b0033d3553d395mr1006409wrc.15.1708677776485;
        Fri, 23 Feb 2024 00:42:56 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id m20-20020a056000025400b0033d071c0477sm1912522wrz.59.2024.02.23.00.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 00:42:56 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Feb 2024 09:42:55 +0100
Message-Id: <CZCBPXTOU5QM.2CV2WOTP0YW48@gmail.com>
Subject: Re: ath12k & ath11k beacon miss detection
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Kalle Valo" <kvalo@kernel.org>
Cc: <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.15.2
References: <CZA2NS7J83D4.18SU6W9R96KPY@gmail.com>
 <87a5nub8r8.fsf@kernel.org>
In-Reply-To: <87a5nub8r8.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_004303_331459_197E60CA 
X-CRM114-Status: UNSURE (   5.64  )
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

On Wed Feb 21, 2024 at 8:02 AM CET, Kalle Valo wrote:
[...]
>
> Just a generic comment: QCN9074 and QCN9274 chipsets are designed for AP
> use cases and their firmware tends to be lacking on station mode
> features.

Yeah I know full station mode is not to be expected on thoses chipsets but =
we
do use them as such for a short period of time on our product...
We just need basic connectivity for a few seconds.

