Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21C0E7717F
	for <ath12k@archiver.kernel.org>; Mon, 16 Dec 2024 16:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpXHKXHw98BsiTXyomIpWXczQz8SYOfxnAMHA1bryRU=; b=egTTPg3N7kbES4W4OqyzuDFxaS
	REgVFm50Al90JIiO9JLf4/mY9GThChot607Ipw92X3trQvROYos/jDVw9To3hRAZmGQqf3JtEylw0
	plhPtfeiLSV31fKZhNM0osQXpGYDX7dCeIG8ee40Z0nipuZFz/ST11qcraHccIzEfsbRtsRbd2zWv
	U0IyJWWSiLwY2flluJnlHwBr9YeXD/r6s4I0VCpLVrLm8d8DTYaLdcx0xEjv5kyEpVccm6zsDoxHo
	qcdUaQZAF9o4AlfNtoA5YixnFS9Q4Asoj/qQPIA5TgEgBDgNM5t2jpgtI9npxBxQ1huMWowI5NfKA
	uzzHBETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEJJ-0000000AfSA-2zg3
	for ath12k@archiver.kernel.org;
	Mon, 16 Dec 2024 16:51:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEJD-0000000AfNk-2POD
	for ath12k@lists.infradead.org;
	Mon, 16 Dec 2024 16:51:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGD0foU023769
	for <ath12k@lists.infradead.org>; Mon, 16 Dec 2024 16:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mpXHKXHw98BsiTXyomIpWXczQz8SYOfxnAMHA1bryRU=; b=kcWYU8iJMfU56ScF
	3R0RCmLZMntWj2tPiUBWzy1+/cRZSDA4g1+Ytl7BJnQQxMQnp4njA71LbwyVVqtU
	XJ2upeHPChBbO2LLpbjJlB/Arb32mKOVCvO6q3eAmKlUigy8M239HNoJwtaHTltr
	LGHJRSJvATcAU5c6NdVZvSWKdXgutawjVaT/9ainqlHoRnIFH6yQWKEQmCe837cb
	sPtlqKoRAYlf3XmbjwrsQk6GoQJKWFY8fUE4dU3qlKWJxdQnpP2JbqOdieIl8OTq
	HomKjaNb6cCtrjLOZpFoFRTrza4wT24/So5YdVBjZb/4l/jl5Ad+jVDrelV7AB1r
	CDMoTg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jmqcgk59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Dec 2024 16:51:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-801d5add29eso1603588a12.3
        for <ath12k@lists.infradead.org>; Mon, 16 Dec 2024 08:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734367860; x=1734972660;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpXHKXHw98BsiTXyomIpWXczQz8SYOfxnAMHA1bryRU=;
        b=oXIkWD95/FXzXzL788kRpMxxIeziNs4M2uf1ScAfkMSkxbgdPQIYvw2fNF2yH0zVqK
         Qi0BkUnDezvKGXHvmgS0q0vQbi2tsFyjpPaqcZTmzPeT5zj6xSYhLJKyNiN579ViVwgF
         Bsnk/b2gDrJYmR5kRz0VxopJ2pFN/PgyPSIq63Bg1RYKozLBj+ocdnO9y/1AVxqTCFoT
         Q/T5sXscoczynorMK3r8jatIh6sWL6IB0T98jBcEbWxqgjGp1GiDOP0+Rc2qQd6+De1n
         fs0TUSemg76T+dBsF6S9jAuOC0GKxze1S71XVjedQWFa+47+8Ky0MtzPMths3hjg+7fX
         ZVgA==
X-Gm-Message-State: AOJu0YwdCMCFe1uSeXMgvxVY0fqsCHFnZ4/WEwtWowUyRZBVFYSwph0j
	ybGxbtzoIHBmYHE05tHNPOrsEvIESU1YYHNfjBVb+0VPpVoKYm/Ln3HMVo6xKsY+Zt5wSqGwa/t
	C8W3p4cgYdcM1EVIoHSEWhmgYmUqfEAdUnRq+CxGcOwOO7K6v3/3KsZ0mJ0XmjlT0EPJh
