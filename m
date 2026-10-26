Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF2460A260E
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 17:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a/lz7oFH;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bIwrq3jc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y7fieeF7CmqetCmDW/QKoeVOfYtQRHVfDW9OzlsY0n4=; b=a/lz7oFHjQJC9mLJVRCHyd5pSw
	7PRsq1Ue8TbYNKnTJERMuh+PoCk0qgoayDL0k95xEmVXEdb2+twH3lr/X760HYq7RHBOpRF92DAiy
	QevbSO/AlpLI7jwhtxoOEMTG1ln9EHz2/duebUVXET0l1wTmLPyLp0oFqsLg6XpWxHHva+N066anM
	mSESv2gHvzTB4twbqIzPvPxnDdoC+vrUVAVS3QMHskyYMQvNuTPm3VHRnoujMlXUvzHEVosMbpzo4
	EYiGpQ1lXFaiDOljh+GLUu7OMWiY7JZHwJz5nsJXjIULBc2ZSWSChfKL+q/+VGIyTg76GS0QZ8TzB
	KQKbuLtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLOSk-00000002zSv-1C65;
	Mon, 26 Oct 2026 17:26:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLOSj-00000002zRl-0UMt;
	Mon, 26 Oct 2026 17:26:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB2A244047;
	Mon, 26 Oct 2026 17:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893661F01825;
	Mon, 26 Oct 2026 17:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793035580;
	bh=Y7fieeF7CmqetCmDW/QKoeVOfYtQRHVfDW9OzlsY0n4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bIwrq3jcWrVWlKY8Ol4vI8+yt/qdkIhJvzjUsFnJcQWz3XJYeEXX2S4C0ZhimFzof
	 goBbek1dQU+wXfkoaPDg3K54VH/pP38R+714tMnt48sRGhzCxeYts7CkqGlCj5V+wM
	 MUvhfO4sZkf1zfcxsOHV016bxGhPv5P1SLg6l3H7T/dqml1fDcfdtBSNE8RYo8yXya
	 RxLGizVb2O5ZJry4Es3MXd/uAUOEio8S58XVeog9qr3kNNdiZLowA2thGEVkKW0iVF
	 2xmF4MLCyvZ3pC7/5uFhf/hgxEa94yrglFs/C+j2WjAPs3Cms7mHnWh/ClX/km5DZo
	 N20jrkg72XU4w==
Date: Mon, 26 Oct 2026 17:26:15 +0000
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
Subject: Re: [PATCH v4 4/4] wifi: ath12k: Connect to the QMI server belonging
 to the device owned by this driver
Message-ID: <20261026172615.GK257209@horms.kernel.org>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com>
 <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
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

On Thu, Oct 22, 2026 at 07:43:10PM +0200, Manivannan Sadhasivam wrote:
> When two identical ath12k PCIe devices are connected to the same host, both
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


