Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3314DE668AF
	for <ath12k@archiver.kernel.org>; Sat, 20 Dec 2025 06:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjHzsyxqKMoNTtUyA4jBS92SmSsw9X27qzb8+l3u85o=; b=wrATBSErDX0YZAXeAEsamC9bPK
	HnYK2hiXs9mpg+Sk8e6y+sY9kb82AiVaGSP7dA4gmlOLJ8pLplQJKeXI+W68e4lHVlwekcM5HqoSU
	16VopRuzA6432d0yJuNRvTM+IvmIKxkgit1qG5BD1xD1asWSFz/1TivbRhl31YDzlvGnSjWhv2S0N
	6Z1QLoAxxZeoB5MNL2m6RP6/DGJACyYy0kRN8fXiweK7MvzwwTiqkRDrT2l3lTnXmHWlZ0FRgUp9O
	VvSrzJnSFfoYXrHe3Fy9NYmtV9eVY5396pnYSxxiWOrQRA6tllwTTrU/luG8kDVJ79l9yzdZOGntn
	m0IaQr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWq4X-0000000BLLa-32FZ;
	Sat, 20 Dec 2025 06:04:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWq4W-0000000BLLO-0R43
	for ath12k@lists.infradead.org;
	Sat, 20 Dec 2025 06:04:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BAE560008;
	Sat, 20 Dec 2025 06:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDAEC4CEF5;
	Sat, 20 Dec 2025 06:04:01 +0000 (UTC)
Message-ID: <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
Date: Sat, 20 Dec 2025 06:04:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Dale Whinham <daleyo@gmail.com>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 20/12/2025 00:21, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> For some devices, Wi-Fi is entirely hard blocked by default making
> the Wi-Fi radio unusable, except if rfkill is disabled as expected
> on those models.
> 
> Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
> disabling specific features based on ACPI bitflag") added a way to
> support features set via ACPI, including the DISABLE_RFKILL bit.
> 
> Add a disable-rfkill property to expose the DISABLE_RFKILL bit
> equivalent for devices described by a Devicetree instead of ACPI.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---
>   Documentation/devicetree/bindings/net/wireless/ieee80211.yaml | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> index d89f7a3f88a71d45d6f4ab2ae909eae09cbcaf9a..c10a4675640be947cd0b5eaec2c7ff367fd93945 100644
> --- a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> @@ -29,6 +29,12 @@ properties:
>         different 5 GHz subbands. Using them incorrectly could not work or
>         decrease performance noticeably
> 
> +  disable-rfkill:
> +    type: boolean
> +    description:
> +      Disable rfkill for some devices on which Wi-Fi would be entirely hard
> +      blocked by default otherwise
> +
>   additionalProperties: true
> 
>   examples:
> 
> --
> 2.47.3
> 
> 
> 

Is this really a hardware description though ?

Its really more of a logical/functional description. It tells the 
runtime what todo, not what the hardware is.

You could also have a list of quirks in ath12k for this or have a 
user-space utility look for the appropriate platform device string name 
and disable rfkill.

I think this logic belongs in drivers/net/wireless/ath/ath12k/ 
triggering on a compat string.

Should be achievable.

---
bod

