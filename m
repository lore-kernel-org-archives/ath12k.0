Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA00CA6019
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxWelmSlH2JHhp90EwkFGP9vd1R+MewtWKi268DULMk=; b=bHCI3kkBZOxHoObgtzZtVMd0v6
	3WWB1KigJLy1KzR7YzVRzJ0X3/3oeJGENDYwQGy4Zuhm4duKZd6qPUtm31J4g5F26DjGCJCiDd+Dg
	Nz0g2x6RTSAyeS1/347HNjN//DLo5O7Iw9e7LuEQ/AQDQJiOPYrHXdVrcrfJ+IH2curjMBVH68kfY
	wbEUmD21Ix+Gn/HHZ5HxbSmXTL53MZDZ3TViSZBqdndT3k8n4s6AYstTj4uWjT/7IA82vQ1zcxJ85
	JOMa1GWHwoT7tbGNOV+/4iriUI/0hvfeXh1LduCXnv1lkxpmZarX9ZpsqE8eV/Q12Rp0/tbatjWCd
	lMirVymQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDGq-00000006ddG-38eR;
	Fri, 09 Oct 2026 16:16:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDGo-00000006dcj-3A7B
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 16:16:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so98305e9.2
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 09:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562588; x=1792167388; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxWelmSlH2JHhp90EwkFGP9vd1R+MewtWKi268DULMk=;
        b=UyB/UXjEXCSKlVL5fi3LPTFtSacqJ7GapiiNaHzFNdtaRiyc0c5DFT5K/5m0K4aS91
         KQTp3cijhcqSX/oS03+CpvVKCrKIrtFCUV7jG5mN362EMMafM7N6M9G70nHh9Cy4sR+F
         iLYFGYaP6xROQuOC4Nx0UuuEJZ1uXfHzguWisiEbWl82MrZlEwbWfs49UY0gDo4FLZYc
         FjtoRFRSUPxietUw/aYDTDX9MIPxBIzkibaGTrsbVOwnmH2q7Qtxfw7AdDWG6RigdXIu
         5KOlhR4QBLGV+VtlW91oDxmO8ubevUjS8J79OZJgiB0L4QiCeZ1gTYbiniig3z+IstIB
         c+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562588; x=1792167388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sxWelmSlH2JHhp90EwkFGP9vd1R+MewtWKi268DULMk=;
        b=hcwKx2vjBpRtYnllEcGiCDObWciRt89uMQS0dENdPqkmDvFZsWKXXRW+o5l1dqpbUa
         wib9JeakrtVFVC/ni07+3d/pkBsv8QTDKIuPVEmG3HJrs/KmFfkrCgcrQPHDsrFHVTDm
         TzooEU1qrKWQGczJsU4YX8jJ2te+aRwwl8YLfS3MnrWruoRnZzbG/+ZjtFK+k4ZvxToM
         5hjeteRd6rdw1qjDzdlj6eKgO6sTLPrBbb7RN4RHttt8GL1RmijyHYAqqB46+1sWWfgK
         D9UEAM5jiNxmjHPJ164RF2ARuwenDYnEWVGuas0LWTFAdghQjhJ0MlbrpQwj+i1mf40g
         goeg==
X-Forwarded-Encrypted: i=1; AKwUvByRsHdBZQ9I464MMaghxjD1ihf3ikD4/sfDekNc+GFtxnZnweuXJGCg25wwk3hnmfk/bU8AukM=@lists.infradead.org
X-Gm-Message-State: AFuF++m8JOx4551p+0yOc/Vm3FVQRJG2/H+l8I6oCWMBW6rlTjJu4X+P
	MPhxrP0poO3JJ0cytKgktZeT1rV6Api4t5AUU4shYOgmkL4zi1Rha2gm
X-Gm-Gg: AYBFou3uU1IPtdvqHWbIv4gHJ3afMp6sQ1fMEqBKGcqwC71yqi4P4eAcoFovAQ+6AvO
	4VjrDvWDsGgoaKcSeRk5Q9WCfo6OLqSsNwslT8yHN3YrKavFRQzSFmvtm0fzK/3r1fab2UTM8t3
	faeTxebyVY43l2Oo18i714ozcEOfHOLBgN/4f0UaC/tCWMo88r1/o0v9yEQtQ4uthONdRqkbSO9
	Aox85INqg3XBOkPYb5yZQ/FwvJd5YpMe8ianxLvcAQv7ndIjtohQbEU8nEhnTXSOIWmLkg4wogd
	5i1sISZQnQjDRqMo9cLqpJ0ALvof3zZtMhJTd7OABtaPJliAgLu6D6DbRYnYyYs+pV6sJAZbuze
	KvMc8U9VlQI/oyn3MXzq0VGOfC2n0Fgbprde+zVyxksH4y/JMb9egCkQ0ou64DRE5DeI1HdeuxO
	PkI7rv+dS0dgJ32BxVUe+cETt2FBC8rr3tqUpOepCvhPLx7C6lGsSGwC61lvZzybr0x1cTMCpQR
	C9d6f9vfM2m/ZWOD/ecdPYfW3nnYg==
