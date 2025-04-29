Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8F4C369DC
	for <ath12k@archiver.kernel.org>; Tue, 29 Apr 2025 16:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJ2Uu4wviK+ET+a1Q/3hHUMgJ+PVwDch+yPdKu89LDM=; b=YeCDizi0Ck0ohwUHqDjE72eXqr
	iJLMVVN1ZluH3kBT/FBZ+erFEpbU+QlxPGbQQP+dJm1fbwaLURC0nRVuk0RHH2KgYt0RdfhPrFC7O
	ED5vtH4lPcVVRD/fFcMWMZreRcKz92LFoMABeg2p5sq46Jqyq4Io3SmaGFubXiyWuxq15XRbhUs7H
	9Q+JP4UqAkIWJzaMAX+8T5z7sYr8LhNfNo0LkLRBa0w/SXB1m+NrMliON3zmJBDluwLwiz/8SGQ3J
	lphydpT5pYPSrC63adJskOZ5mhNSJhPbnKD1fvAHVa8Yzv2HnTiT/g+76G8ks5xZGjvN236KXw0zq
	VaiNXxSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nad-0000000ADuc-1P7k;
	Tue, 29 Apr 2025 16:13:47 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nBi-0000000AAgr-2xtQ
	for ath12k@lists.infradead.org;
	Tue, 29 Apr 2025 15:48:04 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso63539291fa.1
        for <ath12k@lists.infradead.org>; Tue, 29 Apr 2025 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745941680; x=1746546480; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJ2Uu4wviK+ET+a1Q/3hHUMgJ+PVwDch+yPdKu89LDM=;
        b=CfhbJe/oBras1umTVQP032NpoFtQBqXq8xkI3e8TsW8ztFL1jZzGLLpmJbJ1q/+FJB
         j2w/3KiomeTH6Q20HXrQzDg8Z3zO7Sn6nv6ajzKrdBd9W8nEIB90Nc9Xm7WF2LRFZ7pW
         rg6I1Hd7e5r0eB4LbSyzv9GKHd/Ii9vrwliEbyJ+rhTMBeAE8jlkMdcszWFq6mlnjsiK
         xZRORG+Z6snc1VTXrCTrwWtehaLUYMPxEaOS63bwgETmc2tSZckTFwz0enaOO1Uu9+TQ
         NvCF1e6cKXj1QbOKNWvvq9LzrMTFVVjlD3GuI8KFdmF7xZZsX2gTYbqRcejfbhMxshah
         +3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745941680; x=1746546480;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RJ2Uu4wviK+ET+a1Q/3hHUMgJ+PVwDch+yPdKu89LDM=;
        b=jqd8RDEBB03grsF8cqcg1wYtN5qmPqS3fxp+5Vy6ZOcxbxIB7V+sYyH9ss8uSQQuSh
         k2Oy140a7xeUb4BiZlWWc1SUrZu9cV8xSGMCmvdmSOsgx6tMWp+hTx3tDzYQYaf72ocV
         a7uQyb7xdguAMRixyq3PZk/0baGdgGkxTIUgfaq8s4ls0QvWUbuHBIJiEqgCT/XekeEo
         xTpbepm7JA9VRZ5te90WM+elg/+QZieo50p/N+N7+t8N4e5EemLV8/LuzMKJdhy4S7nI
         tPke1OaNRvleROl2218CWEE7S6+7B5N4KM6dI0qdzMMtl6g26uGC+El4H8b3YaTTB0iG
         CF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQ+weILFMMR0rbEbLtrcRS8tI8guTYPZU+NqAtprli3wOWqrREqfIQS2RJ4ZYxAheQd1Kizt4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz76SvU1kiDjGCAFxspIsUPwQTrfbZzxLXGKoXD2fQd/ChIMMX3
	sFH+Yz/VxumrzFs2/wvbo97XfPVFxzJo/4f1XZ2kuslBqbNUs1phnrFKxg==
