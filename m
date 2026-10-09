Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061FCCA6019
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBkCeYVqmSb3prSHngCK69WNaY6mX9aeLJas4Zai/rc=; b=h0Zh8tCdn4BkZfCdF+QLQOPOe1
	r91whL2Tn97bfylN9u+tqLvD9mPJUiDgy/f5MxAt4FgN7jYf6OWCU4n4cMotCtxDVxrHyhQJ0ixxE
	eU+c27EWrkG+NrVteOUh+gm/G70K8UrRJU/mFzafuCMUM+VLRZ08T8/q/Q+ZoWBb2u/kvuo7DK9vD
	U+XLlhqNct364FcM5Hde5bySgnBS253dJGWuhBJSuWOfKu6UnL7WVVNd/UdA4C6pAtt8wxBN1VWYa
	h8W9wypd3J/2XHPWRJtKqWuL2Jsx2lSYGoGlKh5WOrnmxJQ/2m/ea2ME8Au2YngC13ISHrySvo2qs
	ZT3yt7+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7rd-0000000648f-2xqI;
	Fri, 09 Oct 2026 10:30:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7rc-0000000648K-22CK
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 10:30:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6CB76053A;
	Fri,  9 Oct 2026 10:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6241F000FF;
	Fri,  9 Oct 2026 10:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791541807;
	bh=gBkCeYVqmSb3prSHngCK69WNaY6mX9aeLJas4Zai/rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R6e2Qf0eWYTgeySbgvyFPddjgtR3ExeP/Xp0JQc0LklEF2alM100T1WG7UwBX5Uca
	 TKN2QY0qD/mV6jUvSipzC9bSV4r580y6NU/OMkHCPLxMHLxZU1imTrA+2u3UkrCWO8
	 mfkc1XVJAG5Vn1VRfrXz6UG6Y/733EMcEEo3/xtUfYfYCBZzvGnGhcuuCsldBDpKua
	 Qgz6SRQldFvH73lyfWMinJ3sAHucgtg5sItzTwNbd+yF1/pXZJ88dnnTVkLfAFqwNF
	 DM+h49+3z5nnsNkOxiDBLwbnrVMy3uMrODCeth2kE3efVKDYxJlgN180Wh1Rp84yaI
	 AjivVt8fFdcIA==
Date: Fri, 9 Oct 2026 12:30:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org
Subject: Re: [PATCH ath-next 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
Message-ID: <20261009-brainy-alpaca-of-focus-31fbbd@quoll>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-1-2c5797b5e4ac@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008-mpp_bringup-v1-1-2c5797b5e4ac@oss.qualcomm.com>
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

On Thu, Oct 08, 2026 at 03:53:57PM +0530, Aaradhana Sahu wrote:
> Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
> wireless device.
> 
> QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
> platform device, even though the Wi-Fi hardware interfaces over PCIe.
> Document the compatible string and the resources, including the Q6 remote
> processor phandle, MSI interrupts, SMEM states and memory regions.
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
>  .../bindings/net/wireless/qcom,qcn6432-wifi.yaml   | 149 +++++++++++++++++++++
>  1 file changed, 149 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml
> new file mode 100644
> index 000000000000..97d8885333fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/wireless/qcom,qcn6432-wifi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies QCN6432 wireless device
> +
> +maintainers:
> +  - Jeff Johnson <jjohnson@kernel.org>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Qualcomm Technologies QCN6432 is an IEEE 802.11be Wi-Fi device
> +  associated with the WCSS Q6 subsystem. The device is represented
> +  as a platform device and uses MSI interrupts for its Copy Engine
> +  (CE) and Data Path (DP) rings.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qcn6432-wifi

Is there qcn6432-something-else as well? Neither commit msg nor
description explain that.

Best regards,
Krzysztof


