Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1907DC27C53
	for <ath12k@archiver.kernel.org>; Wed, 12 Jun 2024 07:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6o0FZBPMx+nOIu/mzHBniZ5GdF+FcAxR4uXfrLlAu8=; b=YndL6m9jT0DgxvFrkLuCp+9cys
	eFMdsfAy5ftSnI1IWI70CNoL6/Qh9SxISeU5zRjd+Bfemvzdz9elxqYKY6yNZPZrTtFAyyJafg56c
	4Ihl2a+ALq6QrpboIQKdJJ9/NHY0CwPneJB0Ili/0IQgXlo1d1C/8e7II8sFIds1IqkBofjQvshps
	39x0BP9FlYxlNQx80Jbgg8cPZmuj1fUwWuADRCswYNAf/dFg1u42KmRyAB3vRqmQ+eIikLzZTJoGG
	8ztQ8KRws9rrTcWiUTwhxGFrYqteNPmFdwfrj+zhDeRzbij4Z3cPnXK+aTkowMXuTeVxxULoSc9Kv
	ZK0z1log==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHI8T-0000000BNbB-2vNY
	for ath12k@archiver.kernel.org;
	Wed, 12 Jun 2024 07:11:09 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHI8Q-0000000BNZM-2lDA
	for ath12k@lists.infradead.org;
	Wed, 12 Jun 2024 07:11:08 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ebdfe261f9so50085041fa.1
        for <ath12k@lists.infradead.org>; Wed, 12 Jun 2024 00:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718176264; x=1718781064; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6o0FZBPMx+nOIu/mzHBniZ5GdF+FcAxR4uXfrLlAu8=;
        b=IUgSNOwJADYdJRSlJ67OU5CVmQZnQRa0hascidxSTLcjqpfxmlRqSnjfHckw0I2nR2
         Xe4EAG3gdJZnRsfrKdJrNSrFGgPal4dHyLkwFy74rIcvznwE7zPoWRsMatQtz0ktRZNv
         1sRU/aUelv/B85EASgvCxuDuvecbx4UfKCbsVmLbTmcyA8ErmkBl/lEuq17Y9W/Qeykk
         47dKy3jx1dVQ0Ukc5gUya5ykptYM2MNt9Gcxq60bpMfCFs9Oh/5FAQ2PQ0hgDz5WHRcd
         BebEwZXJfaxVhf2dbZmAlPW6kJPKoK0oBKtkdxZbkiyhuQKtkE3XDzw7jsYyb/ulyxsm
         JtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718176264; x=1718781064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6o0FZBPMx+nOIu/mzHBniZ5GdF+FcAxR4uXfrLlAu8=;
        b=bC29ALyGhmWgDH8F4cEmEL7nLgrgXnaKDjGv2+WbhQoMmfAE2Ut/pPkp/v5mLvFtzS
         oQo07CYj5BtQGf1X6ARH2SzVc09CzLyXsD8l8JESyxqYvqxOabyic9aIIKm4UqpQJb/h
         9ebu6sLWsTCkHugRhNtuVGJuVIAfB3M+aZaEDtCXZuaP3wG3dxrcTMyyq4d8foiYq7vS
         whfEy16LvGQbRWwLbzMJhtddEg/wQhqUBtRbluiLfKH+/TbrkbrUvKPB7S9mqAbYgk2e
         /LCvrlXKTY2D0WpWZX08YjWYtoEUjIdWEV81dFJ8j/+TNVE+65fu2OMLYF2fdHKJVM0S
         hoJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC9QgI+pssirGb6vhvheBcojB8A1kdeHQ+2fhWkbhUJy8n1eqcEO5C7ibtKl0NE0Ho735lw2UWXhsR206EL5QYFZDs4p7tjnLPfg==
X-Gm-Message-State: AOJu0YxexAN66JTTr17sGzsxazEWAI3bhiMg16jvTYiXhceOZ+SpcsD2
	5iZpQxVmeQuyARg9Ot8zS4J1inlN9ljGsKl9vbdCZGRQcpBpwSJfUAXuIYmTG+8HGjnHw1XOCwp
	xM0gSi5K2ydGtpLbx+9ZU1RXFaQsG2R2hnkYbzA==
X-Google-Smtp-Source: AGHT+IGbd4X2fJf6zNeYZx/X1mM77+GhoF1Zhv+mm3RhXCxcJXVvZIgRJjoUptYt08IGG4KjkAvHHP/xFOcuJD7oR1M=
X-Received: by 2002:ac2:4c4a:0:b0:52c:826f:f3f1 with SMTP id
 2adb3069b0e04-52c9a3bfbb7mr898457e87.2.1718176264237; Wed, 12 Jun 2024
 00:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org> <20240611225428.GA1005695@bhelgaas>
In-Reply-To: <20240611225428.GA1005695@bhelgaas>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Jun 2024 09:10:53 +0200
Message-ID: <CAMRc=MfE0o=ohK6fpJN6=J7hmywifneBaNdSxOgeGH9iZ1uvTQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240612_001106_822040_F4DBFA24 
X-CRM114-Status: GOOD (  20.96  )
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

On Wed, Jun 12, 2024 at 12:54=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
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
>
> The PCI changes are very self-contained and any conflicts will be
> trivial, so rather than messing with an immutable tag, how about if I
> just ack them and you can include them in your tree directly?

Sure, if you're convinced that eventual conflicts in PCI core won't be
an issue then it's even better.

Bart

