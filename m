Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEADDC47422
	for <ath12k@archiver.kernel.org>; Mon, 29 Jan 2024 11:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L7vu6ydIf0KE8wNJPqKbPxgDYv4shGysA0p/VvL8714=; b=OCkLfTN6LKoPZGud3KVkoTYwvL
	Zj+mirmz6tkkFsIXuCC0uNwAXgNvPQZwvIs6vUPKGBbMUCN+gUPFau/Lh6TssTUnnD91vo3sKWHIL
	1lkcZpmDBJdoroSpAHOb61fK4smBUf9SaZD3yKWiUX7kcrcTH3UjfxinqUuJYvGAv7bolA9eX8M0c
	aHeOybhuKPwv92i85vNW0f9oKwGGLVsnhidYL0Uylz0G584PRZeyw4nuta1YYYyAcsCLlFi3EKzaN
	Kpm09e3ejhAULrI2Z97HVCDKASOj6jX43/eoP2WdrswU42rMpWeYCHnF+TYRBDJZOgo0MEf4xJf4c
	CApOue2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUPut-0000000CPwM-27bf
	for ath12k@archiver.kernel.org;
	Mon, 29 Jan 2024 11:35:07 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUPuq-0000000CPvM-1ozz
	for ath12k@lists.infradead.org;
	Mon, 29 Jan 2024 11:35:05 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5d835c7956bso1251045a12.2
        for <ath12k@lists.infradead.org>; Mon, 29 Jan 2024 03:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706528102; x=1707132902; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L7vu6ydIf0KE8wNJPqKbPxgDYv4shGysA0p/VvL8714=;
        b=meLnrNozf58J8SMmbNbxNNhoTvMhpJZQ74tURzSoAb0lk44J/pX+2d+EUOi2lY9VGK
         s3pG4VPbjYRsfv188G++vcO3bJmVe99yUImZ1P/6t24nOT+aOCW58RCdGYidD/jJZvbU
         28l00XmQefVl90+g+ZuMezvJSy2t+YFGhkZo8cdAnkI9dlInyFFZB8PcQ0gAfR/Gy412
         zmH+3udzKRVuRnKIVZFttUpV2wt/P7cQCz0z1/V2fu2+QxRdtC/6ztWO1RDTZ9KVBZdB
         TrioGSthQ68q3mcPeMPYdI5hzndxID5UlhInKuVnD5P5hNA4WYqhP1AXF/5h3FT4iYKf
         So4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706528102; x=1707132902;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L7vu6ydIf0KE8wNJPqKbPxgDYv4shGysA0p/VvL8714=;
        b=Y7b2EW96k2FA6mz/JoTMHG6BpiadOQcaSCRzspddL5aqZnuzxia9VV9ciJTETfycdG
         j/AUFR9wnxDXvrmZ4kOxJ2j1mW/060qvphbCNkX4Ea5SA0YNdqmI+QMFCjg5uBS1Pl4E
         LUiZFCZey8qsr+4LEv289SbGS6yg9e/RB//SP8wfbcVCJc1aBVi71vqY+aO78Jp3Ad1k
         UHgf1EtaQ+KXQYNyONZ+euZDDDADTk1nKvKUZkW9L0r2ZvoyRIbVKuq+MsoHhtRFMQJC
         MGDydunDdqo4NCsOrHkXbIaAVXkqFFkTE2onrj93TBdAoeoWHthH6ayR7yI+Wl+4ohwU
         H+Qw==
X-Gm-Message-State: AOJu0Yyv/ns7UWP76k2Pzf95BuJS1OdTbCYT3Jwnv3uOqUOFDXTfd/T1
	6aYSnMSlyvO8iJkOtjKl+ccCuRFOKkIDRO73RvvLc5OlFKIWPqaNFKVi4Wz/Eyx+/gA0XjBPUdp
	sF9Qw992qH09CbLz8WTsA2p/kF/XIuK/dBTnMTw==
X-Google-Smtp-Source: AGHT+IHT1n+EECNTJv/GzN6Eb24DYmtD75NBv6TF/TCcTuTS5/hTM9MPLHqA++x+JQuCEN9mBYuVKc43PbPEXssDoa4=
X-Received: by 2002:a05:6a20:2d9f:b0:19c:a03f:9e5c with SMTP id
 bf31-20020a056a202d9f00b0019ca03f9e5cmr1264289pzb.30.1706528102303; Mon, 29
 Jan 2024 03:35:02 -0800 (PST)
MIME-Version: 1.0
From: Janusz Dziedzic <janusz.dziedzic@gmail.com>
Date: Mon, 29 Jan 2024 12:34:51 +0100
Message-ID: <CAFED-jma7ZB17Rcgx9H+eVZ=N6Pty4__gz3B+O2V34XtcEzOGg@mail.gmail.com>
Subject: qcn9274 hw2.0 in banana pi r64 - LTSSM read fail
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_033504_522203_8B1C0D7F 
X-CRM114-Status: UNSURE (   3.95  )
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

Hello,

I have this card in bpi-r64 board. Need to hash: ath12k_pci_enable_ltssm()
While board hang here (next board restart):

val = ath12k_pci_read32(ab, PCIE_PCIE_PARF_LTSSM);

Is it a 12k bug/MTK pci controller bug?
When hash it works correctly.

root@OpenWrt:~# lspci -nn
00:00.0 PCI bridge [0604]: MEDIATEK Corp. Device [14c3:3258]
01:00.0 Network controller [0280]: Qualcomm Device [17cb:1109] (rev 01)
root@OpenWrt:~#

BR
Janusz