X-Gm-Gg: ASbGncsBlMB4TUrOvsz0ScUITCRNr/668Tp70Xc67yI24BnY49DpqZvUivyQE0HMHH2
	WTHRZ7aWajPdWqu6OakCm7Jo0BjiF+j5CL+3rJzkK17em0h9yWzODfpagpKSRtXFYRHbikOPQzD
	h+ayMo+WphxrKQrWzpw0mKbvRK1NW4PaGZZhA5E5n+s0XDeechTsVdnSdDzo7YYZ2rlRP4MYTSW
	vhyMav6/t1oq+xdMMhCiWyV524BBmdYcdo8x/QDetTHCAHnUVCwPp/xr4O0skUkdgvIH9fhhU8w
	OUgxCZ4SsVWS7kN95w==
X-Received: by 2002:a05:6a20:a11a:b0:1dc:bdbd:9017 with SMTP id adf61e73a8af0-1e1dfe43afbmr23646933637.40.1734367859976;
        Mon, 16 Dec 2024 08:50:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEV8A6FtU8/weso+KmitSxASicvji+fw+OyGjA3CopQT8obo7DLsthuhpEbsRgydCESlYvdPg==
X-Received: by 2002:a05:6a20:a11a:b0:1dc:bdbd:9017 with SMTP id adf61e73a8af0-1e1dfe43afbmr23646896637.40.1734367859552;
        Mon, 16 Dec 2024 08:50:59 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bcde43sm4937486b3a.194.2024.12.16.08.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 08:50:59 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20241211153432.775335-1-kvalo@kernel.org>
References: <20241211153432.775335-1-kvalo@kernel.org>
Subject: Re: [PATCH v3 0/8] wifi: ath12k: MLO support part 7
Message-Id: <173436785894.3413746.14923997859754791913.b4-ty@oss.qualcomm.com>
Date: Mon, 16 Dec 2024 08:50:58 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: ile2eTdWkAjELwDH-4zNs3jh0xL60203
X-Proofpoint-ORIG-GUID: ile2eTdWkAjELwDH-4zNs3jh0xL60203
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxlogscore=930 spamscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_085103_729676_87B08A10 
X-CRM114-Status: UNSURE (   9.90  )
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


On Wed, 11 Dec 2024 17:34:24 +0200, Kalle Valo wrote:
> Implementing Multi-Link Operation (MLO) continues. Bindings document is added
> to get WSI information from DT (patch 1) with the code parsing the information
> (patch 2). Rest of the patches are about configuring MLO in firmware.
> 
> Device Tree bindings were reviewed as RFC earlier:
> 
> [RFC PATCH v3 1/5] dt-bindings: net: wireless: Describe ath12k PCI module with WSI
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: net: wireless: Describe ath12k PCI module with WSI
      commit: 30e36fa89d8266d9221ee992d4f43553a59a3431
[2/8] wifi: ath12k: parse multiple device information from Device Tree
      commit: de61173d59082575d985c89a58db0e4055605b48
[3/8] wifi: ath12k: send partner device details in QMI MLO capability
      commit: 59d789c212eb9c11b02f2fd06c06cabb314913d2
[4/8] wifi: ath12k: refactor ath12k_qmi_alloc_target_mem_chunk()
      commit: c445894b9a0504727fabac0ddf3aab27d48b9fcc
[5/8] wifi: ath12k: add support to allocate MLO global memory region
      commit: 157fb81feda5c646b77d8135de6e29214fcd74af
[6/8] wifi: ath12k: Add MLO WMI setup and teardown functions
      commit: a085667ab1751a3b821ff926a08934d42dcb99d1
[7/8] wifi: ath12k: enable MLO setup and teardown from core
      commit: b6529891f04659c5279f4b58db230fdb589dc2ac
[8/8] wifi: ath12k: avoid redundant code in DP Rx error process
      commit: bdbb676320a22eddacf3188726b359e179b9bc07

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


