Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B13606A324
	for <ath12k@archiver.kernel.org>; Tue,  3 Nov 2026 04:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZfnAtfYO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXufRxdN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cl7XuderxVyatIgZNuprudUTpms6qFioS0bOx3h11W0=; b=ZfnAtfYO3g+nyW
	ZPYiwpVy6vmNVREjUoemf1lgacpSLJqx1IKH0XbswDKGpA99RkgUIuyHwl1RoXGzcEVFJbwFJryb5
	a5z1exK7T5yPBgHGr05cuhsopRUjutcNf8Xl0SW+Fk7HUx5BAsBOu91sDEeKLZTqsx8lm3rFKA3lb
	aTd8aZeTpIt26H+EZIXEP5szkAHe9em3v2ezZl4CVjASoQUTrtJ7EbLdLTkt9/YhoYyZzpSvzJCI/
	4wz0I7uNrLjf8eQpd0SOI9fa4CpYBvxwOFAtwlVMr/O9wYa29W0uUrbUz1gUH4YSdP3WIuTGzFqGZ
	Sbonx2T5t8LjyJuYPHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO5lV-00000000ybc-0hi0;
	Tue, 03 Nov 2026 04:04:53 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO5lS-00000000ybG-3tN6
	for ath12k@lists.infradead.org;
	Tue, 03 Nov 2026 04:04:52 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ae702d28c4so1673005a91.3
        for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 20:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793678690; x=1794283490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cl7XuderxVyatIgZNuprudUTpms6qFioS0bOx3h11W0=;
        b=YXufRxdNuQ0okQUFopJpgjtlORIyvH7bFKNo8j2vvSOMrHO6o5Yu+Pn/9QoOhl94EK
         kDKWKdAaCPFX10QSxlOP0kutqDj6L2c8xEn0o/yQc4IhGU3Gx6jr3g8DRDgOQuUxpGkX
         2xuiQ6XwUqvE84jTJ3G5GSxxlOBJzePqj3su1R7S3kyK9XQNh/VLsXWh3bfOfx5Mn63M
         PTXv+JEBFWVAfwx0PIR4ljIKYOy2NAkME83WemvhnZ7GL5G181V2Rkr8vSj4Mk020E/h
         56Da+ZjC46EnPEnoOPrsMoCtjKw5sGA1jyT/h2/C2aVq8GmRS+VikTazbxSSYT1hGa+q
         nK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793678690; x=1794283490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cl7XuderxVyatIgZNuprudUTpms6qFioS0bOx3h11W0=;
        b=B2fqcVDIl5Mac88EZt9nPzNsvL63LnY2pTHNPe7etqPMFuzSeWWd0laswENBvQA2kS
         rXQ7sINrqa/kq4x+Jp4d87Yr5ny0XeCouEA7olFpp8vCuLn8/xrFcNhPoOpe3Nais9wk
         igAKHW9QavhhfIHLoH1lr1AbMZkpQ/KR+2cnyCRhKWPNVxGyJeoxkq+fTTTcYVMIkvxT
         F28QhcmVGjH798bm9RPnjJJgBWDpL0i3kNQQBHcRUaCaLERz+ly0oXIs2YxPLnMooizs
         ZDKB9cmBG66ueYhpsLxNKtpaC9A9Pp+wD6P7vEkZlpErOZzBrFvIXnSuUQ0y4tYFzn9h
         y85Q==
X-Forwarded-Encrypted: i=1; AKwUvBzpuEGOx6j4Qx3xVLulnBiKSf4Esfa02TSAAsDjCCkLWzbNYz2VAdTmiziFfVvLwVVwnSSH/TA=@lists.infradead.org
X-Gm-Message-State: APuU4Z+CKC/DQ48LPWNIWbIXyNVmZQ7CsH1q9+680zdnxs4wxUyO8eQl
	gyrKxWBpR70c0ezTBUmRmvftX/j1QjMMGfo0yhaCY9oKEjQ7CNKJ5qYGcMBy/OQnzA==
