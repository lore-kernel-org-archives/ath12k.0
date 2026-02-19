Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01985E9A03B
	for <ath12k@archiver.kernel.org>; Thu, 19 Feb 2026 09:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+NuR9VGQucH3RE5LsdgI6IWd0WqBlDZWEmahtU6Wyw=; b=fESUTdJ1V/D06h8h3oGR7sJFzZ
	ljRLNUG05hmzwK/wv0LlDLflowwh13Jn1+Tpp+8hKImXIpbDOdd/BTxq9zSnnGqe7FwOsL1oH9Sl8
	MrfY+1FNy8NanriK2W7fkDiCK3/0DWaqwtgWDOsGlTRpZGMrjhFbVICcC0aX9gOqPNrR82q66K+lf
	+zGx21+HOxKJ4AYOKdGyV9lxJ49e+PDU8UXbBbH/2wOLe4h+wqCZJCdY2xKTJcdTh1ZDxbpUYTKzK
	p/rqYz9Pzfp6y0tz5zJ1W97rocVHwo/67F71m4oKMq8WmaeVbh2B7tUdDEeDbyfwEQB/+sQOUhWDY
	UDiPXNHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt07u-0000000B9x7-2vIc;
	Thu, 19 Feb 2026 09:15:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt07r-0000000B9wd-3g0y
	for ath12k@lists.infradead.org;
	Thu, 19 Feb 2026 09:15:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4834826e555so6260675e9.2
        for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 01:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771492510; x=1772097310; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+NuR9VGQucH3RE5LsdgI6IWd0WqBlDZWEmahtU6Wyw=;
        b=nk0Yx4SNSb3niLbtGHDd/EiL9WRSZoKCJCBY3c8q7gnIU1wq31wZuwp7qjx4yupHRl
         3cAUwRb8yQPuCGfVtnay9WmPvbEbcAsERUSpMIypf7nEbnAKC14J5Rs6VXYdTojEHdlK
         IwRth+WTah83GZy150Bs+KdBF0XqZ52I+pzmkWU+2vDH+LiNCUlmUcFDv3XOodgrJQ+Z
         41IDO5+HdIWquLlQ5HdppJev/PfGucwkSKLhrwmJmXyOMeAXEmlBQlRBtmrsOK+wN/np
         W+xb4ILpmMlUQ/TVACB7YcLRe+HqL8AmHqDOf+7c0qdzz5xcbr7iut90JdQjSuQ4LnOW
         bjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771492510; x=1772097310;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A+NuR9VGQucH3RE5LsdgI6IWd0WqBlDZWEmahtU6Wyw=;
        b=tn+TaPvRPR/YPmUD0bHq84PM7e7DvIp6yr2XNEQPFWBDVGNWb9Z2QkjuUWgppPCUS9
         xazKNXlzBz0uuJl/JtLkf3phCnIG7plDcfe/O/EVeyAaJqyk/Degr17gx3R1MYYJL/5c
         Nm8zL9Glln2aapdOhvLvFP8VNPNn7uzY3coxqKw3r7er7aVtRoTc+AXoBlD4W1KjEI1/
         0YyxSe9eka+qHQ7yybps6+Et0QmQ9LIpClyf1w4E58rxtgi+Y0MWmkbBxcl3MyNS6rsu
         jY7ejOgM9MBDkTyKOlqZoXqqxfmwl3CTjMafMgWBXWkJijFKTCu2X02Bia42WVCJGnm8
         W+8w==
X-Forwarded-Encrypted: i=1; AJvYcCXPjsTFWfr/MuqzrmELqbuuUl6GAiln284IeY4cu0pHFHs1j5CpV51zsrxQyiaXtc9+ee2UXtg=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv/adkWwL9PYSL67REUW7ZRwfJPy4SrgvS8o77Q0HJI2tH4pzk
	dxECDRs+KJhPu7TQsoxXbN3O7PIaBouVRVyfXK9xM/e/ltY2hjbdl12PyrMKwQ==
