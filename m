Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4CCE9A03B
	for <ath12k@archiver.kernel.org>; Thu, 19 Feb 2026 11:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDzlYIoeVQaQH9OqgFyjlNZouhIzF/kzZ+17obwht0U=; b=P2HbnYM9Azi4qkNgmuiFyBmSmH
	33IVkcu1wR+i7Be6z4VtZWJ/IPU8ePuSi0Dz2J2gs+MBfPtiCTMyRdKyyHfLrUJS2RQGqS4t+VJ1B
	w+Ron+IdK4R/XqJFqe806MN4WpHHVL4Zahgvn8KGSAzY+F5PjfK41j1wGCjE+pBpKV+tQ3aD1zgku
	K4BMLEvnqoBYuAXTcMGFUVOp538pDPT1paH5UMGFT84O1ihPDG0FnLm/Yb5/ncc3iy+YVbAqYgDHz
	uQCItxu8dJAcLchD1xrZz9iaHL7GVpS6MOoFy/VheWU5FNZyBGjTPY095JjDx6rn44y4PzUcZU/E0
	erU+vNQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2GB-0000000BHj7-1H5b;
	Thu, 19 Feb 2026 11:31:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2G7-0000000BHil-2hWO
	for ath12k@lists.infradead.org;
	Thu, 19 Feb 2026 11:31:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4837584120eso6068905e9.1
        for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 03:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1771500709; x=1772105509; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WDzlYIoeVQaQH9OqgFyjlNZouhIzF/kzZ+17obwht0U=;
        b=r3nOLHuPdb2G+JkO2AB1WyPU2uP3bzxeSrDxeN/K2l0oH9ItNnW5dgA3iXNlb+v6Y5
         Yus+6bpFqqZCQFR4cNrtQyQjN1s/9E+4tA+6WHeUmql+j4LIA4lcIOW0iv5sjapdlFSR
         tv6gnjgURhsbwIpeT6L+/L30tXhxpvFxyDlNo4tVipb+AmqbwpA4j9b1iyNTLKBbmuac
         XFG+w/Z1QK8ZPPifSIscTel2u8WCSDI6FnyDwDcZ4edBTex76bPbjX2+mHXhuJM8r2T5
         zrZb1q/MZFD2ZB67Kego3eH6tk8ovnHKP2CuBoMgXH8HOrrsyAsGbwR16oBsn2xtyzsC
         4qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500709; x=1772105509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDzlYIoeVQaQH9OqgFyjlNZouhIzF/kzZ+17obwht0U=;
        b=IHpLZf8B4QikMj+8lfM9HVpylk/8n2sQBzjMlDKic7/WzXmXWlm2Pj5gHPgIuf8B9t
         jZGGoPtKcrpwbcX4XyYXeZZL9qgbPngUAVGgmVaxPVflk2IGZo8so5ZhHVbsbL1jucwQ
         BLltfqs0fi03t6wktQO7AvgVupeLXBZn1TTSm/9dpdbpJHSSbF2CLJb1nkaHJMx1topF
         gndX21DRsRvuwcfzLZlYZf5ZdEECJIwdXbhSxrsSU6GlOl/TL+vRwqhmsctnyZLooUVj
         99hH//YNLqDf18ELY0MNgJlDcEakUl0izDeft3m34K1Zia6w+EhSd6M6TbC77chOYz1X
         Q1xw==
X-Forwarded-Encrypted: i=1; AJvYcCW1muqQ4IaRyQK8SwbDpMI5F3/eTnFhlahVa4UVPFUzrKjZVHs3LHq9n0AzQeXKgwVQOS2x5xc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOguKm88AqCWWRBl4ZIOTEbtvLnuqxoS4p+wlo7YkSVPo4MHhb
	hPY412LNSbZu84EuSbWXkAlmd1cgPvQXihAjTbXBVhqwqVYT/EZ5RjYtcAqvbsICk8k=
X-Gm-Gg: AZuq6aJWrBK3CATcIiEIirIwxWmuoYzQZ3O9GYOd5RnYCcgalQ4Bhz5QCN4gHj0p6dT
	A8DiMlyzWwanLkT/By5juVW9pqyUDkcAq4M7UyML1cw6QOfFuOJUHqMawBjmSX8gU85WZdZJKdn
	2MgZ8+1wOZpGBfgR14jNu6eNAKhFVeDbPj81WipjjzSlqgNTsCCuF/EfS0hE4EA2JylTTwsm+26
	X/KWh+eKN8Doct9XpE7Q2QDPYck6ojiYd+MuJ7ertdr0OjUZB9tc9flRLwofkbp7aP4TABLEz4B
	Tt9uVK7mXW04wttbFTzbyP5CZSAvK42WmIv8zw1UbvSKSBW7twjg/z3UfoGjCyoBxyvF9o5h9TE
	GGq1t09r5fn7oiMG/BC2dlfJsdu6usuUXK/2yG6nbeAGKG71KZNLCyDTc9FKVkmPWz7ExjDE/jM
	EXMVgQTBgdK70Iqf/O0pRyGWI22hdyexfa+f35F0Sx+eJUJQlbv8Hbww==
