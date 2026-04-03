Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE79FE7E35D
	for <ath12k@archiver.kernel.org>; Fri,  3 Apr 2026 09:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0MsR4PHC7LRNEDJ02SXHtGh86o8LwWKhT/z44z5dSo=; b=KgUakAZ18iOZ/eDRasfsFfUadE
	FkKRAv/clpij1jtIeZl2Kay/FNYzyuXHSAtnwu1a0I0yCrqgYxj16nP2z+mLQVqUSHXVcAwh4ERNO
	7YU2hUmfGm1zwfFU+WYH8jqsKObg8mPmVctZcbmGpNbmDRzHGPsvuOUtq1W9r/t/wMIiJUaJBCR4q
	dOiNlySyMlIF0WELv/zdT7qa/R3hehJGJZQjvkh3qeHg0eKP5TKsWWSIxD1/29ECkOKf7dpbkZPPc
	5QE8bhbZ/h4aiQg8WAaIbUo2lAilo6fM2O+mui5nOZQHnXuTivpUK+ZjFdR3r1YetUTqOR4RyBd8u
	7DLNKU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8axr-00000001p96-2SBv;
	Fri, 03 Apr 2026 09:37:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8axo-00000001p8J-0Kaz
	for ath12k@lists.infradead.org;
	Fri, 03 Apr 2026 09:37:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6337e2GC2707224
	for <ath12k@lists.infradead.org>; Fri, 3 Apr 2026 09:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H0MsR4PHC7LRNEDJ02SXHtGh
	86o8LwWKhT/z44z5dSo=; b=isxJvM2K/Cv3Pm0NShfaaEwkY51/yH2P37+roCBv
	lYrCcgbdhQHUYJxt9ZaYRXWC20+urqqeQP2i3fq42SxtBdpAbOyHaIPnzRWp93qp
	QhAms5skdcgdocGbuW8EEkhEUxZ3sTcKnETvEuiyk1+Pm3OocQu1n8HzYcRw66t4
	536ts+kxzBAJIVeVFBFgH3T8x2hYC18mMhBZriiWcTHzQDNU9C8b+kQqmV4xadiD
	mTBOHSS2dOrTwiGXGNamY2DF5T1mQ/6TJ4GlxtarDcpWup0gReaWKh75SsJBMArq
	yJ0mRgfT8xA5wWGvPp4wQ33YQwu38eZi/2RiBGwkpqwHTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9yfjhyee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Apr 2026 09:37:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509070bda13so29730091cf.1
        for <ath12k@lists.infradead.org>; Fri, 03 Apr 2026 02:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775209032; x=1775813832; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0MsR4PHC7LRNEDJ02SXHtGh86o8LwWKhT/z44z5dSo=;
        b=DFiQ25JS7r2DRip29c454m+PpCrmpMK03nMexEJHbV8DJ8nW1mbwO3rBMrcRXM3Pv0
         KAtn0JmrC+TAc1A7nBF1YQ7GJLvXd8dW3ME5nAeYFkFBpnBEo+0ic0nsMk2/1tgH8fex
         tOzTOIDOc0YQVY6FCffHDk7jmtHlLZ/Jn3nSQ4FVoDRB0dQYj00AdwvuzVT7fiD9Ve8Z
         PyLEfwydv69ZTVWWA+t8Czx8HjiYXUIR2wzos72aegp46Xc8FXRwp7tiYEg/t7L1Neis
         tDvVpxtYjzMmuyuRJnuO05qdaA5RBpaVljbbGOGobA511tNGZPXnD3q9f38p38giKFJP
         Zu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209032; x=1775813832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0MsR4PHC7LRNEDJ02SXHtGh86o8LwWKhT/z44z5dSo=;
        b=r8JanpsZ4tmx3r+cA+2axuV/OGSLz29xuZQCdQMRzspzm4fKFCZoYFpm7OpfjmMuuo
         ipU3vVEKylcuzoSHjLW5ZhFG5PcI+XoRYO4XUakVmrYfpwI7q70NnXC52j8kRovknANo
         8XzHsPox4/fKUe8YxPeC2hXqCHApbUQANZJSxqYbZt1h7XX/hr37e5QpMPckXrHILolI
         HazR0QOgwl7YL2J3lCDiOhp5x0M7kCc1VIrvkRGUokmE9s1JAR2xPeEP08ZabuCKNf9P
         x0QTjbjdjxiuTpKsl+jXtnqzYPHtwROYEYzXQvinPVCT2/P4l5kFWX9QUvxmqcszw7FV
         2ZVA==
X-Forwarded-Encrypted: i=1; AJvYcCVVd1zbY9V2q7xiOLSgZ8MJCVmTrz5YGAkUtPYJpiLLI9gUAJPNWp+V4uDAQdS43vVo8b+ZNTw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwB7/4ozlWtUAFUrtdqoC5P8IHLGLDixFmsPpwhTXIzNO74vPQx
	YpcdXFzUNFGXrSwcYvP/BsJF2lbpG1NIB/GMel/KBkdJybqQF1RRm6ytpGIZgwGuisjjJorgnzc
	pmXDx0WS1eKd3lgatp511ilAk4mk/b4WBIGe16jvREKjlAbXhNKneBjz0w1tBvy/d
