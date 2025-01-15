Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F9DC02183
	for <ath12k@archiver.kernel.org>; Wed, 15 Jan 2025 17:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlDDNcKDaZcW8uRMpLsonrE48doB0/bvIA2RZCJ2Hho=; b=dyMtw2ijY1E8z4WIYEm99hF8Vx
	r6Uygf08LEKqeFCmgfj/nWoPsZ3FFkjvXE/0NNA0r3HZw7zUIOSYZwbgF2pj+WaOmLZGVjMIJJX/i
	IMPWXS8/3tohog2cjOtKzUtkEcF+mx1NMdF+QCqYuBKKMMPwR+TV8gb/HSEoHJqqKhZvCc/FffLC8
	LYRziOIHkNkRBK+t6yxKgWBsLipKOmInifiCQffodCDqVhq9AarSCZ/kwyKC9qiHuHjBkxRXGuH6x
	GI6NMlcuZbuk/crITdxEdGc7+SPPMECZ7lBCzBvERyHF2hXNvVDzq9/zmA4RtMN4S5lSXH57ISGjn
	UiCj07kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7bz-0000000Cgk1-3Myp
	for ath12k@archiver.kernel.org;
	Wed, 15 Jan 2025 17:55:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7bx-0000000CghA-0z09
	for ath12k@lists.infradead.org;
	Wed, 15 Jan 2025 17:55:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43635796b48so682585e9.0
        for <ath12k@lists.infradead.org>; Wed, 15 Jan 2025 09:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736963723; x=1737568523; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlDDNcKDaZcW8uRMpLsonrE48doB0/bvIA2RZCJ2Hho=;
        b=EeSngnei6tG+AhNAKsjirYKA9bx6LhMHsv3F8vv0vQp6u9bq8WyJgz7SoWrmVI7+r6
         xJh3mdTdfgPQazN9xXOHl/GJiwh9TwrRspZjtWC7GiSp3T2Ebs/vhZUsgc5iL9TBbsAf
         Uu4KKmkaBYVAVpL5NM6yz3yQoLGrt9c4hu9Bx4gxLzFc6tnC+fxqOkY8uu6Nt36a6x1z
         4JqoG84j3v2KDpD+MrVMbwRY+GYSp+8iwksprR3c1xtdZ0KkxOg9RJdlEVJheL4fpPaB
         13vpHP3sHICBtRsEdWaFUkXZBbnm7VCgqYTsgn4n3poc/vuT6aJKREoZvFOYqHUXvzhn
         i/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736963723; x=1737568523;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wlDDNcKDaZcW8uRMpLsonrE48doB0/bvIA2RZCJ2Hho=;
        b=lwMv/EQWsW68LqAx6I/EWkH7NfQshQly+eretvjRfENwmmI9t6utTlGym5QPwx7jXg
         MGDOlZ7WmBbZoXuQuSJ1RkqvbD727Y7+knaVUsxnCI+Eh7Jqs1vWF1ZNDtgREUfVzGAl
         P9KiZMfogvzHDwZBxw8H7TiA1IdMVv5ZRhB/zwoWvv7uGuDro/alSLeOkgWKoo0zYNkT
         3PvkhPY3qNtt0Mosoti0tU6c7EvqtnydWhFb8yqogL+TFe8+IPCJXjRNRVGRUOEGwlpn
         c9nAyy+5fqfBkoj7RsjBvdj8uMCkdJptOcCCcHgmJzdYr2v6rKqftMS8SHIkZedUTILv
         b9Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUCmVaw0kH1F9uTIKV2mQBUyTy5d5t25z+HCDE36LPPt+Ukzpc2DWkOMRSqbCnbu4XNoyvmsJ4=@lists.infradead.org
X-Gm-Message-State: AOJu0YztSRN3KHMQvR863W69oBU+cUoH+otIVPJt0Ts73PAH62hf628t
	5ek2naqGdRRm051Nm3jXNiuHwoTzcQRkpVgGFIiVcvLORPsyy//k
