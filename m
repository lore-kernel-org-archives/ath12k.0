Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86760E668AF
	for <ath12k@archiver.kernel.org>; Sat, 20 Dec 2025 06:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x70fIiYqvEC0N/wUbzGGOAh4k7CcmR36SjwczZPeRhs=; b=N+m/Krmtlwir8vMZ5Hhz338QOr
	7jLjoFj+mp7uLrjT9KKe3rO0faBlXsfTmaPyCFeSBs+fGZZXooIvHkPy+qyw6Z9IbowwUtZxGJiaD
	zYZLY0m1RFg6Lunv7O0/nZWkZtfbtCYsGhwDVc0D/cs+nlupf2VG0pN+eHPUaeThKnrca8rqDVWn8
	eI/s8U1bd9cTeFNArt4Q8NsE2KDOBxXal2tl2Qum7F5pX1+8N7mY3fCc4ldumbnMhlGNy9/1r7Ddr
	jDT21F32E144D3I/gyOV+2w6pPlJA7zWbBTzw1ZxyvJNnskLfsBy+8MkxW9KqN6U7r33OxWjnJ7Av
	9cJmWUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWq8E-0000000BLby-1AEo;
	Sat, 20 Dec 2025 06:07:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWq8C-0000000BLbX-3bep
	for ath12k@lists.infradead.org;
	Sat, 20 Dec 2025 06:07:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49BA441E44;
	Sat, 20 Dec 2025 06:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EFEC4CEF5;
	Sat, 20 Dec 2025 06:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766210875;
	bh=VX0dE+JZYIwLPwmtZYo3MjEeyWBbD/TEvkAunGo1edE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DIKl6yP1ICX3q2p7ewS25HLugEAtwBK0udFePyVqZqLFEjdjPmpM3VrvaOxUoWQl/
	 ne3Az7vvEsSPVYVWVPH9kbWZ4wXauVhttJuoQ2BwRCX0Ms9VtFIvoS1JOo+QWi0+5K
	 H9w2qVj5/8dztmVvhtFSnwmHmiPXP3KMPySNveeFFCq3B1cdBFpxEsrzrKMWqG/F0A
	 xPUtzEngVul7KtFHPB8trk1WA64KyciQNwvonO9ZF7pHXqBZUhizpE8qSmbY7GC2Z2
	 4N3P2txnfhyVcBtOrHO3iQkjEzucZsgyz/FzQT2oOjed1Csvf0j3fnwv/WuMwRfSZz
	 4PvxZJFtTju0g==
Message-ID: <37b947bc-ae54-49ef-bac6-1ec13772d03f@kernel.org>
Date: Sat, 20 Dec 2025 06:07:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] wifi: ath12k: Add support for disabling rfkill via
 devicetree
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
 <L8oRgLxJXJOSFskrI_YHusMp-Hx1nToNTGzEAuYfFmvK_uyJ0tJiJbXOQTcwHMbWOHTKcRws9ehpNIEZhAfWng==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-7-16065bef8ef3@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251220-surface-sp11-for-next-v5-7-16065bef8ef3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_220756_921618_6B25EF3F 
X-CRM114-Status: GOOD (  19.38  )
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

On 20/12/2025 00:22, Jérôme de Bretagne via B4 Relay wrote:
> From: Dale Whinham <daleyo@gmail.com>
> 
> Some devices (e.g. Microsoft Surface Pro 11) indicate that the rfkill
> feature should be disabled by means of an ACPI bitflag.
> 
> If ACPI is not being used (i.e. booting using a devicetree) then this
> property will not be read and therefore rfkill may be enabled and
> the ath12k will be hard-blocked with no way to disable it.
> 
> Add a devicetree property that allows to disable the rfkill feature.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index cc352eef1939937ce902bee2fbd9737ca3ab5993..e10073bb975cfd2e9ee418edcc49d0d51cf93de1 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -77,6 +77,9 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
>   	if (ath12k_acpi_get_disable_rfkill(ab))
>   		return 0;
> 
> +	if (of_property_read_bool(ab->dev->of_node, "disable-rfkill"))
> +		return 0;
> +
>   	for (i = 0; i < ab->num_radios; i++) {
>   		ar = ab->pdevs[i].ar;
> 
> 
> --
> 2.47.3
> 
> 
> 

Just maintain a list of devices with the quirk. disable-rfkill won't fly 
because it doesn't describe hardware and DT != ACPI that way.

---
bod

