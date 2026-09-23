Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20EFC982EA
	for <ath12k@archiver.kernel.org>; Wed, 23 Sep 2026 06:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wOWxYY4eY9XU25OMHVx3sfwNw2fYVAY+jnGCl+7xTA=; b=PA9Vyr9bIiU7jlHvy/AqnBERQT
	vfmkYiC1uj05cFBsv9wKy2QCP3D2QvTCRMZDummT8q+cdhvInKrbxLNaXi0R+XMwrVN7i0RKuykaM
	Dhjewz044bFMJHhhrGu9uXbKQRT/hCR1bqBpj0HzHjcPMnnwGimS3MISEFg1ZUQ7NeBBxFD47x3Ym
	y0XY0YrXPQ6yrsXIvkl011ojzObv3sxZ1l8wPfPoBDDPxCS1VmRyEU6cq/snjoKd9ZXDj+Qx6i8rY
	5ZaWdEZIRJpn9KcPgJpUkZ1GF96VpyUswzuloNBaNDmtBXY9WOyHP16Sr9G/ame39x3NItQt5A6Ny
	Ou/atEvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GhO-00000007JVI-4B8k;
	Wed, 23 Sep 2026 06:43:22 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GhL-00000007JUX-3sl2
	for ath12k@lists.infradead.org;
	Wed, 23 Sep 2026 06:43:21 +0000