X-Gm-Gg: AZuq6aLHN+PBWVJ3QtcyibBMmcigGZpifW9YFggnKkfhw/Nr3HGDtWHqdB+kR3sSVkB
	ZqudzfXS/+z07dVP28ww0kjmVIgHpZGDn0A9e95z1JgnfRl4wZUyj9i2HY+4cseWBh6LL7l06yG
	kNrBQBy9TL5n/BWiGg54l2+fSPUKTaSKd497PlYWNDbfUNSTN1YD0tmmBGGxbueCfqmRFlaxKfX
	3il3zfzBCU7GGPKa1ToLLqnZJOHb1y0XhBCGXId8zldu1Sb/HtXIzwLyGWrN4wseaKNUFTigm/H
	Fh5Ssw26elF0MLksGBFw6rKRTQPng7GkCvTjQ57A8d8QRGb/kq7TNHwsPW/jJHCoQc9p+GFXGj9
	UhEbqeGhOC577oGptzO7/epe248gykN0clRVGu0bCj/Q7FRTR2O6z78V9Mkge2+bVRCODkfP17Z
	itzJYQ5qqso5ASCQwDWvfNXQwSLbGJ4qRg3OQrAsvD0w==
X-Received: by 2002:a05:600c:8b61:b0:480:1b65:b744 with SMTP id 5b1f17b1804b1-48379bf7907mr264060185e9.28.1771492509311;
        Thu, 19 Feb 2026 01:15:09 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483801ff9b3sm362588785e9.13.2026.02.19.01.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 01:15:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 10:15:08 +0100
Message-Id: <DGITONL8L200.PJE38TDXYRQC@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, "Aishwarya R"
 <aishwarya.r@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: add basic hwmon temperature
 reporting
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Maharaja Kennadyrajan" <maharaja.kennadyrajan@oss.qualcomm.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260219073440.19618-1-maharaja.kennadyrajan@oss.qualcomm.com>
In-Reply-To: <20260219073440.19618-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_011511_934352_8CED9DBC 
X-CRM114-Status: GOOD (  13.79  )
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

On Thu Feb 19, 2026 at 8:34 AM CET, Maharaja Kennadyrajan wrote:
> Add initial thermal support by wiring up a per-radio (pdev) hwmon tempera=
ture
> sensor backed by the existing WMI pdev temperature command and event.
> When userspace reads the sysfs file temp1_input, the driver sends
> WMI_PDEV_GET_TEMPERATURE_CMDID (tag WMI_TAG_PDEV_GET_TEMPERATURE_CMD) and=
 waits
> for the corresponding WMI_PDEV_TEMPERATURE_EVENTID
> (tag WMI_TAG_PDEV_TEMPERATURE_EVENT) to get the temperature and pdev_id.
>
> Export the reported value in millidegrees Celsius as required by hwmon.
> The temperature reported is per-radio (pdev). In a multi-radio wiphy unde=
r a
> single phy, a separate hwmon device is created for each radio.
>
> Sample command and output:
> $ cat /sys/devices/pci0000:00/.../ieee80211/phyX/hwmonY/temp1_input
> $ 50000
>
Hello,

In ath10k & ath11k you guys also had the throtling feature. Do you guys pla=
n to
add this also at some point ?

[...]

> --- a/drivers/net/wireless/ath/ath12k/Makefile
> +++ b/drivers/net/wireless/ath/ath12k/Makefile
> @@ -32,6 +32,7 @@ ath12k-$(CONFIG_ATH12K_TRACING) +=3D trace.o
>  ath12k-$(CONFIG_PM) +=3D wow.o
>  ath12k-$(CONFIG_ATH12K_COREDUMP) +=3D coredump.o
>  ath12k-$(CONFIG_NL80211_TESTMODE) +=3D testmode.o
> +ath12k-$(CONFIG_THERMAL) +=3D thermal.o
>

I may be wrong but I do not see Kconfig changes that allows to actually bui=
ld
the new files. Is this intended ?
 =20
>  # for tracing framework to find trace.h
>  CFLAGS_trace.o :=3D -I$(src)
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireles=
s/ath/ath12k/core.c

