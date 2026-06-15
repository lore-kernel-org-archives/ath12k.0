Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B6ACD98CF
	for <ath12k@archiver.kernel.org>; Mon, 15 Jun 2026 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJPr7AwovREaKXgEuzZAVb8kOr5xcjm3uq69zeHw4Ao=; b=Rcvu4qqiIByDsq5xVE+r7h3DdB
	c2BsK7cQ/p7NcxYTlf9igoIaehtZvNpJ9buoLkzXJPdtSIVo5XZzFGrgjSfCnlcVtoPgwCMOR2Gje
	vVE460yOSN4miWd114HimO9Ztf2qYRZmUFqUrG4+whCexpDyWvKhWrk7XPJe1fQI/Vm3pJJG477OW
	6a8+0ikPXMxTusl7jwuFSEafUj87YNGwRaJyXetsDS00ukGqoX5yLNaCkmjS9hhhbDpRR+VRoJsdY
	8mCk1z4nbNopA8FbSiem6EoOpfdOX6BzKs63pTjpLUbrpgYKeiex3djwyxXGr9MknUaExGqnaejX9
	y2ZMKNQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7Un-0000000EJiu-48xG;
	Mon, 15 Jun 2026 13:36:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7Ul-0000000EJiD-3AZ8
	for ath12k@lists.infradead.org;
	Mon, 15 Jun 2026 13:36:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4905529b933so33860625e9.0
        for <ath12k@lists.infradead.org>; Mon, 15 Jun 2026 06:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781530613; x=1782135413; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bJPr7AwovREaKXgEuzZAVb8kOr5xcjm3uq69zeHw4Ao=;
        b=NK3RSpT7RunNLLrniLTWjd5jUbYV4ybPuu86Y+msWsUG0MGunkWVzoGxQKG/aY+Weq
         QkKiLUHC26drSZjeIYhKb2Xak8ODaqr7lk1QyXxGcUyQT65KZ/hK/g6drgpM2u2MiC4U
         5uwqY2XTJtb+upcgtINY1zveWFwheSeQEJJZQtW6hrzkd1xZOLOp4nEu5Vxtam+yoO31
         Qi+7PUo3ebmgJXIxneV0VRn+4fr/xWx78hBtp6EYOB7aMoangNhA9upjuvBYxxBm6UI7
         w00AxkoPJhUQG9A+L0SaW4jeJXBGi8UCl0+q+r1LEu96Sc0cnsBqN0HRtCcXv1dVJX80
         7/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781530613; x=1782135413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bJPr7AwovREaKXgEuzZAVb8kOr5xcjm3uq69zeHw4Ao=;
        b=MwbkZdvv23hXt2ILUlpN68dPptdZOAxRelFFrOu8JIvM7lN1XlMPcaQLWzMWjt0jPz
         XQB0DLydkXoi7x+Cyp/KZdVNia++1lucQOG2MPtLBhHdJV2kjDPNq545+KSq+2sQIvG7
         PqpPCvArm2Q4I1zdLvCFqxky+6o/8oN19k08DP5Znw2El8hs0KD5zYT2USUZRnCwM2Xp
         2YsZAmpNlCfKg/QG/T4s+GMKGqPwM9UQ6sd/UtWMzsBItRtdTnIoULGxf2nFTqHlhCq5
         MTsuTQHZh+c8mwurGoYWRKlhk+2D+hTkiumCoJV/dVD2+7aiplPkbLRqDMr7dThlbqiR
         kS2g==
X-Forwarded-Encrypted: i=1; AFNElJ8nyrBCngsDHlGubIXrbFD5zKp99RmCR3bl0h+kEQCv8nhEERjs5HN4vf6oD+TWp3By2Q+k6PU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIjh+QJ5E8VanPzxL+OME1fmTv8pciTMVlhcmDjzR46CTae7EH
	bFR7DNShMwHBMO3ALullYpWLeiTRYJnckG25Ry4nZI/BaOp6IXmego4q
