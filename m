Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E325606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 18:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NNh6BQuU;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=KgyGWn4Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n1K8seOsKkPOPbWKSfQ5OwT529T+UjkzED1UxjM8Iaw=; b=NNh6BQuU34oo+028JIHe1b+V6T
	/q8BX64dfNGxgiI/RdyztpXWVps7hXT/l5HuWpZXLlt9q2X9sYVlTEt2IbchN0vtpxG5uVVm6Xdga
	WcxZBiGz/YqrP1Zyh6LWaXqbjtb8KWoDX5iMd6xgyGcjSESf6bTRaMNXvxCUzZe8+9an7rVKFJi/h
	QaD8zpGu1ZLuxVMefSFbWjg8eX48qOwDjSIciqKX4wV3JuQumOwjM9KdRTlt5snJQr73EiiNMpl/v
	L/Kqs6glIvtSVjA0Hj+qI1IYCFqf+gQ0b5S/Ii/V1tQN6IYRX4ODY/xin0mv8nQk3jIxcO6KR5mzq
	jJO/gAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkRW-00000009yI1-1TRC;
	Wed, 18 Nov 2026 18:31:38 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkRT-00000009yGe-0ffB;
	Wed, 18 Nov 2026 18:31:37 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2CDB422219;
	Wed, 18 Nov 2026 19:31:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795026689;
	bh=n1K8seOsKkPOPbWKSfQ5OwT529T+UjkzED1UxjM8Iaw=; h=From:To:Subject;
	b=KgyGWn4QC1zzmfmuQGu9yfSa246jCGcvpfJIZaVGLWN4ZRWX46+MFucMbVfmItST5
	 yQu42gMtBGpN3wnQXjB7yP3Ld1Z+l2ir41zHS6zEoJBZFaXUqzgssJ7/BSW+TG5XVz
	 /r8fitAWr0f05Y1fZqkVXWddvcfXJefs9MTnjtU6Ouamwnmz2IpVbenDY2bmhA7v3f
	 2LJTSYlqoVAxMRAvu85ow7j6dX8jPsg2vn/YKZMzUq8XMcCNNlSa2aXfEqlENeKYpI
	 JIlJElvlXmcfmL8gniLEUBYccqK8vkFF5M8EiDxuo7Fx1B2bcjdfYe9FgC05B+WVfc
	 Dkykgg66NXraA==
Date: Wed, 18 Nov 2026 19:31:25 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vitor Soares <vitor.soares@toradex.com>, linux-bsp@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: freescale: imx95-aquila: Add ath12k
 calibration variant
Message-ID: <20261118183125.GA530200@francesco-nb>
References: <20261118123837.651915-2-ivitro@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118123837.651915-2-ivitro@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_103136_133830_6EC8888C 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 12:38:37PM +0000, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> The Aquila iMX95 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The
> module reports the same PCI and QMI IDs as other WCN7850 designs, and
> its board data also comes in variants for different regulatory domains
> (US/EU/JP, UK/CA low and high). The IDs alone therefore cannot identify
> the right board data.
> 
> Describe the Wi-Fi device behind the PCIe1 root port and set
> qcom,calibration-variant to the US/EU/JP board data.
> 
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


