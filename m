Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C570EC54E71
	for <ath12k@archiver.kernel.org>; Fri, 22 Mar 2024 16:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfycjR4G0Z7gGgay6hupFqtRwNZvv/E+4EUNN49G/Sw=; b=u8SmXovGQ6KPf3JM2fHkR2ycRG
	07NvLx3MVb/6+ZsWaTdAM6viLsJodBSDEArmWpSdHro11yhKBZMA4L8VHFkK9H24DH0/M2wqJjMXh
	rK1+X+q9Ev1oxmfLn1omaO1Z5Mg9ikPp6l+Il056si9EQ7fih0H7RR564XYE7hbuxTrKqLoBJp833
	/LEnQ8YdO8pYrYl1YEgex3sDu/wpHjKcBZ6xtlcvaK0jQdRzuBA6a6sb9Zl3ilcBvsOV0zPl+nSgt
	bgqAxW1uQxpdx869UPKrvquWlApFlHzb2lG3WIoi5SpxQ4j2zxUocL4oUjeyqTe2WSrXahR/8WAVQ
	vhQf77tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnhM6-00000007rTM-1pJD
	for ath12k@archiver.kernel.org;
	Fri, 22 Mar 2024 16:02:54 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnhM3-00000007rRC-3zED
	for ath12k@lists.infradead.org;
	Fri, 22 Mar 2024 16:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=zfycjR4G0Z7gGgay6hupFqtRwNZvv/E+4EUNN49G/Sw=;
	t=1711123370; x=1712332970; b=wxWQLMBGUrVE1oIBleXU6qlEtH/eeF7FiUHAzT3wrOnBwlw
	gJQTeZiLlcFwQg4J1kKsuYoEEFWIX29W8igIF82hbZM433xOXKCP2Te8PcMyvAK97Yist8UG5Hx+n
	dZ0pLHVVNAX5QrvAEjOfceL+45rTSagBTV52WhAHzvAmaFCer8dVOCwOD60YveKKZjE2FWhm/RHqL
	QHAUsX2cRb9BdvjOGQQNL4Z6BPRa+IyeiouqLrbC50pMaPRUANXZmsX1Rl2jYRCsUmser/dtP6OL6
	L15j2QRq6O5AH9HfaDx/KjQQNv9deQuEZXaNObwmPcBU4jpSh8fi7qHvKojPQbhA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rnhLz-00000009v4N-26Xf;
	Fri, 22 Mar 2024 17:02:47 +0100
Message-ID: <bec0c3f9220c5084f163a39355499bcc7a32da36.camel@sipsolutions.net>
Subject: Re: [PATCH v2]wifi: ath12k: Add firmware coredump collection support
From: Johannes Berg <johannes@sipsolutions.net>
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 22 Mar 2024 17:02:46 +0100
In-Reply-To: <20240322054231.467152-1-quic_ssreeela@quicinc.com>
References: <20240322054231.467152-1-quic_ssreeela@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_090252_216606_6FC514B7 
X-CRM114-Status: UNSURE (   7.53  )
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

On Fri, 2024-03-22 at 11:12 +0530, Sowmiya Sree Elavalagan wrote:
>=20
> +config ATH12K_COREDUMP
> +	bool "ath12k coredump"
> +	depends on ATH12K
> +	select WANT_DEV_COREDUMP
> +	help
> +	  Enable ath12k coredump collection
> +
> +	  If unsure, say Y to make it easier to debug problems. But if
> +	  you want optimal performance choose N.

Why would having the hooks to dump affect performance? Surely you don't
expect to be doing it much?

Also I'm impressed - 55MB seems like a lot :)

johannes