X-Gm-Gg: ASbGnctz82WGrHRBo0QvLqUDZzzgsadCHkeE8tY2N5+Ird+9+1u6TxCQQ415oXLrN28
	LC/0Lvb/TXW1aK/2PhFn0xrTeM/pM2hxwO3+jb5jrUC+x4bKNNADLeVuZI4Xb95cBSpNEHfP1OQ
	E7DMNJhDvZQOHIFOI3qaS/W+sZjqrlwNH9OP9WaH3Pe8bKkPorwVuJ4H6CPqIsNmgCsRYZp5P23
	j83tTptZ/x2yeA0meLKm5naZdQpiOqpjWl23zVzI5estbQpa4MNN8MgGXikIs2I4jNfCdmOyYs=
X-Google-Smtp-Source: AGHT+IFI1l0q2TyjPbJiKFhDTGKHt3GarGprcZBwc1uYTtn4KG2IKwwePxh9rc58ZBicbtX9Hz3KHw==
X-Received: by 2002:a7b:ce86:0:b0:436:185f:dfae with SMTP id 5b1f17b1804b1-437c6af2037mr32040895e9.6.1736963722866;
        Wed, 15 Jan 2025 09:55:22 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74abb27sm30829685e9.9.2025.01.15.09.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 09:55:22 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jan 2025 18:55:21 +0100
Message-Id: <D72U91ZG2PNM.2IXUT304LMEC0@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 0/7] wifi: ath12k: Add monitor interface support on
 QCN9274
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Karthikeyan Periyasamy" <quic_periyasa@quicinc.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250107021017.3857555-1-quic_periyasa@quicinc.com>
In-Reply-To: <20250107021017.3857555-1-quic_periyasa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_095525_275189_48D879C6 
X-CRM114-Status: GOOD (  13.74  )
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

On Tue Jan 7, 2025 at 3:10 AM CET, Karthikeyan Periyasamy wrote:
> Currently, monitor interface not supported. Therefore, add the missed TLV
> tags parsing in the monitor parser, configure the monitor vdev state
> identifier with HTT filter setup.
>
> Depends-On:
> 	[PATCH v3 0/3] wifi: ath12k: Refactor monitor Rx handler
> 	https://lore.kernel.org/all/20241224143613.164921-1-quic_periyasa@quicin=
c.com/
>
> 	[PATCH v2 00/14] wifi: ath12k: Enable monitor ring for updating station =
dump in QCN9274
> 	https://lore.kernel.org/all/20241223060132.3506372-1-quic_ppranees@quici=
nc.com/
>
> 	[PATCH v2 00/10] wifi: ath12k: Add peer extended Rx statistics debugfs s=
upport
> 	https://lore.kernel.org/all/20241224161442.263729-1-quic_periyasa@quicin=
c.com/
>
> Hari Chandrakanthan (1):
>   wifi: ath12k: fix link valid field initialization in the monitor Rx
>
> Karthikeyan Periyasamy (1):
>   wifi: ath12k: Replace band define G with GHZ where appropriate
>
> P Praneesh (5):
>   wifi: ath12k: Add extra TLV tag parsing support in monitor Rx path
>   wifi: ath12k: Avoid fetch Error bitmap and decap format from Rx TLV
>   wifi: ath12k: change the status update in the monitor Rx
>   wifi: ath12k: Avoid packet offset and FCS length from Rx TLV
>   wifi: ath12k: add monitor interface support on QCN9274
>
[...]

Hello,

There might be something wrong with this series.

I applied it on top of ath-pending-202501150104 + the "ath12k: Add peer ext=
ended
Rx statistics debugfs support" and now 'iw dev wlan0 station dump' shows me
that the RSSI value seems to not be updated anymore after I stop a monitor
interface on the same phy.

Steps to reproduce:
iw phy phy0 interface add mon0 type monitor
ip link set mon0 up
# then just for 1 sec but it might not be usefull at all
tcpdump -nepi mon0
ip link set mon0 down
watch -n1 iw dev wlan0 station dump
# 'signal' seems to not be updating anymore, maybe some other fields too ?

Don't know if this is from this series or something else broken before, but=
 as
we could not add a monitor interface before, I could not see it.

There still is a possibility that I messed something up while applying it s=
o I
would greatly appreciate if you could check it.

This is on split-phy QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILIC=
ONZ-1

Thanks

