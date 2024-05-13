Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E591C25B10
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 20:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLQLJ1FpnagjYn3H/klb3R7atZ71hPTNq0d4ckxGLkU=; b=deGMSEi9H+I0P5J9nlFu2V3Wg/
	sh+2rV5N324+bbJaikHsCjqWgyzV3oMEHLyotQ1FkpTtAC+AZwFKb1ufINnTDQ6XwiNB9qA9MO9EP
	AckcCpTul3CDypj99QTX4GOGqbm39aUMPrgP/wKjZT6lS4IGmsbi35ztanmNP3IItv6e7qVHlDlDj
	gPGKoGjNCaXhvUm8NSikq7doueWX8eijUSG9Q7eJKVIPFyAHCN9keP62qvjRmcwzUeUBLQaiDd9Co
	27nSxRXpiMd6pTjI0sHB0PTcxaolBgfTx+D3i/5qBIG7XkeBlgOmGqYkmaGqtdafdyrd2LaD38Cwc
	t3A1BtMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6c6W-0000000E6Cd-3M2p
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 20:17:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6c6T-0000000E6C1-1Dsy
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 20:16:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-41fe54cb0e3so30655455e9.2
        for <ath12k@lists.infradead.org>; Mon, 13 May 2024 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715631413; x=1716236213; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLQLJ1FpnagjYn3H/klb3R7atZ71hPTNq0d4ckxGLkU=;
        b=JZMG95UKGtpDiwTtpG+39xJMlpM2rtb7cQyFjbMtkSgdS84Co/Xbv1lC6rM/zz1kCM
         DXu6e2NyionR2EahdxB3qdXY/7AoJsRzlIa7Zw/WBafwhI3qTWY0tiPF800bEFowyfBa
         Tg+u4lXu0v7hex8bsE2vKLjkqFIccwkorx8eTgYeL15HMU4LziGxAieEDHNxOUL9rnDB
         3XVcXNmqpCaXwx6tJ3KHEjkmgBrFzIvxoG5j+9euyfbaOfsNgUuZ01h0rVvMLq63gIPT
         9eaVlbDLQ5EvYS1IKnvLd5UhEYnX1vz0zF6yTi9ij0hawnYdvevOC7gz0uUEojKpyTHp
         kQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715631413; x=1716236213;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cLQLJ1FpnagjYn3H/klb3R7atZ71hPTNq0d4ckxGLkU=;
        b=UgKtLen+g9ypYIFZP3/Yza0YFkNKdbXD5yLIx5jiUpLVw1FiPTsRZTkWIn7Rwi41xa
         7sRJKZGBrxuzoCL6dWyj4zGOTzz3gUYVo0LmrbTvW+zyJRu8NRJQPmVuZVPgXcPmTa2m
         ZZkuaVB+4umYHG5IMX8YIV7x4n/xkBeQaXXwcsHTP4+iyPzanAHu674W05+6Sy0OwleA
         n/prD1MoJjYpf4ah9+w984EI8eBuEIwPpT3X+Vghr3Btnjx8FaHfLggDyZom4wRBQO63
         jtxvJbOcbo8H6m9B3Ya3rFHTHz6pd+HF3Oy0To0szS09bEByKhojyWUk+Rc26Plq6vqY
         msjA==
X-Forwarded-Encrypted: i=1; AJvYcCUQhN9ESEUYo1fg/eQRk4msoex6/XGviXWcrozD3Xgq/Aj7/sVShDmypoy2/NTwUsypJIme7ppNgYZt5H/QKscMiFOTO9ONYvIZYA==
X-Gm-Message-State: AOJu0YwvdqbM/l0saGocSVrYuJaFxtU8/JQR3KvzjktYGU2PMiOoMEeO
	NU8WNh/sn7Z/R+5ScvXQDatVUO6KYiq7t9FOSg8s0PF/4Ypyvtd3VMdbEA==
X-Google-Smtp-Source: AGHT+IGP4MRFzLIDSLIPIIrAg1UfaJt72YHqZsOvUFlHMvpGkEtztc1r5GKkaFHy8IEwnPzW9rVcsg==
X-Received: by 2002:a05:600c:198a:b0:41a:c92:d323 with SMTP id 5b1f17b1804b1-41feaa38afcmr79083725e9.10.1715631413251;
        Mon, 13 May 2024 13:16:53 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fd11ef80esm165443105e9.39.2024.05.13.13.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 13:16:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 May 2024 22:16:52 +0200
Message-Id: <D18SKUBJSHK2.17RQSKX4XB5JP@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: Add Dynamic VLAN support
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Muna Sinada" <quic_msinada@quicinc.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.17.0
References: <20240506231752.942567-1-quic_msinada@quicinc.com>
In-Reply-To: <20240506231752.942567-1-quic_msinada@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_131657_357399_CDB71E80 
X-CRM114-Status: UNSURE (   8.09  )
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

On Tue May 7, 2024 at 1:17 AM CEST, Muna Sinada wrote:
> Add support for dynamic VLAN. VLAN group traffic is encapsulated and
> encrypted in mac80211 and driver needs to set flags for the VLAN group
> traffic to skip hardware encapsulation and encryption.
>
> VLAN group traffic utilizes ext MSDU and HTT Metadata to set
> encapsulation type to RAW and encryption type to OPEN in order to
> inform firmware to skip hardware encapsulation and encryption.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_S=
ILICONZ-3
>
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
Reviewed-by: Nicolas Escande <nico.escande@gmail.com>

