Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4C2C02198
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 10:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phievftbMhEJWOjF57oTUK/kdR4f6x3/eDPPiCF/bJU=; b=la80h9k7P0/wXBr2jHVCyQmckQ
	sB16l3Wcu2pF8/Pa5PkyiPzg8cbgPM0anDJEVLmK9oNrx/jpLCTaFpikWrNg5H5djCSY6mSRqqC97
	RuBUX9qJjZ4zNSdjqjiTUbu9+eBGPBJPstIG/YkPfkacOv0GKGWLZzNQZuxcAWISubN2vZeplwREZ
	QW09+M1JhFMIUDZ28aQ8z/CuBPhD0tre1kemht58/GT5uq7nIPwnfe0ctt9Z8kJ+7emDAvVLS/Eer
	+4wfWCAcfgHO2eKBShwNpivwHPLHgLo8Hy54+UHa59wo474Xr5/FxAlzPeDS/wM69zrLVJxp+SRw8
	K52nLytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFlf-0000000072X-2TNj
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 10:02:55 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFle-0000000071f-0qty
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 10:02:55 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2743937f8f.0
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 02:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738663372; x=1739268172; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phievftbMhEJWOjF57oTUK/kdR4f6x3/eDPPiCF/bJU=;
        b=N0Ok9qT/u6G0OTynHXuoVUV/uigZwn90aKjmB4uxIRRxiD+Ujxy8B8Uq/YUDymDiHN
         QyhOcGNIp5QZBBhhP38oMqZYwBZJQ0l5kzC1XNjr0ga6HpgcEdkzXGhR/0wUtEItCLGK
         irWPVDhjeqFYkGa5HvtlB4JmctxCAV1ucxA6iko3+jQMh6UsrMWdzfyAvAyOMN1T7nX7
         WXJnbC7DV2zfGRHoyHCKg0DbFbhMMYHGdgpSnnJlAhCJDTvEw0VS85JWU15SpKslq9Se
         Xmv+4yWPVuiR1cu80FCLQSj0hAly4DaKM+C/QwE1OZKxhCr70nunQuuiAM0oVMpe7yqW
         3C0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738663372; x=1739268172;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=phievftbMhEJWOjF57oTUK/kdR4f6x3/eDPPiCF/bJU=;
        b=g7csE0uMZPgPSfd4XekeG2N08xqnEWozkNR4Ghi7abS9k6CW6arp7r2EQBVqc9jZZZ
         dui3pEAV2Ehl6ZBXqMY4TtwUi5n5jGM17ur3HmoBnxBucswX68daMv65ddvgaG5avR5r
         vyMulL1+0pX08oefe3rA8XghEerFAPOI+ystkz3TlHwJpq3jU1WuceE8YCoyoOrShoba
         ugO3Eu7zxo3ee65+9Ln2TnE2VzR2/aTQQNfX/7PTSEV/uUdHPewuFXxqB7fTeUmMvJNt
         BABO2UYqxucnnKxX+rPR24bEkIzNxyI/TeusLcmRLkr2wOBBnyiTjjsDpFvf99VOy5TB
         r8cw==
X-Forwarded-Encrypted: i=1; AJvYcCXWn3DSPjE95/F+0cYkF0b/UYEhfb6tFyMCBqFCIXflqohaDB9XP9LCupAhVysq/LRBB8mY0gs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXJ+wWrl5p8RZSV5dbes5IzjFoiTnTFQVyCml3Jqu1RXxaW3k9
	Tn7nhFgqQNH7ZyAo16NFMjleYLNvfxs5K7sZg3v3DUh9iP3wV9m7
X-Gm-Gg: ASbGncvvnwSAMq4ksuEaEl6INZUoB2qp7Ho+0cTlsFE6NXUr5jnAFa+V/R7reyebWAN
	7hvO3RvyRWM43d+3Nh17V/iSEq9S4rtte/gioMhnG0hI+I3pmlblMERoJOdlCx4KG46TaH4OsGr
	55qWMCprQ4UrcnSkqNdNxibZgpZrX4vjz6GwejZOXIzVNWKQbjFqVR+1/jTWHoZ/uQ8eTUIAk2F
	cdsnuzZaOraE2M9Oaoc0o5tkz/lii/5OP8Z4bzKymAE3CVRThOgyFP35i+NUyfifi4/5/wq+qZW
	MQVGQxUqvEQTUDt5U6OkpZgFMOuKhLDkqg==
X-Google-Smtp-Source: AGHT+IE17SiHozWKj+Os0pE2Y/1zwACLsOViGQPHYeNCGvgkHtVrDitOn4GliYkHWXRDJzqG8U9sig==
X-Received: by 2002:a5d:4d47:0:b0:38b:f44b:8663 with SMTP id ffacd0b85a97d-38c520bb322mr15854536f8f.55.1738663371922;
        Tue, 04 Feb 2025 02:02:51 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c11fadbsm15039077f8f.44.2025.02.04.02.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 02:02:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Feb 2025 11:02:50 +0100
Message-Id: <D7JKQ60C6EZA.24H639LLIG2U7@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/8] wifi: ath12k: handle change_vif_links() callback
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Aditya Kumar Singh" <aditya.kumar.singh@oss.qualcomm.com>, "Kalle Valo"
 <kvalo@kernel.org>, "Jeff Johnson" <jjohnson@kernel.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_020254_243302_8D32CC3A 
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

On Tue Feb 4, 2025 at 5:23 AM CET, Aditya Kumar Singh wrote:
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
Hello,

When applying this series I am no longer able to start an AP on a DFS chann=
el.
(I don't know specifically which patch though)

After the initial CAC period I get the following kernel message:
	[   45.248441] ath12k_pci 0003:01:00.0: cannot install key for non-existen=
t peer 3a:07:16:d8:00:08
And then hostapd goes in failed state:
	wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
	ACS: Automatic channel selection started, this may take a bit
	wlan0: interface state COUNTRY_UPDATE->ACS
	wlan0: ACS-STARTED
	wlan0: ACS-COMPLETED freq=3D5620 channel=3D124
	wlan0: interface state ACS->DFS
	wlan0: DFS-CAC-START freq=3D5620 chan=3D124 sec_chan=3D1, width=3D2, seg0=
=3D114, seg1=3D0, cac_time=3D5s
	wlan0: DFS-CAC-COMPLETED success=3D1 freq=3D5620 ht_enabled=3D0 chan_offse=
t=3D0 chan_width=3D5 cf1=3D5570 cf2=3D0 radar_detected=3D0
	wlan0: nl80211: kernel reports: key addition failed
	Interface initialization failed
	wlan0: interface state DFS->DISABLED
	wlan0: AP-DISABLED

Maybe I missed something ? Is there another series this one depends upon th=
at I
should have applied before ?

Thanks

