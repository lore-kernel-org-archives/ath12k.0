Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0537FC7EE3A
	for <ath12k@archiver.kernel.org>; Tue, 24 Jun 2025 22:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63USy0k4rZWxEk52jxI2cfx+TXLEiL7Fq2mfBYY5CuY=; b=j7Ayjvmkyz9xt2gl8H5oFXRC9Q
	JvgzqqiYA23HwpjOYhq7ABMOTFSwqvRhaaIG34iA+zAjGd2cR0QvKYGVXNuAc2xi8rI7GW0WSzury
	06tUrWNNWiJ5/OFohIWXctbPyw6YCc1RQm/HBG4b3bdV+se1oGUZOZK4fNq/thMXtEhXLnuM6BIov
	U0TjoCo+lAKbiNKo9PNFDScGmNSD3MTCvJtUi03mUpcMiaA2FwLmFdr70jefv2DL1AgEHRLLrB9ux
	1mG91iLzSD21jEYnZaj5XuPlRpokQoVgWm697hiCBVLnkVgVMO5hduxv2xFPUswG4nSA+0oPyYqZj
	8Sz5cK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBuE-00000006xMX-33sF;
	Tue, 24 Jun 2025 22:14:18 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAC7-00000006kvK-1qXr
	for ath12k@lists.infradead.org;
	Tue, 24 Jun 2025 20:24:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ad1b94382b8so169827966b.0
        for <ath12k@lists.infradead.org>; Tue, 24 Jun 2025 13:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750796677; x=1751401477; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63USy0k4rZWxEk52jxI2cfx+TXLEiL7Fq2mfBYY5CuY=;
        b=dFknynMD3spiQ7ZojVJK+uOXfooDTDOZMEIx5eT5pCximJcIHQY8Y/fYo/EZv72haY
         oONFqupd+7ljyjehv+KeD2BSKc2IEATwFhFo6T0eD/lVOZCEh4z0qxIsPUKaZIoG0TrH
         IUDz+/nEMKNz6CYH4hO93ym9rEr8psuAx9OYqIoFADh6+Bghx271KRNEvcPU+jqK1gS3
         xg3w0A5VaDO+FZgVkRFOBqdvFmg1C6BqX40zwSMw4tNdp82V9JQ1lXWHXKsmQt3mf4NG
         /hnmjVivCII5KM3TlXNmsPc4KZfU7J7E3S8KPAMDMfAu78EyLK3w8KDiBI3PZad4rf3O
         6HXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750796677; x=1751401477;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63USy0k4rZWxEk52jxI2cfx+TXLEiL7Fq2mfBYY5CuY=;
        b=tZeyuBRDWiOhQmzERyYUv8sqAtpsA5KjAFAAjjVXfsUsFNaFTbNLmi3j1mPSpgtllO
         wuECYfetd4XwHBQMxdTsuOgXRDcZSGuWmrrvXTDcOcbakpYUu5qh6+tUmFlLu1bLaWY8
         uZYlOOD2uw8XfyFAcSsbO0PgPwmrm07O5DHV4tGm1j4IR/Azes5tXubYxqGN1CujmnWk
         tavLeAl23DJsKNZmgokGAwxCkYdjoz6l5YQuvXmXFPeetgTRaPRZzTYP+EbfBCYHgBcU
         6U9Ie5ojt7tFGvbbdarBvHxGtJar0OnngToQCqWGQePiUcHj03w6m/EWY7dijG4QagyP
         AtnQ==
X-Gm-Message-State: AOJu0YyQ0in80+a2VxYSSZ4Hywcz+uBnlqb34L8KOF+DoUbKeqrZ3zLh
	S2PeWRv7VT8bdbgWx4o5q6O3wA0D3+EpYvtGowJsjfXtVfVlm+xXlmSs
X-Gm-Gg: ASbGncuKDys78bRKQ0BzLSTBf12DfooP2fz5xxVyF3ts/rWPCkYJ++2zUTn/hwDedd4
	XoQMSICZWF+WKt3/YBx3qwYIM3DKbUOjzp3g04VFkIj50vwlFpyHjHbp2UM3z6b/bmEBOVPrMg0
	jOJIue99jHLD4TpimBqAvWjBvpScndVlTc4T8AJFIAepoSNSqZfF74nzs8Ezb7QzFg4xXIbazLM
	1tQYQl9fFrm9FNW1OOxBicirG+sHtYJvqKNNTthQ5SmnoeIrurM3yUgHPirF4NynzyC2ChKc2jR
	U2xJHG5m5lXNY4VV9uVYFpSI7YYpJZTVva/x0kuhCE/QZ95Vf4Qr4m3vKho3KGsiWTqQYC9tsFL
	dGti8VUaUQA5Sc+zefQsNdGUAbymfnQQ2dEb8cHTOHo7gppj6gg==
