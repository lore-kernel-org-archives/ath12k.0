Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9C9C0218C
	for <ath12k@archiver.kernel.org>; Mon, 27 Jan 2025 07:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KD4kyqPouOmUkv3WddUXdqITfDkJwtj7Ck9nQWeDCZU=; b=MnXOZSu3sQXuEE2BeaG4HYXNSd
	jRIwFlpSgdQITG85qzodhIolCtuo4Fe35dQ2zeGv98OcAtCqWALIPUMoWCtCh01HLnoIzpsg/gqAU
	6YRUOJ8w7N6fZI2lq2PzgyM2eWUxjhrSn2fkydH4Jg9KxhvHP7ZklCwrN/8z65wZLX7v18JX/ODHy
	iFISbrlrsJnjNUT9ZYFSm1GwbwS93ODazjXPG7/Dma3Dpt4VShZ6DBaKpIw8z5Jmfz6lA4Rtdc6Tb
	5MCEgSLhsAy6HSQSar0xXGDqACHg5cMogbmTuY2GF4lgxkVQv9+02gUrs+SdFFJniNHTDXD9O8TXL
	UqDmzXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcJDw-00000001m0r-0rrr
	for ath12k@archiver.kernel.org;
	Mon, 27 Jan 2025 07:07:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcJDt-00000001m0V-0ykC
	for ath12k@lists.infradead.org;
	Mon, 27 Jan 2025 07:07:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so46993805e9.0
        for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 23:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737961668; x=1738566468; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KD4kyqPouOmUkv3WddUXdqITfDkJwtj7Ck9nQWeDCZU=;
        b=bu7WWnjqjgqYPr4lNw3xMm9iR82iNb3BMcbyAaU0iUI1l5Uj2w1c5WajER2nVTwD07
         wVGssj3//BrYMskoleSzamzTxQRsd2jH+Gn7Ch9aLE9QPjJK9aJoXB65ZqlNNWNB4sPU
         RHQZJFURgTVwl4X6CO6aqzcEDD4B96LDMxA5WaeuUNfAmAEAaMRZKkg+L8vTWgWu9e/y
         DzWaUtGGhWkwMFLx52meFjpmjoA2h7D6yrrZZXe8EyJm3VYCjQVcaD8lqp02QSOZkuTO
         8t8VarlK8ZKqKC8tW8GSK3z6YagDAO3MjthDOH258oEK+ZmyRWzsdrWV68hIC38vNBVi
         6xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737961668; x=1738566468;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KD4kyqPouOmUkv3WddUXdqITfDkJwtj7Ck9nQWeDCZU=;
        b=aXUq5//KwHx66DfbUITfocHjoY8VwAiGqabc86IkiMx+qyeaGw1CKzeDxNNner/uam
         q4CjXjNT7qpJ86YAfZf0LXp/aXjRCCCStOYi3W9ZbDhX/iQ85lqITDyFo9mqBEkOFLtm
         I1HszZqW5XO5Crp/2ECNIMxkehk1NfJdxyjcxuHauZ9uyBcrYuJYUz2YkIEepO7OdO4P
         QJqXoyK7TTVNByrxKRGNgZEHCZyCpViu4xI6viNnweiZCMB7v5N6Q84La4puLcZ/G+nE
         Kh5AxmjtK2X6Rh9XnjGAwnA/aOnwXKkmBku2p2B2TDoT8TgrGv/1QSAfdf99dPq7jC4I
         RH2A==
X-Forwarded-Encrypted: i=1; AJvYcCVB4yzuk5uNB/fkiWsyk5VNZvSf1UGlyvxzPlnlh4/2Et8b09qFkBxJ/DYvzI4DdWarlDu0pjc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyhSfb3PflmYrreEK2JMNU9U93clopqj1e5fNgKKZ1GJPtno9E3
	ci1JYfjhOe8RmlM/0AkJKADZpySiZcU+CqRfVABWzD2BJpnH5W8W
X-Gm-Gg: ASbGncu0JSE/CtxwadAPmhWYuKGFE5FJcXtdXGU/2/jMuu6LXgUTb4DuEqwCnyzNe/p
	Nq8mISaTC3UQheIDdyZvynVIUmGtitzSI8vr88IadXPBk3rqYmTGTThfeyzOmDFUStKdg4/E+cD
	/4RwN0ghHovvDsBapCELIIOgE1MevQ6UrxRzyYfF9/bazhYUJNNMj8r/ewXUrzrxvxs/qKR//1u
	s4DMqBMgVoNw/kFMlZfTD9c5SGGOw/l+FsMk9gX1OStwIL+SCeEHn+WheAMUgWcZX7MoT6TnsXb
	bn/SwKwiyd2gOJGu4W8tBeRDvUM3S7gHXQ==
X-Google-Smtp-Source: AGHT+IFOPnV6eg4/EI+Rko3jvtnrVjmrQCAEaaNUSykSMgz6DJj9K7/e2xe81AYlKsiiP23KpiIYHw==
X-Received: by 2002:a05:600c:4e93:b0:436:1b81:b65c with SMTP id 5b1f17b1804b1-438913df89fmr355619255e9.15.1737961667721;
        Sun, 26 Jan 2025 23:07:47 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd507e46sm121287365e9.21.2025.01.26.23.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 23:07:45 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 08:07:45 +0100
Message-Id: <D7CNZQS09N54.JU8UK370JWNZ@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fbx: fix
 ath12k_hal_tx_cmd_ext_desc_setup() info1 override
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, "Vasanthakumar
 Thiagarajan" <quic_vthiagar@quicinc.com>, "Karthikeyan Periyasamy"
 <quic_periyasa@quicinc.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250124113352.93638-1-nico.escande@gmail.com>
 <a979cbc5-5cfe-160d-d5b9-9e5ed7513ed1@quicinc.com>
 <D7B63ACJOYD0.1XBZ5VB991KOW@gmail.com>
 <18b47227-6b77-a029-2e80-04a0455ac091@quicinc.com>
 <D7BFM42HW2NL.2IZS207VTCTJN@gmail.com>
 <23d62bef-2393-4232-93ff-82ca4dbc4524@oss.qualcomm.com>
In-Reply-To: <23d62bef-2393-4232-93ff-82ca4dbc4524@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_230753_271342_59002261 
X-CRM114-Status: UNSURE (   7.96  )
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

On Sun Jan 26, 2025 at 7:16 PM CET, Jeff Johnson wrote:
> On 1/25/2025 12:21 PM, Nicolas Escande wrote:
>> So You guys prefer I remove the fixes tag then ?
>
> Yes, please don't add a Fixes: tag if no current upstream functionality i=
s
> broken. This may cause the 'stable' team to spend unnecessary time backpo=
rting
> the change for no reason.
>
> /jeff

Sure, no problem, I'll send an updated v2.

