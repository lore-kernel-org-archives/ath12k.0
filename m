Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640D606A32A
	for <ath12k@archiver.kernel.org>; Sat, 21 Nov 2026 12:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j/y/ZcrM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FwLhBHfu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7H6yTJgiXVjurwuVwDh2bU2c+2wm8uECQPTv4Fe2SXA=; b=j/y/ZcrMNrW1FrJI4FOyBn20rQ
	96weHnEJfouSyKcwHnolNDsjln3Fj7KTvTAOPUPlbzB/188/fP/Tc7JsypHzKZAcXWgoHRy5nRjo3
	l9Xl3W+UC6x61A9Ntn1gs94+RG6hDGXoFq3B9jbekMplxqBtA1qlIfJadkEbBNxxkEfYtGuyQmzVF
	MJ7Qbv7YOsPmXAap4lvZgy4gHJezpnm2Sqr9BBzMzwHraQVSVNUOajxkvJRAH9bEcujnVZRX6Haa1
	7Mj3pGlKZz0TkyokjiDCDJUKTeaGZl+yH5Hj1OflEVFU/cpMS5um1qgbSHhTRjZNTOYqPKGomF10c
	u+hCGOkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkCb-0000000HA5N-2sIA;
	Sat, 21 Nov 2026 12:28:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkCa-0000000HA5B-3dGN
	for ath12k@lists.infradead.org;
	Sat, 21 Nov 2026 12:28:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 033E660A4F;
	Sat, 21 Nov 2026 12:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C5C1F000C4;
	Sat, 21 Nov 2026 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264099;
	bh=7H6yTJgiXVjurwuVwDh2bU2c+2wm8uECQPTv4Fe2SXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FwLhBHfufqwXZeNQ6Ov4B6OaGsVBAJ7XCHmXMbe+iEf3NnGJNqugTCNnCqhTQoYAb
	 BBJp9SNsbW6yhDKVEJ6/M/hBR73MRngtUM1/NljbzqQvRj6n7crSDUsPfgMX/4eVTK
	 jV7+LrLJwBAe4skUxuniF7o5VLOvOgLLlBO6ViiFZsG+hhgRLcpEFHLKBUjSQDDmGk
	 L4Fh3bTgM354j6HGyg4U40vIUnu0IGVPRJ4Fs9vivT+LojFuv7a/Ff82Olf3RxtMKF
	 ts2RqWuYnMTRfEfKclwTJSoFxVWJ1701Bek1Vgt8Uz1SODFtG4+KtBrH9xBQyD6p18
	 BfLyZtdUxyjIA==
Date: Sat, 21 Nov 2026 13:28:16 +0100
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
Message-ID: <20261121-astute-calculating-hippogriff-69ecfc@quoll>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 01:45:38PM +0530, Madhavan Ganesan wrote:
> Add QCN9575 PCI window register constants (WINDOW_VALUE_MASK [25:19],
> WINDOW_STATIC_MASK [31:7], CE_WINDOW_MASK [13:7], UMAC_WINDOW_MASK
> [20:14]) and a Wi-Fi 8 reg_base instance (ath12k_wifi8_reg_base) for
> per-device window selection. Implement ath12k_wifi8_pci_probe() to
> configure QCN9575-specific PCI settings: MSI vector layout (3 MHI, 5 CE,
> 8 DP vectors), static window mapping, window register address (0x3278),
> and hardware revision. Call ath12k_wifi8_hw_init() at the end of probe
> to complete hardware initialization. Define the Wi-Fi 8 PCI driver
> struct with the probe callback, and register it with
> ath12k_pci_register_driver() in ath12k_wifi8_pci_init().
> 
> This series only adds Wi-Fi 8 platform scaffolding; QCN9575's CP, DP,
> and MAC datapath support will be posted as a follow-up series.
> QCN9575_DEVICE_ID is intentionally left out of
> ath12k_wifi8_pci_id_table for now, so no physical device can match and
> probe until that follow-up series lands. The id_table entry will be
> added in the final patch of that series, once QCN9575 is actually
> functional.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/hal.h       |  2 +
>  drivers/net/wireless/ath/ath12k/wifi7/hal.h |  2 -
>  drivers/net/wireless/ath/ath12k/wifi8/hal.h |  1 +
>  drivers/net/wireless/ath/ath12k/wifi8/pci.c | 89 ++++++++++++++++++++++++++++-
>  4 files changed, 91 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
> index 9e88bdf4a93b..b30a8039b2ec 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.h
> +++ b/drivers/net/wireless/ath/ath12k/hal.h
> @@ -11,6 +11,8 @@
>  
>  struct ath12k_base;
>  
> +#define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
> +
>  #define HAL_DESC_REO_NON_QOS_TID	16
>  
>  #define HAL_INVALID_PEERID	0x3fff
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.h b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
> index 19e02bb16ff2..fe880b0befcb 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hal.h
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
> @@ -31,8 +31,6 @@
>  	((hal)->regs->umac_ce1_dest_reg_base)
>  #define HAL_SEQ_WCSS_UMAC_WBM_REG		0x00a34000
>  
> -#define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
> -
>  #define HAL_TCL_SW_CONFIG_BANK_ADDR		0x00a4408c
>  
>  /* SW2TCL(x) R0 ring configuration address */
> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
> index c99521abdcb3..89fa9a7f3fd9 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi8/hal.h
> +++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
> @@ -11,6 +11,7 @@
>  #include "hal_desc.h"
>  
>  /* WCSS Relative address */
> +#define HAL_SEQ_WCSS_UMAC_OFFSET		0xf00000
>  #define HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(hal) \
>  	((hal)->regs->umac_ce0_src_reg_base)
>  #define HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal) \
> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
> index 3975081d167b..fd0489f8333f 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi8/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
> @@ -5,14 +5,101 @@
>  
>  #include <linux/pci.h>
>  
> +#include "../core.h"
> +#include "../hal.h"
> +#include "../hif.h"
> +#include "../mhi.h"
> +#include "../pci.h"
> +#include "hal.h"
> +#include "hw.h"
> +#include "mhi.h"
>  #include "pci.h"
>  
> +#define QCN9575_DEVICE_ID		0x1113
> +#define WINDOW_REG_ADDRESS		0x3278
> +
> +#define WINDOW_VALUE_MASK		GENMASK(25, 19)
> +#define WINDOW_STATIC_MASK		GENMASK(31, 7)
> +#define CE_WINDOW_MASK			GENMASK(13, 7)
> +#define UMAC_WINDOW_MASK		GENMASK(20, 14)
> +
> +static const struct pci_device_id ath12k_wifi8_pci_id_table[] = {
> +	{}

Why do you need an empty table?

> +};
> +
> +MODULE_DEVICE_TABLE(pci, ath12k_wifi8_pci_id_table);

...

> +static struct ath12k_pci_driver ath12k_wifi8_pci_driver = {
> +	.name = "ath12k_wifi8_pci",
> +	.id_table = ath12k_wifi8_pci_id_table,

I actually wonder how does it work with such table - what is its
purpose?

> +	.ops.probe = ath12k_wifi8_pci_probe,
> +	.reg_base = &ath12k_wifi8_reg_base,
> +};

Best regards,
Krzysztof


