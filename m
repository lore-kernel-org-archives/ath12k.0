Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFC1C27C53
	for <ath12k@archiver.kernel.org>; Tue,  4 Jun 2024 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=0NVb3zaOJvIrNufQO1zCtKGZqjgMRLXWdNcF/N4dMzk=; b=kWipD0IdKl5bOX
	MIl//spPAoi4D0I/OoszIlulLblFFkvd0b7qS6BlkiWu446ZxRYPptveijYoIZGGSBduyGl6kEmzS
	vCEnJmbf8rsDM+FLP6t9/nbvCLjRJyEuAz2SpHaVhNTeyrRTvb9othsBr9ETHHXC/KIdfpBH+BzCa
	Hcz8FVuTQjXMR/KqEzTzsfTFuZHD5f3aseyfso8TRwwVpHd9+/RtR0rwdeymMLplf3jCw5VqaURRT
	xbfx3b9XAufRyGqK6zqq+hlvgj3yUbR7FtZYSxo6mcuZkwSshrcojxCHv+4qFPagmO78LVjVn2OQ0
	ReA+O/fU1o3kAoMu8FQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXpF-00000003H18-3OgG
	for ath12k@archiver.kernel.org;
	Tue, 04 Jun 2024 17:19:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXpC-00000003H0S-1MYJ;
	Tue, 04 Jun 2024 17:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDBB76122A;
	Tue,  4 Jun 2024 17:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5358DC2BBFC;
	Tue,  4 Jun 2024 17:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717521592;
	bh=ahgtXc4qQiXa8mwemiBOfb1WhBE5WcSDQDlT80ff1yw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BXk7AHJQZhWMGA5FR5N42VZ4YfP1FBB4v/UHDo/4Q2sz1BqFhtW9bOeDkoS7kyLjH
	 RETUQsjJOPfZvJdgRglyAIUsdlwJRJGWB9leiecxMdfJp4QNKGQ/YxwEnru5aV421G
	 OTHjZHQwph9R/p4Rt8KXAeI4/vjvIj/nHGfcalXJg0eG36v54xh0bx5HCNf+OGbldW
	 w4djORfUXitP26HFUAa2Fp5HDu4Px3SXAjoTSMcRgXl3nKAcDGy1hc6DxDSQBP1/UA
	 3VH9EXdVJL8B7uw7ZQQHBXO1hvWfi2DAwah0DrDoLQhxDHipKevtC/mAkKAEXA7u33
	 98SvIYye8ALng==
Date: Tue, 4 Jun 2024 12:19:50 -0500
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
Message-ID: <20240604171950.GA731649@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_101954_429861_7B064E0A 
X-CRM114-Status: GOOD (  15.78  )
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

On Tue, May 28, 2024 at 09:03:08PM +0200, Bartosz Golaszewski wrote:
> Note: I am resending this series in its entirety once more for
> discussions and reviews. If there won't be any major objections, I'll
> then start sending individual bits and pieces to appropriate trees.
> 
> Merging strategy: The DT binding and DTS changes are a no-brainer, they
> can go through the wireless, regulator and arm-msm trees separately. The
> bluetooth and PCI changes have a build-time dependency on the power
> sequencing code. The bluetooth changes also have a run-time dependency on
> the PCI pwrctl part. In order to get it into next I plan to pick up the
> power sequencing code into my own tree and maintain it. I can then
> provide an immutable tag for the BT and PCI trees to pull. I wouldn't
> stress about the BT runtime dependency as it will be fixed once all
> changes are in next.
> ...

> ---
> base-commit: 6dc544b66971c7f9909ff038b62149105272d26a
> change-id: 20240527-pwrseq-76fc025248a2

What does this apply to?  I don't know what 6dc544b66971 is; it
doesn't seem to be in upstream or linux-next.

