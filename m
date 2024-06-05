Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0AFC27C55
	for <ath12k@archiver.kernel.org>; Wed,  5 Jun 2024 17:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=N7brzQL50/5+7/ze0/eIpz/efP5s8C3CTfNGnXkiqTU=; b=Zl5M/BOBVpRbR+ez/IN2B1pdZb
	sRmBN42DBg0r0rwxgK1AE/Imx0Y9diaVOArhhmxDYMDHCj4/yJuKmDkJo/qknPyccNe8oOImlRVrf
	OJVXliW9ANhM45vj7Z1dpRrsYxfC8H2L3V++uOzusFYzK8hdeVx0ag9+ECYuWrr+8KWbBL7M8ipSt
	hijefyRIC+GJTQyf7xvsKx4GIiFygxhj0HMkbExiSphIlGo7/DFGK3QPQC5jWRJioEbL0XBwwhYrq
	+O0MHPXS0fvRD1mAwv3uekeZbo4RerSdf2R+mXIaFb/8Sk8EedQWFoWWe++E2KKZ10NkgR50wjFKK
	C3FsM/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEurv-0000000726S-0FEm
	for ath12k@archiver.kernel.org;
	Wed, 05 Jun 2024 17:56:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEurs-0000000725H-12Ov;
	Wed, 05 Jun 2024 17:56:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71EB261A04;
	Wed,  5 Jun 2024 17:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6DAC2BD11;
	Wed,  5 Jun 2024 17:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717610171;
	bh=5hTZDZgWwowr+2AQ2lcFfI09QAJ6OolISbaea+hj9pE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Bnqcj30/lc0LZwOprhljD/nn9cHX4h+CxuFrtg+3wNCxZqbE4KNaSShp3BSJfNsrX
	 8Om0TR4a851Jnx4sr6WeulZ1ygwYBhq+8fpwQYeOT2yX0NxUnJlvVqd9SC/69ZR6Da
	 mF2r+gz2YlF4Sd9esbhyIESf2nfDkiqnD/1BOh+H77meLY5WCkSBNxv5PCdk5G/T1+
	 YhINXIUoZZxPj3hC/wsLU0NsCss/84TLwLEX4bhUw5V+Z0kdrlb85ZVrWvvhgP03DS
	 +6WyOQ+FMOvX/+IX5YFDKkSvw0SBqw43PAhtMiYW1zG6ucIIoCk5z9tLO2ab+2PyH1
	 qGJkXclR+OZhQ==
Date: Wed, 5 Jun 2024 12:56:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Alex Elder <elder@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath12k@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel@quicinc.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v8 00/17] power: sequencing: implement the subsystem and
 add first users
Message-ID: <20240605175609.GA768239@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf9SDwo+RzEF8d=2Si3-KQVT_Xf8ew4k6+FQAyvOS+EvQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_105612_419052_1EB893B7 
X-CRM114-Status: GOOD (  24.95  )
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

On Tue, Jun 04, 2024 at 08:24:34PM +0200, Bartosz Golaszewski wrote:
> On Tue, Jun 4, 2024 at 7:19 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Tue, May 28, 2024 at 09:03:08PM +0200, Bartosz Golaszewski wrote:
> > > Note: I am resending this series in its entirety once more for
> > > discussions and reviews. If there won't be any major objections, I'll
> > > then start sending individual bits and pieces to appropriate trees.
> > >
> > > Merging strategy: The DT binding and DTS changes are a no-brainer, they
> > > can go through the wireless, regulator and arm-msm trees separately. The
> > > bluetooth and PCI changes have a build-time dependency on the power
> > > sequencing code. The bluetooth changes also have a run-time dependency on
> > > the PCI pwrctl part. In order to get it into next I plan to pick up the
> > > power sequencing code into my own tree and maintain it. I can then
> > > provide an immutable tag for the BT and PCI trees to pull. I wouldn't
> > > stress about the BT runtime dependency as it will be fixed once all
> > > changes are in next.
> > > ...
> >
> > > ---
> > > base-commit: 6dc544b66971c7f9909ff038b62149105272d26a
> > > change-id: 20240527-pwrseq-76fc025248a2
> >
> > What does this apply to?  I don't know what 6dc544b66971 is; it
> > doesn't seem to be in upstream or linux-next.
> 
> It's next-20240528 but it also applies to today's next without
> conflicts. What do you want me to base the PCI part when resending?

For PCI, we usually apply things on topic branches based on -rc1, so
that's the easiest.

