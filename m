Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D196FD88FF
	for <ath12k@archiver.kernel.org>; Wed, 11 Mar 2026 05:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxbb64IJUlvLupcBKvMeTLzBiBjcAwiLeJCKfl9LLBE=; b=XPIf2O6mrwmrp11hG7JPmKjphd
	08CrKTwLKJaC3SSUGf0sMgHZPTYAEIbcrmsY7frGLMp2QXYa5AQXOU1ZXoLvQLwyIyEQuFBbeGtaF
	Hv/g8TExlBNeHHnrVlKR/grVo2RHpOGK5RaO4WNHG1l/H632D7Xum3E0mm36ggv+dVDksze4fw3bo
	QGpsMT6Jclknm/e1CxlWNaTyI4UR+K8YpHyFVY3z4TSyhsnUyBXHz8C/7KxErbBo3XTy7pCA5CT9m
	L3+FGnhoqI8z1yqCHnGJqes+ZBu32g6t2cyC3PJFNjA2qY38fwFaVJYZxrL/7k/DF0ZU6xmwC+ylr
	HKsmFMqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CQE-0000000Aps6-12yc;
	Wed, 11 Mar 2026 05:47:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CQC-0000000Apr9-0WDS
	for ath12k@lists.infradead.org;
	Wed, 11 Mar 2026 05:47:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 645AE41757;
	Wed, 11 Mar 2026 05:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0823FC4CEF7;
	Wed, 11 Mar 2026 05:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773208070;
	bh=vtEXOBuhUMjTZiyrtnPZqy/gdjvwakJ6MHrQOKgG2i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eeACOq6zvoHImfK89PKpnKoKhq+cOkbQunVao4m97OtiMRTKtqFh5GxPIPgTjIpgy
	 rnEXWEaYqXoVPz5ELjFYeO/OHfGGLDfvzbsGPzhxhIrkh68hW1CJRR4AMqK4s5A/36
	 ld6d79lXYRX/UiVqfoGxjiJVtOw0GGYKcTa1YqzSjiSiJyZy/VAFq8tCU6CqG2b/NJ
	 SZNPygMIjEB2PBNtAIG1KJvpM2Btaw4YdDzp40appRQ5TQ/cLfng+o6eD2SfNbyA4Z
	 Rq3gIQ30dMyREadAFPWCHwvu/KXM6SPAK0Tl7Sju6ZCSdtME89zS08zVLG6HUh3nuc
	 aib8sP4ePsXng==
Date: Wed, 11 Mar 2026 11:17:32 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
	akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com, marijn.suijten@somainline.org,
	airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com, bod@kernel.org,
	mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, jjohnson@kernel.org, mathieu.poirier@linaro.org,
	trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
	pavan.kondeti@oss.qualcomm.com, tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 11/14] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <abEB9DiHs6JLVRnp@sumit-xelite>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-12-sumit.garg@kernel.org>
 <aa6O5tir4kVIe0eZ@trex>
 <a96cca02-54e4-4ed0-9fcb-816c72afe0e7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a96cca02-54e4-4ed0-9fcb-816c72afe0e7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_224752_182692_4790F561 
X-CRM114-Status: GOOD (  13.69  )
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

On Tue, Mar 10, 2026 at 12:18:29PM +0100, Konrad Dybcio wrote:
> On 3/9/26 10:12 AM, Jorge Ramirez wrote:
> > On 06/03/26 16:20:24, Sumit Garg wrote:
> >> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>
> >> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> >> TZ service allows to support multiple TZ implementation backends like QTEE
> >> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> >> backend service.
> >>
> >> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >> ---
> 
> [...]
> 
> > are the calls to set_remote_state required?
> > 0 is not the IRIS/VENUS remote processor.
> > 
> > If it is legacy, maybe they can be phased out?
> 
> FWIW, in msm-3.10 (yes) QCOM_SCM_SVC_BOOT/0x0a used to be called
> 'TZBSP_VIDEO_SET_STATE', taking the arguments:
> 
> args[0] = suspend->0, resume->1
> args[1] = spare=0
> 
> seems like sdm845/msm-4.9 still had that and so did 8250/msm-4.19

I would assume passing actual PAS ID in that spare argument shouldn't
cause any issues for QTEE as it could just ignore that. Let me try to
see in my testing on RB3Gen2 if it causes any ABI issues. Since with
OP-TEE we would like to not deal with ABI inconsistencies.

-Sumit

