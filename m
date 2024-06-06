Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461CAC25B75
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 13:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vf+z87oWQc4Myzvj0pbB4Pzpk4g3HmaNR5xuAkxSd2c=; b=jvZeCAhEUIJwNZqUEyb2YJ2A97
	aCT1b7zMQcwPOCyI5QXMFawQXWpcQRUrKlw3pdx4DbayQFtrYp6IU6y28bBTwHoa6TBqaqCgU5RFC
	YDZ5gsMFuGP95LlBJy/tckcmtuGcqp4l4yd6SRLZT6FNgeP/HmpPo+/eMcFhwbFw8xQnqQCf34iw6
	6KBLIW6Tiw1NHt21BcSh7kgkHMe9EfcQ9IqTL2ykRKZYmECZ22/UbGJqWV0p97W8f90rtOYCcmlq2
	1+sHZuYq6M0aDRN66j61UFsvIzYvWcs46Ep90D0+TJJ71pvIMU/7XVReyA+J+HtsIb6Nx3X18DxKR
	Hjlg1BGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDCh-00000009tMJ-3qu6
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 13:30:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDCe-00000009tKr-2EMg;
	Thu, 06 Jun 2024 13:30:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9366A61B91;
	Thu,  6 Jun 2024 13:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5570C2BD10;
	Thu,  6 Jun 2024 13:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717680651;
	bh=Y6vvUZaqqNzDBcZyJb8uANrd/RPyO8bmsrI9Fy1N1Yk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=olnGGMhdtaecQNsV+bM/3zqTVm/RI0w4RRa9vWACB38Wf0uBEOySr6sdZhR8A9cj7
	 yn8cvLmk5kv2p75y9fLzVWJ/vXuSkXyq13NacoZehA7k/kRqH/S2FXD2W5V9XBK2zI
	 wlV/A0d3b5IiNLGD+vDOTKaq6oNRq6ZFgCPxgV48XlK9URr7ahXL/2plk3xiqsVlGQ
	 UBna/1PWchiqmOGgCkgELhFUs4TcihpzFBYACSfwQBoll0gaRt4abdXUNtkiHBZHOa
	 SPOLYbINwGLq1O0bJv0oqR4AHFDiY52YaK2cKdtVt3jo24KuCWOa1N+OfPkMll4EjR
	 GXpyN+IWu0hpg==
From: Kalle Valo <kvalo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "David S . Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Jeff Johnson
 <jjohnson@kernel.org>,  linux-wireless@vger.kernel.org,
  netdev@vger.kernel.org,  devicetree@vger.kernel.org,
  ath11k@lists.infradead.org,  linux-kernel@vger.kernel.org,
  ath12k@lists.infradead.org,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 1/2] dt-bindings: net: wireless: qcom,ath11k:
 describe the ath11k on QCA6390
References: <20240605122106.23818-1-brgl@bgdev.pl>
	<20240605122106.23818-2-brgl@bgdev.pl>
Date: Thu, 06 Jun 2024 16:30:46 +0300
In-Reply-To: <20240605122106.23818-2-brgl@bgdev.pl> (Bartosz Golaszewski's
	message of "Wed, 5 Jun 2024 14:21:04 +0200")
Message-ID: <87h6e6qjuh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_063052_640397_B4D42190 
X-CRM114-Status: GOOD (  12.04  )
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

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a PCI compatible for the ATH11K module on QCA6390 and describe the
> power inputs from the PMU that it consumes.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[...]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: pci17cb,1101
> +    then:
> +      required:
> +        - vddrfacmn-supply
> +        - vddaon-supply
> +        - vddwlcx-supply
> +        - vddwlmx-supply
> +        - vddrfa0p8-supply
> +        - vddrfa1p2-supply
> +        - vddrfa1p7-supply
> +        - vddpcie0p9-supply
> +        - vddpcie1p8-supply

Not sure if we discussed this before, but based on this I understand
that there can't be an DT entry for device pci17cb,1101 without all the
supply properties? But there are QCA6390 devices with PCI id 17cb:1101
which do not need these supplies and already work. For example, my Dell
XPS 13 x86 laptop is one. Or anyone who manually installs QCA6390 board
to their PCI slot and some of them might want to use DT, for example
setting qcom,ath11k-calibration-variant.

This is not a blocker for me, just making sure that we are not breaking
any existing setups.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

