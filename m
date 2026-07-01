Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA8BC43327
	for <ath12k@archiver.kernel.org>; Wed,  1 Jul 2026 07:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGEf3SeZYgm8dFwF9x3Ecpp2cSEz1doIyoAXcK2ExLk=; b=ph9lGhAWROyj8WYiFNNtrO61/x
	qODIYFgGyPThxqUteB3njKTQ2r37UycS8JMw84C3IF1bfmnJF8eouJUrgbYIWYziAsXTCYVsX6yhG
	xrkFEMa38zNzynaMG6Fcel6I9DxxLFFeQnkxphy7oyNyk9zeBRj5YOuStYAulSG2rDmCJPgzmfvkq
	lnu/Hh7UHcyfOAWaQXvRjTRCvTcWV9+IkTXoZPOKq7PU2d260AcATUIJyjrRd5Q7VzN/1X6fVSfQi
	p0dGULnDuYVpefaGaAv7zgNHcn/WdLAgScVkRm2Cy/ozpSFnScVFBqvWtR/tozrig+gtTIhH3LuQQ
	jMF3Gjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepTn-00000000umL-1ptD;
	Wed, 01 Jul 2026 07:35:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepTm-00000000ulz-23mq
	for ath12k@lists.infradead.org;
	Wed, 01 Jul 2026 07:35:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E87F1601E2;
	Wed,  1 Jul 2026 07:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644DB1F000E9;
	Wed,  1 Jul 2026 07:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782891329;
	bh=kGEf3SeZYgm8dFwF9x3Ecpp2cSEz1doIyoAXcK2ExLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EZXazlFdkvJYULlF2W57c/IBuIHM5bksnlkhn4JZaEZIsV9u2rxfmgVZDWz/sZzM9
	 TqD+fNJP5Gg69c84izlEtOmv1hXtdA+ae6nzZAfzliStrhO5HzV2wLG4qKigklMyQv
	 q28Z1sdgYOeeXbjkxyXoJBjXn2qaEFZMf68fviUkyMhpHgkLiOBmo+aVmig+ldi9vy
	 o6htvUykVi39Ey/ZaVPRgmG7pTTIyJ8j7dR3CBapLqAzJnt7VK0UPPNcDN8kaUUbyn
	 XLt68BOXBx0lyB/fVegvFbVv6Y+rwjzrNI8Hs+1xo1QRp6g/qlg07x/zc2QicnMnSz
	 GHT3VNckuu4Qw==
Date: Wed, 1 Jul 2026 13:05:12 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com, sean@poorly.run,
	akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com, marijn.suijten@somainline.org,
	airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
	bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
	mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
	mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v8 04/14] remoteproc: qcom_q6v5_pas: Switch over to
 generic PAS TZ APIs
Message-ID: <akTDMOvu5H9qMDUK@sumit-xelite>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-5-sumit.garg@kernel.org>
 <594cf827-819e-4262-9dff-a35c7f69f86b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <594cf827-819e-4262-9dff-a35c7f69f86b@oss.qualcomm.com>
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

On Tue, Jun 30, 2026 at 02:34:59PM +0200, Konrad Dybcio wrote:
> On 6/26/26 3:34 PM, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Switch qcom_q6v5_pas client driver over to generic PAS TZ APIs. Generic PAS
> > TZ service allows to support multiple TZ implementation backends like QTEE
> > based SCM PAS service, OP-TEE based PAS service and any further future TZ
> > backend service.
> > 
> > Since qcom_q6v5_pas depends on MDT loader for PAS firmware loading, it
> > has to be switched over to generic PAS APIs in this commit to avoid any
> > build issues.
> > 
> > Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> > Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> 
> I assume that the leftover qcom_scm_assign_mem() will be handled
> in a separate effort, presumably through something like FF-A lend
> on the backend

The qcom_scm_assign_mem() is already handled as a SiP call in TF-A.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

Thanks.

-Sumit

