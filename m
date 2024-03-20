Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADBBC6FD1F
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 16:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUwKm7BqeblPkq1tsT98ofSwE4PJdNs+3DB4xYP8WE0=; b=B7VIzHe/Vu9zSbU2az7A+ESHBv
	ZagG6xrAlAAgV76SmHAhPR3eBQqGtnc5PLj3pe5rBQZHSrPT/S19MyC3ZFumpd2/oxSXsiF/536MV
	SUfW2gZmAPbzWgWekuFrnLmddEoV5XpyiM5MkZizG8M9LmTHkgHZ8pJrJHlLp9XSCYzDOhtFfrpbG
	3E6DPzdeCSApmcGMhdz4ALUwO2IKtQukAXz3UGsHUnhlpOPm50wb+Lci669uYRWFvmcgrMuFwy8Sp
	SQnHTOBQoWPrsHtNBXsQZFWh+57UCmSplt3V56h3/3MzPuIW6+1R2BfnNvtqewfRFj4kYg5QRyQ+k
	zhQuBkxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmywB-00000000L5G-0rc9
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 16:37:11 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyw7-00000000L3W-3Fpr
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 16:37:09 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-56a2bb1d84eso129891a12.1
        for <ath12k@lists.infradead.org>; Wed, 20 Mar 2024 09:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710952626; x=1711557426; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUwKm7BqeblPkq1tsT98ofSwE4PJdNs+3DB4xYP8WE0=;
        b=L/x3wmz8huHhtLD1lGEHGXnwVtyKZmmdFEyuiu4twOxkS1slj3nzc3oevwbbuwCrlA
         IrgAzWjzMLdM4AUqGXqEecB8b6WQJM5KkQtnLG55EXWYKY+ZHj9/LdesIO1WPVYATtCF
         rkRpda/4jfsObk5E+y6OhcDQz6FfZ7Me4BfKjsMqaS/lBI2fKdvSzlnsOKXCHC/hZtiv
         ryoBECe4eveg+f2WcIex5HCd5lPbFWijFu3TCExX34LbdYcgMIXmoJitp4b3GG89ow3i
         tgZngwgKDEOAwGczF/WTgwC5WrnuLBIYY+asxz3YCy0BsNfYUQb+YGPxPsY4SPuiQfFt
         TgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710952626; x=1711557426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUwKm7BqeblPkq1tsT98ofSwE4PJdNs+3DB4xYP8WE0=;
        b=jirEpjNWIQo/zA+ztpXnfgqHgggVzL4RgHcXK04J42M2/xU+rNNJdYOwAJTI0YN4QI
         1g1WXiVIyaVX824VWmmjjWtCsm2AbjvtCM1tv8L9vDCvhAN3MAQDGOBlgOcQGgy0uHyq
         Y/1+9TFyGjg5ZJWKE5QlmQjwBftWeRuoy2PFm1sHXXGgSeZeivNb1xiRrtSKxGiSd1jN
         TZi+1dElgv5NKdGVqbVhvnUg9IO513BgDZaJCzv1mplnkZal+Ip10pdCKKkli75imojX
         tSgDeq+H5jwOW20WTFIQ2yHcY9+SJRiu9B9zyvfU6cVoYNieZLbwqT2pUEqTE6WjQxxV
         aB7g==
X-Forwarded-Encrypted: i=1; AJvYcCUGp4ZrdSojQvTsfRi2jfwlvHEOiOzQF/3cCrqHa0fb+RxsJADtBEApc3OGk4AkX9LS1JzXEZma9KmcNA5jn1z6zK+3op7WSpwqxQ==
X-Gm-Message-State: AOJu0YwX6nqV38joLfHeHCJmG9lyyj09JsrZTb6FFufFmr/UNh+CpGE4
	5dflBgGoRDdBmW48N9m649MCZjMcb5KWdstwOVhOvRh9iZeKo8k+lG7xRHp/Y2uKA1gv4a2eRoW
	UYZFNPfFTh/byzq7Xn8/mM3ttcjs=
X-Google-Smtp-Source: AGHT+IEKigdEHpcAYmHrYJ5VFeuBkoQNwm+BPEKC1eiuCSOUPP8baDoe04bgSl1yxp845vNg5z7ceu7H4wVDZ8pBT2I=
X-Received: by 2002:a05:6402:3709:b0:567:f475:6c6b with SMTP id
 ek9-20020a056402370900b00567f4756c6bmr179026edb.8.1710952625879; Wed, 20 Mar
 2024 09:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAHohoUjGROZ=E-D_qJp3S6dLUwA-PfAWBCU7pAkPVBJqkG=QQg@mail.gmail.com>
 <87sf0kan7d.fsf@kernel.org>
In-Reply-To: <87sf0kan7d.fsf@kernel.org>
From: "Owen Mesh." <owen.mesh@gmail.com>
Date: Wed, 20 Mar 2024 19:36:54 +0300
Message-ID: <CAHohoUh9nt06n_eqFwVf3k6vbqJb5akxvgS4i8sNHpadDzUOEA@mail.gmail.com>
Subject: Re: ath12k: driver does not show tx bitrate
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_093707_880775_09778337 
X-CRM114-Status: UNSURE (   7.35  )
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

Thanks, great
I also noticed that a fix for missing "signal strength" is planned!

Regards

=D1=81=D1=80, 20 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 19:21, Kal=
le Valo <kvalo@kernel.org>:
>
> "Owen Mesh." <owen.mesh@gmail.com> writes:
>
> > I found a small bug in ath12k driver with wcn7850 adapter.
> > ath12k driver does not show tx bitrate.
>
> We are working on adding it:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20240219095802.=
1147-1-quic_lingbok@quicinc.com/
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

