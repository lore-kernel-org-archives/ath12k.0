Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E03C48BC3
	for <ath12k@archiver.kernel.org>; Wed, 14 Feb 2024 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUsO+IzRJ5+2bOn6TgFrFIgxHQIR2wb0vuBdLhpxUdI=; b=3+coNuPDXKmPfGVtjGgDFTFR5L
	+ZpsNOvsa/o6L5RPNCmUrssOVJol1JIzs95DGRJ2Bb/16uIiz2olPL93j6i8EUsrFxtwELr1hUzyB
	keDk5IzM6qktz9M0uX6/NS4TBf3QMA+ugFL49DDfayGgn9Z0Vm2ltleQLU/h6GTFzarQH7fgcxl2N
	Y+30sACP7L9hl1HF+uYNcMlUErYPYMCAzptj5qX/VfhmbT9yxyO/Nc4x+/takzYKY0fa27FqEOvmN
	fp0qVxdo460IyJSzT6IPNaHEE6MXC/CJmZUYtnn0dfdtViE7EScToDlOcTRDgYoSK1CKQ+HTnzxFc
	a54c2rGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raG4o-0000000D8cW-3s92
	for ath12k@archiver.kernel.org;
	Wed, 14 Feb 2024 14:17:30 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raG4l-0000000D8bY-33Hc
	for ath12k@lists.infradead.org;
	Wed, 14 Feb 2024 14:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1707920239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aUsO+IzRJ5+2bOn6TgFrFIgxHQIR2wb0vuBdLhpxUdI=;
	b=sHSn/v46EYiEniftvRMf+ygjBfZUDonOOnp8yXl2pR0fghGLjRYP5BKSucLu16jkYFSeSy
	7EInFSYSV7TntobV6/Eunz9vLjVR5aejY/+Q1B3FTSQI8lpx33h4lfmIbbZ8+zPSxBnQiC
	p1g1jLJve1KtG6vfY7MuSj/RXL1NUas=
From: Sven Eckelmann <sven@narfation.org>
To: ath12k@lists.infradead.org, Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
 Ganesh Babu Jothiram <quic_gjothira@quicinc.com>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: Re: [PATCH v3 12/13] wifi: ath12k: Read board id to support split-PHY QCN9274
Date: Wed, 14 Feb 2024 15:17:11 +0100
Message-ID: <23399810.6Emhk5qWAg@ripper>
In-Reply-To: <20240129065724.2310207-13-quic_rajkbhag@quicinc.com>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
 <20240129065724.2310207-13-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2595327.Lt9SDvczpP";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_061727_980957_B6B0293A 
X-CRM114-Status: GOOD (  15.46  )
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

--nextPart2595327.Lt9SDvczpP
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Wed, 14 Feb 2024 15:17:11 +0100
Message-ID: <23399810.6Emhk5qWAg@ripper>
In-Reply-To: <20240129065724.2310207-13-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0

On Monday, 29 January 2024 07:57:23 CET Raj Kumar Bhagat wrote:
> diff --git a/drivers/net/wireless/ath/ath12k/fw.c b/drivers/net/wireless/ath/ath12k/fw.c
> index fbcf40c97792..5be4b2d4a19d 100644
> --- a/drivers/net/wireless/ath/ath12k/fw.c
> +++ b/drivers/net/wireless/ath/ath12k/fw.c
> @@ -119,6 +119,13 @@ static int ath12k_fw_request_firmware_api_n(struct ath12k_base *ab,
[...]
> +		case ATH12K_FW_IE_AMSS_DUALMAC_IMAGE:
> +			ath12k_dbg(ab, ATH12K_DBG_BOOT,
> +				   "found dualmac fw image ie (%zd B)\n",
> +				   ie_len);
> +			ab->fw.amss_dualmac_data = data;
> +			ab->fw.amss_dualmac_len = ie_len;
> +			break;
>  		default:
>  			ath12k_warn(ab, "Unknown FW IE: %u\n", ie_id);
>  			break;

> @@ -371,16 +375,43 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
[...]
> +	if (dualmac) {
> +		if (ab->fw.amss_dualmac_data && ab->fw.amss_dualmac_len > 0) {
> +			/* use MHI firmware file from firmware-N.bin */
> +			mhi_ctrl->fw_data = ab->fw.amss_dualmac_data;
> +			mhi_ctrl->fw_sz = ab->fw.amss_dualmac_len;
> +		} else {
> +			ath12k_warn(ab, "dualmac firmware IE not present in firmware-N.bin\n");
> +			ret = -ENOENT;
> +			goto free_controller;
> +		}

I saw this now already multiple times that the source code was referencing the 
firmware-N.bin (like we had with ath10k). But they aren't published anywhere. 
I can't find a single one at:

* https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ath11k
* https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ath12k
* https://github.com/kvalo/ath11k-firmware
* https://github.com/quic/upstream-wifi-fw

So I find it odd that the new code now seems to depend on it without actually 
providing these files anywhere.

Might be good to have these soon in linux-firmware.git.

Kind regards,
	Sven
--nextPart2595327.Lt9SDvczpP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmXMy2gACgkQXYcKB8Em
e0b/fBAApivgxL1eB/xBoiFI5KRag3uRnne7oFJYEr/cWtmYKmTkQtGRMjymqbJY
qH24K2itQRxTbZtuJmz0YMAKT1wGleuy4bKDVtDrprDsDesvuaFV81tt6fBllIbb
9Kk0JlbVTcV9rvjciEHO6mvjuajTgh6dmXS1XgYwOER3wZijLOf+GEon7XmDUOaz
tdAS6dtmVPo+uXsKNpEAImV91n45aTF01xY3pXOGEWWVIKPqi5eJgIG4w8zLJa1b
Jao/ACKGRKGSxHKrJJWQ3YTim62eK595PLyj949U725oxClqg4N96uY3qElyNk1q
iYrUtcsvOwMHSMVVRXQunznD3isXNprC7M0mX45spmUGXTAmxLP2y6CCiSQXEyXo
wjczNbhHoFZlSKLi8/hY0zvFwn3Ep+0oegKNBhjZMgUj8yiwHvIKeGkR667c4PEb
lUJ4FZA08gDHEp0r4li0LXcf7Sz1qa4QIo+brX+UVFXU67aMoI/wPY153gteQLmf
xx8AHegi9P+SavuZ3Dc321/icQQdFugjF7L2msvRHmqaFvBSYFfqpxVxhbXz5kPX
OcbT9TuT2Ne0GZcISxBp7uqYaW67dwY/EYwgmhfIgiJ6RXNgW935ROiBiHsu86ZD
jo3JB5cxvSe0XL0XGhVOs8WZPkBMYlqusS9ZfwQEnZGxjqjTK+E=
=Ic38
-----END PGP SIGNATURE-----

--nextPart2595327.Lt9SDvczpP--




