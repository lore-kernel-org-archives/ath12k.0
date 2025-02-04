Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1BFC02196
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 01:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsLAc0etCe+UgkVAauzS5bGJvK3saA4lvwusQ2VXNig=; b=wyuYFEAUneoF2hyg3pi06oeZ/K
	xG1B3ys55d14Uskg8v1FhL7PTCt3zGbWmv/6V7ALnWr4Yd1VViD6mm4V0hZiqXufU9wEwpEIA/j4b
	HgMwbrX5iy+ukv5+/UG+iOFP3mB1Dxlmp8g41pgw2Yz1IpBm5TLrFnxeC9yIyKhmPgs3FMk2+Lpbs
	/CvqdFxpwi6115OF9ZEBOE5mHJqNu8vUUjtBxs2q3YGX4zSz39ozKGXl5N7iBr15lAoVvXWadgDeB
	3w3uKL880wGhrqFVcQDVP37r8WENZtRA5iBy7/MQyiZp5SQFrDKtRNg0jfQ5f3PHq204l53yErnKY
	roQ5PCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf7VT-0000000H1Jq-2iAP
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 01:13:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf7VR-0000000H1JJ-19Oh
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 01:13:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513GF1aj010943
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 01:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsLAc0etCe+UgkVAauzS5bGJvK3saA4lvwusQ2VXNig=; b=poDe1coW2ikstMl9
	aQmYr7xtrEJevjTfSu+6kXwIUETqEYMnj76hkVXKKb3zAD+fnb7IuDdfZiDdtL3I
	eQ+oIJtLt41pCPEn7WAnc8zwq2i7vImg8hGDQ/aRgjiNqMA/GqT6L7WgyABp+r4o
	pKC06nbg3/JSFDGLU/1zAtFtyadaJhwC+h/G9gCzXE33uSuJTOukHzoAO9ACQpGM
	8o3+88ZhPjgK66/apRi/TIcnba/sbYv8xz86hIFOyl0X9+gMT36ceStGExkxNyU6
	suuY9Je21CT72bdvG3TPKbihT7HhagIml8pgh3epN/YCqTOJvGPdcvv/iK+jBpC9
	QEGhWw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k159h29n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 01:13:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2166f9f52fbso165279795ad.2
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 17:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738631614; x=1739236414;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsLAc0etCe+UgkVAauzS5bGJvK3saA4lvwusQ2VXNig=;
        b=jVPopnnFXxH9b6Z73VnUbn7FkWNAnSiG5gbpZk/eUI8rdqGyg23cKj8Z3V0cWd26ol
         noK0qmFAReMpK02mp3P9Q8bapw/ftzmRGps9+2/k++Hk1XLT65uhcZvWV7aJMGLlExKZ
         2sRD8Eizoxr4c7aMAvMQ7DYSEOCW85TbDgusb0d2N9nS2Ess52cAETOsBES4+m52Azxy
         t12unzUdoM/KOIw7a5qevM/bGjzqz8GsSGNb/FIJlhCmNKL+5ZRgu49X40xiGUUAbQaB
         fY2RTVB+zVVNXu4c1tbAxJL0AkTHECh6CftPeqr3jU817MDTeGP0t94x0vqXgL9R5cBl
         ZZgg==
X-Gm-Message-State: AOJu0YxFHEEcELBhqz6FtTZWC1QlRE0IXRu5CneQzY145giuPrd1gN6e
	yAgcmgCapM6q6lSDbJ/ePDDht0t+QokVvG6Gd4nIjupJEh2Ib2iKoo2NC/eYt3oIzmilZPzHawu
	fT3ieW3hRWWpvsyFMGP5EihCQ7FpQLCEdEjad5tnizC66K+uPtIlOGx9gZU34gMrjGgfN
X-Gm-Gg: ASbGncusRvy248kf2MBbCc17Kkgl4PBWTRPclVH2u73K2n/7S81TY0mb449TN0Lk5jG
	ojE4mWOOJVl4JcaFCyCJNmBKYwzPnUYDFKSEEJrajrcfCxHvtKY5G+rNuivLjeIbxMuZYp8EoiX
	oM8UallnGf8khc1ca/BU6HNyT12s1KkrFA1LDOR5AMJgzQqzkjo2VA9EQQ5fq3oWuHBR5vAj4S/
	/YFK5yPbEmtsjI2ao1iEveCukOt1L9bymKblees1+Tb00XxxPeBkKMCss7OeUESq7MYw3qSziEX
	TM+1AO/dx3DIYo4gzyj68TxauNh00gTsCbeOw+oT/A==
X-Received: by 2002:a17:902:d48d:b0:216:7cde:523 with SMTP id d9443c01a7336-21dd7dccf72mr402190505ad.32.1738631614215;
        Mon, 03 Feb 2025 17:13:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQhirGSlYsQctVLbVfubQmXtt4uUSoxCVnrBhqmBdMP0kixjUhD8Z+iAqewDNZoH1qC9QHEw==
X-Received: by 2002:a17:902:d48d:b0:216:7cde:523 with SMTP id d9443c01a7336-21dd7dccf72mr402190115ad.32.1738631613687;
        Mon, 03 Feb 2025 17:13:33 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f8522sm84069685ad.89.2025.02.03.17.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 17:13:33 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250130061104.962124-1-quic_rdevanat@quicinc.com>
References: <20250130061104.962124-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH v6 0/2] wifi: ath12k: Support Transmit Power Control
 Stats
Message-Id: <173863161308.4031998.16141695262239737559.b4-ty@oss.qualcomm.com>
Date: Mon, 03 Feb 2025 17:13:33 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: R2MeH-uGDNwOgS7_fkwXjo3FIV-bvTZi
X-Proofpoint-ORIG-GUID: R2MeH-uGDNwOgS7_fkwXjo3FIV-bvTZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=851 phishscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_171337_435338_4CE5886B 
X-CRM114-Status: GOOD (  10.89  )
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


On Thu, 30 Jan 2025 11:41:02 +0530, Roopni Devanathan wrote:
> Add support to print Transmit Power Control Stats. Add support for basic
> infrastructure necessary for enabling TPC stats via debugfs. This patch
> series brings support to request stats type from firmware and dump the
> corresponding stats.
> 
> Schema for an ath12k device:
> ath12k
> -- pci-0000:06:00.0
>     -- mac0
>         -- tpc_stats
>         -- tpc_stats_type
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Add Support to Parse TPC Event from Firmware
      commit: f0c3bb78e42f2f67403b2314486e42f40737b15c
[2/2] wifi: ath12k: Add Support to Calculate and Display TPC Values
      commit: f5c90ff80b4c0326e5fd1feecafd88718075b1b7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


