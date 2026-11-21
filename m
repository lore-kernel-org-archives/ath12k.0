Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CEC606A338
	for <ath12k@archiver.kernel.org>; Sat, 21 Nov 2026 12:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=359pSJWn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LAcqYrdf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Qfmz3wQRZHw1Acdm/+1MzSlQaBNEHKcQlH0KCOZ3rss=; b=359pSJWnouTBCVZfPsaM1PrD+u
	OiVYg3i5D/3NDQDggdk7np++9BtaB62mtgq29RYojpQlaTsGQyW/hDGfui/gznx0wOAdtcSi9uPm3
	Y/Bz6M7CLnNHZcTD697LPizfaAhOSzehmfBaj5HKgOL6hSn9QPd2rmFLj7sYV0fP9OK/Ly7M7rIxD
	ChueZoZHsWJH5G+88hiLrTYMsp1jFLbwGzP5mRnz+nC1q3zXYJ0dWgbM46oCVDwjy3oxyfD+HZBTC
	fpGgy0m8xG41WlBs5yljrTyYXfCJXdwpQOwmXyWWEPFYDa1djktQyeqomUDwBrEcC3c62sxj2kFYl
	9ULdZKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkDw-0000000HAKu-3hmS;
	Sat, 21 Nov 2026 12:29:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkDv-0000000HAKk-3unI
	for ath12k@lists.infradead.org;
	Sat, 21 Nov 2026 12:29:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 63E3F613FD;
	Sat, 21 Nov 2026 12:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06C91F000C4;
	Sat, 21 Nov 2026 12:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264183;
	bh=Qfmz3wQRZHw1Acdm/+1MzSlQaBNEHKcQlH0KCOZ3rss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LAcqYrdfw1qR/CVdPj1cGVnpCoWME6A8kiXMXMOTpexuyeFWolmOnIaWvsuJtnzrG
	 OhJy2TP5pRbQcS7jTlY6JkBgsN4lgLdU6TiCaFSmwnVMKRKUkXu89gW6LFBTkf26o2
	 ZnLDApMTE1KBCKtz3nFNQ/ksd2k7N+zhFQe/4MH0CE44IMHXICvkMXcsfJDchf0IId
	 R33W49VK4bNYtjjwCBVzYzxLtqzvWnDJ+wY/NwaNFbBTgnQmdIFXYcIWGzqikDrxs9
	 rQscWm9fAV7EuTAw+4dRLhTrBGmugRrhhYHC1sFhUCvvbdoOovp2ADDGYLQi+apXTq
	 SmwQKW9rF7cjg==
Date: Sat, 21 Nov 2026 13:29:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH ath-next v3 05/15] wifi: ath12k: add Wi-Fi 8 directory
 and base module scaffolding
Message-ID: <20261121-objective-turquoise-sponge-f91ff2@quoll>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-5-9875d2a3953f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-5-9875d2a3953f@oss.qualcomm.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 01:45:28PM +0530, Madhavan Ganesan wrote:
> QCN9575 is a Wi-Fi 8 target with a distinct hardware family that cannot
> share the Wi-Fi 7 module. Add a dedicated wifi8/ subdirectory to host
> QCN9575-specific code. Introduce Wi-Fi 8 build rules, base module source
> files (wifi8/core.c, wifi8/pci.c, wifi8/pci.h), and add
> ATH12K_DEVICE_FAMILY_WIFI8 to ath12k_device_family. Keep Wi-Fi 8 PCI
> init/exit as stubs so the module builds cleanly and remains bisect-safe;
> actual PCI driver registration and hardware support come in follow-up
> patches.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/Makefile       |  1 +
>  drivers/net/wireless/ath/ath12k/core.h         |  1 +
>  drivers/net/wireless/ath/ath12k/wifi8/Makefile |  4 ++++
>  drivers/net/wireless/ath/ath12k/wifi8/core.c   | 31 ++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wifi8/pci.c    | 18 +++++++++++++++
>  drivers/net/wireless/ath/ath12k/wifi8/pci.h    | 11 +++++++++
>  6 files changed, 66 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
> index 861ec85eebed..332110d72a1d 100644
> --- a/drivers/net/wireless/ath/ath12k/Makefile
> +++ b/drivers/net/wireless/ath/ath12k/Makefile
> @@ -25,6 +25,7 @@ ath12k-y += core.o \
>  ath12k-$(CONFIG_ATH12K_AHB) += ahb.o pcic.o
>  
>  obj-$(CONFIG_ATH12K) += wifi7/
> +obj-$(CONFIG_ATH12K) += wifi8/
>  
>  ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o debugfs_sta.o
>  ath12k-$(CONFIG_ACPI) += acpi.o
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index a8e8a55aa718..2a4b5e5e1af3 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -956,6 +956,7 @@ struct ath12k_mem_profile_based_param {
>  enum ath12k_device_family {
>  	ATH12K_DEVICE_FAMILY_START,
>  	ATH12K_DEVICE_FAMILY_WIFI7 = ATH12K_DEVICE_FAMILY_START,
> +	ATH12K_DEVICE_FAMILY_WIFI8,
>  	ATH12K_DEVICE_FAMILY_MAX,
>  };
>  
> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
> new file mode 100644
> index 000000000000..b8c5b6d3a7bd
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: BSD-3-Clause-Clear
> +obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
> +ath12k_wifi8-y += core.o \
> +		  pci.o
> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/core.c b/drivers/net/wireless/ath/ath12k/wifi8/core.c
> new file mode 100644
> index 000000000000..9253ef9d9cf5
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/wifi8/core.c
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/module.h>
> +#include "../pci.h"
> +#include "pci.h"
> +
> +static int ath12k_wifi8_init(void)
> +{
> +	int ret;
> +
> +	ret = ath12k_wifi8_pci_init();
> +	if (ret)
> +		pr_warn("Failed to register ath12k Wi-Fi 8 PCI driver: %d\n",
> +			ret);
> +
> +	return ret;
> +}
> +
> +static void ath12k_wifi8_exit(void)
> +{
> +	ath12k_wifi8_pci_exit();
> +}
> +
> +module_init(ath12k_wifi8_init);
> +module_exit(ath12k_wifi8_exit);
> +
> +MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11bn WLAN devices");
> +MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
> new file mode 100644
> index 000000000000..3975081d167b
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/pci.h>
> +
> +#include "pci.h"
> +
> +int ath12k_wifi8_pci_init(void)
> +{
> +	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */

That's dead code and dead comment. Why are you adding comment which at
this point is not correct?

Commits represent logical chunks of bringing device support and above is
not logical. It's empty and achieve nothing.

Do not create stubs just for sakeness of having stubs (or worse - commits)

Best regards,
Krzysztof


