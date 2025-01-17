Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB67C02183
	for <ath12k@archiver.kernel.org>; Fri, 17 Jan 2025 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4hBp0TCeNb4jgoyOrHuru28rEsiSTagGEUyqsSUl0U=; b=u2wQ4ikYqGvxd8o5EaE1exDcSP
	JR8G6BEWp3q8zW7K44Nh1/w+nXa6i7uJeETWvi8FZh/9pgSWvrayehUNZTJ+6E8UIlm0IjYkwWdWX
	UGToko26DA9Pk3Zrx1Wl0BKhI1sz+8ca2oq2EbQ5qnUwOl6x9MZm404jAUF5SuQIwVoeMYZCPAP9I
	aG9uA5YPelydQ9ibpOep2sDMf7rmz/o1yrBGiiK+D9QoxYtRA07bPRADPw5OxbzM75/YrMgbzcHJC
	zBPaaKyfGL2qlq2PGWQ0okN56z5MY0GIyP2k5ye7+mzDEYIpRd2obzI5h3xXCLIc0HlfctTiyhvBc
	FczPXgUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYivy-0000000HTbX-0qqT
	for ath12k@archiver.kernel.org;
	Fri, 17 Jan 2025 09:46:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYivv-0000000HTaI-2JuT
	for ath12k@lists.infradead.org;
	Fri, 17 Jan 2025 09:46:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43675b1155bso20018085e9.2
        for <ath12k@lists.infradead.org>; Fri, 17 Jan 2025 01:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737107190; x=1737711990; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4hBp0TCeNb4jgoyOrHuru28rEsiSTagGEUyqsSUl0U=;
        b=LQfkosOrLqOZzkMyeEw45nhUeNBGkCLwZWuYAzaIUmvcIw3BtKf9z+qblylCyNnz88
         ZC4O/a2eWma5t1RyXG88Hv+xSgw4G0hzuq7E7lAVcLvVNDivhABhn34W2fF2dSddoAhN
         x9bVevmB+lmu8zw8wFGrkKqTSQbgmloaiaQTjaCKvWi6XvMaphTSI/mcgo4Zsg6oDWKA
         ReciMQVPz7cbgBT9WKizcRLWetQj4uGc9HSy9DXVlmIrNvooMbo8icKOIz7E3vTQXXY9
         OAxlvjDVl8+GemxZxJBGBFDaQW98SDxvuIwO0e7AzkN9csGnVY8FnG9LKSjX0J9jYtoR
         nQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737107190; x=1737711990;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O4hBp0TCeNb4jgoyOrHuru28rEsiSTagGEUyqsSUl0U=;
        b=DzjWj2Wr4EtvQ8fRIUVEexzIrvNnd/K645CVEIwdWaPYGf2Hd9Sc5W6xbOA2t3sGhX
         JBdKhzrLsguaic3VcfRlM+Ts0HhrFgLcx8FGGx34hOc2MnnMRuZH3kg7TIQdY8GZZS/Q
         zP7XKAakmzWdozWyWjTDuWnY0nWNEEo6nr97amyQGObprit2D6Jp+pz//P6+0IqbMWqH
         b2cHPRObvcgg9TFfyorTG8YJbn90Vyl9abUXmsxfal8jUqjKYLXIvlXvN/pKO3pquais
         OiRR1DhSBS2rsMtP1m9bgPVC1AB+IwAdki9gls3nmvclba3svcm0v2cJOzZiNa5xSbKX
         9xtw==
X-Forwarded-Encrypted: i=1; AJvYcCXjLkuCkgJANX4Q6iibSHNeJf54b1xy7l13vNwI8ZuF6ck2kqmngyDrbSus3to5TK8NT0l4y7M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6FKhUhZit2IxwNrmJTAAbpQxrADncvL56TllmV7buHLpTw0kR
	CEStjJUFKL08+1tohOglDTzLNl/FqrP7i1FeP72a0eB0ITk06imeh6ab3A==
X-Gm-Gg: ASbGncvYHOa6n3pdswbaeSaTLs8bdESxq2dfc3V/9CZ4+4cI/8ncK5Hhq2s5TfM8xOD
	WBmKY4g7nkwe+Pd0hlPyZGhYS/hKtno6y3nd5TdmDXRkOOY1Ij9kFhY+ghJBTOi3XtEec9Okgdr
	+U9x6sumFEXp+8yA2qHTb920xRRruPw3NWno8tv1RR2xBuIQ2VJZo5g0/JZ/oxonzRr6Jr/H9ho
	UcVvGq0VpQT3DusHqEPOz7QaSl1oQzNWidPJ1F96FrtzXr/QeZbaex299BSaWQEgZ7q6dWGNhE=
X-Google-Smtp-Source: AGHT+IG44lq6Xs8TjLlxvjNLydQ9QPXwgmxcuG5OXImXTvfM0ujy+ohsngUpa7xqaoEz8L9b2iBHYQ==
X-Received: by 2002:a05:600c:1f11:b0:434:fff1:1ade with SMTP id 5b1f17b1804b1-438913df205mr16717345e9.13.1737107189411;
        Fri, 17 Jan 2025 01:46:29 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3278088sm2046160f8f.73.2025.01.17.01.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 01:46:28 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jan 2025 10:46:28 +0100
Message-Id: <D7493TJ2Q2YJ.2EVCWPQR58U4A@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 0/7] wifi: ath12k: Add monitor interface support on
 QCN9274
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Karthikeyan Periyasamy" <quic_periyasa@quicinc.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250107021017.3857555-1-quic_periyasa@quicinc.com>
 <D72U91ZG2PNM.2IXUT304LMEC0@gmail.com>
 <d9181c82-ffb1-e8de-c5c6-f58b73f9291f@quicinc.com>
In-Reply-To: <d9181c82-ffb1-e8de-c5c6-f58b73f9291f@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_014631_589588_B322EEDA 
X-CRM114-Status: GOOD (  15.42  )
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

On Fri Jan 17, 2025 at 5:37 AM CET, Karthikeyan Periyasamy wrote:
> On 1/15/2025 11:25 PM, Nicolas Escande wrote:
> > On Tue Jan 7, 2025 at 3:10 AM CET, Karthikeyan Periyasamy wrote:
[...]=20
> > I applied it on top of ath-pending-202501150104 + the "ath12k: Add peer=
 extended
> > Rx statistics debugfs support" and now 'iw dev wlan0 station dump' show=
s me
> > that the RSSI value seems to not be updated anymore after I stop a moni=
tor
> > interface on the same phy.
> >=20
> > Steps to reproduce:
> > iw phy phy0 interface add mon0 type monitor
> > ip link set mon0 up
> > # then just for 1 sec but it might not be usefull at all
> > tcpdump -nepi mon0
> > ip link set mon0 down
> > watch -n1 iw dev wlan0 station dump
> > # 'signal' seems to not be updating anymore, maybe some other fields to=
o ?
> >=20
>
> Not able to find the wlan0 interface details from the above steps ?

Arf maybe I wasn't clear, my bad.

I have a running AP on wlan0. I constantly monitor connected stations infos
using 'iw dev wlan0 station dump' on the side in another terminal, and then=
 I
add a monitor interface with the above steps, and thats when I see that the
stations connected to my AP have frozen values in station dump.

I suspect that ath12k_dp_tx_htt_rx_monitor_mode_ring_config() should reset =
the
rx filters to ath12k_mac_mon_status_filter_default when disabling monitor. =
But
I'm not so sure, you guys know better.

