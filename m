Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D54E7719E
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 11:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+usBpp/aW2WuI3wyOuA9fXlF8fPBXtOJOTl4n2HkZpY=; b=Nal1VQyqw2wEX8LyzUidZM4mYu
	38twC4Kq+HU7hLkf+AeXu65VnzQNmop0Jwki6D/9lAwO4wG8BkAQFm1DfSNSSvHBA1xedWEo+IMQ3
	EiF7v/ch6UZo7BZVPW4d6pEGKbcbmEkLJawiFMwhvSAZ4hyAY0mKlXiEe5TkW29rkE/RhEJxttkdC
	lzLJrpDYhYMEWxurlE8U+HHTvD3ApczLm/NHy/v9/XUQ0VQvqq7zdTondASa57tybGXdX9wLl32ip
	fQ/cHmzK/l8q10sYvImzObm97q3Ox/GdAWACjG5ipd6Vx/FfNY8JLwUZ2QGTNYJ+D7A3C6jdSNr2h
	zPWlPpkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIih-00000004wYm-2reJ
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 11:34:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIiS-00000004wSY-2d8R
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 11:34:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso29449905e9.2
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 03:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736768082; x=1737372882; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+usBpp/aW2WuI3wyOuA9fXlF8fPBXtOJOTl4n2HkZpY=;
        b=f6ryfWr2fy/2DsHH+Wh1LjBAhkJ7yk5Hx249FGbAYlSbtB/q5M7LDR+0UGu7JGQtHT
         DhPFK8jn8gPq1BeqtEFBLDWwuMgw7Lj3f1QdcAdOApU4jkd4apPXb3kmMVRfR9OBCBec
         98hHkxtbt/f00XoSQw6ZdyVo2PF37TYWTM30kPujb6v30yC24ab6HieLY1UXE4J2Iwwd
         K/Dw/mA88CYaJfwtzyZwC2biBee0ctNixP8oJQo5EvblNs8UpHRjdUS4RyQlEIGvKQpR
         kUajiNgx1R2wa9NpevXB37Xa1443K84MlanCPkctFfc0iX4z4WL1Nl+MbpMdWt4jO3o+
         ZPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736768082; x=1737372882;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+usBpp/aW2WuI3wyOuA9fXlF8fPBXtOJOTl4n2HkZpY=;
        b=uoTM9xHwSwNhQ12iCYNOBsW4BRBbFCbbSEeKflrI4PROTZXsg0vPv2ZyRIPH8EL9+B
         42F8jmPBBQgEhPzV2JT3byE2lEh+tjLJ8f2aJP8bTKodw2cd787Sj8p66lgmI58q7S/n
         66cxBXHA57Un+s/udPUFAKsFm+PhmCCd04vyFe21LvKkJ+fnXK+y7od+w5nMmD4qpCgf
         z33OsAGM9kFWW29E5X2Gf0NvElWcc1Ppw8mPX4UuUryh99GeIGnmX/ir/VETstU6K2ei
         7C2/KFuWDDxj+dgf5JJrXS+cGDjGSNbyV7WLzVpTPvY4Nz2iS/2fKxOnu40Cgx9wdBlD
         rBLw==
X-Forwarded-Encrypted: i=1; AJvYcCWDCTShZN6kNLvONxbdMamFfcQ5foCzfpujSNQdk33vqOmzCIyQO+gQ87cJ+h/0FSEf9t8WmdE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxupIIysRvayvdshNgUc0MzaIOriQ4nSLjvi8NhidJcTDKjcEs6
	7xls2TQeqroe1xacbWsXnOCW3EOalU6dRdCIRteac3+fTbxxtRjb
X-Gm-Gg: ASbGncubYEnlaSmKKXSqFxwyCCNlO2uD2od5osnibgrSX9mHj3m4P0gsmAWSeJ0eR24
	aBinddm7r99a1cmzOdYBbwFKQl29p89V7BynopCwODsZk0WKmwSb8YXSGhwrQ3YWtXIjUMOaiGx
	bX6lkFTNXvnFadMS71XjlrWf7OlEpvKptkKaH18Yk7AG+tqXjG0Xvvy4FCm5W7GNE1jSHVhnGD3
	hM0Frtz+mnwBJYvQ4wCr0UDiO2gKWV61aw5Hsx0in648xQAUIUgiAJZ7D+eTRzzjI2+FOV1LDE=
X-Google-Smtp-Source: AGHT+IFupkNx0dLFod1XbLENSafE4AHbOagVfykDLEn84SJo2Wt7Nexd2Y/bmUTy821uCYEf8IHt/g==
X-Received: by 2002:a05:600c:45c3:b0:434:a4b3:5ebe with SMTP id 5b1f17b1804b1-436e26e554cmr155607175e9.24.1736768082293;
        Mon, 13 Jan 2025 03:34:42 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37d69sm140008175e9.30.2025.01.13.03.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 03:34:41 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jan 2025 12:34:41 +0100
Message-Id: <D70WWHYSPEY6.2TEXW2PF1C8SX@gmail.com>
Cc: "Kalle Valo" <quic_kvalo@quicinc.com>, "Jeff Johnson"
 <quic_jjohnson@quicinc.com>, <linux-wireless@vger.kernel.org>,
 <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath12k: fix key cache handling
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Aditya Kumar Singh" <quic_adisi@quicinc.com>, "Kalle Valo"
 <kvalo@kernel.org>, "Jeff Johnson" <jjohnson@kernel.org>, "Rameshkumar
 Sundaram" <quic_ramess@quicinc.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250112-fix_key_cache_handling-v2-1-70e142c6153e@quicinc.com>
In-Reply-To: <20250112-fix_key_cache_handling-v2-1-70e142c6153e@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_033444_664620_32E6299D 
X-CRM114-Status: GOOD (  14.13  )
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

On Sun Jan 12, 2025 at 6:53 AM CET, Aditya Kumar Singh wrote:
> Currently, an interface is created in the driver during channel assignmen=
t.
> If mac80211 attempts to set a key for an interface before this assignment=
,
> the driver caches the key. Once the interface is created, the driver
> installs the cached key to the hardware. This sequence is exemplified in
> mesh mode operation where the group key is set before channel assignment.
>
> However, in ath12k_mac_update_key_cache(), after caching the key, due to
> incorrect logic, it is deleted from the cache during the subsequent loop
> iteration. As a result, after the interface is created, the driver does n=
ot
> find any cached key, and the key is not installed to the hardware which i=
s
> wrong. This leads to issue in mesh, where broadcast traffic is not
> encrypted over the air.
>
> Fix this issue by adjusting the logic of ath12k_mac_update_key_cache()
> properly.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Fixes: 25e18b9d6b4b ("wifi: ath12k: modify ath12k_mac_op_set_key() for ML=
O")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> ---
> Changes in v2:
> - Add 2025 Copyright

Tested-by: Nicolas Escande <nico.escande@gmail.com>
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3-03253.1-QCAHKSWPL_SILICONZ-29
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