X-Received: by 2002:a05:600c:8709:b0:480:1c53:2085 with SMTP id 5b1f17b1804b1-48379bd731emr287433325e9.19.1771500708973;
        Thu, 19 Feb 2026 03:31:48 -0800 (PST)
Received: from [192.168.108.101] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839ea1e9absm18204535e9.3.2026.02.19.03.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 03:31:48 -0800 (PST)
Message-ID: <541218f7-0256-4cae-9cb1-40a1a2da2bfb@freebox.fr>
Date: Thu, 19 Feb 2026 12:31:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: add basic hwmon temperature
 reporting
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
 ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
References: <20260219073440.19618-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Language: en-US
From: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>
In-Reply-To: <20260219073440.19618-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_033151_979683_73307378 
X-CRM114-Status: GOOD (  18.23  )
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

Hello,

On 19/02/2026 08:34, Maharaja Kennadyrajan wrote:
> Add initial thermal support by wiring up a per-radio (pdev) hwmon temperature
> sensor backed by the existing WMI pdev temperature command and event.
> When userspace reads the sysfs file temp1_input, the driver sends
> WMI_PDEV_GET_TEMPERATURE_CMDID (tag WMI_TAG_PDEV_GET_TEMPERATURE_CMD) and waits
> for the corresponding WMI_PDEV_TEMPERATURE_EVENTID
> (tag WMI_TAG_PDEV_TEMPERATURE_EVENT) to get the temperature and pdev_id.
>
> Export the reported value in millidegrees Celsius as required by hwmon.
> The temperature reported is per-radio (pdev). In a multi-radio wiphy under a
> single phy, a separate hwmon device is created for each radio.
>
> Sample command and output:
> $ cat /sys/devices/pci0000:00/.../ieee80211/phyX/hwmonY/temp1_input
> $ 50000
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202602160145.YQdvbqYY-lkp@intel.com/
> Co-developed-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
> Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
> ---
>
> v2: Fixed the kernel test robot reported build test error.
>
>   drivers/net/wireless/ath/ath12k/Makefile  |   1 +
>   drivers/net/wireless/ath/ath12k/core.c    |  13 +++
>   drivers/net/wireless/ath/ath12k/core.h    |   3 +
>   drivers/net/wireless/ath/ath12k/mac.c     |   5 +
>   drivers/net/wireless/ath/ath12k/thermal.c | 125 ++++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/thermal.h |  44 ++++++++
>   drivers/net/wireless/ath/ath12k/wmi.c     |  57 +++++-----
>   7 files changed, 217 insertions(+), 31 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath12k/thermal.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/thermal.h
>
[...]
> +
> +int ath12k_thermal_register(struct ath12k_base *ab)
> +{
> +	struct ath12k *ar;
> +	int i, j, ret;
> +
> +	if (!IS_REACHABLE(CONFIG_HWMON))
> +		return 0;
> +
> +	for (i = 0; i < ab->num_radios; i++) {
> +		ar = ab->pdevs[i].ar;
> +		if (!ar)
> +			continue;
> +
> +		ar->thermal.hwmon_dev =
> +			hwmon_device_register_with_groups(&ar->ah->hw->wiphy->dev,
> +							  "ath12k_hwmon", ar,
> +							  ath12k_hwmon_groups);
> +		if (IS_ERR(ar->thermal.hwmon_dev)) {
> +			ret = PTR_ERR(ar->thermal.hwmon_dev);
> +			ar->thermal.hwmon_dev = NULL;
> +			ath12k_err(ar->ab, "failed to register hwmon device: %d\n",
> +				   ret);
> +			for (j = i - 1; j >= 0; j--) {
> +				ar = ab->pdevs[i].ar;
Shouldn't it be `ar = ab->pdevs[j].ar;`?
> +				if (!ar)
> +					continue;
> +
> +				hwmon_device_unregister(ar->thermal.hwmon_dev);
> +				ar->thermal.hwmon_dev = NULL;
> +			}
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +

[...]

Best regards,

Pablo MG


