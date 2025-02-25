Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5554EC021B6
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 11:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vZ0UnkDQVhxe/jilj97rLlCm947XTF5OIjtkH6W5mQ=; b=MCyLYq+LYg3FbZDu7xm6MFZE8E
	cs/c1PVCc8oZ8parIskcokE4eWtjRmiKw8nxnxwzLl6P9rUPnaa/cUp9CJsg4l9jm+TA6OKBFk0Bu
	ObZkvzcXijK9GJ5d2/+JVSbrI14+L6dRuPcLhcCPz+CkRJdYju0tVgWlLRntLJTIbltZQ7gl9a1MJ
	kzY0FEHnb/HMwzBbhe2oxalshdmL/ipvQE+tJE9EKiYrSiGTZ232Vyhwg3S3RLBlRruzOXjJFGG5G
	GH8qn/g3y/5Mc/Ech6qxvznZFh9UjPhU+Y+lky0ZqS6Ho7aGPLAS2CUVj0RMgunt+SwOoinKgC2Gp
	8Z/o7+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsu9-0000000GzUM-03BG
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 11:15:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsEb-0000000GqEH-1PHS;
	Tue, 25 Feb 2025 10:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740479535;
	bh=+OCR+GIe5xLZeikUC6PfXnk5joRi3BkvxLM8KgsPD/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D1LUvCjJ/Lp9/MzZCTPHnFDrM/RaVCl63na+WpzXRc258xsAnex+V63/K8eHEI9AZ
	 S07lTsMu1yM1M7uoFWiTkDQPHXgvb0L8Zf9gs5NUCWOxrz0ukXyAR9xqEGDJdBt/9B
	 KyHuEc5Hsfoiy2d3Iuk52Ns0Fr9tMh5G2gJCFMkd4sHRPgR8vOi3P6QX8xWHOArICs
	 8AQ4dbE3VSVzfoqGqYG3C5W1R2kI/sVsT3wJLYqUrya5tiO/phtTFyC0CWuSLl3flo
	 Ul8m6a1ivzYJ6wVyaaXEskD9gTVokV0snqchY1o+eeu6fPQhEzwpb3awOlo2uhh2xO
	 EHSLXkmPxIEbA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0881917E0B64;
	Tue, 25 Feb 2025 11:32:14 +0100 (CET)
Message-ID: <184de5d2-ad02-4387-b850-b45b615cf164@collabora.com>
Date: Tue, 25 Feb 2025 11:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] wifi: ath10k/ath11k/ath12k: Strip device prefix from
 calibration properties
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_023217_525506_2084D898 
X-CRM114-Status: GOOD (  11.64  )
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

Il 25/02/25 10:05, Krzysztof Kozlowski ha scritto:
> Devicetree properties describing exactly the same thing should be
> reusable between device bindings.  All Qualcomm Atheros WiFi chips needs
> certain calibration data, so properties should not be prefixed with
> device family (ath10k).
> 
> Deprecate qcom,ath10k-calibration-variant and alike, so we gradually
> switch to a common property.  This will also allow moving these
> properties to common schema, if desired.
> 
> Why? Because people add qcom,ath12k-calibration-data and probably they
> will add qcom,ath13k-calibration-data, qcom,ath14k-calibration-data and
> so on.
> 
> I will fix DTS in separate series.
> 

For the whole series

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (5):
>        dt-bindings: wireless: ath10k: Strip ath10k prefix from calibration properties
>        dt-bindings: wireless: ath11k: Strip ath11k prefix from calibration property
>        dt-bindings: wireless: ath12k: Strip ath12k prefix from calibration property
>        wifi: ath10k: Deprecate qcom,ath10k-calibration-variant properties
>        wifi: ath11k: Deprecate qcom,ath11k-calibration-variant properties
> 
>   .../bindings/net/wireless/qcom,ath10k.yaml         | 25 ++++++++++++++++++++--
>   .../bindings/net/wireless/qcom,ath11k-pci.yaml     |  9 +++++++-
>   .../bindings/net/wireless/qcom,ath11k.yaml         |  7 ++++++
>   .../bindings/net/wireless/qcom,ath12k-wsi.yaml     | 13 ++++++++---
>   drivers/net/wireless/ath/ath10k/core.c             | 13 ++++++++---
>   drivers/net/wireless/ath/ath11k/core.c             |  5 ++++-
>   6 files changed, 62 insertions(+), 10 deletions(-)
> ---
> base-commit: 8936cec5cb6e27649b86fabf383d7ce4113bba49
> change-id: 20250225-b-wifi-qcom-calibration-variant-92a02995e996
> 
> Best regards,


