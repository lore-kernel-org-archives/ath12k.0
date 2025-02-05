Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3C6C02192
	for <ath12k@archiver.kernel.org>; Wed,  5 Feb 2025 10:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgKWsb4wd8O5NQcrXT8xnVQwH9+D70MltxfRewZxbzo=; b=BkCvRGsrh3jNnceeaCYMqkLqs1
	xQxQOy5RwZgyZy2F0S+pCYgfcg25piVoyRrb6zJdDvdXPeVkBGS3p+SIv/jmGNmyS+szxs2fYcmxm
	9nEzkkeOqSX59bdKTlpbGWy1/Z4BLLWEHQlsY69HzSTsKNC+QgFtLbHL/1eZDQwzckoc+uzlK2w5r
	eoOxomRKVy+yKmXRjYXycWPj0dUGOGwXBsHeSG96mdbOVdHO9IZJPZy3mE57TsAwM5UtmUDLnxC3L
	2yelHMGWZfjMudlLzZG/6R0CHilFpT0/rtdq140e4mJrn6x2WNnJqtVC76LWVlhiv9aplSFHT2jVV
	Tx9a8c/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcZo-00000002rcg-1tkU
	for ath12k@archiver.kernel.org;
	Wed, 05 Feb 2025 10:24:12 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcM2-00000002pO8-0DGP
	for ath12k@lists.infradead.org;
	Wed, 05 Feb 2025 10:09:59 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38da66ce63bso1028597f8f.3
        for <ath12k@lists.infradead.org>; Wed, 05 Feb 2025 02:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738750196; x=1739354996; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgKWsb4wd8O5NQcrXT8xnVQwH9+D70MltxfRewZxbzo=;
        b=l8THbl1VzqBFpkqS8O0NoNMr6FLkpx5HK6jndMUBI2KlCj16MdrSBs2rz/iSndRE/5
         1TkysW6e5YvSb+PexkgYHA0rmr0qiWXPX+JQwpt1jLDrY0XSkgk5ReuezPUIQ7TQhsb5
         VCYpEaLJ+jkoiC5I/K2Zl5uqKlqy+Upgb37P1hN/Y90GOpBWE6VWEU6fwr86uys7R/zA
         HpcXjxvqP8UymkGxQZYODmXujMgVQ5gGwg0WRYCUoIwM2rUMO9I1G3/SQ+xjAfHXbYcN
         8cCsCWKyj6Q1DZuK4M687oGcSey+6HGIa0ntHkBNXGegMkFe12radobivxOTTBvgcclg
         o3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738750196; x=1739354996;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UgKWsb4wd8O5NQcrXT8xnVQwH9+D70MltxfRewZxbzo=;
        b=IUF8KVCjS8jY85wgQUC2J5PJKobYuyHaW5FvMEd/00rWt/cD9irA8Io6Es8GsL/c+g
         IsiRPngmumQVMkYmdCzboKE9XaebNlS5TjesoOYQLosAaMa5sSh5c03ywiLHTBArSiNB
         aJ22NELwvOKZPWH3ZBcDO96Y6eZVVRjmlGo95Z90LOqMwi/OHBD8SeWtxRMWvDe9ywYB
         OI/BAOLuLoiTdRFv0wXhyTNtQXmHeD41vrhSa2zTFRhvlsaFLN0GrrZKGRFOyd6gj7kT
         Qw2iEHzFQuyBdHpgynw1plgeEnPC8yPqnM5y4lRAaKtXLQVZDK+LPROXYMUEwmjZHkz2
         JPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU59YoJnS9ScthCTEG78o4KwgL9fG+IPH06RomLB/c0wafHr4vF7jNcJSnl25OoEXoALUBGXvk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3rogc+qzFU8XPeTWbR3VRDEubx2op+EEAB9Hhe7pVbRZYioWw
	ZR+Gi3IfSSMvgdIZ/6Fu+DUyGpPTE8ZfV1bgpiCI5CUiz/oBI6Ix
X-Gm-Gg: ASbGncvx+MrWYlJP9uC2Bf8yMT1K3Lhg9BmNdWLnW0d+27w/ht9SJtFt7DyxGnHTeNa
	qqsPZmz2eIigbFdjNXQvYYDkncIDaZedX/yFXUSE1NxxXB392VyF7t1rvjiYM7lDlM9uw+wpv25
	JG4ts0atiOGcpwelwNRemse55EFrO8GUwEy4xW64RBaaFIKDEqtZBgdQ8syOgyK6k3/z7lA2K87
	bUEmoUouYfZ9FWK6+2GwD2Gb1jYH81oWLDBZlIn7H3CyYPC24lIk+PY7zl7tqscCIJeybwcc93K
	Von5cDpPZ2S6uPhaUz8oEb/ciX7vRuycYQ==
X-Google-Smtp-Source: AGHT+IFM8JZsI4fER1QYtXtRH5Vsk9KNxGrlRwfk8xspZYy+cSpsU0f1P8CqycBiWmyK6AMn8PG+5w==
X-Received: by 2002:a05:6000:402b:b0:385:dea3:6059 with SMTP id ffacd0b85a97d-38db48dfba5mr1426073f8f.49.1738750195987;
        Wed, 05 Feb 2025 02:09:55 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d933a3esm16904435e9.5.2025.02.05.02.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 02:09:55 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Feb 2025 11:09:55 +0100
Message-Id: <D7KFI4INC6NC.3JY96TZGRJCX7@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Vasanthakumar Thiagarajan"
 <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/8] wifi: ath12k: handle change_vif_links() callback
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Aditya Kumar Singh" <aditya.kumar.singh@oss.qualcomm.com>, "Kalle Valo"
 <kvalo@kernel.org>, "Jeff Johnson" <jjohnson@kernel.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_020958_087850_F5F4E750 
X-CRM114-Status: GOOD (  11.49  )
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

On Tue Feb 4, 2025 at 6:05 PM CET, Aditya Kumar Singh wrote:
> Currently, links in an interface are allocated during channel assignment
> via assign_vif_chanctx(). Conversely, links are deleted during channel
> unassignment via unassign_vif_chanctx(). However, deleting links during
> channel unassignment does not comply with mac80211 link handling.
> Therefore, this process should be managed within change_vif_links().
>
> This series aims to add support to handle links in change_vif_links()
> callback.
>
> Patches 1-2 are making debug infra to work without device info.
>
> Patches 3-8 are the ones changing the code to handle as mentioned above.
>
> NOTE:
> * A new ath12k-check warning comes which probably needs to be added to
> ignore list
>
> drivers/net/wireless/ath/ath12k/debug.c:69: Prefer [subsystem eg: netdev]=
_dbg([subsystem]dev, ... then dev_dbg(dev, ... then pr_debug(...  to printk=
(KERN_DEBUG ...
>
> This is because, since device info is not known can not use netdev_ or de=
v_
> dbg family. pr_debug() is an option but that will require DYNAMIC_DEBUG
> and then ath12k needs to be probed with dyndbg=3D+p which we don't want i=
n
> ath. Hence, only option left is to use printk() directly.
>
The issue seems to be resolved. Thanks a lot !

Tested-by: Nicolas Escande <nico.escande@gmail.com>
Tested-on: WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1.97421.5

