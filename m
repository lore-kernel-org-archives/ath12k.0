Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBF9ECE58B
	for <ath12k@archiver.kernel.org>; Tue, 10 Sep 2024 09:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sM+7PPwYWN07NlwtJn7Vg3Kbt0LlTirc1KeW5XQhyvw=; b=AFP/BqgpeicLJhmVbVziiChodi
	fN956AXme5XOVJopZcSE+booYIfzmXLhcjxQzkb8fjbkFXPNniQBrSBK4ugj1Q0xcazqQCRZRf5ED
	z8yFnT2bauIydDAR6MXlQTHwLzh+Y1Hvyw5xb3vSA0m8Utu+KBIht083sv+/6fi9qmEC1bfMhUxLx
	VFrI2vlVyrZzaqo+undpXSfB0yF4/BAMYiKsVLlXqYsAkKMpX5uiqswvOWbNUrDVzn946WQM3kDjz
	jaWP6oaZCYmPIE7ofwkTvZn4kDgkqgPk8sYIn+XwVkM441Ei4xrzwFhQiQjFCzWo/daByCjxsPuOH
	uVlwZHoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwkp-00000004uhQ-01Pn
	for ath12k@archiver.kernel.org;
	Tue, 10 Sep 2024 09:01:43 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwkE-00000004uVC-0z1T;
	Tue, 10 Sep 2024 09:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1725958858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sM+7PPwYWN07NlwtJn7Vg3Kbt0LlTirc1KeW5XQhyvw=;
	b=BSOBTfkcS6PsWA+UZr7YHUMUdR7mx3phmN6MaayXimpKGNiHCMIayJnWSpnqeiDsqo3riA
	mVWPOJHvLQ5kRj/XXsldlPJdbc2mzwHzEv/N+UEWIOCvfD/8AviIh+u75RFW8690nBlw5g
	xoXRyBWOgAiDTIEME0KUmyk1TKxi9/8=
From: Sven Eckelmann <sven@narfation.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org
Cc: ath10k <ath10k@lists.infradead.org>, ath11k <ath11k@lists.infradead.org>,
 ath12k <ath12k@lists.infradead.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Kalle Valo <quic_kvalo@quicinc.com>, Robert Marko <robert.marko@sartura.hr>
Subject: Re: New staging repos for ath1*k firmware
Date: Tue, 10 Sep 2024 11:00:52 +0200
Message-ID: <3772134.MHq7AAxBmi@ripper>
In-Reply-To: <CA+HBbNFQ+25u_PK2j3vYtiCZwv+shVAVeAHKqQCwhyCopORt4Q@mail.gmail.com>
References: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
 <CA+HBbNFQ+25u_PK2j3vYtiCZwv+shVAVeAHKqQCwhyCopORt4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1945126.taCxCBeP46";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_020106_986282_49EB5A0C 
X-CRM114-Status: UNSURE (   7.63  )
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

--nextPart1945126.taCxCBeP46
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: New staging repos for ath1*k firmware
Date: Tue, 10 Sep 2024 11:00:52 +0200
Message-ID: <3772134.MHq7AAxBmi@ripper>
MIME-Version: 1.0

On Thursday, 7 March 2024 09:39:26 CEST Robert Marko wrote:
> Can I please ask for IPQ6018 firmware to be updated to 2.9.0.1 as well?
> 

I've asked them via their support platform. They closed the ticket after Jeff 
uploaded the 2.7.0.1 firmware (which was given to him by the firmware team).

I will ask again...

(Btw. thanks to Jeff and Kalle for managing the new firmware repositories - I 
just hope that you get better input from the firmware teams)

Kind regards,
	Sven
--nextPart1945126.taCxCBeP46
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCZuAKxAAKCRBND3cr0xT1
y8lKAPwNsSwdxLSmTikf4A4zjnUCpxxZhriK+7u8hhJ+kTvhrQD+K4pV0rseDTTc
JqCq029XRTiTr4WcIPL8mUWrOeGZTww=
=7gwb
-----END PGP SIGNATURE-----

--nextPart1945126.taCxCBeP46--