X-Gm-Gg: ATEYQzy29r83FGy/lUkBPDkMQXrnjQXBA0MkUSWFjrBlG53rZ2JtY8dY0yOEPIFWeqJ
	N9ssV78IQY2Tg4yeooD2gK8FfuckO7dw5qpQdgQy+V3ISkLMGgvAIrIkMFCCrH5BJH6feO+U2Ds
	yKdM/+cVCy7Er4QP8eQi16X9YyN1JYy+a0oqDvSXl5Pbkk/5Xn4aGtxRwzSUNtqprq694A5z+Cg
	NHIe2T5jeQmdal2xcAri9PPoGlvlNCr6f7LkyD6vDB/bX538RitRpY8pfeArptvDnTUDPBC+bSK
	UAEKVZD/25K5Yj4maWPPVRr9oraKXiFDWwc1wPOq9ipZt3r2p+mOonidM3RjJCG/fBDzs40bvcH
	UlJwIR0OPjpjjeKuVv76SmzH3TDiBdPLGr/NHL4fDftWnO2CGzGblvnmD
X-Received: by 2002:ac8:7dc5:0:b0:509:202f:f03 with SMTP id d75a77b69052e-50d4fd24b4dmr66234851cf.38.1775209031742;
        Fri, 03 Apr 2026 02:37:11 -0700 (PDT)
X-Received: by 2002:ac8:7dc5:0:b0:509:202f:f03 with SMTP id d75a77b69052e-50d4fd24b4dmr66234201cf.38.1775209031263;
        Fri, 03 Apr 2026 02:37:11 -0700 (PDT)
Received: from trex (187.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm15010561f8f.3.2026.04.03.02.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:37:10 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Fri, 3 Apr 2026 11:37:07 +0200
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, harshal.dev@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 11/15] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <ac-KQ7e8-syph1Zl@trex>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <20260327131043.627120-12-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327131043.627120-12-sumit.garg@kernel.org>
X-Proofpoint-GUID: zdg-XMIgQ1i4Awjtnx8A7F9P5B7q4YO9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA4NSBTYWx0ZWRfX67QHve8Zk3X8
 Nft2Zi6ibwK8RCZxeeTqn3U0273U9+z4q82p3NYVkASdiZk60BeltndWukdHnyTIWdalZxvWlvK
 aQeIvc5uZh6xa7xErdmS1Loxmb1SLRNGB/lqDzeDuxKCGMbx6TtX2rmkyIWEK8YS6hIVsEt0L11
 CR/DkAnndcWlSaTz2EqtyJuW85BMtpliSCAp7iU94QY1XcTMvEyaq0SFWFeJ/wl+yi4i0HfgzFB
 G4WaBI8ovOXE0K9PIdwEcQ5XThF/Zjy40EU6VCWQZrSseDhT2GAcWHuj4CK3By4RE8vKNv83ng5
 Wk6DTuwWSynndshfUzbYDb2LoSVGFbP4wPnLLtq6KnTTCvfuRZCsKrbASn6VG65XKDav5Vt4G+Y
 h0MvvAL3T447c2ckXhJIJMGUNZYmQWaw/pE5coeTkjatnE0ikfBOHalBvoT/1WoaPVK3uoR0bZn
 hgODhfZJ6ZIpqKeoDKw==
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69cf8a4a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=VPdg2FrOqWfiVCzsz0q0YA==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=vWT0tKtjkO2eN-vK3vkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: zdg-XMIgQ1i4Awjtnx8A7F9P5B7q4YO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_023716_237443_1E5A8CCD 
X-CRM114-Status: GOOD (  15.41  )
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

On 27/03/26 18:40:39, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.

OP-TEE based PAS service relies on the linux driver to configure the
iommu (just as it is done on the no_tz case). This generic patch does
not cover that requirement.

Because of that, it is probably better if the commit message doesnt
mention OP-TEE and instead maybe indicate that PAS wll support TEEs that
implement the same restrictions that QTEE (ie, iommu configuration).

I can send an RFC for OP-TEE support based on the integration work being
carried out here [1]

[1] https://github.com/OP-TEE/optee_os/pull/7721#discussion_r3016923507

> 
> Along with that pass proper PAS ID to set_remote_state API. As per testing
> the SCM backend just ignores it while OP-TEE makes use of it to for proper
> book keeping purpose.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig      | 25 ++++++++++---------
>  .../media/platform/qcom/iris/iris_firmware.c  |  9 ++++---
>  drivers/media/platform/qcom/venus/Kconfig     |  1 +
>  drivers/media/platform/qcom/venus/firmware.c  | 11 ++++----
>  4 files changed, 25 insertions(+), 21 deletions(-)
> 

