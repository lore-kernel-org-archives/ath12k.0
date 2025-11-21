Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97461CFC278
	for <ath12k@archiver.kernel.org>; Fri, 21 Nov 2025 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4E4qgWLZbJvc0nks66Kf2sl/KD3LP6StGpvCGYDfDXY=; b=m46MKOoJBjMbSkLjqX5c5JpbpW
	GPj01WXE+ycw9tyZllZfIv5+N4SaGpmm83DTykkrpecsexv3XbSgpEm0xk/tyaPLHXCSuGMktodAG
	hNiQS3KO8wlFYDTzsko+HH0yCKbBU2oGRaG6M8BqqXMOTDEiBakDHmUs1R+bsLHrQ4uX0OSbgpq3X
	vB3FKLglI8OP1hqQgty5GzUG8A02PzKnJX0UBZZpedIy83ryddV6qGohOQni5t7W7IhOn4sWQwecE
	cHdPLsB7qGUtEklqQIeutYPhiA2CroD7q4tE6BOXrBW4hoZVopAHynLZCH9swftdsnLEGJR4xDD1o
	KUTu3Kfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRCM-00000008PcQ-0xSs;
	Fri, 21 Nov 2025 13:29:14 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRCJ-00000008PbN-0AiA
	for ath12k@lists.infradead.org;
	Fri, 21 Nov 2025 13:29:13 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b7277324054so311097366b.0
        for <ath12k@lists.infradead.org>; Fri, 21 Nov 2025 05:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763731749; x=1764336549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4E4qgWLZbJvc0nks66Kf2sl/KD3LP6StGpvCGYDfDXY=;
        b=AWolaUjX4sYRdipBZzETXgd4PZKzgXltuCuHTEMtwZBPutkMcVj1DuFQaqEeVJE7X2
         Py3Z8P18LQWaRS/V+O7V6/TvA9EEYPrL8q3ZQ4EeknHuvyIWjnvLcigCdnh5KPL+DOZu
         wh8qsxql/AVqCobSqLkd8Irw73lHJfob6hWZV4l2ZLSsKJ29FuTWkQO7pL2c9zZ04MQ8
         zv3vWjud1POG/zzCttSJ6hQpLZYbanqDiNKLPqsMqXTh5BLOjZ945CQSmX4hHBRGGzPU
         rn4ob8qrQU4qHaDEbRWZTK9dWMfK/hGVYHX2tL71Z3I0bfJK6CEBCFwNxINwMFqK3mb7
         S96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763731749; x=1764336549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4E4qgWLZbJvc0nks66Kf2sl/KD3LP6StGpvCGYDfDXY=;
        b=W6eWbOVRkhxX9H1PTbF640KHGl/XEb6EhV+GlgBCIPMEY+ILa0bgfxuV/y4QBtwhzd
         557n9DVIKe/9olTN652stZ6QCZ7MHOoufVvThhazVQAApCsoIKnhpEwkg+g0uL9HMUh7
         FLGeS0bZZI15va4s1upp9RnqQadD1YWmlQd3gQaKi956AgfbUP2uqVTwAGs9p9q8v+7L
         nt6zrY9xNt28UabhZvpDgY0MBu7vYoXc+l0VGRbF52RHtfWB8Ju4LJa5hGlVSwCCowga
         jwHUzsaK01LeLHyHbPR9B5C1xwMQrEp3P7pOLXH9UwO8OxpDp6YPJlSVq/vQpMBcq70R
         3E4g==
X-Forwarded-Encrypted: i=1; AJvYcCVlHBASEZNypQOFxomidA7XMHK7RSK/YH7wPYtXXGOg07XmA2HO6U1HIM+mMqEdJS1w+bkrGJU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVhYIaxz1hwIMnFsPJTajYgp6/U43cbCs9KBF3CHlBrl1ZJVth
	bfFrlbC6yRieIeBfW9Dphh5BTPYP5E+GYql6PStpYLLX51jZ9wH+zno=
X-Gm-Gg: ASbGnct2Cj+eUq7s2yR4yJqAJ50idEnYNUZrie0bgLIgcRUr+bilY9yyiUNY8WmIDMM
	NdQdDPug76jcwe6HguZh+WpSzdRpDnKnvUco33dA1gSMJXiDprwK1H278SSPzNuhp3J+7NGtTrz
	5u0XM+uFzu6FRhjlp6ypwpkN65POdVViOH1sJdmNF01vI5Oz/Zsp4HcHDD6Mav3PzEEyO96iNjt
	32nC8mKfKzEFbAdSuHFUe1loqYIk0VirqttQrL/Xy3H+kwJeXjeXudCCu2AAzXBqZD79glM23+5
	ZR8x3omILsBrel5DVs2oaFqYWZ3gVDYnDgGhW/RpHM8DnqfoAz/mRyivjfF4T2Dd/WxPdxBYg5M
	V7qLNqVZ6QUITse32XzwrDrvC4VTJrmn0IQoZ9bZYCMlxjI9WqGRkhZH+BMq2Z+/bEWIU1qbQgs
	xcndSjEuPyIBHdMIz2curZy+GLnUiV1XS0gr6t8o8Gq296RiE=
X-Google-Smtp-Source: AGHT+IF+fRHUXtIbFHexbW+bX7vS6xhtJysRXvMNTGrbcAbQOhcG/TSSGP78YliQlRoGmwcWofF6oQ==
X-Received: by 2002:a17:907:da4:b0:b73:3ced:2f66 with SMTP id a640c23a62f3a-b767159eea3mr272040066b.14.1763731748949;
        Fri, 21 Nov 2025 05:29:08 -0800 (PST)
Received: from frutis-latitude7490 (public-gprs376887.centertel.pl. [37.47.103.120])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b7654cefe53sm459963266b.13.2025.11.21.05.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:29:08 -0800 (PST)
From: =?UTF-8?q?Pawe=C5=82=20Owoc?= <frut3k7@gmail.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: =?UTF-8?q?Pawe=C5=82=20Owoc?= <frut3k7@gmail.com>,
	ath10k <ath10k@lists.infradead.org>,
	ath11k <ath11k@lists.infradead.org>,
	ath12k <ath12k@lists.infradead.org>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Kalle Valo <quic_kvalo@quicinc.com>
Subject: Re: New staging repos for ath1*k firmware
Date: Fri, 21 Nov 2025 14:28:25 +0100
Message-ID: <20251121132825.1663248-1-frut3k7@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_052911_107408_5F61B789 
X-CRM114-Status: UNSURE (   5.35  )
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

Hi, is it possible to release the new firmware version (2.12) for the IPQ8074?
There's a problem with the latest ath11k driver on version 2.9:
https://lore.kernel.org/linux-wireless/CAKEyCaD8RMqPvwZOxgwAT4G=h-M94ToxoSdYwCjfvZMiM8mB-g@mail.gmail.com/

Regards,

