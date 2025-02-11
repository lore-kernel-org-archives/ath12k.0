Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229C9C021A1
	for <ath12k@archiver.kernel.org>; Tue, 11 Feb 2025 15:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DzeVdd8SF7qpz7tNPDYXF9vs5orS9avpQ/i2+8qUWA=; b=ZQ05sPUUWl0cMhDK4Pru6axavS
	T6qO2RWfb4+YIVlpUz/cmImniehF0vL3K3FxRLeHbUL3UevB0O4Mk257uY5cYaSxYzZLOjv8ZQ+TX
	MWrSftx4r/DQXTcAS7b9BRKKeGIMlDiZVQKlY258bFTjihN2ifMqXb28dCtJPR7FDxX4zOasvf56K
	q2baelwYi2dPXXPuq9IEEPklP0vQWo2HMnIFyDrNumK6wpHkm9i/PH7cUOwLdkHkryJHZECNNAmEa
	uwfjmYFSUGyMfvOODAW9NKQ3R28xHBz2swqR/fKUUdCOKoyw045/esKTg/s5ehG/TxelR5PWV1HrG
	XtiJBZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsSR-00000004LPC-2Bci
	for ath12k@archiver.kernel.org;
	Tue, 11 Feb 2025 15:45:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsR9-00000004LF5-0p8M
	for ath12k@lists.infradead.org;
	Tue, 11 Feb 2025 15:44:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B77WBT006113
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DzeVdd8SF7qpz7tNPDYXF9vs5orS9avpQ/i2+8qUWA=; b=MiTDLtZECIkzvuaj
	IY2uM6Ozbq/6rayw/7V0urJdxNP7tQPQ+ZdLwgoxudUxGBbr6zTorwcIvyeoFnlw
	yLMfBT87BjCn/8TntvBFm0af2G+z8LayMHCpCFin1jcVOlgGAOvdZAEnvQ3lg0pe
	GSuQDjrPB7M6p+uFCYsS9jYZD3azACxAXz0cAONkaamK5bCEBzn0Iw721bXOChzw
	65jKTA49jN4Pj79fH+TDGBSiGs/XYtNUizf5ggjAvzr5vqvIAgiZ9o2ts2fnGdxk
	JWVGD1EEkwkMwO8OHO8H1c6AoJf/u8x9nypiKjLWRzZdXcGHYCp9QFY8920HtpYY
	R9G4dA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5mvkeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f6b2d49e3so81780155ad.3
        for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 07:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288672; x=1739893472;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DzeVdd8SF7qpz7tNPDYXF9vs5orS9avpQ/i2+8qUWA=;
        b=hOdzEXAteuOaMsVsS29ter9KSYH4fp7gl7xs72KOTWoelSTap362HhhjNGE5ERsV2x
         ftomHq2MVZVoqe7ef753//VQ0QOSxCS+Az4sfsdQFKWlDJ9ZnsqvCVeW/N9zvkuL3GNv
         eKQ2oQ8AFLCR4/4J/t3ERR2T1meeS/boi87VHb4D/cwxGlIumK3nKdXQEdO706buZ5Ih
         uRR2pjZxfUjrTUdLR1982C9WVSTEXClRLsf5+4kEIHfTs3s0M/YR91OWOq84sn/5Zwyv
         xMFPJa86z8rS6B4R/IiZx3hp1u7IN1AA2X0pYTfc2NWuuW3AYEVWzzXirHrzlnmEDn+w
         jmPQ==
X-Gm-Message-State: AOJu0YyKYHIrgVNuwdmSWsDyQPsPHvKxqD1wuE0u1TODdwjwuYDuZN2W
	kCgMRFbOi3O2CZ2Sd8ZpkplXIpcV/zepUlYmoUsRfAdE0jp9iwot09vIgqz7tNG1wmGo4hGkAOt
	Ko0BqbdT5MFZRP4q/BT8Eu+wTbeq7ARYpRMgoFacu+deivXoM81MMkk8y4liIwD/ddJyc
X-Gm-Gg: ASbGncu6yu9kUJVO52dUc1L34TkrLlsNzM0e32JFHIJ4STaDUvwivNJVQ6RItMXbFkq
	UY96TiKjkko0ZeYXkfGSs16fl0L2+xKi0Vd5gTO6HHCgjO14IyPE7aMyZHiFjc+lYsoOaAQStNs
	d+mXev5+mrcSw9KvnbCmu/2PpmXPX5ep8vanWiGKaPzjQVfPCgwM9Jjj4BO68AAEOsFaqX3DYNq
	hnSn+rdys6y6epGsnaNF2oq2tQERxMYOVuTGOLQe1idBPsJrMBkCVOIPVAzC/PV1+LR+7kX0YDg
	uVtJ4baKhhJna+ErR6y+N71JhbW1pkUEpJarUZqqwA==
X-Received: by 2002:a17:903:32cd:b0:21e:ff3a:7593 with SMTP id d9443c01a7336-21f4e6ce751mr213191015ad.6.1739288672194;
        Tue, 11 Feb 2025 07:44:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhXfdgSN1N+xai/wCFwf8W+v4OhBNN5yiWqW9rRXxcEBRo+A1d/Oc8cj1YkynjHO2uz8c5dA==
X-Received: by 2002:a17:903:32cd:b0:21e:ff3a:7593 with SMTP id d9443c01a7336-21f4e6ce751mr213190705ad.6.1739288671797;
        Tue, 11 Feb 2025 07:44:31 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36510e34sm98399365ad.28.2025.02.11.07.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:44:31 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Nicolas Escande <nico.escande@gmail.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250201211301.357985-1-nico.escande@gmail.com>
References: <20250201211301.357985-1-nico.escande@gmail.com>
Subject: Re: [PATCH v3] wifi: ath12k: add support of station average signal
 strength
Message-Id: <173928867093.1115150.16269929738374915560.b4-ty@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 07:44:30 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: GnAjl_8adlkwf6oZQJEyagVSKAdvAM-J
X-Proofpoint-ORIG-GUID: GnAjl_8adlkwf6oZQJEyagVSKAdvAM-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=763 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_074435_355876_C049B6A4 
X-CRM114-Status: GOOD (  10.22  )
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


On Sat, 01 Feb 2025 22:13:01 +0100, Nicolas Escande wrote:
> This adds support for reporting to the kernel the average rssi. This is
> done the same way as it was done in ath11k. A simple ewma (with the same
> parameters) is updated with each rssi update.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: add support of station average signal strength
      commit: cb53a6785ea5b0a14e7e5af4322bee3df266e949

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