X-Gm-Gg: AYBFou33ChGkbNl5qZgqAXmU1BB6/+2l5BPGirgQFhV35+VdJuIlRftR5V4VHjoGGzH
	kcyFz1G/KpZEn74sRI2fgtUUziDJOMl76WDlPkTaLD4hm3q9EPri6pHVeTkpVrcWm2M/F2QpSCi
	a+RHAmcB4aoiflmA6gk17mNsrxBtRwzawsUmMspOcdjNypD4AdtufBcYUnPdWi3sJttf5z24SBo
	fw8hao9o4AAe4qIJR//qPIE2L3/vNd/Mgtc44xlCYkdq4OdyKNvaIXkppjTeZ7immHLDMqGkDBQ
	HmgPePpfsXWgCLppx40903Q7jlm6D7lgXANTnsSo4mDDCAF8OXHWQZbidZLYduXyYnTj7DA30OC
	86p6zOlMTlLmP+R0SFn4RDrarUfqY8fdhhQeh0P448ZydVJ0x+bmujFZt7UazQnfomIRHcSy0f7
	eviyW6Ls+WqVLOUp8p92yJj+B2ZDakCeI77eV6uAyWo+uQaBsTt7Dw9R3PPYuYm0ZNlrgQCimVq
	pOGsvUrRP9ih1RZuENrkhNzf9VuHK4+SekOs3CZL5oUWa+qdOwUY4W5/e+S7von97IB0nQH68s7
	Y+R1JjoAZz2IxyX36h1nU2ETEVH+ex54PvAFkjnEZ2++TGbRUcLeTQ+YBV6O0reqKNZ9
X-Received: by 2002:a17:90b:2e4f:b0:3ac:9a5e:9ce9 with SMTP id 98e67ed59e1d1-3ae897f3440mr10056187a91.29.1793678689562;
        Mon, 02 Nov 2026 20:04:49 -0800 (PST)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c896cc6sm1887277a91.9.2026.11.02.20.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:04:48 -0800 (PST)
From: Burke Cates <burke.cates@gmail.com>
To: baochen.qiang@oss.qualcomm.com
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	jjohnson@kernel.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH ath-next] wifi: ath12k: fix MLO 4-way handshake timeout on QCC2072
Date: Mon,  2 Nov 2026 20:04:34 -0800
Message-ID: <20261103040434.3387789-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <492ece60-a670-48f4-a808-f09394b3db95@oss.qualcomm.com>
References: <20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com> <20261030041902.2740757-1-burke.cates@gmail.com> <492ece60-a670-48f4-a808-f09394b3db95@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_200450_968249_35DCA25C 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 04:02:56PM +0800, Baochen Qiang wrote:
> Hi Burke, can you please try if below series can fix your issue as well?
>
> https://lore.kernel.org/all/20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com/

Yes, it fixes it here too. I took Miaoqing's patch out and applied
v4 1-11 instead, on v7.4-rc1 plus three ath12k commits from ath.git
(c752394249f8 and 02121aa4a012 from ath-next, 1e678e37ff13 from
ath-current) and out-of-tree Glymur platform/board patches; the tree
also carries Miaoqing's dp_peer reconnect fix (8b6b871332b5). All 11
applied as posted.

On the tri-band MLO SSID that failed with reason 15 (SAE, PMF
required, 2.4+5+6 GHz):

- 12 of 12 connect/disconnect cycles completed the 4-way handshake and
  came up as MLO with three links (2.4 and 6 GHz active), ping OK each
  time; no reason 15 in 23 handshakes over the session
- 5 of 5 rejoins after s2idle resume
- non-MLO WPA2 on 5 GHz still fine

This firmware sends the PEER_EXTENDED event (two per association), so
the host allocation path in 8/11 was not exercised. I'll send a
Tested-by on the cover letter.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke

