Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287A6E77188
	for <ath12k@archiver.kernel.org>; Wed,  8 Jan 2025 09:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B89NSua0s2NL9yMjR0i7yePdrfAUdgeidNmKjSs+5Ak=; b=g8utXyLxyEq12PiHfO0q7E49PS
	sJnKWNUv5RpODtWJyu+G4qMY0wwh8WWVG+WUkBYuEgW9AZjxOc+PWvhbbZf/mgk9Od4Ns7vyiV+2+
	SY8IFihCINJtmih/yeqKIOKLEygvXW3/TCx8nEsmaMqGBRKISSl8ixGVATWVkIaH9pYjs7fg3Fusu
	tdU5Xt9tVF6ZKTF1K6KLw/3iKXN6SovDjmJ2b7/6DU37ikZg1cg31+sfd7fVd2nI8rohnE73b3L+e
	NWdVVdz7+gQL1bpVWPa9VXXTB1l7GSzfwii5Ht61yO4LBf84WXPAq/9/+z0LXLI1gt8BDEZ4xmobt
	wQSwjCUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS2n-00000007gTo-3ta1
	for ath12k@archiver.kernel.org;
	Wed, 08 Jan 2025 09:08:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS0X-00000007fj0-44TK
	for ath12k@lists.infradead.org;
	Wed, 08 Jan 2025 09:05:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38637614567so7490560f8f.3
        for <ath12k@lists.infradead.org>; Wed, 08 Jan 2025 01:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736327144; x=1736931944; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B89NSua0s2NL9yMjR0i7yePdrfAUdgeidNmKjSs+5Ak=;
        b=JasautnENFX7drGP4gpaB7tl/12C2P/rk4swqZDmelwdgg9lYwcd7EJMHDSp20m019
         YJtp8y5LqONNJFC1V9QZoKNb1mJ4fsf1U8gXduOSSyOem0jXykV7tREtuUPbjj58AS9u
         kY9BNp2ywV8LkxH3yvGg29gG0i9hzCNhsBuCGmG8hVd47ddI2ZM08hcMNLXnW69R2I99
         qkNnxg+fcqdXOkxwj+ASbHPzVx42hiHkuur3JWfeHC9EBVVXOSqBMvQdbZitW7NZzDRe
         tS8ppCjXpZd3cZatavVohefhBnAIOaTSJntBdomsTzBRu4B+xu36NrS6ihCJ6eeObd75
         Uo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327144; x=1736931944;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B89NSua0s2NL9yMjR0i7yePdrfAUdgeidNmKjSs+5Ak=;
        b=GAqomvCwfaOBxPPGmgzHI0UazIqOQlYMDjqNyFNth0AwhL0+hRWuEGCl0Sme4LX/G6
         8GAZQRAYM02KnSam01tSp2qnTDnmJa2dMJXB7ll9U9/qOcML2GPZxb7GQOlfMs0beI21
         jRW0cRoAtFnHUIEhmGz7frBVrpDR801SgKv8+Sy/Sema71QrBWDGo500NbR7VNV5sVXo
         eCIOpHyzKYwin8Kj2rzWNBSK4dLy3uy85MtX6ys9gIentSQgFYVNIkH03FIuBzg+Dcif
         u95XQc8yFBBT7QIJB5vDyXIiWXBue7o+0sG4iPOMAUsWeOGmSGgHv6wGGwwzEvFx+JjH
         VvpA==
X-Forwarded-Encrypted: i=1; AJvYcCWZqMNWvON5CPkRZdm4SCmLowJGIb9Hm/ZFOXiQohvoZWRvZfMH9MCaCf+w4RLtri7I3e93xKY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5yb60x0ciSgZXH3Xqj30Axiq6qBgxZoD08baLSpKfqeexazsy
	lTnA9HagdG6LDu0WHpnC5FCFRik95/TiIBCHy2/F1FsdJS/LGmugmvOe+g==
X-Gm-Gg: ASbGncuYhEL7du+hmG7j7wS8vWVzzxW/8PKiM+U6N2lvPYx+GKN851C0PBGKY5EqUlX
	h/47X8Wxsqqzwsk2yiHwt2AKOF9hQULmWZiFbiC8KdrgU5+OXAjxrrXcdMBLwx2HFyTEnMPzXUk
	0ehak/cWq6oZ+7XzVpsaR4Ye0hsCcIRJ6ry6lbnNsVDuay/uxSNKFwVeTTVIMk0CFNnXEolfaZf
	obO1poylkjJsdvkn91Bh0qwVS/wenMNetwKkHpI1Zih84A5iahWTi69HoElMYpxMxYvcqZ0q9g=
X-Google-Smtp-Source: AGHT+IFd7isXdiuuZAhkyVSn84acInMhw1zHLKjbGGjVuf5RC652pAj9eDj91mCMpRDLX6U/2h6MwQ==
X-Received: by 2002:adf:a41e:0:b0:385:ec9b:e442 with SMTP id ffacd0b85a97d-38a8733a391mr1242495f8f.40.1736327144140;
        Wed, 08 Jan 2025 01:05:44 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828d39sm54052634f8f.9.2025.01.08.01.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 01:05:43 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jan 2025 10:05:43 +0100
Message-Id: <D6WKLPTWY5GP.1KTCXNQWACLBH@gmail.com>
Cc: "Kalle Valo" <quic_kvalo@quicinc.com>, "Balamurugan Selvarajan"
 <quic_bselvara@quicinc.com>, "Carl Huang" <quic_cjhuang@quicinc.com>, "Wen
 Gong" <quic_wgong@quicinc.com>, <linux-wireless@vger.kernel.org>,
 <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Sathishkumar
 Muruganandam" <quic_murugana@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: encode max Tx power in scan channel list
 command
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Aditya Kumar Singh" <quic_adisi@quicinc.com>, "Kalle Valo"
 <kvalo@kernel.org>, "Jeff Johnson" <jjohnson@kernel.org>, "Vasanthakumar
 Thiagarajan" <quic_vthiagar@quicinc.com>, "Bhagavathi Perumal S"
 <quic_bperumal@quicinc.com>, "P Praneesh" <quic_ppranees@quicinc.com>,
 "Karthikeyan Periyasamy" <quic_periyasa@quicinc.com>, "Pradeep Kumar
 Chitrapu" <quic_pradeepc@quicinc.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250107-add_max_reg_pwr_in_scan_ch_list_cmd-v1-1-70d9963a21e4@quicinc.com>
In-Reply-To: <20250107-add_max_reg_pwr_in_scan_ch_list_cmd-v1-1-70d9963a21e4@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_010546_021173_74BA4FE0 
X-CRM114-Status: UNSURE (   9.16  )
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

On Tue Jan 7, 2025 at 5:01 AM CET, Aditya Kumar Singh wrote:
> From: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
>
> Currently, when sending the scan channel list command to the firmware, th=
e
> maximum Tx power is not encoded in the reg2 member. This omission causes
> the firmware to be unaware of the host's maximum Tx power, leading to
> incorrect Tx power derivation at firmware level.
>
> To resolve this issue, encode the maximum Tx power in the scan channel li=
st
> command before sending it to firmware.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_S=
ILICONZ-3
>
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Not sure if those are in the righ tag format but
Tested-by: Nicolas Escande <nico.escande@gmail.com>
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3-03253.1-QCAHKSWPL_SILICONZ-27