Received: from fauth-c2-smtp.messagingengine.com (fauth-c2-smtp.messagingengine.com [204.75.18.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hqS8b3NcXzyTQ;
	Wed, 23 Sep 2026 09:43:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1790145791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7wOWxYY4eY9XU25OMHVx3sfwNw2fYVAY+jnGCl+7xTA=;
	b=x5fsWG4AaVQvQ8z+CT9aRIp5lXYdYNtVf/vVMBds6DuRGR9uhnQ+mxeO06ZAsZ+xmnQtro
	cLoL6h+EnDZIxPH8Ym1iB8xeXR0UT+PUZb6hIq4RevVCYJqRniwxN0utljUCPw34kIgoly
	kie6CFNn7nq/7iP5gxrvYAz2CZZiCVc=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1790145791;
	b=M/sFfqTH2oBjHqrBQW+FerMg3xFQqiQPzGR5v1e8MgTLzM/XMqjXjm+DmUyH+iRTbvAxRL
	07KW/qwYD3mW+LvG9Q0Sswi1qeAEHzjS5J9O3X4LYcRKVn9zZ8OaAGTGdzIaqgnNV7UUBQ
	m1fjNcc62wu0FvqMjAQD8sOxeN6Yfb0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1790145791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7wOWxYY4eY9XU25OMHVx3sfwNw2fYVAY+jnGCl+7xTA=;
	b=QNfPPPN1q/uR8YvjjJ24DpB10TmnneJ8Td4MeIt/o+/rWx73nE1NS6csNSvcWLV9nH/V4N
	ZxI0qJ2H5Nn2KC1MNJyOwnsGvQbWElDIwlO8/vWQ2vwkpgbxN0HVMmE/7FSIGhCBMvWiME
	XsfoGxWStxNs5F5xOgkLBr9icauSgBs=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 47C9C198004A;
	Wed, 23 Sep 2026 02:43:10 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Wed, 23 Sep 2026 02:43:10 -0400
X-ME-Sender: <xms:-3SzakVwe1VxyDXHb413WQaKDq6_3zS5KetTsI54C_mSAwQH0mt_sA>
    <xme:-3Szajafl31YUfXA6zZn9bh6EicH2OMotgMoN4ROKMs4jH_N-D7ceHqCbHsjzolOu
    sDl_DA72TNnX6OjN3J1xer5Ma-yJC6sXTf3IB8fogpEbNvdVw_yRvM>
X-ME-Proxy-Cause: dmFkZTFZGTj3GjzbP5lYRKQxP+eSpNJWuoi9GAhHtMOeLYfiHKA0AKIj1Kd2GGDDkxTBLQ
    4MDet04aCmyUWslVn60gIvcdy66Uw/Kl9xZ4fbg5csse8A1LyE3KT+sl+WNTnWti4S34vi
    K3VAMHoqN0HOf7wqh2GI7+SjgeXMDlXjJSADQctWRxmn28w9PzX6kZFYR+BkQoKkIXXri4
    DxYtKkj90b18TYFd2Y+VPF3EYEpE+NhRRtWYRkHrpclSqpVjwDFI/hjvCrZN97Wr/OrU9o
    HRvNsq+S+iEsP+6E8AEjSgtkw+nmJ/A5ZhtfcHVDlPmeTCkRMMNLbNEgiFeNWnLihnXTOj
    u+Z4YjcR7unRGpzGBPc15f1rg0udjNxofqmGerLDYFu1uTWwVjN76Z1Q6/Aixb6poAxTO5
    vY1QNdSzmFNIuu29EHc6qFe6ZFPiFDwpIs2BjrB+vWrPbg9dchmr4vxgYCnvFtXUvyLkf5
    64jzDe6/rnpD/DO9oTypgquLbQApXc+GF1dmAcZSLeppr//4+S7Vma+EXXsyExj77GEHmL
    DpcfNh8DDKGX7vU9m6d6XVqYk8sqOIsX5buSn3UfGZRuHVq3bYX0Qe0Neca+PwRKZh2vZd
    xCXvBqu6UlKeUniQNtLDNsRaKdZf976LYb5BHQNxCUb8SUB6zvxCxEcgrvew
X-ME-Proxy: <xmx:_nSzas1dJCHZrnRNJjNGhY-P-tN9iTd28AuGv2pcygktRRX2JZi2HQ>
    <xmx:_nSzarW6uNVDeY5Ma5O7pAZiV2v5NtMrGWWiYJNuXB3GrrWiOu2iYQ>
    <xmx:_nSzaocQkw6MFOLUVjXGq-H3U2BIb3LIOGChOniranpEf1pta-u_eQ>
    <xmx:_nSzak9kF_xpDo5CtpZP9WJtwp3JHcWPWbi5ZveYyqvRRRG9B37BPg>
    <xmx:_nSzaoZ_i2H8ufpkLRt4jBZSPqE0pmWboi2feJDFtcKu7x6eS2f8YheB>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 15044F8008B; Wed, 23 Sep 2026 02:43:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ArNQnYYOpCrZ
Date: Wed, 23 Sep 2026 09:42:46 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Jeff Johnson" <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Chris Lew" <christopher.lew@oss.qualcomm.com>,
 "Deepak Kumar Singh" <deepak.singh@oss.qualcomm.com>,
 "Raj Kumar Bhagat" <raj.bhagat@oss.qualcomm.com>,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>,
 "Vasanthakumar Thiagarajan" <vasanthakumar.thiagarajan@oss.qualcomm.com>
Message-Id: <f4cba44d-d566-45d7-8772-c08af41dfdbf@app.fastmail.com>
In-Reply-To: <20260922-qrtr-multi-ep-v3-4-c00831e88957@oss.qualcomm.com>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-4-c00831e88957@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] wifi: ath12k: Connect to the QMI server belonging to the
 device owned by this driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_234320_154622_FBAD75DE 
X-CRM114-Status: GOOD (  14.42  )
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

On Tue, Sep 22, 2026, at 16:41, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> When two identical ath12k PCIe devices are connected to the same host, both
> advertise the WLFW service with the same service and instance id. The QMI
> lookup reports both servers to each device, so a device may connect to the
> firmware running on the other device.
> 
> But now, QRTR provides each MHI endpoint a unique node id which is
> different from the node id announced by the device. So use the same id to
> pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> the node id derived from the MHI controller index and zero for transports
> that do not assign one. In the new_server callback, skip any service whose
> node id does not match. A node id of zero disables the check, so transports
> that do not assign one keep their current behavior.
> 
> Tested-on: 2x WCN7850 hw2.0 WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> Tested-on: 1x WCN6855 ath11k + 1x WCN7850 ath12k
> 
> Tested-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
> Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Ok, you can retain my Tested-by tag despite the changes to v3.

Backported to kernel 6.18.53, all regdb issues are gone, and when I
attached antennas to the secondary WiFi card, the statistics fetching
dmesg issues are gone now.

I have two cards, both of them work simultaneously, on the v3 patchset.

The only remaining issue I have is this on the access point card:

ath12k_pci 0001:01:00.0: dp_tx: failed to find the peer with peer_id 2

Google's AI (Gemini) tells me it's not worrying if the connection works
(like it does for me).

Thank you for the effort! I'll take the 6.18.53 LTS version into use
with these patches.

BR, Juha-Matti

