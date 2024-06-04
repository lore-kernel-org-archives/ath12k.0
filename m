Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16748C25B78
	for <ath12k@archiver.kernel.org>; Tue,  4 Jun 2024 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YajuiVABIxMlw/Xt1HbUpyxnW+sg47NgMW4NcK3Sjcc=; b=tkfB9pfizmn63+VkFF13r1ttdq
	cVRDinM/zc7f+BEIuBiyuXDgQnOcAaoJurpgtXtLSZq0g4vZRVFwaMU0CVe82IwTXJxZEP0RtDvl/
	B4p/CKHKBuWkGMzO7VAI8RPBBCki6DPHSV7ER7lDy9pQEGGMXq23M/VnwzJ9JPMFditt29Z8yUEkU
	bzqHizcsRF3UZ97azgHmKWcoAr8ftFVrmbH4jdh75q/nIDJ4zl59mIJ0+jEBBjaqUuyGHKF2PihrS
	gjXdUaMABDkqTHHdabilJsBJ3Vq+OsFB+uXXe+uYnX86jw2Z+IcEBEXipWeLNuKoAXyZlYgxkGhgR
	+fUjoGug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEYq8-00000003Riv-3MS0
	for ath12k@archiver.kernel.org;
	Tue, 04 Jun 2024 18:24:56 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEYq5-00000003RhN-0o8S
	for ath12k@lists.infradead.org;
	Tue, 04 Jun 2024 18:24:55 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so47357721fa.0
        for <ath12k@lists.infradead.org>; Tue, 04 Jun 2024 11:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717525486; x=1718130286; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YajuiVABIxMlw/Xt1HbUpyxnW+sg47NgMW4NcK3Sjcc=;
        b=HcuTFShOi80YhojA2SQKbSgKfAFR1WdVD4BD829bY5G2JdWiMHXcHo7LKBicW0NUWR
         8KqyOzVAHApeOn1yeXUkNhyg6LIZd6Zha3sQC+N2YU4JOXN2qoEdNNxImxQXKMWNukcp
         Tn7byDGCjWJB7Wsx8jgo9mXGtOf2dGEvGakczJJS5g6tm3YErboa/XZwbwhg34vTaylv
         Y7dkb2sRCUqcmh2x04CbhIyTRP8A3M6ULtcY9TRDstuaW/91P8ukwNlgPXLvR93Z+Noc
         6VhKvX1bViJO1lrItzAvAcdq6fVlIe9ODjMmkTOTQ1QTHDNLKzwsp8xiq4NwtZac5yZq
         xauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717525486; x=1718130286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YajuiVABIxMlw/Xt1HbUpyxnW+sg47NgMW4NcK3Sjcc=;
        b=gUNdcxo4HPHU/jebzKel7E2bz0jKPVZDATyV5U/Wt0O6+/5FKkJn9jn8C0mhjAVSMc
         tU9EK5lXE4SAqJQ0GoysmDtt5dDnOIhNMWvHJG0j8kHBMua+DAuCr2UiZ0givyRSDJOX
         hzVSXJUzUM/55LWiH/3WF3rjV4/df5o086B0kQVFgUn839VW8u4vwv+hkxG24sp9EP2l
         e0Y/G+St3ofk1Ubi2dBlKj/go/G7Xc+AyJeilIX8i7jrjbbNM0J2mYdN+TWQc02ghjfS
         3jK+YjuZJoB2AEKKhSJBeDaTtXMp0SJX28xQaN+Eh092S3NxXHKZ+sir4pKCbET8Uuni
         brgg==
X-Forwarded-Encrypted: i=1; AJvYcCVML0vyVdtkAnHj75FPq8fyb7migtkavnefu8tWjZd+ymqHg+utaCXYX1tU5jpz0Am4D0eCy8CSob6Li577/hI6KpXM5QxGKlCjNQ==
X-Gm-Message-State: AOJu0YydPRMvfwBV6+MjiuFpdX+vA7spl8QZCk1ioAY7B/hg1WYdGvBW
	cZzIAwtpULQWF7bhvQHL6+o7gu0WZqSjDs7qh1QAJklMbRLUHjlDpeodQhT17gpZkL7IWOwEKzR
	iotkz+oQMOD4W55rc7wsZyjWpyHXEqdnLs+aBlg==
X-Google-Smtp-Source: AGHT+IGLi1e1brdH2UNouYUbAUzN69aAALtAIZxoqynkaIYefJpLBuEQv8MM/AiBkSUTcEg9+r81ijCuWPOmcLI+5Ls=
X-Received: by 2002:a2e:93c7:0:b0:2ea:8f93:a49e with SMTP id
 38308e7fff4ca-2eac7a68282mr575891fa.36.1717525485967; Tue, 04 Jun 2024
 11:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org> <20240604171950.GA731649@bhelgaas>
In-Reply-To: <20240604171950.GA731649@bhelgaas>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Jun 2024 20:24:34 +0200
Message-ID: <CAMRc=Mf9SDwo+RzEF8d=2Si3-KQVT_Xf8ew4k6+FQAyvOS+EvQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/17] power: sequencing: implement the subsystem and
 add first users
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Alex Elder <elder@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_112453_468391_D55BE996 
X-CRM114-Status: GOOD (  22.12  )
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

On Tue, Jun 4, 2024 at 7:19=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Tue, May 28, 2024 at 09:03:08PM +0200, Bartosz Golaszewski wrote:
> > Note: I am resending this series in its entirety once more for
> > discussions and reviews. If there won't be any major objections, I'll
> > then start sending individual bits and pieces to appropriate trees.
> >
> > Merging strategy: The DT binding and DTS changes are a no-brainer, they
> > can go through the wireless, regulator and arm-msm trees separately. Th=
e
> > bluetooth and PCI changes have a build-time dependency on the power
> > sequencing code. The bluetooth changes also have a run-time dependency =
on
> > the PCI pwrctl part. In order to get it into next I plan to pick up the
> > power sequencing code into my own tree and maintain it. I can then
> > provide an immutable tag for the BT and PCI trees to pull. I wouldn't
> > stress about the BT runtime dependency as it will be fixed once all
> > changes are in next.
> > ...
>
> > ---
> > base-commit: 6dc544b66971c7f9909ff038b62149105272d26a
> > change-id: 20240527-pwrseq-76fc025248a2
>
> What does this apply to?  I don't know what 6dc544b66971 is; it
> doesn't seem to be in upstream or linux-next.

It's next-20240528 but it also applies to today's next without
conflicts. What do you want me to base the PCI part when resending?

Bart