X-Received: by 2002:a05:600c:3510:b0:4a1:7703:e549 with SMTP id 5b1f17b1804b1-4a18e4c3fe4mr53443415e9.26.1791562586570;
        Fri, 09 Oct 2026 09:16:26 -0700 (PDT)
Received: from [10.147.33.44] ([135.136.51.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e481993sm52116525e9.2.2026.10.09.09.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 09:16:25 -0700 (PDT)
Message-ID: <aea18e6a-b831-4336-a647-e87228fc46b1@gmail.com>
Date: Fri, 9 Oct 2026 17:16:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: skip hardware rfkill setup on Microsoft
 Surface devices
To: =?UTF-8?Q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261006062728.45007-1-franzelfranzel@gmail.com>
Content-Language: en-US
From: Dale Whinham <daleyo@gmail.com>
In-Reply-To: <20261006062728.45007-1-franzelfranzel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_091630_821575_34469DA8 
X-CRM114-Status: GOOD (  29.47  )
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

On 06/10/2026 07:27, François Roux wrote:
> On the Microsoft Surface Pro 11 and Surface Laptop 7 (X1E80100), the
> WCN7850 hardware rfkill input reads as "radio off" and the OS has no
> way to control it. ath12k enables hardware rfkill handling, so Wi-Fi
> stays hard-blocked:
> 
>    iwd: Error bringing interface 4 up: Operation not possible due to RF-kill
> 
> ACPI platforms can opt out through ath12k_acpi_get_disable_rfkill(),
> but DT platforms cannot. A DT property was proposed for this and
> rejected, because it describes what the OS should do rather than the
> hardware. The suggested alternative was to handle these machines in
> the driver until a connector binding can describe a broken rfkill line.
> 
> Add a table of board compatibles and hardware revisions on which
> hardware rfkill is known to be unusable, and skip the rfkill setup
> there. Other affected machines then only need a new table entry.
> 
> Tested on a Surface Pro 11 (microsoft,denali) with next-20260929,
> booted with the unmodified mainline DTB: the interface is no longer
> blocked and connects. The Surface Laptop 7 entries (microsoft,romulus13
> and microsoft,romulus15) are based on reports from Jérôme de Bretagne
> and Dale Whinham. I have not tested them.
> 
> Link: https://lore.kernel.org/all/2ixwny6hzumlqmok5cjwutvtk7nzmx4t3dhxc44ao4l2u755pj@n6m7jyxf2o62/
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Assisted-by: LLM
> Signed-off-by: François Roux <franzelfranzel@gmail.com>
> ---
> Changes in v2:
> - Use a table of board compatibles and hardware revisions, as suggested
>    by Jeff, so that other affected machines only need a new entry.
> - Add the Surface Laptop 7 (microsoft,romulus13/15), which Dale and
>    Jérôme report as affected too. These entries are untested by me;
>    a Tested-by from someone with that machine would be welcome.
> - Retested on the Surface Pro 11.
> 
> v1: https://lore.kernel.org/all/20261004165132.4313-1-franzelfranzel@gmail.com/
> 
>   drivers/net/wireless/ath/ath12k/core.c | 32 ++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 0c72948f3..67d4c98fb 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -72,6 +72,35 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
>   	},
>   };
>   
> +/*
> + * On these machines the OS cannot control the WCN7850 hardware rfkill
> + * input, which reads as "radio off", so hardware rfkill must stay
> + * disabled. Ideally this would come from the connector node of the board
> + * DT, but that binding does not exist yet.
> + */
> +static const struct ath12k_core_broken_rfkill_table {
> +	enum ath12k_hw_rev hw_rev;
> +	const char *compatible;
> +} ath12k_core_broken_rfkill_table[] = {
> +	{ ATH12K_HW_WCN7850_HW20, "microsoft,denali" },
> +	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus13" },
> +	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus15" },
> +	{ /* Sentinel */ }
> +};
> +
> +static bool ath12k_core_rfkill_is_broken(struct ath12k_base *ab)
> +{
> +	const struct ath12k_core_broken_rfkill_table *entry;
> +
> +	for (entry = ath12k_core_broken_rfkill_table; entry->compatible; entry++) {
> +		if (ab->hw_rev == entry->hw_rev &&
> +		    of_machine_is_compatible(entry->compatible))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>   static int ath12k_core_rfkill_config(struct ath12k_base *ab)
>   {
>   	struct ath12k *ar;
> @@ -83,6 +112,9 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
>   	if (ath12k_acpi_get_disable_rfkill(ab))
>   		return 0;
>   
> +	if (ath12k_core_rfkill_is_broken(ab))
> +		return 0;
> +
>   	for (i = 0; i < ab->num_radios; i++) {
>   		ar = ab->pdevs[i].ar;
>   
> 
> base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
> prerequisite-patch-id: aafe3fac38f4020441979665509928f8cc832095

Tested successfully on Surface Pro 11 X1E/OLED/WiFi model.

Tested-by: Dale Whinham <daleyo@gmail.com>


