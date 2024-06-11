Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10402C41513
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 22:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=j34SkS9dEnFHK61FL+WtnyZs9IIAUympxqFPYU0f4Sc=; b=BsnKDC6XgPgl1+
	NIs5kBhT6EydWoxs6vEgxbD5hCPALt6Z29KJxORQWUnqBaElHtOaC5JgxvJXDJlkGxo7bAiVpG7Q/
	QJQrce0pyeqCccpeyqE0v7xMLMcFGf7cB6AoaRChJmwiAGe5Gd2SR9VilEvcoreo40AQmpZ/k40e+
	GTFc57r4Voh63F05dM1gJU5sgG7HjXlUl2rAeycqZrnTFWEtWeXL25q63ERP9heuwF+ojz9Mg8Qm1
	MT8MD9b+j2m4OSeZ9f73Y1UW8pMN4SaTK5ucrkJl8GZoS4WsGr6jZTrUHKx89TCYJKMJXbQnF4n+r
	UqVC6pGZdJ18up0jf6Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHANv-0000000ARoT-3DDG
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 22:54:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHANs-0000000ARnr-05iw;
	Tue, 11 Jun 2024 22:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3CEA66121F;
	Tue, 11 Jun 2024 22:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6207EC3277B;
	Tue, 11 Jun 2024 22:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718146470;
	bh=Qk1xtp+Y0CsC+cGSX2bvsS9KRtEFezREYHk2nrDR1VA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ghY50bs0RlmiaNDSZwjEm0OI3iVK0UG5GkXzkYk8Z2fu2SwC23ID3ccJ7KaxqUc7Z
	 J3MCwzZZrcfHEsyzWIanidlCVT1T7Yu6Ur/Uhrls66GtuXhEdWkHV63z0Ho8HXRJo5
	 ZhyK1sdLS17ioINSFHQnMZAjfnS5XKlxRUgEsAfGzOpaa+k2Za4sPHbYho0cpJBNWc
	 LbWRItPHXJHKW0fcccqgY/fcov1umU2R9sNliNvFCHK1eFi+hholPLR0aTYcR9xETD
	 oW0pnaqqFoYbZjge1UzN6manRXLNxrYbrtjRk851t0ENdwsZUdmcCp4nGCWVaiymqM
	 kV4e15f3vqfdw==
Date: Tue, 11 Jun 2024 17:54:28 -0500
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
Message-ID: <20240611225428.GA1005695@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_155432_149235_53275446 
X-CRM114-Status: GOOD (  14.51  )
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

The PCI changes are very self-contained and any conflicts will be
trivial, so rather than messing with an immutable tag, how about if I
just ack them and you can include them in your tree directly?

