Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A932C44539
	for <ath12k@archiver.kernel.org>; Wed, 22 Jul 2026 14:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cUC4k/3uqIOg3tp8YmbbS7HkkcktVvF8Cv4Ao3xCWI=; b=alZtnghWSmlDMze6MRfmW+0PI3
	9E4A13zho+VbGn3BoBhHr393O7oZVuLI9d7rjHCZ3j1jnXsC/t+U+QA+ge3+feVk+nXSN9HEPJmI5
	wGjt+8odGebbREciiPtIdudW0JSkEW2dqPPXTn0PSGkz0txhz5ucF6W94clOeFzxCGqyb3/et2f0v
	ax2YzTsKxhMuC16Fh/cuxpCshQF7oJSOQyDK63s1X9zHpemP4OM7d+9jdhgrsAgc4ujVlamOsmlSk
	O0HMuG7/PSPVceZkdjq7ZfuDboQ3VeYnTkeA4zu53K/d2iMKyxDUV41Yx5/ymUj8QLlgpO7AlY8bz
	I0PrHQ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXcN-0000000BzX2-3Qkg;
	Wed, 22 Jul 2026 14:08:15 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXcK-0000000BzVb-2otb;
	Wed, 22 Jul 2026 14:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=5cUC4k/3uqIOg3tp8YmbbS7HkkcktVvF8Cv4Ao3xCWI=;
	t=1784729292; x=1785938892; b=CMp52H+XbFXqKmRCdJLTY1PDiXror/IxJTH696eP3qWxVN4
	YrubKEv2W5S9evOrtRgZ02V6PohrdlSFOCKA39i4jI4JJOrkvd150pzbKPdtxTcpBFddj6GJgQkzX
	8iBylPPKoLkK6Vf/212MdaTgvpaJOFXZCPHxJA0qrmQwP768++fDmokq6vWw3O5IGDijVYDy+/0OA
	P0xrOwTYlvfvs7lrSOg1EBzr3IMY1i6/U7YVPH6tUOefcOOuQB3poASsRSiCzw3XK3rjlgYcJQjO9
	ycJWAtRA38LWAVrCE30XioeHRMsAbYD+pAfAveP0t5OHYEiON8a/qa2IP01FvcJg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wmXcG-00000004nkt-0dpj;
	Wed, 22 Jul 2026 16:08:08 +0200
Message-ID: <67b88a3cc68473a1ee9d2816c4b5fe07c378434f.camel@sipsolutions.net>
Subject: Re: pull-request: ath-next-20260721
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Date: Wed, 22 Jul 2026 16:08:07 +0200
In-Reply-To: <f73b76bb-dc27-42d0-8e47-b617eec766a6@oss.qualcomm.com>
References: <f73b76bb-dc27-42d0-8e47-b617eec766a6@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_070812_732987_36404F2B 
X-CRM114-Status: GOOD (  10.57  )
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

On Tue, 2026-07-21 at 16:46 -0700, Jeff Johnson wrote:
>=20
> ----------------------------------------------------------------
>=20
> NOTE TO UPSTREAM MAINTAINERS
> This PR includes the merge of an immutable branch from the qcom tree
> https://lore.kernel.org/all/178362521364.2422497.1305957434056184382.b4-t=
y@kernel.org/

That's annoying, it added a kernel-doc warning that now shows up on our
output... I guess we need to ignore that.

> New warnings added:
> Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found for r=
eturn value of 'qcom_scm_is_pas_available'
> Warning: drivers/firmware/qcom/qcom_scm.c:1055 No description found for r=
eturn value of 'qcom_scm_is_pas_available'
> Per-file breakdown:
>      2 drivers/firmware/qcom/qcom_scm.c

I also get two fixes tag reports:

> Commit: b127f79a4933 ("wifi: ath12k: Correctly copy the hint BSSID in WMI=
 scan request")
> 	Fixes tag: Fixes: f40abb4788a2 ("ath12k: New driver for Qualcomm 11be hw=
 family")
> 	Has these problem(s):
> 		- Target SHA1 does not exist
> Commit: fde37c064641 ("wifi: ath12k: Set IEEE80211_OFFLOAD_ENCAP_4ADDR af=
ter tx_encap_type vdev param")
> 	Fixes tag: Fixes: 729cad3c3c9e ("wifi: ath12k: Add 4-address mode suppor=
t for eth offload")
> 	Has these problem(s):
> 		- empty lines surround the Fixes tag

Note that the first of those ... the commit exists, but not in the right
tree. It's in some ath12k-bringup-start tag in your tree, but not in
mainline, got a different sha1 there. So checking locally is confusing.

johannes

