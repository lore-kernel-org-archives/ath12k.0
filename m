Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490B2E98E10
	for <ath12k@archiver.kernel.org>; Mon, 23 Feb 2026 10:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udDw3yBpUkAMkazROavv5PXUxzxBR+GjnS6pxK0vMWA=; b=ZdrpjpcBzvTiCDHQem/DHk8Iup
	ZPlpQ0Guu9uOX/j4vJx5OSyoiKT3OEW5RAy/LSMpnGy9T1Td+kTazHhQgxmlRNe5jS9dejOrJxCbq
	8MZhCj2uI8g60WtJ7gIs6W7zbOXOnmZBuO9AsuEK6eNxrXhfsSDqvMClsMWM8WookABbTnxsgXX/6
	b2mSLvdyWp5iU4MLL9m3gb1pGqt9sdP9OUqvp2RIevv9VywuUGi4o21HBj+dXDDt33TfAQDyHQMo7
	gjP3uBfqiNP2BctwiFQK8BCaUY+Ny6sqtW4s03rs6ufbJVhZe/u/SbxJwtvs+jXFdfVXgjte2CiGe
	5MNBJu0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSoT-0000000009R-40Yf;
	Mon, 23 Feb 2026 10:05:13 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSoR-0000000007s-34Xv
	for ath12k@lists.infradead.org;
	Mon, 23 Feb 2026 10:05:12 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48371119eacso47660015e9.2
        for <ath12k@lists.infradead.org>; Mon, 23 Feb 2026 02:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771841109; x=1772445909; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udDw3yBpUkAMkazROavv5PXUxzxBR+GjnS6pxK0vMWA=;
        b=gaNYX/xSfkNMgb061rlXCVMPx0v6YdxQGgh2TqMMpE/tC/vLjtW7OLNSK6fma2d7Br
         q/Y/BeeRCVnAh4X7QSNkmUpKoivIXHoI0ZV8r2oPPFGAkldTuIGdEeaNMX3W6H9O/jdG
         P2HAUHicujtwkFvJdmZVTucaW8xRtc3VEPA4lIGjDsOlu8lGo4DVlnnNM5LDmaN7yMjG
         +B0M4HckYgyEnO8CKHYdIJj3ppJGUsHyU0XphIUdEhbZDZoz6xqosKH6rjE5OphMGSzQ
         FERcG/ybmHKuz1QOmJbcamVVJ+o6EyFQMOOFFja1pcLdXGrNlkVh2+AGO+otHyPLFUMU
         OcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771841109; x=1772445909;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=udDw3yBpUkAMkazROavv5PXUxzxBR+GjnS6pxK0vMWA=;
        b=I64XHfDGcpm4AtWT+fP8tDaG6pHX+RSboNW21gkL53U0VmgP1/49ZBKWplCm4YbysT
         mng7J7oSpArytq0Bqlnn5/qtq1AkVuh7jFhiQIoPv+t0gaBNmaQ+8U5IxBXxm1JJg09Y
         h8jk0CfPFnCpzOcO+KMKskMzdlSfJAnXovklMmcvKtM/8q9wtoCsrP4BebWOETFgWGHs
         NLNXd4DtSBsH0+pysmQ8+fX1gqI3QTtEJ4zcUwi6rWZgB8NVEzGv1Dp6VLjnf977aWsg
         YW8e3BHR5lScT1wDHVJlpiLFhKhQiDC0EQ3coWz5B6G35ip6x2H8442nHkAXKaEZDqCr
         NyyA==
X-Forwarded-Encrypted: i=1; AJvYcCX4Hao1YcYCaY3JbDmSg9scHdTRbwCT3UFjkE2hDzF5dGUI+sJ5Ii9CTXT9pEGFgfna4FYpaxY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBHp8Wu4iElvgc6WCXtKZeBanAWDXKT7RCmCvN5HwiOywjdRGw
	7yOTZz70BwWk7+hOR9Pinq32RVCwGKWvANkH/90XcQCfQLFGWwnAwMDW
X-Gm-Gg: AZuq6aI5+ff85u76OSY4gWSpwWzEaCKEQpCED6tbrJZU96PFd8ETXyKsEVdT9OeFkCA
	ykBVonQfmUlNGhV4k2BErXRYBN+OxSq9bU2PCY9m5OO4Hcom+nPFhYWIicfN892sdRv6r9FRRou
	sl8dvtbRnYH9A6QXgjcO0Wy2mDiKSwTJOfh54U8abo6NaGlHZ8ipuBWCV3smWTlbUCyX3JYgEkY
	L8Gwwd1ItRP8vn2Pwh2fLe9CdrG78HuGTt0nKL9zW00QmJMFGK8sH5TEawBREjp7RWmVFft5VQP
	D6LY4steEA7dBYFnJywEQWkgp9QCSC6/IxDK7jGZOVEIdYe6ZEAUjKziEuZX4l4QrxqOI1JFvcJ
	0MuJSptyt/MCh5xdc9au29SxRzBzG63Db2Ft0NmOWeYfM3IAxg4EAfVjQUvSNl3t2+4P55f1zDG
	2uyjgpxJjVfGBDUrm1+uUNdl8YSQkzRgLiG4viy+nCBg==
X-Received: by 2002:a05:600c:1f8f:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-483a962e459mr155134995e9.16.1771841109061;
        Mon, 23 Feb 2026 02:05:09 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54c5csm17737463f8f.38.2026.02.23.02.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 02:05:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 11:05:08 +0100
Message-Id: <DGM9946HTER7.2HAN0CPP3R2ZZ@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Maharaja Kennadyrajan" <maharaja.kennadyrajan@oss.qualcomm.com>,
 <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>, "Aishwarya R"
 <aishwarya.r@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3] wifi: ath12k: add basic hwmon temperature
 reporting
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223060238.7038-1-maharaja.kennadyrajan@oss.qualcomm.com>
In-Reply-To: <20260223060238.7038-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_020511_780260_1FE612D5 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

On Mon Feb 23, 2026 at 7:02 AM CET, Maharaja Kennadyrajan wrote:
[...]
> +static ssize_t ath12k_thermal_temp_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	struct ath12k *ar =3D dev_get_drvdata(dev);
> +	unsigned long time_left;
> +	int ret, temperature;
> +
> +	guard(wiphy)(ath12k_ar_to_hw(ar)->wiphy);
> +	guard(mutex)(&ar->thermal.lock);

Hello,

Is this mutex really needed ? It is used in conjuction with the wiphy_lock =
but
it's never used elsewhere. So even though there can be multiple ar for a si=
ngle
wiphy, there is no code path that that would lock this ar->thermal.lock wit=
hout
locking first the wiphy. And the wiphy lock already protect for reconfigura=
tion
and recovery right ?

> +
> +	if (ar->ah->state !=3D ATH12K_HW_STATE_ON)
> +		return -ENETDOWN;
> +
> +	reinit_completion(&ar->thermal.wmi_sync);
> +	ret =3D ath12k_wmi_send_pdev_temperature_cmd(ar);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "failed to read temperature %d\n", ret);
> +		return ret;
> +	}