X-Gm-Gg: Acq92OGzxPf2vhKHiK2YKlKIAiyI4iH5nfHLX6qmtLWxfROjaacyVa0kw/9ZoryPv5y
	UsPhA5BvfSp5j+f2Rb/TYelkaHxHuX21A1EXu2zAgpF90Zh66aJXLZeotkSTA15t5/OSn14pSv0
	BOjz1PEu1h4UCOXLSPkS6BoZyIsXM/GAlgI3mzlPkDUC9cYasrL2xiruMVdrzrPB6RlRnqiFuW8
	yOBj9Aysuu+9NIaTg+LZFtkeh6QhgdnJvKvPKhBWydxa0khgj3ppmUcd47bWajT09LNI9N7W66A
	c2yDX7TTTEbGyH3hv6KuSUVMcISadmblJSFW8I6z8IiTnjGdACkBQHx3/l44S+F+G8PdV6ahdn5
	+QqFQLk54Np1FU7D2g2uo4/Fsr1JO/lgtrnaytRgpaet0ZZGZsoeJMT2nci6dFb76KTgw++TUYQ
	t9x+h4XoVmXndlMgYpjnBtFN6gnG+tL8bCr7p6FYQcbhjxScGKKzBa1kpQUgwUhvJ265WPPhPGH
	rEgBw2+VLT4BhTcsET3zIsxuUI=
X-Received: by 2002:a05:600c:4512:b0:490:4663:691b with SMTP id 5b1f17b1804b1-490ec4992aamr201275805e9.7.1781530613100;
        Mon, 15 Jun 2026 06:36:53 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm270433745e9.2.2026.06.15.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 06:36:52 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:36:50 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Andrew LaMarche <andrewjlamarche@gmail.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] wifi: ath12k: support calibration-variant from
 device tree
Message-ID: <23fr45actdrqt6rp6fozcaugyk3egs5zm7imschl7gyuuj6cme@3pvdhqv7xvkq>
References: <20260131003222.2011259-1-andrewjlamarche@gmail.com>
 <A2E3AAE1-1A80-4265-9497-0C95C3308CD7@gmail.com>
 <dc8c9c9c-dc85-40dd-9313-845a808a35f4@oss.qualcomm.com>
 <3B9D1FBE-37D0-4902-8C0C-8AB57C1310A5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3B9D1FBE-37D0-4902-8C0C-8AB57C1310A5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_063655_807664_C143FEF0 
X-CRM114-Status: GOOD (  20.73  )
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

On Wed, May 27, 2026 at 05:01:51PM -0400, Andrew LaMarche wrote:
> Ack on the deprecation of qcom,ath12k-calibration-variant in favor of the
> generic qcom,calibration-variant. 
> 
> However, drivers/net/wireless/ath/ath12k/core.c still misses the logic to 
> actually load in the BDF, which this patch also accomplishes. I don’t see that
> in the Qualcomm-authored series you linked. Perhaps a v2 to address this?
> 
> Andrew
> 
> > On May 27, 2026, at 3:52 PM, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
> > 
> > On 5/27/2026 9:12 AM, Andrew LaMarche wrote:
> >> Hi,
> >> 
> >> A kind ping here. I’m not sure why this functionality is missing in the first place, but it is needed for loading caldata from the device tree.
> > 
> > Your patch duplicates functionality in the Qualcomm authored series:
> > https://msgid.link/20250228184214.337119-1-quic_rajkbhag@quicinc.com
> > 
> > And note the upstream device bindings for ath10k and ath11k only support the
> > generic binding qcom,calibration-variant.
> > 
> > There are no longer any generation-specific bindings, see:
> > https://msgid.link/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org
> > 
> > /jeff
> 

Hi Jeff,
Hi Andrew,

We also need this functionality, and as Andrew noted, the patch series
from Qualcomm does not actually address this.

I believe some confusion arose because the patch series mentions the
"qcom,calibration-variant" DT property, but it does nothing to implement
this in the driver. In that series it only exists within a schema file:
Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml

Our need for this property was previously discussed here, and for now I
don't see a way forward without it:
https://lore.kernel.org/all/77vowy4ax4cl6dlc45i2q3fjmwn3q676wqghq267tmbix7773b@27h5t66mflur/

Thanks a lot for your work here.

Best regards,
Ernest