X-Google-Smtp-Source: AGHT+IGHcpROFlsCD6PLF5NT2RH3S/Gu8pnude2InN2RawwD2NE4toKcfWr+CDihtJUm+rKfFWlrGA==
X-Received: by 2002:a17:906:6a12:b0:ae0:a1c2:262e with SMTP id a640c23a62f3a-ae0bea2e0c8mr59203466b.50.1750796677150;
        Tue, 24 Jun 2025 13:24:37 -0700 (PDT)
Received: from smtpclient.apple (201-252-142-46.pool.kielnet.net. [46.142.252.201])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080e28sm928151566b.73.2025.06.24.13.24.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jun 2025 13:24:36 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: wifi: ath12k: Attempting MLO with main (6.15.rc7) for NCM865 /
 WCN7850 in station mode leads to crash/backtrace
From: Benjamin Eggerstedt <benjamin.eggerstedt@gmail.com>
In-Reply-To: <81d2794c-ac3f-4917-9267-af91afd4baa2@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 22:24:25 +0200
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F8842C33-E474-40F1-8E47-CD1CDF9782BF@gmail.com>
References: <81d2794c-ac3f-4917-9267-af91afd4baa2@oss.qualcomm.com>
To: Lingbo Kong <lingbo.kong@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_132439_484559_837AE7E3 
X-CRM114-Status: UNSURE (   8.07  )
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

Dear Lingbo & team,

> > Should I see EMLSR support?
> > I noticed that =E2=80=9Ciw=E2=80=9D output no longer has a TX nor RX =
Rate:

Indeed I can see the TX and RX rate again with the patches you kindly =
suggested.
The signal at -128 dBm would still be incorrect.
I still cannot see support for EMLSR, although the corresponding patches =
are part of v6.16.rc1 (ath-current-20250617)

debadm@debian:~$ sudo iw dev wlp3s0 station dump Station
Station 88:3c:93:01:ce:40 (on wlp3s0)
	inactive time:	22360 ms
	rx bytes:	2533534
	rx packets:	9680
	tx bytes:	4459
	tx packets:	37
	tx retries:	0
	tx failed:	0
	beacon loss:	0
	beacon rx:	0
	rx drop misc:	15
	signal:  	-128 dBm
	signal avg:	0 dBm
	beacon signal avg:	0 dBm
	tx bitrate:	1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI =
0
	tx duration:	0 us
	rx bitrate:	960.7 MBit/s 80MHz EHT-MCS 9 EHT-NSS 2 EHT-GI 0
	rx duration:	0 us
	authorized:	yes
	authenticated:	yes
	associated:	yes
	preamble:	long
	WMM/WME:	yes
	MFP:		yes
	TDLS peer:	no
	DTIM period:	0
	beacon interval:0
	connected time:	505 seconds
	associated at [boottime]:	161.391s
	associated at:	1750795842112 ms
	current time:	1750796347204 ms

Corresponding output from AP side (5 GHz in this association).
Please note how EMLSR is still being reported as =E2=80=9CNo=E2=80=9D.

=3D=3D=3D=3D STA Info =46rom Link: ath101 =3D=3D=3D=3D=3D=3D=3D
ADDR               AID CHAN TXRATE RXRATE RSSI MINRSSI MAXRSSI IDLE  =
TXSEQ  RXSEQ  CAPS XCAPS ACAPS     ERP    STATE MAXRATE(DOT11) HTCAPS   =
VHTCAPS ASSOCTIME    IEs   MODE RXNSS TXNSS                   PSMODE
b6:b9:b8:5a:a2:05    4  100 960M   1441M  -29     -36     -22   11      =
0   65535     P  EWBQ NULL    0          b        1441200           =
AWRSM          1gGTRs 00:08:15     RSN WME IEEE80211_MODE_11BEA_EHT80  2 =
2   0 =20
     =20
 RSSI is combined over chains in dBm
 Minimum Tx Power		: 0
 Maximum Tx Power		: 30
 HT Capability			: Yes
 VHT Capability			: Yes
 MU capable			: Yes
 SNR				: 66
 Operating band			: 5GHz
 Current Operating class	: 128
 Supported Operating classes	: 81  83  84  115  116  117  118  119  =
120  121  122  123  124  125  126  127  128  131  132  133  134  137  =
130  128  135  133=20
 Supported Rates(Mbps)		: 6  9  12  18  24  36  48  54=20
 Max STA phymode		: IEEE80211_MODE_11BEA_EHT80=20
 MLO				: Yes=20
 MLD Addr			: 50:cf:14:8e:e3:d1=20
 Num Partner links		: 2=20
       Partner link 0: ADDR :f2:0a:ab:8a:78:12, Link ID: 0 Bridge link: =
0=20
       Partner link 1: ADDR :da:8a:5e:b9:f8:69, Link ID: 2 Bridge link: =
0=20
 EMLSR capable			: No=20
 EMLMR capable			: No=20
 STR capable			: Yes=20

Thanks,
Regards,
Benny



