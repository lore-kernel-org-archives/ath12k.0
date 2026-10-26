Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3887B606A32F
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 17:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m/8BsOA5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=do/DnN1s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4flWI2WVnwFI/fTrvl/y9DbpMdHilW4fazMAT/2C8K4=; b=m/8BsOA5jH58y54hq1gz4X4DFP
	mCgbtotJfZj65bhqya4jqivegq+VJSvGxxfjvJHl4Cz52C8iWlxnB3i1aB+V2Fkup/EMs9Iwkiut6
	HSVZLEuGSz2X8WXN6joqs47h1O4LDzTcbj41uGCAHe7oJNT1b2whfylz5oUdA8lo7ej+UsZKa0l0H
	iqQ4Zg/rZXtzA6eivl1uIxiYr59YKsCU2/Q1BXhQAWG0sm7GyTDu9DJ+ZYLEdAV9lRmBSZeyZrKbb
	bIUUFBZ43OYh3ufFUmCSURe1irtznx5PZA7xDt46dBXu7FYIpys5tZkecGMH52Xo3nrzR9B8rRUmu
	XQbHYWEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLOSM-00000002z9S-3igA;
	Mon, 26 Oct 2026 17:25:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLOSK-00000002z7r-3fas;
	Mon, 26 Oct 2026 17:25:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D3D743E64;
	Mon, 26 Oct 2026 17:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8AA1F031E1;
	Mon, 26 Oct 2026 17:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793035556;
	bh=4flWI2WVnwFI/fTrvl/y9DbpMdHilW4fazMAT/2C8K4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=do/DnN1sS/BFglJXOVc3eSqMWCTulTWj7p+/8C3vlAjiIZXkLfkFq6Swf3Uyn1IUU
	 Sj1q08ywy4L7I4hshh4mggb81RpchiYROxIIos+HPKXxZmsJ6WcqSD+8S3CZOOTE9g
	 qjvHFXmXB9W2eRZQ9Jogkt8laFHm4/M19aEW2a/HErOn2EIkWygQkWrYrUSW4IStr4
	 EMsE9KAHgg9TF3Vtb88B8eqVr1iH0YB3LV9tnrFmp8odKW4wOjD7ovpWx49ulxtBmA
	 9X+Qvsz7hDgthb4wgYZRcfYNPc8g60Spyim+kDi2YZ3E5HhzAyp9dei5iTrZqY+deG
	 jA0LRiGwZaZBA==
Date: Mon, 26 Oct 2026 17:25:50 +0000
From: Simon Horman <horms@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
	Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
	Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] wifi: ath11k: Connect to the QMI server belonging
 to the device owned by this driver
Message-ID: <20261026172550.GJ257209@horms.kernel.org>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com>
 <20261022-qrtr-multi-ep-v4-3-c6fdb75fcd3e@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-qrtr-multi-ep-v4-3-c6fdb75fcd3e@oss.qualcomm.com>
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 07:43:09PM +0200, Manivannan Sadhasivam wrote:
> When two identical ath11k PCIe devices are connected to the same host, both
> advertise the WLFW service with the same service and instance id. The QMI
> lookup reports both servers to each device, so a device may connect to the
> firmware running on the other device.
> 
> But now, QRTR provides each MHI endpoint a unique node id which is
> different from the node id announced by the device. So use the same id to
> pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> the node id derived from the MHI controller index and zero for transports
> that do not assign one. In the new_server callback, reject any service
> whose node id does not match. A node id of zero disables the check, so
> transports that do not assign one keep their current behavior.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Simon Horman <horms@kernel.org>


