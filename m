Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD65C369B2
	for <ath12k@archiver.kernel.org>; Mon, 14 Apr 2025 11:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtsqEiOso+3ySVEpPpnY9tocZGrAQf6OsnV8IcNWh6c=; b=2hmXZ/8Px6EhEm5WGu/VIMi/E4
	B8Lr310U/cf7AUIAGU9iPFsVO/8scZkWiNU9TwJCALIwccFEJEznVaiAyCVjWHF8Mh58gxPO9hsfG
	Zgi0/P6l8y4BovQSzfiHSz0/wczZsEjGHL/E6ZRh5MhTMzLIiAeLn4SPMVBeRBKcBjh0tHvh9tx3b
	jSod+KZ0bKKczLGBSPqII3hxLjr5F1CXRS6TvTM6TzI87/FCnV470xma/KHcKYEI46RaA5PtI8pS6
	lgc5GikJnqS6j3LjT7CQ+BaWBiJsNlXHLlF4CRm94WaUohi02OjkgM8rtX7cKPnEkyd5XelGfRf4R
	XHrFgwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Hdx-00000001f5b-10xz
	for ath12k@archiver.kernel.org;
	Mon, 14 Apr 2025 11:06:25 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HNa-00000001bqE-3cJ1;
	Mon, 14 Apr 2025 10:49:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so2578478f8f.0;
        Mon, 14 Apr 2025 03:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744627769; x=1745232569; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xtsqEiOso+3ySVEpPpnY9tocZGrAQf6OsnV8IcNWh6c=;
        b=JyDbDUABkDUZpW0WDSx23Zi9RtsZZ69kBVMCzg1wgf/ZqUlshJTXOjRl3U04Q1u5T0
         9pqbg7yrDOYbYjFCCFYIb109yq3Yfig0LVFLCO8JlurG+61I3jtqzaatQQKu+W1tipuh
         YJrdXj2brqz+5XMZvM/j+tfnszF3SaS73vupJKCUBlTfK4EaAHtfIIjtswGwdcI2JWgK
         9GHazknU3voUbSWerO80LNIP9NY0BDQHo2cO22HaKsFggLvOmP8TfwcCw62dXQzI6EPl
         3EV0PrMakToJXhd3o/W4DxmZ8B/tJZZNOufRGSkxDy8WA/QonhlZNjkSQ2yrx4KQXRCD
         YKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744627769; x=1745232569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtsqEiOso+3ySVEpPpnY9tocZGrAQf6OsnV8IcNWh6c=;
        b=nhFENihhVpiP8vd8q2PmzMJi6CjZFYrYRZeR1eSeZ6PAghXOtMNdzz5bzux+/kawxZ
         yWhachAdeyrVLR8dzc9QyuItz66CkZJbOx1AMESPcb/rqFCSKwFhEzCtW5nF6KaOPE0w
         4hXr8KEpNsTDOnuFaygFWQUFYjoweZKnlJdd5MkfvUgmuaOCj/zJaVshwNg+Pn52Gbiz
         tZhDnOMbE7sCNEO7l6qRIE6uFV5q6rTKvAKqVgMwGhw5fnzPVvgWm9BWDNXrGp1mboZL
         vAoP4OMI47pGw21O0SThVPwoVSVoKov/V269qd+Ofo8AGQK356hhlRnuZPsOHGjoPPBt
         +9JA==
X-Forwarded-Encrypted: i=1; AJvYcCU8WMEow3IMLMqinwr1q4GtbjUu4uPoAsU9SHf/WcIsLaXpluue13MgvZV9UHc4Wl8D0q3sAFb8@lists.infradead.org, AJvYcCVUTPfApjCxBWy379TjMnVBFQLGrg8ff89AXyDaRRMT6B/VUeUGQ18x+ZBbX2aGCGqxKaUIpjk=@lists.infradead.org, AJvYcCVpVdVOYPlaC8PoooBFwLEZxrh+lpUHof4c/BPck6EM/ABBsp/71sMLV2ZYcSUw850tdd/X6xk56Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwha7TG2Soxf0uIk1bQV7fD9GfX4wYqgq77TJNOTEIIlTO6w8M
	UdVvOVUGc45KC8xl9In8ct+DXzfaEOMJGccz7mhH0xQBDkNoYVOh
X-Gm-Gg: ASbGncuKDonsJtugmADglEC+BtgOA+hg0uwLv+V+o1MRlez2XSalTzXmiVKpf6QqubF
	HVLvh8Jr40IxHISt9umL6IgOlO5rUCroepXmcPk89ev+es7fNi4IV79eiMR42rJ3xf/Y3TuTjud
	n1B6SQ90dUnYtwy1Tcnk1TWKgLshdN3igluIZ1UzuYFaC5Ct3B3/ObKZ5fdrn+2jMYclorR8hsM
	3B+WaTFO6brJKVSyDDagvcMkY6S0ALyU9aQShmsajxW6HcWzg5nxy1igkqHOIzc73qokf73g8s6
	ALRzNFhyBpQbjyhquudQlFvAv/Sm9jNWHxsj40HsgsDjEYlCLnECwolHyGii
X-Google-Smtp-Source: AGHT+IH1pMW+2VKVzwJ49w6Ztlv9YMJUN6W45Wwpzz8L92YImh1YeiCHahCGMNa6e6rsSObu5WtiCQ==
X-Received: by 2002:a5d:6da8:0:b0:39c:1424:3246 with SMTP id ffacd0b85a97d-39ea51d3527mr8524313f8f.2.1744627768500;
        Mon, 14 Apr 2025 03:49:28 -0700 (PDT)
Received: from [10.158.37.53] ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445772sm10695726f8f.91.2025.04.14.03.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:49:28 -0700 (PDT)
Message-ID: <f4a406e2-af98-4762-af44-9089440c0a7f@gmail.com>
Date: Mon, 14 Apr 2025 13:49:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 7/7] net/mlx5: Don't use %pK through tracepoints
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Jeff Johnson <jjohnson@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Brian Norris <briannorris@chromium.org>,
 Francesco Dolcini <francesco@dolcini.it>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>
Cc: ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org
References: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
 <20250414-restricted-pointers-net-v1-7-12af0ce46cdd@linutronix.de>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20250414-restricted-pointers-net-v1-7-12af0ce46cdd@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_034930_904942_244925BC 
X-CRM114-Status: GOOD (  12.53  )
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



On 14/04/2025 11:26, Thomas Weißschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through tracepoints. They can still unintentionally leak raw pointers or
> acquire sleeping looks in atomic contexts.
> 
> Switch to the regular pointer formatting which is safer and
> easier to reason about.
> There are still a few users of %pK left, but these use it through seq_file,
> for which its usage is safe.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   drivers/net/ethernet/mellanox/mlx5/core/sf/dev/diag/dev_tracepoint.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Tariq Toukan <tariqt@nvidia.com>