X-Gm-Gg: ASbGnctqsZVu8DiIhmWpq7CbhJo1EIcxRq1ziTKmJFtlYSuOEJmVQQirEcelWsbhSqc
	dnuCHPXMJMpZU/Cpj+idaDkZtyKsbiOwT/MQd8Cne4btvKJ86NlAOJerfCra0cwc4Pa3zlAVBk7
	3+n4j1M508QQicscSEWKE2YuXWqMGR63n4jHfVvEOTd0rQJrD8x254RGyb0M4Bn0Bi+YuQtZ9H/
	LfFJOycT+BeB802NDXI8mPtmDhay+xDhJg1UQsWDEBCZAkpwDN6sjUN+DlvDc3hs9ucLTTIrgO7
	MN9ronBcrztVHr8XRGUdfFj/hluhpxYbFOWjOl74MdSCSJFjGHg1XtCOdq0=
X-Google-Smtp-Source: AGHT+IH9b85HibhvPJXHR+VJVotRVVPQyUVww3aNhG6Xb5/qwDd3JtHBnySrsUnnvkQRO8EKycfQHQ==
X-Received: by 2002:a2e:a553:0:b0:30b:c328:3cdc with SMTP id 38308e7fff4ca-31d45a3ce50mr17371591fa.2.1745941680000;
        Tue, 29 Apr 2025 08:48:00 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cf659b1esm24819241fa.20.2025.04.29.08.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 08:47:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 17:47:58 +0200
Message-Id: <D9J8O65N947J.Y0LSNAOS0AYG@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next] wifi: ath12k: allow beacon protection keys to
 be installed in hardware
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Karthikeyan Kathirvel" <karthikeyan.kathirvel@oss.qualcomm.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
In-Reply-To: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_084802_742481_A17F2D78 
X-CRM114-Status: GOOD (  17.59  )
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

On Mon Apr 21, 2025 at 1:47 PM CEST, Karthikeyan Kathirvel wrote:
> Install beacon protection keys in hardware for AP modes only if hardware
> supports it, as indicated by the WMI service bit
> WMI_TLV_SERVICE_BEACON_PROTECTION_SUPPORT. Allow keyidx up to 7, since
> beacon protection uses keyidx 6 and 7.
>
> Control this feature by setting bit 0 of feature_enable_bitmap when sendi=
ng
> the WMI_BCN_TMPL_CMDID command to firmware.
>
> Check for the beacon protection enabled bit in both tx and non-tx profile=
s
> for MBSSID cases. If set in either profile, enable the beacon protection
> feature in firmware for transmitted vif.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.=
com>
[...]
> @@ -4964,14 +4994,6 @@ static int ath12k_mac_op_set_key(struct ieee80211_=
hw *hw, enum set_key_cmd cmd,
> =20
>  	lockdep_assert_wiphy(hw->wiphy);
> =20
> -	/* BIP needs to be done in software */
> -	if (key->cipher =3D=3D WLAN_CIPHER_SUITE_AES_CMAC ||
> -	    key->cipher =3D=3D WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
> -	    key->cipher =3D=3D WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
> -	    key->cipher =3D=3D WLAN_CIPHER_SUITE_BIP_CMAC_256) {
> -		return 1;
> -	}
> -
>  	if (key->keyidx > WMI_MAX_KEY_INDEX)
>  		return -ENOSPC;
> =20

This hunk seems to break station mode on QCN9274. Maybe on WCN7850 too ? I =
see
that it was not tested against that HW.

With that hunk I cannot receive broadcast trafic sent by the ap anymore.
Generated by a simple "arping -b X.X.X.X -I br0" in my case.

Replacing that hunk with something similar as what is done in CLO [0] seems=
 to
fix the issue:

@@ -5575,13 +5605,9 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw=
 *hw, enum set_key_cmd cmd,
=20
 	lockdep_assert_wiphy(hw->wiphy);
=20
-	/* BIP needs to be done in software */
-	if (key->cipher =3D=3D WLAN_CIPHER_SUITE_AES_CMAC ||
-	    key->cipher =3D=3D WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
-	    key->cipher =3D=3D WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
-	    key->cipher =3D=3D WLAN_CIPHER_SUITE_BIP_CMAC_256) {
+	/* IGTK needs to be done in host software */
+	if (key->keyidx =3D=3D 4 || key->keyidx =3D=3D 5)
 		return 1;
-	}
=20
 	if (key->keyidx > WMI_MAX_KEY_INDEX)
 		return -ENOSPC;


PS: I tested that with firmware PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ=
-1

[0] https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/w=
in.wlan_host_opensource.3.0/patches/ath12k/726-ath12k-add-beacon-protection=
-support-for-ath12k.patch?ref_type=3Dheads

