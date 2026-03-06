Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9040FCB61A
	for <ath12k@archiver.kernel.org>; Fri,  6 Mar 2026 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8a84bdh4a189aV1exzhyEPACpyCLyBrnhfV05dA+Q9A=; b=0Cxp1I4i0ZA+GzcIxKCXz+rBm8
	Alju9afT1T4jNXIE6K3ZVUoeNvc2bGrn5mg6sSZxNWD+LsfP+V2Lto+nc9ZkBS0g70MmSvElavFia
	0A2edd+O1K5ySLl5+GOhn593Yua/29JSHl/7aOe3pXIeno1amsZK1HItnQUaUx8zRqt4u/kaM0G9c
	TbgEbXRoEnKrxeLe9mAmp2jTrL6l8x3CX0btErzqM9vFhP3ncEXrwYa0q6wpg58uEUPfyPNs3HDIb
	mtESxt7Qm9lMVnE1cmthqRaGerULc2jIu1eoC6LfqP9bFZPkWTn65dC/MdWxkP9kiCYkdq/YdqlfH
	4OSeCdDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXTF-000000045fW-2PP6;
	Fri, 06 Mar 2026 15:52:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXTD-000000045ey-3bSX
	for ath12k@lists.infradead.org;
	Fri, 06 Mar 2026 15:52:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C1A344395;
	Fri,  6 Mar 2026 15:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153C4C4CEF7;
	Fri,  6 Mar 2026 15:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772812326;
	bh=VB7z6G4/ZLlDD7r7FKPmMsl9wkW7kNZ+4WwUIRbuOyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sDoh2dpx7TsNXplh355AlqTBYRr5byBVn6JZf1XoqnYR1K+T+maAULQRE1A8qMTKg
	 xHtDnGP3+GPygxGHbqLIvytNB/VHWUllxD053WfzTs9wBqALLwbozdBF0kwn8YAiHi
	 Xu+QgLYJOxkJYXesCociGAm3EP56F0PYeEeSS654JMCMTmP6hSLKZ10k+hxyes9CS7
	 fc1mRKGwqqkaaOT8ht0+Lr30ETzX5q8TdzY8TBMqGfrLO191G538lT12CTQC62TveW
	 Unm/228UfIdJvqzUYQpEGHVCvmMkdgkcg+yf2e0/KQQIz8ISf60N9dK2kpAVokD3WG
	 +CtPHgNkHZr8w==
Message-ID: <eb0ef26d-d1db-43b9-8113-a7c977d4b8cd@kernel.org>
Date: Fri, 6 Mar 2026 07:52:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] wifi: ath12k: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 bod@kernel.org, mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jjohnson@kernel.org, mathieu.poirier@linaro.org,
 trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
 pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
 tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
 srinivas.kandagatla@oss.qualcomm.com, amirreza.zarrabi@oss.qualcomm.com,
 jens.wiklander@linaro.org, op-tee@lists.trustedfirmware.org,
 apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-14-sumit.garg@kernel.org>
From: Jeff Johnson <jjohnson@kernel.org>
Content-Language: en-US
In-Reply-To: <20260306105027.290375-14-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075207_921693_FCC6E475 
X-CRM114-Status: UNSURE (   4.11  )
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

On 3/6/2026 2:50 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ath12k client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Acked-by: Jeff Johnson <jjohnson@kernel.org>


