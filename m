Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9863606A32C
	for <ath12k@archiver.kernel.org>; Sat, 21 Nov 2026 12:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GlGvYg5d;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R/KSUD66
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nvHNbqHWqikzvI1C7XLBgkMbqGuJsO8eeucb2RNy2jk=; b=GlGvYg5dr3N1sJGYBEsJHMmw8q
	1FUaGPPtdeS6IfEbkTAtU3HOLYrWjceJln6+z1OnYhNHjnCjl27LHt1sP06y7nRgnP5jNYu4irA4e
	x/y6zJDW9/MIF3cgg/Lg8wxoMKvILM7Lg6w3goaDvGBEBLgJRD3WNTald6YZUkQMKeZiUCDJhKr/g
	swcjcA6HV86iAlx8J0TI/IPMCwTIZvw4z6lPusYz1zHjo8Nx9wS62oAxMWqMJ9eUUHmzk3dzqWKl3
	J5C9YkRDNAq6Ncw4j3q8e+hdp/p6sr0lzhnrntC+jF9r9pqAXdvI0jkX4/pktMR1t0DLsppkP5SuR
	FZexz7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkIh-0000000HB9O-2suE;
	Sat, 21 Nov 2026 12:34:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkIf-0000000HB8w-3wke
	for ath12k@lists.infradead.org;
	Sat, 21 Nov 2026 12:34:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A7096117C;
	Sat, 21 Nov 2026 12:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0303D1F000C4;
	Sat, 21 Nov 2026 12:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264476;
	bh=nvHNbqHWqikzvI1C7XLBgkMbqGuJsO8eeucb2RNy2jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R/KSUD66RadEA8FsSRBGKnNidVroc0Uw/pRckPDUXw/0H0s4niWFkpn3lrKRp22Sv
	 qDCdYMjMoeJCsbRAt4/oyJzrgxQYln3uU6AGEhV5mqWYWt2GhDEtdPKaeZdMrHqxql
	 71u7DnDxzlUIfyvMQj6CMCf7ok3hfJkx1ZtJzBod0qFKiYz/OGmhO9avURQzwUxriW
	 w2uwSuD7VMuRbDtSQjgkah2a6Rt9/waFttAqIqwMJa6KVmXbk0kvMSJtrX1RExQ37P
	 8kIUCTBDkSAcix3vtGZ+AYS+g43uJ+IeRIijThzUPmL5i4O5KU4S3CA0DTzZxBQ8UP
	 SzldoYgQY68Jw==
Date: Sat, 21 Nov 2026 13:34:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH ath-next v3 15/15] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
Message-ID: <20261121-logical-flawless-mongoose-9dddea@quoll>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-15-9875d2a3953f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-15-9875d2a3953f@oss.qualcomm.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 01:45:38PM +0530, Madhavan Ganesan wrote:
> +
>  int ath12k_wifi8_pci_init(void)
>  {
> -	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */

Really? You just added it in this patchset!

> +	int ret;
> +
> +	ret = ath12k_pci_register_driver(ATH12K_DEVICE_FAMILY_WIFI8,
> +					 &ath12k_wifi8_pci_driver);
> +	if (ret) {
> +		pr_err("Failed to register ath12k Wi-Fi 8 driver: %d\n", ret);
> +		return ret;
> +	}
> +

Best regards,
Krzysztof


