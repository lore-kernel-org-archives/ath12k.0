Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8ABCCD184
	for <ath12k@archiver.kernel.org>; Sun, 12 Oct 2025 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGMyGxMjkQ+b3vCIVngK9ivzNaspS3b1SY6lwz20Bmk=; b=Wo56A79y3IE/nubBtWp76wVAt1
	NtyEyf8XslUHSQEtnNLOUMk5uDu6FcQRFTajT+GiMXwmMG198pLbYImD8+KNLPwHL601ID14CdWEW
	aDL6SM5nwc3xbRMxLMy/rR2GNehk0JCOvjs2KaQrood/SMt0knOlHHKwDlpZ6Vpkdy5fr83LvmOGi
	oyMPy5ZzQozBgpMCB+OpcoXZ2sfOmDFw9zLkNWVsPVSkujtFYckmVxNDq0RHDKdrOjUIwqtx6G2t2
	UScLPHZg9Jn5KMWE5/PjhxT9knqlhKghfoDVi9tEhLt0/SyAap2FDGJ4Fp9w7zV8bmiTRFZOIMRO8
	Os50k+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7wbv-0000000BOU2-0P2s;
	Sun, 12 Oct 2025 13:59:43 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7wbt-0000000BOT7-0UYy;
	Sun, 12 Oct 2025 13:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=rGMyGxMjkQ+b3vCIVngK9ivzNaspS3b1SY6lwz20Bmk=;
	t=1760277580; x=1761487180; b=e9mESf+pXU1ob4kLZTuV5xfEm3470PlIdRxtjaVWa0Y5ORa
	0iG1HAaKAzNVj41Ku8xI+l+Au+3xXxGZFXSAzXNxj7yis9WkFG+SGIRSWftHFoR/rFjNhBd8C3x7f
	IhIJfB6xu2QlnAQ54o6HOaC+fWeR2ruzKEUlq3NONSQmsuNk+982S1hhCbsFh1n8Nl9tr690PbTsP
	e/FnufxsXept7IEbQ1ZVgsY536cDfuWxSr1diTRC3c9/hwrHv04F6swjJuhkX+IE8+YV4/CPsb86J
	huLjzDGaVCBSkZiE4OgUmpGdJOiDOnELdEvtUayYEZ8Y6EPfg5HLBUoQU37Xrq1w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1v7wbo-00000008FIA-3lws;
	Sun, 12 Oct 2025 15:59:37 +0200
Message-ID: <30403bb70a2a017c90b1d4a5a1a07514bb670822.camel@sipsolutions.net>
Subject: Re: [RFC][v1][Design] AP Architecture for Roaming with Wi-Fi 8
 Seamless Mobility Domain (SMD)
From: Johannes Berg <johannes@sipsolutions.net>
To: Aditya Sathish <quic_asathish@quicinc.com>, ath12k@lists.infradead.org, 
	hostap@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Sun, 12 Oct 2025 15:59:36 +0200
In-Reply-To: <c618e0e8fdee9f7aa2628aefdf2dc04c48e6e9b7.camel@sipsolutions.net>
References: <fbf4209c-4fd8-4047-96d7-7fa34d9ba44d@quicinc.com>
	 <c618e0e8fdee9f7aa2628aefdf2dc04c48e6e9b7.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_065941_153351_048DBA71 
X-CRM114-Status: GOOD (  10.37  )
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

On Sun, 2025-10-12 at 15:51 +0200, Johannes Berg wrote:
> > 	DL/UL traffic transition latency to the target AP MLD depends on the I=
AP
> > 	messages and the ST Execution Response arriving on time. Therefore, th=
ese
> > 	actions should not have to wait for pending management frames to be ha=
ndled.
>=20
> A good part of this argument - "pending management frames" - really goes
> back to hostapd's architecture and single-threadedness, but really I
> don't think "hostapd's current architecture implies more latency"
> implies "we must put this into the kernel."

Continuing that thought: I think that hostapd's architecture currently
leaves a lot to be desired, in particular around how MLD works, and
obviously, at least to some extent, being single-threaded is an
architectural advantage in hostapd.

However, user space also affords far more flexibility than kernel space,
for example some things could be written in rust (with its "fearless
concurrency", which I can attest to), split out to a separate thread or
process, etc.

Anyway ... I guess in a way I'm using the opportunity here to lament the
lack of architectural work in hostapd which isn't necessarily related to
this, but I suspect that had hostapd historically had more architectural
flexibility we might not even be having this discussion?

johannes

